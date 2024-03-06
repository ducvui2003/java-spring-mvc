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
    <title>Delete user</title>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="offset-2 col-8">
            <h1 class="h1">Delete user with id ${id}</h1>
            <hr/>
            <div class="alert alert-danger" role="alert">
                Are you sure delete this user?
            </div>
            <form:form action="/admin/user/delete" method="post" modelAttribute="userDelete">
                <form:input path="id" type="text" class="d-none" id="inputId" value="${id}"/>
                <button type="submit" class="btn btn-danger">Confirm</button>
            </form:form>
        </div>
    </div>

</div>
</body>
</html>