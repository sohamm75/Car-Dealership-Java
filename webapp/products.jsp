<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Horizon Estates</title>
<link rel="stylesheet" href="css/bootstrap.min.css">


<!-- Custom CSS -->

<style>
.card-img-top {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.highlight {
	background-color: yellow;
}
</style>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container mt-5">
		<h2 class="text-center">Available Products</h2>
		<div class="row mt-4">
			<%
			String searchQuery = request.getParameter("query");
			// Database Connection Details
			String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
			String dbUser = "root";
			String dbPassword = "";

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
				String query;

				//Check if search query exist
				if (searchQuery != null && !searchQuery.isEmpty()) {
					query = "SELECT * FROM products WHERE name LIKE ?";
				} else {
					query = "SELECT * FROM products";
				}

				PreparedStatement ps = connection.prepareStatement(query);

				// If search query exist, filter products by name
				if (searchQuery != null && !searchQuery.isEmpty()) {
					ps.setString(1, "%" + searchQuery + "%");
				}
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					String productName = rs.getString("name");
					String productPrice = rs.getString("price");
					String productImage = rs.getString("image");
					int productId = rs.getInt("id");

					// Check if the product matches the search query andd highlight it
					boolean highlight = (searchQuery != null && productName.toLowerCase().contains(searchQuery.toLowerCase()));
			%>

			<div class="col-md-4 mb-4">
				<div class="card h-100<%=highlight ? "highlight" : "" %>">
					<img src="images/<%= productImage %>" class="card-img-top"
						alt="<%= productName %>">
					<div class="card-body">
						<h5 class="card-title"><%= productName %></h5>
						<p class="card-text">
							Price: $<%= productPrice %></p>
						<a href="product_details.jsp?id=<%= productId %>"
							class="btn btn-primary">View Details</a>

						<%
						//show admin controls if admin sessions exist
						if (session.getAttribute("role") != null && 
						session.getAttribute("role").equals("admin")) {
						%>
						<a href="updateprodut.jsp?id=<%= productId %>"
							class="btn btn-warning">Edit</a> 
							<a href="DeleteProductServlet?id=<%=productId%>"
							class="btn btn-danger" onclick="return confirm('Are you Sure')">Delete</a>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			rs.close();
			ps.close();
			connection.close();

			} catch (Exception e) {
			out.println("<p>Error:" + e.getMessage() + "</p>");

			}
			%>
		</div>

		<%
		//display "Add New Products" button Only for admin
		if (session.getAttribute("role") != null && session.getAttribute("role").equals("admin")) {
		%>

		<a href="add_product.jsp" class="btn btn-success mt-4">Add New
			Product</a>

		<%
		}
		%>
	</div>


	<!-- Footer Starts -->
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/bootstrap.bundle.mim.js"></script>
	
	<!-- Footer End -->

</body>
</html>