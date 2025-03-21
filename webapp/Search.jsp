<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   String searchquery = request.getParameter("query");
   
   if(searchquery != null && !searchquery.trim().isEmpty() ){
	   //use searchQuery to search for relevant pages
	   //for now we are just showing query as a response
	%>   
	   <h2> Search Results for: <%= searchquery %></h2>
	<%    
   }else{
   %>
   		<h2>No search query entered</h2>
   <%
   }   
      %>		
   
    
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->