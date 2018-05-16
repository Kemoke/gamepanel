<!doctype html>

<html lang="en">

<head>
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
<div class="row">
  <div class="col-sm-4">
    <div class="card">
      <div class="card-header">
        Server List
      </div>
      <div class="card-body" style="background-color: rgba(255, 255, 255, 0.7);">
        <p class="card-text">
            Server1
        </p>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm">Add server</button>
      </div>
    </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-8">
    <div class="card">
      <div class="card-body">
      <div class="card border-secondary w-80" style="max-width: 54rem;">
        <div class="card-body">
        <h5 class="card-title">Server List</h5>

        <div class="row">
            <div class="col">
                <a href="/admin" class="card-link">Server1</a>
            </div>
            <div class="col-center">
                <button type="button" class="btn btn-success">Start</button>
                <button type="button" class="btn btn-info">Stop</button>
                <button type="button" class="btn btn-danger">Delete</button>

            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col">
                <a href="/admin" class="card-link">Server1</a>
            </div>
            <div class="col-center">
                <button type="button" class="btn btn-success">Start</button>
                <button type="button" class="btn btn-info">Stop</button>
                <button type="button" class="btn btn-danger">Delete</button>

            </div>
        </div>
        <hr>

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