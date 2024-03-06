<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Table users</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between mt-4">
                <h1 class="h2">Table Users</h1>
                <a href="/admin/user/create" class="btn btn-primary text-center">Create a user</a>
            </div>
            <hr/>
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Email</th>
                    <th scope="col">Full Name</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}" varStatus="loop">
                    <tr>
                        <th scope="row">${loop.index}</th>
                        <td>${user.email}</td>
                        <td>${user.fullName}</td>
                        <td>
                            <div>
                                <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                                <a href="/admin/user/update/${user.id}" class="btn btn-warning mx-2">Update</a>
                                <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>