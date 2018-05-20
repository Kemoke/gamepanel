<!doctype html>

<html lang="en">

<head>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <link rel="stylesheet" href="webjars/bootstrap/4.0.0-2/css/bootstrap.css">
    <link rel="stylesheet" href="https://bootswatch.com/4/darkly/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Space+Mono" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/admin.css">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Admin Page</title>
</head>

<body>


<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a href="#">
            <i class="fa fa-gamepad" aria-hidden="false" style="font-size:24px;color:white; padding-right:10px"></i>
        </a>
        <a class="navbar-brand" href="#">Game Panel</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

         <ul class="navbar-nav ml-auto">

            <li class="nav-item">
                <a class="nav-link" href="/adminservers/">Servers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/machine">Machines</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/game">Games</a>
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
<div class="row">

  <div class="col">
    <div class="card">
      <div class="card-body">
      <div class="card border-secondary w-80" style="max-width: 54rem;">
        <div class="card-header">${game.name}</div>
        <div class="card-body">
        <table>
                <tr>
                    <td>Name :</td>
                    <td>${game.name}</td>
                    <td><form:input type="text" class="form-control" id="name" path="name" placeholder=${game.name}></form:input></td>
                </tr>
                <tr>
                    <td>ID :</td>
                    <td>${game.id}</td>
                    <td><form:input type="text" class="form-control" id="id" path="id" placeholder=${game.id}></form:input></td>
                </tr>
                <tr>
                    <td>Logo :</td>
                    <td>${game.logo}</td>
                    <td><form:input type="text" class="form-control" id="logo" path="logo" placeholder=${game.logo}></form:input>
</td>
                </tr>
                <tr>
                    <td>Script Path:</td>
                    <td>${game.installScriptPath}</td>
                    <td><form:input type="text" class="form-control" id="installScriptPath" path="installScriptPath" placeholder=${game.installScriptPath}></form:input>
</td>
                </tr>
                <tr>
                    <td>Start Path:</td>
                    <td>${game.startScriptPath}</td>
                    <td><form:input type="text" class="form-control" id="startScriptPath" path="startScriptPath" placeholder=${game.startScriptPath}></form:input>
</td>
                </tr>
                <tr>
                    <td>Stop Path:</td>
                    <td>${game.stopScriptPath}</td>
                    <td><form:input type="text" class="form-control" id="stopScriptPath" path="stopScriptPath" placeholder=${game.stopScriptPath}></form:input>
</td>
                </tr>
                <tr>
                    <td>Script Root Path:</td>
                    <td>${game.scriptRootPath}</td>
                    <td><form:input type="text" class="form-control" id="scriptRootPath" path="scriptRootPath" placeholder=${game.scriptRootPath}></form:input>
</td>
                </tr>
                <tr>
                    <td>Root Path Configuration:</td>
                    <td>${game.configRootPath}</td>
                    <td><form:input type="text" class="form-control" id="configRootPath" path="configRootPath" placeholder=${game.configRootPath}></form:input>
</td>
                </tr>
                <tr>
                    <td>File Names:</td>
                    <td>${game.configFileName}</td>
                    <td><form:input type="text" class="form-control" id="configFileName" path="configFileName" placeholder=${game.configFileName}></form:input>
</td>
                </tr>
                <tr>
                    <td>Servers:</td>
                    <td>${game.servers}</td>
                    <td><form:input type="text" class="form-control" id="servers" path="servers" placeholder=${game.servers}></form:input>
</td>
                </tr>
                <tr>
                    <td>Server Files:</td>
                    <td>${game.serverConfigFields}</td>
                    <td> <form:input type="text" class="form-control" id="serverConfigFields" path="serverConfigFields" placeholder=${game.serverConfigFields}></form:input>
</td>
                </tr>
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

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>

</body>

</html>