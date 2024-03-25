<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="/css/styles.css" rel="stylesheet" />
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
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/user">User</a>
                            </li>
                            <li class="breadcrumb-item active">Detail user</li>
                        </ol>
                    </div>
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
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
    </body>
</html>