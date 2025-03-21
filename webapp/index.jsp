<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopping site</title>

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
       
       
   <!--      form starts here
       
  <form class="row g-3">
  <div class="col-md-4">
    <label for="validationDefault01" class="form-label">First name</label>
    <input type="text" class="form-control" id="validationDefault01"  required>
  </div>
  <div class="col-md-4">
    <label for="validationDefault02" class="form-label">Last name</label>
    <input type="text" class="form-control" id="validationDefault02"  required>
  </div>
  <div class="col-md-4">
    <label for="validationDefaultUsername" class="form-label">Username</label>
    <div class="input-group">
      <span class="input-group-text" id="inputGroupPrepend2">@</span>
      <input type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" required>
    </div>
  </div>
  <div class="col-md-6">
    <label for="validationDefault03" class="form-label">City</label>
    <input type="text" class="form-control" id="validationDefault03" required>
  </div>
  <div class="col-md-3">
    <label for="validationDefault04" class="form-label">State</label>
    <select class="form-select" id="validationDefault04" required>
      <option selected disabled value="">Choose</option>
      <option>Maharashtra</option>
      <option>Uttam Pradesh</option>
      <option>dil wale</option>
      <option>Bengal</option>
      <option>tamil anna</option>
      <option>Udta punjab</option>
    </select>
  </div>
  <div class="col-md-3">
    <label for="validationDefault05" class="form-label">Zip</label>
    <input type="text" class="form-control" id="validationDefault05" required>
  </div>
  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
      <label class="form-check-label" for="invalidCheck2">
        Agree to terms and conditions
      </label>
    </div>
  </div>
  <div class="col-12">
    <button class="btn btn-primary" type="submit">Submit form</button>
  </div>
</form> -->
       
       
       <!-- form closes here -->
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    
    <!-- modal closed here -->
	
  
  
  
  
  
  <!-- modal closes here -->
  
  
  
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
	
	

	<a href="backendcall">Backend call</a>
</body>
</html> 