<%-- 
    Document   : CartDetail
    Created on : Feb 10, 2023, 11:39:58 AM
    Author     : user
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="myCss/cart.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #d2c9ff;">
        <c:set var="cart" value="${sessionScope.cart}" />
        <c:set var="orderStatus" value="${requestScope.orderStatus}" />
        <c:set var="orderID" value="${requestScope.orderID}" />
        <section style="background-color: #d2c9ff;">
            <div class="container py-5">
                <div class="row d-flex justify-content-center align-items-center">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px; ">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                <h3 class="mb-0 text-muted">${cart.size()} Items</h3>
                                            </div>
                                            <hr class="my-4">
                                            <c:set var="total" value="0" />
                                            <c:set var="count" value="0" />
                                            <c:set var="shipPrice" value="40" />
                                            <c:forEach items="${cart}" var="o" varStatus="loopStatus">
                                                <form action="MainController" method="post">
                                                    <input type="hidden" name="action" value="editCart"/>
                                                    <input type="hidden" name="id" value="${o.key.id}">
                                                    <input type="hidden" name="orderStatus" value="${orderStatus}">
                                                    <input type="hidden" name="orderID" value="${orderID}">
                                                    <div>
                                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                                <img src="${o.key.img}" class="img-fluid rounded-3" alt="">
                                                            </div>
                                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                                <h6 class="text-black mb-0">${o.key.name}</h6>
                                                            </div>

                                                            <div class="col-md-2 col-lg-3 col-xl-2 d-flex ">
                                                                <button class="decrease" value="-">-</button>
                                                                <input type="number" id="quantity" name="quantity" min="1" max="1000" value="${o.value}" style="width: 50px">
                                                                <button class="increase" value="+">+</button>
                                                            </div>

                                                            <div class="col-md-1 col-lg-1 col-xl-1">
                                                                <button name="button" value="update" type="submit" class="btn btn-info">Save</button>

                                                            </div>
                                                            <div class="col-md-3 d-flex justify-content-center">
                                                                <h6 name="price" class="mb-0">${o.key.price}</h6>
                                                                <h6 class="mb-0">VND</h6>
                                                            </div>
                                                            <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                                <button name="button" value="delete" type="submit" class="btn btn-danger"><i class="bi bi-trash3-fill"></i></button>
                                                            </div>
                                                        </div>
                                                        <hr class="my-4">
                                                    </div>
                                                </form>
                                                <c:set var="count" value="${count + o.value}" />
                                                <c:set var="total" value="${total + (o.key.price * o.value)}" />
                                            </c:forEach>





                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="HomeServlet" class="text-body"><i class="bi bi-arrow-left"></i>Back to shop</a></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <form action="MainController" method="get">
                                            <input type="hidden" name="action" value="editCart"/>
                                            <input type="hidden" name="orderStatus" value="${orderStatus}">
                                            <input type="hidden" name="orderID" value="${orderID}">
                                            <div class="p-5">
                                                <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                                <hr class="my-4">

                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 id="total-price">Price: ${total} VND</h5>
                                                </div>

                                                <h5 class="text-uppercase mb-3">Shipping</h5>

                                                <div class="mb-4 pb-2">
                                                    <select class="select" name="select">
                                                        <option value="1">Flash Ship</option>
                                                        <option value="2">Extra Ship</option>
                                                        <option value="3">Normal Ship</option>
                                                    </select>
                                                </div>

                                                <hr class="my-4">

                                                <div class="d-flex justify-content-between mb-5">
                                                    <h5 class="text-uppercase" >Total: </h5>
                                                    <h5 id="result">${total +shipPrice} VND</h5>
                                                </div>

                                                <a href="MainController?action=editCart"><button type="submit" class="btn btn-dark btn-block btn-lg"
                                                                                                 data-mdb-ripple-color="dark">Payment</button></a>

                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="js/cart.js"></script>
    </body>
</html>
