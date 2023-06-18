<%-- 
    Document   : viewOrderDetail
    Created on : Mar 21, 2023, 3:40:19 PM
    Author     : Dung
--%>
<%@page import="dao.OrderDAO"%>
<%@page import="dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                font-family: 'Roboto', sans-serif
            }

            body {
                background-color: #7C4135
            }

            #order-heading {
                background-color: #edf4f7;
                position: relative;
                border-top-left-radius: 25px;
                max-width: 800px;
                padding-top: 20px;
                margin: 30px auto 0px
            }

            #order-heading .text-uppercase {
                font-size: 0.9rem;
                color: #777;
                font-weight: 600
            }

            #order-heading .h4 {
                font-weight: 600
            }

            #order-heading .h4+div p {
                font-size: 0.8rem;
                color: #777
            }

            .close {
                padding: 10px 15px;
                background-color: #777;
                border-radius: 50%;
                position: absolute;
                right: -15px;
                top: -20px
            }

            .wrapper {
                padding: 0px 50px 50px;
                max-width: 800px;
                margin: 0px auto 40px;
                border-bottom-left-radius: 25px;
                border-bottom-right-radius: 25px
            }

            .table th {
                border-top: none
            }

            .table thead tr.text-uppercase th {
                font-size: 0.8rem;
                padding-left: 0px;
                padding-right: 0px
            }

            .table tbody tr th,
            .table tbody tr td {
                font-size: 0.9rem;
                padding-left: 0px;
                padding-right: 0px;
                padding-bottom: 5px
            }

            .table-responsive {
                height: 100px
            }

            .list div b {
                font-size: 0.8rem
            }

            .list .order-item {
                font-weight: 600;
                color: #6db3ec
            }

            .list:hover {
                background-color: #f4f4f4;
                cursor: pointer;
                border-radius: 5px
            }

            label {
                margin-bottom: 0;
                padding: 0;
                font-weight: 900
            }

            button.btn {
                font-size: 0.9rem;
                background-color: #66cdaa
            }

            button.btn:hover {
                background-color: #5cb99a
            }

            .price {
                color: #5cb99a;
                font-weight: 700
            }

            p.text-justify {
                font-size: 0.9rem;
                margin: 0
            }

            .row {
                margin: 0px
            }

            .subscriptions {
                border: 1px solid #ddd;
                border-left: 5px solid #ffa500;
                padding: 10px
            }

            .subscriptions div {
                font-size: 0.9rem
            }

            @media(max-width: 425px) {
                .wrapper {
                    padding: 20px
                }

                body {
                    font-size: 0.85rem
                }

                .subscriptions div {
                    padding-left: 5px
                }

                img+label {
                    font-size: 0.75rem
                }
            }
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
    </head>
    <body>
        <c:set var="acc" value="${sessionScope.acc}"/>
        <c:set var="dao" value="<%=new OrderDAO()%>"/>
        <c:set var="pdao" value="<%=new ProductDAO()%>"/>
        <c:set var="id" value="${param.id}"/>
        <c:set var="o" value="${dao.getOrderByOrdID(id)}"/>
        <c:set var="list" value="${dao.getOrderDetailsByOrdID(id)}"/>
        <div class="d-flex flex-column justify-content-center align-items-center" id="order-heading">
            <div class="text-uppercase">
                <p>Order detail</p>
            </div>
            <div class="h4">Date of Order: ${o.getOrdDate()}</div>
            <div class="pt-1">
                <p>Order #${o.getId()} is currently<b class="text-dark"> ${dao.getStatus(o.getStatus())}</b></p>
            </div>
            <div class="btn close text-white"> &times; </div>
        </div>
        <div class="wrapper bg-white">
            <div class="table-responsive">
                <table class="table table-borderless">
                    <thead>
                        <tr class="text-uppercase text-lg-center text-muted">
                            <th scope="col">product</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="text-lg-center">
                            <th scope="row">${list.size()} item</th>
                        </tr>
                    </tbody>
                </table>
            </div>

            <c:forEach items="${list}" var="detail" varStatus="loopStatus">
                <c:set var="p" value="${pdao.getProduct(detail.getProID())}"/>
                <div class="d-flex justify-content-between align-items-center list py-1">
                    <div class="mx-3"> <img src="${p.getImg()}" alt="apple" class="rounded-circle" width="100" height="100"> </div>
                    <div class="order-item">${p.getName()}</div>
                    <div class="order-item">x${detail.getQuantity()}</div>
                </div>
            </c:forEach>
            <div class="pt-2 border-bottom mb-3"></div>

            <div class="d-flex justify-content-start align-items-center py-1 pl-3 border-bottom">
                <div class="text-muted">Shipping</div>
                <div class="ml-auto"> <label>${dao.getShipPrice(id)} VND</label> </div>
            </div>
            <div class="d-flex justify-content-start align-items-center py-1 pl-3 pt-3 border-bottom">
                <div class="text-muted">Delivery date</div>
                <div class="ml-auto"> <label>${o.getShipDate()}</label> </div>
            </div>
            <div class="d-flex justify-content-start align-items-center pl-3 py-3 mb-4 border-bottom">
                <div class="text-muted"> Order Total </div>
                <div class="ml-auto h5">${dao.getTotalPrice(list, id)} VND</div>
            </div>
            <c:if test="${(acc.getId() == o.getAccID()) && o.getStatus() != 1}">
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="orderAgain"/>
                    <input type="hidden" name="id" value="${o.getId()}"/>
                    <div class="d-flex justify-content-end align-items-center">
                        <button class="text-white btn">Order Again</button>
                    </div>
                </form>
            </c:if>

            <div class="row border rounded p-1 my-3">
                <div class="col-md-6 py-3">
                    <div class="d-flex flex-column align-items start"> <b>UserName</b>
                        <p class="text-justify">${acc.getFullName()}</p>
                    </div>
                </div>
                <div class="col-md-6 py-3">
                    <div class="d-flex flex-column align-items start"> <b>Phone Number</b>
                        <p class="text-justify">${acc.getPhone()}</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
