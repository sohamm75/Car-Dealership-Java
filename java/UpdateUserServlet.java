

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Retrieve Parameters from the form
		
		String id = request.getParameter("id");
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
			String query = "UPDATE users SET username = ?, password = ?, role = ? WHERE id = ?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, role);
			ps.setString(4, id);
			
			//Execute the query
			ps.executeUpdate();
			
			//close the resources
			ps.close();
			connection.close();
			
			//redirect to the manageusers.jsp page with a success message
			response.sendRedirect("Manageuser.jsp?message=User updated succesfully");
			
	}catch(Exception e) {
		e.printStackTrace();
		
		response.sendRedirect("error.jsp?message=" + e.getMessage());
		}
	}

}

	


