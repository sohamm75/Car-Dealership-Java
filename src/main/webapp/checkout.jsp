<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
// Database connection parameters
String jdbcURL = "jdbc:mysql://localhost:3306/mydatabase";
String dbUser = "root";
String dbPassword = "";

// Retrive product ID from The request
String productId = request.getParameter("productId");
String name = null, price = null, image = null;

if (productId != null) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		String query = "SELECT * FROM products WHERE id = ?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, Integer.parseInt(productId));
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
	name = rs.getString("name");
	price = rs.getString("price");
	image = rs.getString("image");
		}

		rs.close();
		ps.close();
		connection.close();
	} catch (Exception e) {
		out.println("<p class='text-danger'>Error fetching product details:" + e.getMessage() + "</p>");
	}
}


double pricePerUnit = (price != null) ? Double.parseDouble(price) : 0.0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<style>
.container {
	margin-top: 50px;
}

.product-img-container img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.quantity-input {
	width: 80px;
	margin-top: 10px
}

#rzp-button1 {
	background-color: #3399cc;
	color: white;
	border: none;
	padding: 12px 25px;
	border-radius: 5px;
	cursor: pointer;
}

#rzp-button1:hover {
	background-color: #2a88b7;
}
</style>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container">
		<h2 class="text-center">Checkout</h2>
		<%
		if (name != null) {
		%>
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="product-img-container">
					<img src="images/<%=image%>" alt="<%=name%>">
				</div>
			</div>

			<div class="col-md-6">
				<h3><%=name%></h3>
				<p>
					Price (per unit): $<%=String.format("%.2f", pricePerUnit)%></p>
				<label for="quantity">Quantity</label> <input type="number"
				id="quantity" class="quantity-input" value="1" min="1"
					onchange="updateTotalAmount()">
				<p id="total-amount">
					Total Amount: $<%=String.format("%.2f", pricePerUnit)%></p>
				<button id="rzp-button1">Pay With Razorpay</button>
			</div>
		</div>
		<%
		} else {
		%>
		<p class="text-danger text-center">Product not Found.</p>
		<%
		}
		%>
	</div>

	<script>

var pricePerUnit = <%=pricePerUnit%>;
var options = {
		"key":"rzp_test_faBr2afLavZmDS", //Razorpay test Key
		"amount": pricePerUnit * 100,
		"currency": "INR",
		"name": "Your Store",
		"description": "Purchase of <%=name%> s",
			"handler" : function(response) {
				alert("Payment Successful! payment ID: "
						+ response.razorpay_payment_id);
				window.location.href = "paymentsuccess.jsp";

			},
			"theme" : {
				"color" : "#3399cc"
			}
		};

		function updateTotalAmount() {
			var quantity = document.getElementById("quantity").value;
			var totalAmount = quantity * pricePerUnit;
			document.getElementById("total-amount").textContent = "Total Amount: $"
					+ totalAmount.toFixed(2);
			options.amount = Math.round(totalAmount * 100); //Update amount in Razorpay options

		}

	
		document.getElementById('rzp-button1').onclick = function(e) {
			updateTotalAmount();
			var rzp1 = new Razorpay(options);
		
			
			rzp1.open();
			e.preventDefault();
		};
	</script>

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>