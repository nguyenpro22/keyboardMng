<%-- 
    Document   : home
    Created on : Feb 21, 2023, 12:25:01 AM
    Author     : Dung
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="myCss/home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Home.jsp">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                                <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                            <ul class="list-group category_block">
                            <c:set var="listC" value="${requestScope.ListC}" />
                            <c:forEach items="${listC}" var="o" varStatus="loopStatus">
                                <li class="list-group-item text-white" style="${tag == o.cateName ? "background-color: #7789C7;" : ""}"><a href="CategoryServlet?cateName=${o.cateName}" >${o.cateName}</a></li>
                                </c:forEach>

                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Last product</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${p.img}" />
                            <h5><a href="detail?id=${p.id}" title="View Product">${p.name}</a></h5>
                            <p class="card-text show_txt">${p.description}</p>
                            <p class="bloc_left_price">${p.price} VND</p>
                        </div>
                    </div>
                </div>

                <c:set var="kq" value="${requestScope.ListP}" />
                <c:if test="${kq != null}" >
                    <div class="col-sm-9">
                        <div id="content" class="row">
                            <c:forEach items="${kq}" var="o" varStatus="loopStatus">
                                <div class="count col-12 col-md-6 col-lg-4">
                                    <div class="card">
                                        <img class="card-img-top" src="${o.img}" alt="Card image cap" style="width: 253px; height: 250px;">
                                        <div class="card-body">
                                            <h4 class="" style="height: 90px;"><a href="detail?id=${o.id}" title="View Product">${o.name}</a></h4>
                                            <p class="card-text show_txt">${o.description}</p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${o.price} VND</p>
                                                </div>
                                                <div class="col">
                                                    <a onclick="showAlert()" href="addToCart?productID=${o.id}&quantity=1" class="btn btn-success btn-block">Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <button onclick="loadMore()" class="btn btn-primary">
                            Load more
                        </button>
                    </div>
                </c:if>

            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="js/home.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>

