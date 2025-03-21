<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div class = "container mt-5">
	<h2 class="text-center">Manage Users</h2>
	
	<!-- Display success/error messages -->
	<%
		String message = request.getParameter("message");
		if(message != null){
	
	%>
		<div class="alert alert-success"><%= message %></div>
	
	<%
		}
	%>
	<table class="table table-bordered table-hover">
		<thead class="thead-dark">
			<tr>
				<th>User ID</th>
				<th>Username</th>
				<th>Password</th>
				<th>Role</th>
				<th>Actions</th>
			</tr>
			</thead>
			<tbody>
				<%
					String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
					String dbUser = "root";
					String dbPassword = "";
					
					try{
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
						
						String query = "Select * FROM users";
						PreparedStatement ps = connection.prepareStatement(query);
						ResultSet rs = ps.executeQuery();
						
						boolean hasData = false;
						
						while(rs.next()){
							hasData = true;
				%>
				
					<tr>
						<td><%= rs.getInt("id") %></td>
						<td><%= rs.getString("username") %></td>
						<td><%= rs.getString("password") %></td>
						<td><%= rs.getString("role") %></td>
						<td>
							<a href = "edituser.jsp?id=<%= rs.getInt("id")%>"
								class="btn btn-warning btn-sm">Edit</a>
							<a href="DeleteUserServlet?id=<%= rs.getInt("id") %>"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Are you sure you want to delete this user?')">
							Delete</a>
							</td>
							</tr>
				<%
				}
						if(!hasData){
				%>							
						<tr>
							<td colspan="5" class="text-center">No users found</td>
						</tr>
				<%
						}
						
						rs.close();
						ps.close();
						connection.close();
					}catch (Exception e){
				%>
					<tr>
						<td colspan="5" class="text-danger">Error: <%= e.getMessage() %></td>
					</tr>		
				<%
					}
				%>		
		</tbody>				
	</table>
	
	<a href="addUser.jsp" class="btn btn-success">Add New User</a>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src = "js/bootstrap.bundle.min.js"></script>
</body>
</html>