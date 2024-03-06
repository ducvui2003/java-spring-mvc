<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="">
    <title>Create User</title>
</head>

<body>
<div class="container mt-5">
    <div class="row">
        <div class="offset-2 col-8">
            <form:form method="post" action="/admin/user/create" modelAttribute="newUser">
                <h1>Create new user</h1>
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">Email address</label>
                    <form:input path="email" type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">Password</label>
                    <form:input path="password" type="password" class="form-control" id="inputPassword"/>
                </div>
                <div class="mb-3">
                    <label for="inputPhoneNumber" class="form-label">Phone number</label>
                    <form:input path="phone" type="tel" class="form-control" id="inputPhoneNumber" aria-describedby="phoneHelp"/>
                </div>
                <div class="mb-3">
                    <label for="inputFullName" class="form-label">Full Name</label>
                    <form:input path="fullName" type="text" class="form-control" id="inputFullName" aria-describedby="phoneHelp"/>
                </div>
                <div class="mb-3">
                    <label for="inputAddress" class="form-label">Address</label>
                    <form:input path="address" type="text" class="form-control" id="inputAddress" aria-describedby="phoneHelp"/>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
    </div>

</div>
</body>

</html>