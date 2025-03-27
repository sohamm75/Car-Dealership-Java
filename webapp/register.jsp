
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel= "stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style>

body{
background-color: #f4f4ff4;
}

.register-container{
margin-top: 5%;
margin-bottom: 5%;
}

.register-form{
background-image:url('img/login back.jpg') ;
padding:50px;
background-size: cover;
border-radius: 10px;
box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}

.form-control1{
margin-bottom:20px;
width:100%;
height:45px;
border-radius: 5px;
}

.form-control:focus{
box-shadow:none;
border-color:#007bff;
}

.btn-primary{
width: 100%;
height:40px;
border-radius: 5px;
margin-bottom:20px;
font-size: 20px;
letter-spacing: 1px;
}

</style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>


<div class="container register-container">
	<div class="row justify-content-center">
		<div class="col-md-4">
			<h2 class="text-center">Register</h2>

				<form action="registerservlet" method="post" class="register-form">
 					<div class="form-group">
 					<input type="text" name="username" class="form-control1" placeholder="Enter your username" required >
 					</div>
 
				 <div class="form-group">
				 <input type="email" name="email" class="form-control1" placeholder="Enter your Email" required >
				 </div>
 
				 <div class="form-group">
				 <input type="password" name="password" class="form-control1" placeholder="Enter your Password" required>
				 </div>
 
				 <div class="form-group">
				 <input type="submit" class="btn btn-primary" value="submit">				 
				 </div>
 
				<div class="form-group text-center">
			 		<a href="register.jsp">Already have an account? login</a>
			 	</div>
 
 				</form>


		</div>

	</div>


</div>



<!-- Footer Starts -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer End -->

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>