

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet("/adduserservlet")
public class adduserservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Retrieve form data		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
				
		//Database connection parameters
		String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
		String dbUser = "root"; 
		String dbPassword = "";
		
		try {
			//Load JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Establish connection
			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
			
			//Prepare sql query
			String query = "INSERT INTO users (username, password, role) VALUES (?,?,?)";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, role);
			
			//Execute the query
			ps.executeUpdate();
			
			//close the resources
			ps.close();
			connection.close();
			
			//redirect to the manageusers.jsp page with a success message
			response.sendRedirect("Manageuser.jsp?message=user added succesfully");
			
	}catch(Exception e) {
		e.printStackTrace();
		
		response.sendRedirect("error.jsp?message=" + e.getMessage());
		}
	}

}
