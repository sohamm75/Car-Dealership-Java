import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data		
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase"; 
        String dbUser = "root";
        String dbPassword = ""; 

        // Initialize response writer
        PrintWriter pw = response.getWriter();

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Prepare SQL query to check user credentials
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // User exists
                String role = resultSet.getString("role"); 

                // Create a session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                if ("admin".equals(role)) {
                    // Redirect to admin dashboard
                    response.sendRedirect("products.jsp");
                } else {
                    // Redirect to user dashboard
                    response.sendRedirect("index.jsp");
                }
            } else {
                // Invalid credentials
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Invalid username or password');");
                pw.println("window.location.href = 'Login.jsp';");
                pw.println("</script>");
            }

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            pw.println("Database error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            pw.println("JDBC Driver not found: " + e.getMessage());
        }
    }
}
