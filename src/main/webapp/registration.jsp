<!doctype html>
<html lang="en">
<head>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.0.0-2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/registration.css">
</head>
<body>
<div class="form-group">
    <div class="form-group2">
        <h1>Registration Form</h1>
        <%--@elvariable id="user" type="com.folcike.gamepanelf.model.User"--%>
        <form:form method="POST" action="/registration/" modelAttribute="user">
            <div class="row">
                <div class="form-group col-md-6">
                    <form:label path="firstname">First Name</form:label>
                    <form:input type="text" class="form-control" path="firstname" placeholder="First Name"/>
                </div>
                <div class="form-group col-md-6">
                    <form:label path="lastname">Last Name</form:label>
                    <form:input type="text" class="form-control" placeholder="Last name" path="lastname"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <form:label path="email">Email address</form:label>
                    <form:input type="email" class="form-control" path="email" aria-describedby="emailHelp"
                                placeholder="Enter email"/>
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.
                    </small>
                </div>
                <div class="form-group col-md-6">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-user"></span>
            </span>
                    <form:label path="username">User Name</form:label>
                    <form:input type="text" class="form-control" placeholder="User name" path="username"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-lock"></span>
            </span>
                    <form:label path="password">Password</form:label>
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
                <button type="submit" class="btn btn-success btn-lg btn-block">Submit</button>
            </div>
        </form:form>
    </div>
</div>

<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
<script src="/webjars/popper.js/1.12.9-1/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.0.0-2/js/bootstrap.min.js"></script>
</body>
</html>