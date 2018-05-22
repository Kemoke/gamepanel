<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="webjars/bootstrap/4.0.0-2/css/bootstrap.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://bootswatch.com/4/darkly/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/admin.css">
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a href="#">
            <i class="fa fa-gamepad" aria-hidden="false" style="font-size:24px;color:white; padding-right:10px"></i>
        </a>
        <a class="navbar-brand" href="#">Game Panel</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <ul class="navbar-nav ml-auto">

            <li class="nav-item">
                <a class="nav-link" href="/game">Games</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/panel">Machines</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/adminservers">Servers</a>
            </li>
        </ul>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/login">Log out</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<main class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-header">Machine List</div>
                <div class="card-body" style="background-color: rgba(255, 255, 255, 0.7);">

                    <c:forEach items="${machines}" var="machine">
                        <a class="card-link" href="/admin" style="color:black">Machine #${machine.id}</a>
                        <br>
                    </c:forEach>

                    <button type="button" class="btn btn-primary mt-md-2" data-toggle="modal"
                            data-target="#exampleModal">Add machine
                    </button>
                </div>
            </div>
        </div>

        <!--Modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%--@elvariable id="machine" type="com.folcike.gamepanelf.model.Machine"--%>
                        <form:form action="/panel/insertMachine" method="post" modelAttribute="machine">

                            <div class="form-group">
                                <form:label path="username"><span class="fab fa-napster"></span> Username </form:label>
                                <form:input class="form-control" id="username" path="username" type="text"
                                            placeholder="Enter username"></form:input>
                            </div>
                            <div class="form-group">
                                <form:label path="password"><span class="fas fa-key"></span> Password </form:label>
                                <form:input type="password" class="form-control" id="password" path="password"
                                            placeholder="Enter password"></form:input>
                            </div>
                            <div class="form-group">
                                <form:label path="name"><span class="fas fa-home"></span> Name </form:label>
                                <form:input type="text" class="form-control" id="name" path="name"
                                            placeholder="Enter name"></form:input>
                            </div>
                            <div class="form-group">
                                <form:label path="hostname"><span
                                        class="far fa-newspaper"></span> Hostname </form:label>
                                <form:input type="text" class="form-control" id="hostname" path="hostname"
                                            placeholder="Enter hostname"></form:input>
                            </div>

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form:form>
                    </div>
                    <div class="modal-footer">
                    </div>

                </div>
            </div>

        </div>

        <!--ModalEnds-->

        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Machine List</h5>
                    <%--@elvariable id="machines" type="java.util.List"--%>
                    <div class="row">
                        <div class="col">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>Name</th>
                                    <th>Hostname</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${machines}" var="machine">
                                    <tr>
                                        <td>${machine.id}</td>
                                        <td>${machine.username}</td>
                                        <td>${machine.name}</td>
                                        <td>${machine.hostname}</td>
                                        <td>
                                            <button type="button" class="btn btn-danger">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="webjars/popper.js/1.12.9-1/popper.min.js"></script>
    <script src="/webjars/bootstrap/4.0.0-2/js/bootstrap.min.js"></script>

    <script>
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus')
        })
    </script>
</main>
</body>
