<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Here</title>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>

 <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

  <style media="screen">


	.form1{
	margin-top: 1px;
	}
	.background{
	
	background-color :black;
    width: 430px;
    height: 520px;
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 50%;
}
.background .shape{
    height: 200px;
    width: 200px;
    position: absolute;
    border-radius: 50%;
}
.shape:first-child{
    background: linear-gradient(
        #1845ad,
        #23a2f6
    );
    left: -80px;
    top: -80px;
}
.shape:last-child{
    background: linear-gradient(
        to right,
        #ff512f,
        #f09819
    );
    right: -30px;
    bottom: -80px;
}
.login-form{
    height: 520px;
    width: 400px;
    background-color: rgba(255,255,255,0.13);
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    border-radius: 10px;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255,255,255,0.1);
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 50px 35px;
}
.login-form *{
    font-family: 'Poppins',sans-serif;
    color: #ffffff;
    letter-spacing: 0.5px;
    outline: none;
    border: none;
}
.login-form h3{
    font-size: 32px;
    font-weight: 500;
    line-height: 42px;
    text-align: center;
}

label{
    display: block;
    margin-top: 30px;
    font-size: 16px;
    font-weight: 500;
}
input{
    display: block;
    height: 50px;
    width: 100%;
    background-color: rgba(255,255,255,0.07);
    border-radius: 3px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: 300;
}
::placeholder{
    color: #e5e5e5;
}
button{
    
    width: 100%;
    background-color: #ffffff;
    color: #080710;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}

.squishy{
margin-top: 20px;
}

.squishy-classic {
  background-color: #f0f0f0;
  color: #242424;
  border-radius: 0.5rem;
  box-shadow: 
    inset 0 1px 0 0 #f4f4f4,
    0 1px 0 0 #efefef,
    0 2px 0 0 #ececec,
    0 4px 0 0 #e0e0e0,
    0 5px 0 0 #dedede,
    0 6px 0 0 #dcdcdc,
    0 7px 0 0 #cacaca,
    0 7px 8px 0 #cecece;
}

.squishy-classic:hover {
  transform: translateY(-4px);
  box-shadow: 
    inset 0 1px 0 0 #f4f4f4,
    0 1px 0 0 #efefef,
    0 1px 0 0 #ececec,
    0 2px 0 0 #e0e0e0,
    0 2px 0 0 #dedede,
    0 3px 0 0 #dcdcdc,
    0 4px 0 0 #cacaca,
    0 4px 6px 0 #cecece;
}
.social{
  margin-top: 30px;
  display: flex;
}
.social div{
  background: red;
  width: 150px;
  border-radius: 3px;
  padding: 5px 10px 10px 5px;
  background-color: rgba(255,255,255,0.27);
  color: #eaf0fb;
  text-align: center;
}
/* .social div:hover{
  background-color: rgba(255,255,255,0.47);
} */

.go:hover{
 background-image: linear-gradient(90deg, #00C0FF 0%, #FFCF00 49%, #FC4F4F 80%, #00C0FF 100%);
   animation:slidebg 5s linear infinite;
}

.fb:hover{
background-color: blue;
color:white;
}


i:hover{
color: #00ffff;
}


.social .fb{
  margin-left: 25px;
}
.social i{
  margin-right: 4px;
}
	

</style>

</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
	<div class = "form1">
	
            <div class="background">
        <div class="shape" style="margin-top: 50px;"></div>
        <div class="shape"></div>
    </div>
    <form action="loginservlet" method="post" class="login-form">
        <h3>Login Here</h3>

        <label for="username">Username</label>
        <input type="text" name="username" class="form-control" placeholder="Email or Phone" id="username">

        <label for="password">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" id="password">

         <button type="submit" class="squishy squishy-classic">
           Login
        </button>
        <div class="social">
          <div class="go"><i class="fab fa-google"></i>  Google</div>
          <div class="fb"><i class="fab fa-facebook"></i>  Facebook</div>
        </div>
    </form>
	
	
	</div>


</body>
</html>