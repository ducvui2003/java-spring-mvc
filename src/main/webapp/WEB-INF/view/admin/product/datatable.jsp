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
                                <a href="<c:url value="/admin"/>">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active">Product</li>
                        </ol>
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex justify-content-between mt-4">
                                    <h1 class="h2">Table Products</h1>
                                    <a href="<c:url value="/admin/product/create"/>" class="btn btn-primary text-center">Create a
                                                                                                        product
                                    </a>
                                </div>
                                <hr />
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">Id</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Factory</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${products}" varStatus="loop">
                                            <tr>
                                                <th scope="row">${loop.index}</th>
                                                <td>${product.name}</td>
                                                <td>${product.price}</td>
                                                <td>${product.factory}</td>
                                                <td>
                                                    <div>
                                                        <a href="/admin/product/${product.id}" class="btn btn-success">
                                                            View
                                                        </a>
                                                        <a href="/admin/product/update/${product.id}" class="btn btn-warning mx-2">
                                                            Update
                                                        </a>
                                                        <a href="/admin/product/delete/${product.id}" class="btn btn-danger">
                                                            Delete
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item ${(currentPage eq 1)?'disabled':''}">
                                            <a class="page-link" href="/admin/product?page=${currentPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                        <c:forEach var="page" begin="1" end="${totalPages}" varStatus="loop">
                                            <li class="page-item ${(loop.index eq currentPage)?'active':''}">
                                                <a class="page-link" href="/admin/product?page=${loop.index}">${loop.index}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item ${(currentPage eq totalPages)?'disabled':''}">
                                            <a class="page-link" href="/admin/product?page=${currentPage + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>
