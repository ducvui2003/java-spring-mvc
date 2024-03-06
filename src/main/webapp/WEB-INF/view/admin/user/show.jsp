<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>View user</title>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="offset-2 col-8">
            <h1 class="h2">User ${user.id}</h1>
            <hr/>
            <c:set var="user" value="${user}"/>
            <div class="card">
                <div class="card-header">
                    Info user ${user.id}
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">ID: ${user.id}</li>
                    <li class="list-group-item">Email ${user.email}</li>
                    <li class="list-group-item">Full name: ${user.fullName}</li>
                    <li class="list-group-item">Address: ${user.address}</li>
                </ul>
            </div>
            <a href="/admin/user" class="btn btn-primary mt-4">Back</a>
        </div>
    </div>

</div>
</body>
</html>