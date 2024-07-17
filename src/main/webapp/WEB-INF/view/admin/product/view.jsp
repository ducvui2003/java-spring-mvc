<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Dashboard - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
            integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item">
                        <a href="<c:url value="/admin"/>">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="<c:url value="/admin/product"/>">Product</a>
                    </li>
                    <li class="breadcrumb-item active">Create product</li>
                </ol>
                <div class="row">
                    <div class="col-12">
                        <div class="d-flex justify-content-between mt-4">
                            <h1 class="h2">Product detail with id ${product.id}</h1>
                        </div>
                        <hr/>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <img class="img-thumbnail" src="<c:url value="/images/product/${product.image}" />"
                                     alt="">
                            </li>
                            <li class="list-group-item">Product info</li>
                            <li class="list-group-item">ID: ${product.id}</li>
                            <li class="list-group-item">Name: ${product.name}</li>
                            <li class="list-group-item">Price: ${product.price}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script>
    $(document).ready(function () {
        const avatarFile = $('#avatarFile');
        avatarFile.change(function (e) {
            const imgURL = URL.createObjectURL(e.target.files[0]);
            $('#avatarPreview').attr('src', imgURL).css('display', 'block');
        });
    });
</script>
</body>
</html>
