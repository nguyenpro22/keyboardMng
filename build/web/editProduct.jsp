<%-- 
    Document   : editProduct
    Created on : Mar 18, 2023, 7:43:44 AM
    Author     : Dung
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
      
        <link rel="stylesheet" href="myCss/fontawesome.min.css" />
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="myCss/bootstrap.min.css" />
        <link rel="stylesheet" href="myCss/templatemo-style.css">
    </head>

    <body>
        <%@include file="headerAdmin.jsp" %>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                            </div>
                        </div>
                        <c:set var="p" value="${param.id}"/>
                        <c:set var="dao" value="<%= new ProductDAO() %>"/>
                        <c:set var="product" value="${dao.getProduct(p)}"/>
                        <form action="${pageContext.request.contextPath}/admin" method="get" class="tm-edit-product-form"> 
                            <input type="hidden" name="action" value="editProduct"/>
                            <input type="hidden" name="id" value="${product.getId()}"/>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">

                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Product Name
                                        </label>
                                        <input
                                            id="name"
                                            name="name"
                                            type="text"
                                            value="${product.getName()}"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Description</label
                                        >
                                        <textarea                    
                                            class="form-control validate tm-small" name="description"
                                            rows="5"
                                            required
                                            >${product.getDescription()}</textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label
                                            for="category"
                                            >Category</label
                                        >
                                        <select
                                            class="custom-select tm-select-accounts"
                                            id="category"
                                            name="select"
                                            >
                                            <option value="1">KeyBoard</option>
                                            <option value="2">Mouse</option>
                                            <option value="3">KeyCap</option>
                                            <option value="4">Switch</option>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="stock"
                                                >Price
                                            </label>
                                            <input
                                                id="price"
                                                name="price"
                                                type="text"
                                                value="${product.getPrice()}"
                                                class="form-control validate"
                                                />
                                        </div>
                                    </div>

                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                    <div class="tm-product-img-edit mx-auto">
                                        <img src="${product.getImg()}" alt="Product image" class="img-fluid d-block mx-auto">
                                        <i
                                            class="fas fa-cloud-upload-alt tm-upload-icon"
                                            onclick="document.getElementById('fileInput').click();"
                                            ></i>
                                    </div>
                                    <div class="custom-file mt-3 mb-3">
                                        <input
                                            type="text"
                                            class="btn btn-primary btn-block mx-auto"
                                            placeholder="CHANGE IMAGE NOW" name="image"
                                            />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                                </div>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2018</b> All rights reserved. 

                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                </p>
            </div>
        </footer> 

        <script src="../js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="../jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="../js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
        </script>
    </body>
</html>
