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
    <title>Update user</title>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="offset-2 col-8">
            <form:form method="post" action="/admin/user/update" modelAttribute="userUpdate">
                <h1>Create new user</h1>
                    <form:input path="id" type="text" class="d-none" id="inputId"/>
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">Email </label>
                    <form:input path="email" type="email" class="form-control" id="inputEmail"
                                aria-describedby="emailHelp" disabled="true"/>
                </div>
                <div class="mb-3">
                    <label for="inputPhoneNumber" class="form-label">Phone number</label>
                    <form:input path="phone" type="tel" class="form-control" id="inputPhoneNumber"
                                aria-describedby="phoneHelp" disabled="true"/>
                </div>
                <div class="mb-3">
                    <label for="inputFullName" class="form-label">Full Name</label>
                    <form:input path="fullName"  type="text" class="form-control" id="inputFullName"/>
                </div>
                <div class="mb-3">
                    <label for="inputAddress" class="form-label">Address</label>
                    <form:input path="address" type="text" class="form-control" id="inputAddress"
                                aria-describedby="phoneHelp"/>
                </div>
                <button type="submit" class="btn btn-warning">Update</button>
            </form:form>
        </div>
    </div>

</div>
</body>
</html>