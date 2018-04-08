<!doctype html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

 <html lang="en">
   <head>
     <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">


     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="webapp/css/registration.css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body>


<div class="main main-agileits">
		<h1>Client Signup Form</h1>
		<div class="main-agilerow">
			<div class="signup-wthreetop">
				<h2>Welcome to Registration</h2>
				<p>Lorem ipsum dolor sit amet </p>
			</div>
			<div class="contact-wthree">
				<form action="#" method="post">
					<h3>Step 1 :</h3>
					<div class="form-w3step1">
						<input type="text" name="Name" placeholder="Your Name" required="">
						<input type="email" class="email agileits-btm" name="Email" placeholder="Email" required="">
					</div>
					<h3>Step 2 :</h3>
					<div class="form-w3step1">
						<input type="text" name="User Name" placeholder="User Name" required="">
						<input type="password" name="Password" placeholder="Password" required="">
						<input type="password" class="agileits-btm" name="confirm password" placeholder="Confirm Password" required="">
					</div>
					<h3>Step 3 :</h3>
					<div class="form-w3step1 w3ls-formrow">
						<input type="text" name="Number" placeholder="Mobile number" required="">
						<input type="text" class="agileits-btm" name="Your Address" placeholder="Your Address" required="">
					</div>
					<div class="agileits-row2 w3ls-formrow2">
						<input type="checkbox" id="brand2" value="">
						<label for="brand2"><span></span>I accept the terms of Use</label>
					</div>
					<input type="submit" value="SUBMIT">
				</form>
			</div>
		</div>
	</div>
<body>
</html>