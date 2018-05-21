    <!doctype html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.0.0-2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>
<main role="main" class="container">
    <%--@elvariable id="user" type="com.folcike.gamepanelf.model.User"--%>
    <%--@elvariable id="error" type="java.lang.String"--%>
    <h3> Welcome Gamer! </h3>

    <form:form action="/login/" method='POST' modelAttribute="user">
        <div class="alert alert-danger">${error}</div>
        <div class="card-body">
            <div class="row form-group">
                <div class="col-md-4"><form:label path="username">Username</form:label></div>
                <div class="col-md-8"><form:input type='text' path="username" cssClass="form-control"/></div>
            </div>
            <div class="row form-group">
                <div class="col-md-4"><form:label path="password">Password</form:label></div>
                <div class="col-md-8"><form:input type='password' path='password' cssClass="form-control"/></div>
            </div>
            <div class="row form-group">
                <div class="col-md-8 offset-md-4"><button type="submit" class="btn btn-success">Login</button></div>
            </div>
        </div>
    </form:form>

</main><!-- /.container -->


<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
<script src="/webjars/popper.js/1.12.9-1/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.0.0-2/js/bootstrap.min.js"></script>
</body>
</html>