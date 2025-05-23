

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId = request.getParameter("id");
		
		String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
		String dbUser = "root"; 
		String dbPassword = "";
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		try {
			//Load JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
			
			// Prepare SQL query to delete the product based on the productId
			String query = "DELETE FROM products WHERE id = ?";
			preparedstatement = connection.prepareStatement(query);
			preparedstatement.setInt(1, Integer.parseInt(productId));
			int rowsAffected = preparedstatement.executeUpdate();
			
			//If product is  deleted successfully , redirect to a page that shows remaining product
			if(rowsAffected > 0) {
				response.sendRedirect("products.jsp");//redirect to a page sharing all products
			}else {
				//If no rows are affected,show an error message
				request.setAttribute("errorMessage", "Product not found.  ");
				request.getRequestDispatcher("deleteproducts.jsp").forward(request, response);
			}
			
		}catch (Exception e) {
				//Catch any exception, print the stack trace, and show an error message
				e.printStackTrace();
				request.setAttribute("errorMessage", "Error deleting product: "+e.getMessage());
				request.getRequestDispatcher("deleteproducts.jsp").forward(request, response);
				
			}finally {
				try {
				//clean up resources
				if (preparedstatement != null) preparedstatement.close();
				if (connection != null) connection.close();
				}catch(SQLException e) {
					e.printStackTrace();
					
				}
				}
			}
			
			 
	}


