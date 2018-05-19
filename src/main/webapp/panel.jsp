
<link rel="stylesheet" href="webjars/bootstrap/4.0.0-2/css/bootstrap.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">


<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div clas="navbar navbar-default">
    <div clas="container-fluid">

        <div class="navbar-header">
            <a class="navbar-brand" href="#">Brand</a>
            <a href="/servers">Servers</a>
            <a href="/logout/"> Logout</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
            </ul>
        </div>
    </div>
</div>

<h1>Panel</h1>


<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    Add machine
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form:form action="/insertMachine.htm" method="post" modelAttribute="machine" >
                    <div class="form-group">
                        <form:label path="id"><span class="fas fa-at"></span> ID </form:label>
                        <form:input class="form-control" id="id" path="id" type="text" placeholder="Enter ID"></form:input>
                    </div>
                    <div class="form-group">
                        <form:label path="username"><span class="fab fa-napster"></span> Username </form:label>
                        <form:input class="form-control" id="username" path="username" type="text" placeholder="Enter username"></form:input>
                    </div>
                    <div class="form-group">
                        <form:label path="password"><span class="fas fa-key"></span> Password </form:label>
                        <form:input type="password" class="form-control" id="password" path="password" placeholder="Enter password"></form:input>
                    </div>
                    <div class="form-group">
                        <form:label path="name"><span class="fas fa-home"></span> Name </form:label>
                        <form:input type="text" class="form-control" id="name" path="name" placeholder="Enter name"></form:input>
                    </div>
                    <div class="form-group">
                        <form:label path="hostname"><span class="far fa-newspaper"></span> Hostname </form:label>
                        <form:input type="text" class="form-control" id="hostname" path="hostname" placeholder="Enter hostname"></form:input>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Add</button>
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