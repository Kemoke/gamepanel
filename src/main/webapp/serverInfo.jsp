<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Server Info</title>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <li class="nav-item">
                <a class="nav-link" href="/panel">Machines</a>
            </li>
            <li class="nav-item active ">
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
                    Server List
                </div>
                <div class="card-body" style="background-color: rgba(255, 255, 255, 0.7);">
                    <%--@elvariable id="servers" type="java.util.List"--%>
                    <c:forEach items="${servers}" var="server">
                        <p class="p-0"><a href="/adminservers/${server.id}/">${server.name}</a></p>
                    </c:forEach>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm">Add server
                    </button>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">New Server</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%--@elvariable id="server" type="com.folcike.gamepanelf.model.Server"--%>
                        <form:form action="/adminservers/addServer" method="post" modelAttribute="server">


                            <div class="form-group">
                                <form:label path="name"><span class="fas fa-key"></span> Server Name </form:label>
                                <form:input type="text" class="form-control" id="name" path="name"
                                            placeholder="Enter the name"></form:input>
                            </div>
                            <div class="form-group">
                                <form:label path="port"><span class="fas fa-home"></span> Port </form:label>
                                <form:input type="text" class="form-control" id="port" path="port"
                                            placeholder="Enter the port"></form:input>
                            </div>
                            <div class="form-group">
                                <form:label path="machine"><span class="far fa-newspaper"></span> Machine </form:label>
                                <form:select path="machine" cssClass="form-control" id="machineSelect" items="${machines}"
                                             itemValue="id" itemLabel="name"></form:select>
                            </div>
                            <div class="form-group">
                                <form:label path="game"><span class="far fa-newspaper"></span> Game </form:label>
                                <form:select path="game" id="gameSelect" cssClass="form-control" items="${games}"
                                             itemValue="id" itemLabel="name"></form:select>
                            </div>

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form:form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Server Info</h5>
                    <c:choose>
                        <%--@elvariable id="error" type="java.lang.String"--%>
                        <c:when test='${empty error}'>
                            <%--@elvariable id="serverInfo" type="com.ibasco.agql.protocols.valve.source.query.pojos.SourceServer"--%>
                            <div class="row">
                                <div class="col-6">
                                    <strong>Hostname</strong>
                                </div>
                                <div class="col-6">
                                        ${serverInfo.name}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <strong>Map</strong>
                                </div>
                                <div class="col-6">
                                        ${serverInfo.mapName}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <strong>Players</strong>
                                </div>
                                <div class="col-6">
                                        ${serverInfo.numOfPlayers}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <strong>Max Players</strong>
                                </div>
                                <div class="col-6">
                                        ${serverInfo.maxPlayers}
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-danger">
                                    ${error}
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
<script src="/webjars/popper.js/1.12.9-1/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.0.0-2/js/bootstrap.min.js"></script>

</body>
</html>