<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div class="container mt-5">
	<h2>Add New User</h2>
	<form action="adduserservlet" method="post">
		<div class = "mb-3">
			<label for="username" class="form-label">Username</label>
			<input type = "text" class="form-control" id="username" name="username" required>
		</div>
		<div class = "mb-3">
			<label for="password" class="form-label">Password</label>
			<input type = "password" class="form-control" id="password" name="password" required>
		</div>
		<div class = "mb-3">
			<label for="role" class="form-label">Role</label>
			<Select class = "form-control"  id="role" name="role">
				<option value="user">User</option>
				<option value="admin">Admin</option>
			</Select>
		</div>
		<button type = "submit" class="btn btn-primary">Add User</button>
		</form>
		</div>
	

<script src="js/bootstrap.bundle.min.js"></script>


</body>
</html>