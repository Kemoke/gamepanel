<!doctype html>
   <head>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <html lang="en">
   <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">


        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/registration.css"></head>
<body>
<form>
<div class="form-group">

  <div class="form-group2">
  <h1>Registration Form</h1>
    <form:form method="POST" action="" modelAttribute="user">
      <div class="row">
        <div class="form-group col-md-6">
          <form:label path="firstname">First Name</label>
          <form:input type="text" class="form-control" path="firstname"/>
        </div>
        <div class="form-group col-md-6">
            <form:label path="lastname">Last Name</label>
            <form:input type="text" class="form-control" placeholder="Last name" path="lastname"/>
        </div>
      </div>
      <div class="row">
        <div class="form-group col-md-6">
            <form:label path="email">Email address</label>
            <form:input type="email" class="form-control" path="email" aria-describedby="emailHelp" placeholder="Enter email"/>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group col-md-6">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-user"></span>
            </span>
            <form:label path="username">User Name</label>
            <form:input type="text" class="form-control" placeholder="User name" path="username"/>
        </div>
      </div>
      <div class="row">
        <div class="form-group col-md-6">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-lock"></span>
            </span>
            <form:label for="password">Password</label>
            <form:input type="password" class="form-control" path="password" placeholder="Password"/>
        </div>
        <div class="form-group col-md-6">
            <label for="validationServer01">Confirm Password</label>
            <input type="password" class="form-control is-valid" id="validationServer01" placeholder="Password">
            <div class="valid-feedback">Looks good!</div>
        </div>
        <div class="form-group">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
              <label class="form-check-label" for="invalidCheck2">
                Agree to terms and conditions
              </label>
            </div>
          </div>
        <button type="button" class="btn btn-success btn-lg btn-block">Submit</button>
  </div>
</div>
</form>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>