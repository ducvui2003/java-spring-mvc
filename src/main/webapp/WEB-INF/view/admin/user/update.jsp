<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="<c:url value="/css/styles.css"/>" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">z
                            <li class="breadcrumb-item">
                                <a href="/admin">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/user">User</a>
                            </li>
                            <li class="breadcrumb-item active">Update user</li>
                        </ol>
                    </div>
                    <div class="row">
                        <div class="offset-2 col-8">
                            <form:form method="post" action="/admin/user/update" modelAttribute="userUpdate">
                                <h1>Update user</h1>
                                <form:input path="id" type="text" class="d-none" id="inputId" />
                                <div class="mb-3">
                                    <label for="inputEmail" class="form-label">Email </label>
                                    <form:input path="email" type="email" class="form-control" id="inputEmail"
                                                aria-describedby="emailHelp" disabled="true" />
                                </div>
                                <div class="mb-3">
                                    <label for="inputPhoneNumber" class="form-label">Phone number</label>
                                    <form:input path="phone" type="tel" class="form-control" id="inputPhoneNumber"
                                                aria-describedby="phoneHelp" disabled="true" />
                                </div>
                                <div class="mb-3">
                                    <label for="inputFullName" class="form-label">Full Name</label>
                                    <form:input path="fullName" type="text" class="form-control" id="inputFullName" />
                                </div>
                                <div class="mb-3">
                                    <label for="inputAddress" class="form-label">Address</label>
                                    <form:input path="address" type="text" class="form-control" id="inputAddress"
                                                aria-describedby="phoneHelp" />
                                </div>
                                <button type="submit" class="btn btn-warning">Update</button>
                            </form:form>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>

    </body>
</html>
