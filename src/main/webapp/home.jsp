<!doctype html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>XAM</title>
    <div>

    </div>

  </head>
  <body>
  <style>
    body {
      padding-top: 5rem;
      background-image: url("/img/bg1.jpg");
    }
    .starter-template {
      padding: 3rem 1.5rem;
      text-align: center;
    }

    button {
        margin: 10px 10px 10px 10px
    }



  </style>


    <nav class="navbar navbar-expand-md fixed-top" style="background: rgba(0, 0, 0, 0.5)">
        <img style="-webkit-user-select: none; max-width:80px" src="https://tmpfilecdn.freelogodesign.org/9c18431d-0196-4138-80c6-1e36bcb576b2.png">
        <a class="navbar-brand" href="#">XAM</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/gamepanel">Game Panel </a>
          </li>
          <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Servers</a>
                      <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="#">S1</a>
                        <a class="dropdown-item" href="#">S2</a>
                        <a class="dropdown-item" href="#">S3</a>
                      </div>
                    </li>
          <li class="nav-item">
            <a class="nav-link" href="/help">Help</a>
          </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
          <button class="btn btn-outline-primary my-mx-2 my-sm-0 px-py-3" type="login" >Log In</button>
          <button class="btn btn-outline-light my-mx-2 my-sm-0 " type="signin" >Sign In</button>

        </form>
      </div>
    </nav>

    <main role="main" class="container">

      <div class="starter-template">
        <h1 style="color:#ffffff" >Bootstrap starter template</h1>
        <p class="lead" style="color:#ffffff">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
      </div>

    </main><!-- /.container -->



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>