<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mach Speed Auto</title>

<style >
.carousel{

}

.carousel-inner img{
	height:85vh;
	object-fit:cover;
}

.card{
margin-top: 20px;

}

.lub{
height:28vh;
width:39vh;
background-image: url('img/img1.jpeg');
background-size: cover;
background-position: center;


}
</style>

</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
	<div class = "carousel">
	<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/bmw_audi_mercedees_car_images.jpeg" class="d-block w-100" alt="..." >
    </div>
    <div class="carousel-item">
      <img src="img/img2.jpeg" class="d-block w-100" alt="..." >
    </div>
    <div class="carousel-item">
      <img src="img/img3.jpeg" class="d-block w-100" alt="...">
    </div>
  </div>
</div>
</div>

<div class="card" style="width: 18rem;">
  
  <!-- modal starts here -->
  
  
  	  <!-- modal added here -->
    
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary lub" data-bs-toggle="modal" data-bs-target="#exampleModal">
   
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
       
  </body>
</html> 