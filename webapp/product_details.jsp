<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Horizon Estate</title>
<link rel="stylesheet" href="css/bootstrap.min.js">

<!-- Custom CSS to Style the image responsively -->
<style>
.product-img-container{
width:100%;
max-width:500px;
margin:auto;
}

.product-img-container img{
width: 100%;
height: 300px;
object-fit:cover;
border-radius: 5px;
box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>

<div class="container mt-5">
<h2>Product Details</h2>

<%

//Database connection parameters
String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
String dbUser = "root";
String dbPassword = "";

//Retrive the product ID from the request

String productId = request.getParameter("id");
String name = null, price = null, image = null;

//fetch product details from database
if(productId != null){
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		String query = "SELECT * FROM products WHERE id = ?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, Integer.parseInt(productId));
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
			name = rs.getString("name");
			price = rs.getString("price");
			image = rs.getString("image");
		}
		
		rs.close();
		ps.close();
		connection.close();
	}catch(Exception e){
		out.println("<p class='text-danger'>Error:" +e.getMessage()+ "</p>");
		
	}
}

//display the Products details if available
if(name != null){
%>
<div class="row mt-4">
<div class="col-md-6">
<!-- Image Container For Responsive Design -->
<div class="product-img-container">
<img src="images/<%= image %>" class="img-fluid" alt="<%= name %>">
</div>
</div>

<div class="col-md-6">
<h3><%= name %></h3>
<p>Price: $ <%= price %></p>
<form action="checkout.jsp" method="get">
<input type="hidden" name="productId" value="<%= productId%>">
<input type="hidden" name="productPrice" value="<%= price%>">
<button type="submit" class="btn btn-success">Buy Now</button>

</form>
</div>
</div>
<%
}else{
%><p class="text-danger">Product not found.</p>
<%
}
%>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>