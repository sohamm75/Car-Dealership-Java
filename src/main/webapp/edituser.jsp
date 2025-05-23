<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	String username = "";
	String password = "";
	String role = "";
	
	String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
	String dbuser = "root";
	String dbPassword = "";
	
	try{
		//Load  the JDBC driver and connect to the database
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbuser, dbPassword);
		
		//Retrieve the user data based on the ID
		String query = "SELECT * FROM  users WHERE id = ?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
			username = rs.getString("username");
			password = rs.getString("password");
			role = rs.getString("role");
		}
		
		//Close the resources
		rs.close();
		ps.close();
		connection.close();
	}catch (Exception e){
		out.println("<p>Error: "+ e.getMessage()+" </p>");
	}

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit user</title>
</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>

<div class="container mt-5">
	<h2>Edit User</h2>
	<form action="UpdateUserServlet" method="post">
	<input type="hidden" name="id" value="<%= id %>">
		<div class = "mb-3">
			<label for="username" class="form-label">Username</label>
			<input type = "text" class="form-control" id="username" name="username" value="<%= username %>" required>
		</div>
		<div class = "mb-3">
			<label for="password" class="form-label">password</label>
			<input type = "password" class="form-control" id="password" name="password" value="<%= password %>"required>
		</div>
		<div class = "mb-3">
			<label for="role" class="form-label">Role</label>
			<Select class = "form-control"  id="role" name="role">
				<option value="user" <%= role.equals("user") ? "selected" : "" %>>User</option>
				<option value="admin" <%= role.equals("admin") ? "selected" : "" %>>Admin</option>
			</Select>
		</div>
		<button type = "submit" class="btn btn-primary">Update User</button>
		</form>
		</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>