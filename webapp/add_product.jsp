<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Mach Speed Auto</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
<h2>Add New product</h2>
<form action="addProductServlet" method="post" enctype="multipart/form-data">
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
	<button type="submit" class="btn btn-primary">Add Product</button>
</form>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>