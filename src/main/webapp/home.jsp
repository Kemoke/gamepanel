<!doctype html>

<html lang="en">

<head>
    <style>
        body {
            font-family: "Courier New", Courier, monospace;
        }
    </style>
    <link rel="stylesheet" href="webjars/bootstrap/4.0.0-2/css/bootstrap.css">
    <link rel="stylesheet" href="https://bootswatch.com/4/darkly/bootstrap.min.css">


    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home Page</title>
</head>

<body >


<header>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a>
                <i class="fa fa-gamepad" aria-hidden="false" style="font-size:24px;color:white; padding-right:10px"></i>
            </a>
            <a class="navbar-brand" href="#">Game Panel</a>
            <div class="container-fluid ">

                <div class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
                    <a href="#">
                        <i class="fa fa-gamepad p-md-2  " aria-hidden="false" style="font-size:24px;color:white"></i>
                    </a>
                    <a class="navbar-brand" href="#">Game Panel</a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown">Games</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Game#1</a>
                                    <a class="dropdown-item" href="#">Game#2</a>
                                    <a class="dropdown-item" href="#">Game#3</a>
                                </div>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="/login">Login</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="/registration/">
                                    <button class="btn-sm btn-warning">Join Us</button>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>

<main>


    <br>
    <br>
    <br>
    <br>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">

                <h1 align="center">Web Game Panel</h1>

                <p align="center">Intuitive and User Friendly</p>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-12">
                <p align="center">
                    <a href="/registration/">
                        <button class="btn-lg btn-warning">Get Started</button>
                    </a>
                </p>
            </div>
        </div>
        <br>
        <div class="row" >
            <div class="col-md-6">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="max-height: 519px">
                            <img class="d-block w-100" src="https://images2.alphacoders.com/617/617634.jpg" alt="First slide" >
                        </div>
                        <div class="carousel-item" style="max-height: 519px">
                            <img class="d-block w-100" src="https://images4.alphacoders.com/823/thumb-1920-82368.jpg" alt="Second slide" >>
                        </div>
                        <div class="carousel-item" style="max-height: 519px">
                            <img class="d-block w-100" src="https://images7.alphacoders.com/587/thumb-1920-587593.png" alt="Third slide" >>
                        </div>
                        <div class="carousel-item" style="max-height: 519px">
                            <img class="d-block w-100" src="https://images7.alphacoders.com/811/thumb-1920-811249.png" alt="Fourth slide" >>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <h3>What is a Web Game Panel?</h3>
                <p style="page-break-after: always;"> A web-based application to setup, manage, and monitor various game server hosts.<br>
                    Used primarily by server owners to instantiate multiple instances without having to manually configuring the settings.
                    <br>Facilitating the management of the servers by receiving diagnostic information regarding the status of each instance.
                </p>
            </div>
            <div class="row img-fluid mt-md-3">
                <div class="col-md-4 img-fluid">
                    <div class="card align-items-center pt-md-2">
                        <h4 class="card-title">Flexibility</h4>
                        <p align="center">Seamless and instantaneous connection to your game server.<br>
                            Leave the nitty-gritties to us. With our service you can connect on the fly with a press of a button.</p>
                    </div>
                </div>
                <div class="col-md-4 img-fluid">
                    <div class="card align-items-center pt-md-2">
                        <h4 class="card-title">User Friendly</h4>
                        <p align="center">Whether you are total n00b or a server guru, you would still be able to leverage from the experience that we provide.
                            Unless you're curious to learn about what's happening under the hood, there is no hindrance to your involvement.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card align-items-center pt-md-2">
                        <h4 class="card-title">Monitoring</h4>
                        <p align="center">Additionally, we offer an awesome monitoring platform as well.<br>Whether you'd like to follow a pre-specified protocol or just want to check the health or statistical status of your server, this platform has got you covered ;)</p>

                    </div>
                </div>
            </div>
        </div>
    </div>



    <!--Footer-->
    <footer class="page-footer font-small">

        <!--Footer Links-->
        <div class="container img-fluid">
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3 p-md-2">
                    <a href="#">
                        <i class="fa fa-phone">Contact Us</i></a>
                </div>
            </div>
        </div>



    </footer>
    <!--/.Footer-->


</main>



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