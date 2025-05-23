//DeleteUserServlet

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
		String dbUser = "root"; 
		String dbPassword = "";
		
		try {
			//Load JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Establish connection
			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
			
			
			
			String query = "DELETE FROM users WHERE id = ?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, id);
			
			// Execute the query
			ps.executeUpdate();
			
			// Close resources
			ps.close();
			connection.close();
			
			// Redirect to the manageUsers.jsp page
			response.sendRedirect("Manageuser.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			
			response.sendRedirect("error.jsp");
		}
			
	}

}
