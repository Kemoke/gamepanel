<!doctype html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.0.0-2/css/bootstrap.min.css"/>">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="container">
    <div class="card">
        <h1 class="text-center">WILKOMEN</h1>
        <%--@elvariable id="user" type="com.folcike.gamepanelf.model.User"--%>
        <form:form action="/auth/login" modelAttribute="user">
            <form:label path="username">Username:</form:label>
            <form:input path="username" cssClass="form-control"/>
            <form:errors path="username" cssClass="error"/>
        </form:form>
    </div>
</div>

<script src="<c:url value="/webjars/bootstrap/4.0.0-2/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>