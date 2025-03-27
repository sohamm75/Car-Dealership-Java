

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Retrieve from data
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password  = request.getParameter("password");
		
		//Database connection parameters
		String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
		String dbUser = "root"; //replace with your database username
		String dbPassword = "";// replace with your databse password
		
		//Initialize response writer
		PrintWriter pw = response.getWriter();
		
		try {
			//Load JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Establish connection
			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
			
			//Prepare sql query
			String sql = "INSERT INTO users (username, password) VALUES (?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
			
			//Execute the query
			int rows = statement.executeUpdate();
			
			if(rows > 0) {
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('User registered succesfully');");
				pw.println("window.location.href = 'Login.jsp';");
				pw.println("</script>");
			}else {
				pw.println("--User regisstered failed--");
				response.sendRedirect("register.jsp");
			}
			//Close resources
			statement.close();
			connection.close();
		}catch(SQLException e) {
			e.printStackTrace();
			pw.println("Database error: "+ e.getMessage());
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			pw.println("JDBC Driver not found: " + e.getMessage());
		}		
		
	}

}
