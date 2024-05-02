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
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
                                <a href="/admin/product">Product</a>
                            </li>
                            <li class="breadcrumb-item active">Create product</li>
                        </ol>
                        <form:form cssClass="mt-5 row " method="post" action="/admin/product/create" modelAttribute="newProduct" enctype="multipart/form-data">
                            <h1>Create new user</h1>
                            <div class="col-12 col-md-6 mb-3">
                                <label for="inputName" class="form-label">Name</label>
                                <c:set var="errorName">
                                    <form:errors path="name" cssClass="invalid-feedback" />
                                </c:set>
                                <form:input path="name" type="text" class="form-control ${not empty errorName ? 'is-invalid':''}" id="inputName" aria-describedby="emailHelp" />
                                <form:errors cssClass="invalid-feedback" path="name"  />
                            </div>
                            <div class="col-12 col-md-6 mb-3">
                                <label for="inputPrice" class="form-label">Price</label>
                                <c:set var="errorPrice">
                                    <form:errors path="price" cssClass="invalid-feedback" />
                                </c:set>
                                <form:input path="price" type="text" class="form-control  ${not empty errorPrice ? 'is-invalid':''}" id="inputPrice" />
                                <form:errors cssClass="invalid-feedback" path="price"  />
                            </div>
                            <div class="col-12 col-md-12 mb-3">
                                <c:set var="errorDetailDesc">
                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                </c:set>
                                <label for="inputDetailDesc" class="form-label">Detail description</label>
                                <form:textarea path="detailDesc" class="form-control ${not empty errorDetailDesc ? 'is-invalid':''}" id="inputDetailDesc" aria-describedby="phoneHelp" />
                                <form:errors cssClass="invalid-feedback" path="detailDesc"  />
                            </div>
                            <div class="col-12 col-md-6 mb-3">
                                <c:set var="errorShortDesc">
                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                </c:set>
                                <label for="inputShortDesc" class="form-label">Short description</label>
                                <form:input path="shortDesc" type="text" class="form-control ${not empty errorShortDesc ? 'is-invalid':''}" id="inputShortDesc" aria-describedby="phoneHelp" />
                                <form:errors cssClass="invalid-feedback" path="shortDesc"  />
                            </div>
                            <div class="col-12 col-md-6 mb-3">
                                <label for="inputQuantity" class="form-label">Quantity</label>
                                <c:set var="errorQuantity">
                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                </c:set>
                                <form:input path="quantity" type="text" class="form-control ${not empty errorQuantity ? 'is-invalid':''}" id="inputQuantity" aria-describedby="phoneHelp" />
                                <form:errors cssClass="invalid-feedback" path="quantity"  />
                            </div>

                            <div class="col-12 col-md-6 mb-3">
                                <label for="formSelect" class="form-label">Factory</label>
                                <form:select class="form-select" id="formSelect" aria-label="Default select example" path="factory">
                                    <form:option value="ADMIN">ADMIN</form:option>
                                    <form:option value="USER">USER</form:option>
                                </form:select>
                            </div>
                            <div class="col-12 col-md-6 mb-3">
                                <label for="formSelect" class="form-label">Target</label>
                                <form:select class="form-select" id="formSelect" aria-label="Default select example" path="target">
                                    <form:option value="ADMIN">ADMIN</form:option>
                                    <form:option value="USER">USER</form:option>
                                </form:select>
                            </div>

                            <div class="col-12 col-md-6 mb-3">
                                <label for="avatarFile" class="form-label">Default file input example</label>
                                <input class="form-control" name="file" type="file" id="avatarFile" accept=".jpg, .jpeg, .png">
                            </div>
                            <div class="col-12 mb-3">
                                <img id="avatarPreview" class=" mx-auto" src="" alt="avatar preview" style="max-height: 250px; display: none">
                            </div>
                            <div class="mb-5 col-12">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form:form>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
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
