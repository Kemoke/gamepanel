<!doctype html>

<html lang="en">

<head>
    <link rel="stylesheet" href="webjars/bootstrap/4.0.0-2/css/bootstrap.css">
    <link rel="stylesheet" href="https://bootswatch.com/4/darkly/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Space+Mono" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">


    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/admin.css">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Games</title>
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

            <li class="nav-item active">
                <a class="nav-link" href="/game">Games</a>
            </li>
            <li class="nav-item">
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

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-header">
                    Game List
                </div>
                <div class="card-body" style="background-color: rgba(255, 255, 255, 0.7);">
                    <p class="card-text">
                        ${game.name}
                    </p>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#gameForm">Add game
                    </button>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="gameForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">New Game</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%--@elvariable id="game" type="com.folcike.gamepanelf.model.Game"--%>
                    <form:form action="/game/addGame" method="post" modelAttribute="game" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group">
                                <form:label path="name"><span class="fas fa-key"></span> Game Name </form:label>
                                <form:input type="text" class="form-control" id="name" path="name"
                                            placeholder="Enter the name"/>
                            </div>
                            <div class="form-group">
                                <form:label path="logo"><span class="far fa-newspaper"></span> Logo </form:label>
                                <form:input type="text" class="form-control" id="logo" path="logo" placeholder="Logo"/>
                            </div>
                            <div class="form-group">
                                <label for="installScript"><span class="far fa-newspaper"></span> Install Script
                                </label>
                                <input type="file" class="form-control" id="installScript" name="installScript"
                                       placeholder="Script Path"/>
                            </div>
                            <div class="form-group">
                                <label for="startScript"><span
                                        class="far fa-newspaper"></span> Start Script </label>
                                <input type="file" class="form-control" id="startScript" name="startScript"/>
                            </div>
                            <div class="form-group">
                                <label for="stopScript"><span
                                        class="far fa-newspaper"></span> Stop Script </label>
                                <input type="file" class="form-control" id="stopScript" name="stopScript"
                                       placeholder="Stop Path"/>
                            </div>
                            <div class="form-group">
                                <form:label path="scriptRootPath"><span
                                        class="far fa-newspaper"></span> Script Root Path </form:label>
                                <form:input type="text" class="form-control" id="scriptRootPath" path="scriptRootPath"
                                            placeholder="Root Path"/>
                            </div>
                            <div class="form-group">
                                <form:label path="configRootPath"><span
                                        class="far fa-newspaper"></span> Config Root Path </form:label>
                                <form:input type="text" class="form-control" id="configRootPath" path="configRootPath"
                                            placeholder="Root Path Configuration"/>
                            </div>
                            <div class="form-group">
                                <form:label path="configFileName"><span
                                        class="far fa-newspaper"></span> Config File Name </form:label>
                                <form:input type="text" class="form-control" id="configFileName" path="configFileName"
                                            placeholder="File Name"></form:input>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Game Details List</h5>

                    <div class="row">
                        <div class="col">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Logo</th>
                                    <th>Name</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--@elvariable id="games" type="java.util.List"--%>
                                <c:forEach items="${games}" var="game">
                                    <tr>
                                        <td><img src="${game.logo}" alt="logo" height="30"></td>
                                        <td>${game.name}</td>
                                        <td>
                                            <button type="button" class="btn btn-success">Edit</button>
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
</div>

<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
<script src="webjars/popper.js/1.12.9-1/popper.min.js"></script>
<script src="/webjars/bootstrap/4.0.0-2/js/bootstrap.min.js"></script>

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>

<script>
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus')
    })
</script>

</body>

</html>