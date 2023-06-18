<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="myCss/home.css" rel="stylesheet" type="text/css"/>
        <link href="myCss/detail.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                            <ul class="list-group category_block">
                            <c:forEach items="${cate}" var="o">
                                <li class="list-group-item text-white"><a href="#">${o.cateName}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Last product</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${last.img}" />
                            <h5 class="card-title">${last.name}</h5>
                            <p class="card-text show_txt">${last.description}</p>
                            <p class="bloc_left_price">${last.price} $</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9" style="margin-top: 3em">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                            <div> <a href="#"><img src="${product.img}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${product.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="num">${product.price}</span><span class="currency"> VND</span>
                                            </span> 
                                            <!--<span>/per kg</span>--> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${product.description} </p></dd>
                                        </dl>
                                        <form action="MainController" method="post">
                                            <input type="hidden" name="action" value="addToCart"/>
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <input type="hidden" name="productID" id="productID" value="${product.id}">
                                                    <input type="hidden" name="price-p" id="price-p" value="${product.price}">
                                                    <dl class="param param-inline">
                                                        <h4>Quantity:</h4>
                                                        <div class="container1">
                                                            <button id="decrease" disabled>-</button>
                                                            <div class="quantity">
                                                                <input type="number" id="qty" name="quantity" value="1">
                                                            </div>
                                                            <button id="increase">+</button>
                                                        </div>
                                                    </dl>  <!-- item-property .// -->
                                                </div> <!-- col.// -->

                                            </div><div class="col-sm-5">
                                                <p id="price-quant"></p>
                                            </div>
                                            <hr>
                                            <button onclick="showAlert()" class="btn btn-lg btn-outline-primary text-uppercase" type="submit"><i class="fas fa-shopping-cart"></i> Add to cart</button>
                                        </form>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->
                    </div>
                </div>
            </div>
        </div>

        <script src="js/detail.js"></script>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
