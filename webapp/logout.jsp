<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//Invalidate the session if it exists
	HttpSession currentSession = request.getSession(false);
	if(currentSession != null){
		currentSession.invalidate();
	}
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="refresh" content="3;url=Login.jsp"><!-- Redirect to login.jsp after 3 seconds -->
<link rel= "stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<h2>Logged Out Successfully</h2>
<p>You have been successfully logged out. Redirecting to login page...</p>
<p>If you are at redirected automatically, <a href="Login.jsp">click here</a>.</p>


<!-- Footer Starts -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer End -->

</body>
</html>