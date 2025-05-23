import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

// Annotation to enable multipart file handling
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)

@WebServlet("/addProductServlet")
public class addProductServlet extends HttpServlet {
	private static final String UPLOAD_DIR = "images"; 

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//Get from fields
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		
		//Get the uploaded file
		Part filePart = request.getPart("image");
		String fileName = extractFileName(filePart);
		
		//Define the path where the image will be saved
		String uploadPath =  getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		//Save the uploaded file to the server
		String filePath = uploadPath + File.separator + fileName;
		filePart.write(filePath);
		
		//Save product details in  the database
		String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
		String dbUser = "root";
		String dbPassword = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
			
			String sql = "INSERT INTO products (name, price, image) VALUES (?, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, price);
			statement.setString(3, fileName);
			
			int rowsInserted = statement.executeUpdate();
			if(rowsInserted > 0) {
				response.sendRedirect("products.jsp"); 
			}
			
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("Error: " +e.getMessage());
		}
		
	}
	
	//Utility method to extract the file name from the part header
	private String extractFileName(Part part) {
		String contentDisposition = part.getHeader("content-disposition");
		for(String content : contentDisposition.split(";")) {
			if(content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 2, content.length() - 1);
			}
		}
		return null;
	}

}