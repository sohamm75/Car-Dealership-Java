<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="navbar.jsp"></jsp:include>
<%
	String id = request.getParameter("id");
	String jdbcURl = "jdbc:mysql://localhost:3306/mydatabase";
	String dbuser = "root";
	String dbpassword = "";
	String name = "", price = "",image="";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURl,dbuser,dbpassword);
		String query = "SELECT * FROM products WHERE id = ?";
		PreparedStatement ps = connection. prepareStatement (query);
		ps.setInt(1, Integer.parseInt(id));
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
		name = rs.getString("name");
		price = rs.getString("price");
		image = rs.getString("image");
		}
		rs.close();
		ps.close();
		connection.close();
	}catch (Exception e){
		out.println("<p>Error: "+e.getMessage() + " </p>");
	}


%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container mt-5">
	<h2>Update product</h2>
<form action="updateProductServlet" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<%= id %>">
	<div class="form-group">
    	<label for="name">Product Name</label>
		<input type="text" name="name" class="form-control" id="name" required>
	</div>
		<div class="form-group">
    	<label for="price">Price</label>
		<input type="number" name="price" class="form-control" id="price" required>
	</div>
		<div class="form-group">
    	<label for="image">Product Image</label>
		<input type="file" name="image" class="form-control-file" id="image" required>
	</div>
	<button type="submit" class="btn btn-primary">Update Product</button>
</form>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script src="js/bootstrap.bundle.min.js"></script>


</body>
</html>