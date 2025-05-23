<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page session= "true" %>
    <%
    String username = null;
    String role= null;
    if(session != null)
    {
    	username =(String) session.getAttribute("username");
    	role =(String) session.getAttribute("role");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NavBar</title>
<link rel="icon" type="img/png" href="img/lamp logo.jpg" style="border-radius : 50px">
<link rel= "stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style>

.navbar{
background-color: #17a2b8;
}

.navbar-brand{
color:white;
font-weight: bold;
font-size: 1.5rem;
}

.nav-link{
color:white;
transition:color 0.3s ease;
}

.nav-link:hover{
color:red;
}

.navbar-toggler{
border-color: white;
}

.navbar-toggler-icon{
background-image: 
}

.form-control{
border-radius:20px;
}

.btn-outline-light{
border-radius:20px;
}


</style>


</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" > <img alt="" src="img/logo.jpeg" height="50px" width="50px" style="border-radius: 50px; border :2px solid white" ></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="about.jsp">About</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link active" href="products.jsp">Products</a>
        </li>
        <% if (username == null) {%>
         <li class="nav-item">
          <a class="nav-link active" href="Login.jsp">Login</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" href="register.jsp">Register</a>
        </li>
        
        <% }else { %>
         <li class="nav-item">
          <a class="nav-link active" href="logout.jsp">Logout</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" href="#">Welcome : <%=username %></a>
        </li>
        
        
        <% if("admin".equals(role)){ %>
       
       <li class="nav-item">
          <a class="nav-link active" href="Manageuser.jsp">Manage Users</a>
        </li>
        <% } %>
        <% } %>
        
         </ul>
      
       
       
     
      <form class="d-flex" method="get" action="products.jsp">
        <input style="background-color: white ;" class="form-control me-2" type="search" name="query" placeholder="Search for products" aria-label="Search">
        <button  class="btn btn-outline-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

 
</body>
</html>