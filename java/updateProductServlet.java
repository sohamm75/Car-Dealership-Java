import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)

@WebServlet("/updateProductServlet")				
public class updateProductServlet extends HttpServlet {
	private static final String UPLOAD_DIR = "images"; // Directory for Storing uploaded files

	@Override

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Retrieve from data
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		
		// Retrieve file part (if provided)
		
		Part filePart = request.getPart("image");
		String fileName = null;
		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
		
		if (filePart != null && filePart.getSize() > 0) {
			fileName = extractFileName(filePart);
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir(); //Create directory if not exists				
			}
			filePart.write(uploadPath + File.separator + fileName);
		}
		
		// Database Connection
		String jdbcUrl = "jdbc:mysql://localhost:3306/mydatabase";
		String dbUser = "root";
		String dbPassword = "";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl,dbUser,dbPassword);
			
			String sql;
			if(fileName != null) {
				//Update product details including the image
				sql = "UPDATE products SET name = ?, price = ?,image= ? WHERE id = ?";	
			}else {
				//Update products details without changing the image
				sql = "UPDATE products SET name = ?, price = ?  WHERE id = ?";
			}
			
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, price);
			
			if (fileName != null) {
				ps.setString(3, fileName);
				ps.setInt(4, id);	
			}else {
				ps.setInt(3, id);
			}
			
			int rowsUpdated = ps.executeUpdate();
			if(rowsUpdated > 0) {
				response.sendRedirect("products.jsp"); // Redirect to product page
			}else {
				response.getWriter().println("Failed to Update products!");
			}
			
			ps.close();
			connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		response.getWriter().print("Error: " + e.getMessage());
		
		}

	}
	
	// Utility method to extract file name from the part header
	private String extractFileName(Part part) {
		String contentDisposition = part.getHeader("content-disposition");
		for(String content : contentDisposition.split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 2, content.length() - 1);
			}
		}
			return null;
		}
	}