<%-- 
    Document   : viewOrder
    Created on : Mar 20, 2023, 6:01:40 AM
    Author     : Dung
--%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.OrderDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #cd9cf2;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1))
            }
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    </head>
    <body>
        <section class="h-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-10 col-xl-8">
                        <div class="card" style="border-radius: 10px;">
                            <div class="card-header px-4 py-5">
                                <h5 class="text-muted mb-0">Order List</h5>
                            </div>
                            <div class="card-body p-4">
                                <c:set var="listO" value="${requestScope.list}" />
                                <form action="MainController" method="post" class="form-inline my-2 my-lg-0">
                                    <input type="hidden" name="action" value="searchOrder"/>
                                    <input type="hidden" name="accID" value="${sessionScope.acc.getId()}"/>
                                    <div class="input-group input-group-sm">

                                        <input type="date" name="start" id="start" placeholder="yyyy/MM/dd" value="" min="2010-01-01" max="">
                                        <input type="date" name="end" id="end" placeholder="yyyy/MM/dd" value="" min="" max="">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-secondary btn-number">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                <c:forEach items="${listO}" var="o" varStatus="loopStatus">
                                    <c:set var="dao" value="<%= new OrderDAO() %>" />
                                    <c:set var="listD" value="${dao.getOrderDetailsByOrdID(o.getId())}"/>
                                    <c:set var="proDAO" value="<%= new ProductDAO() %>" />
                                    <div class="card shadow-0 border mb-4">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <p>Image</p>
                                                </div>
                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0">Name</p>
                                                </div>
                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small">Quantity</p>
                                                </div>
                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small">Price</p>
                                                </div>
                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small">Status: <span class="statusColor" >${dao.getStatus(o.getStatus())}</span></p>
                                                    <input type="hidden" name="dataStatus" value="${o.getStatus()}"> 
                                                </div>
                                            </div>
                                            <c:forEach items="${listD}" var="d" varStatus="loopStatus">
                                                <div class="row">

                                                    <div class="col-md-2">
                                                        <img src="${proDAO.getProduct(d.getProID()).getImg()}"
                                                             class="img-fluid" alt="Name">
                                                    </div>
                                                    <div class="col-md-2 text-center">
                                                        <p class="text-muted mb-0">${proDAO.getProduct(d.getProID()).getName()}</p>
                                                    </div>
                                                    <div class="col-md-2 text-center">
                                                        <p class="text-muted mb-0 small">x${d.getQuantity()}</p>
                                                    </div>
                                                    <div class="col-md-2 text-center">
                                                        <p class="text-muted mb-0 small">${proDAO.getProduct(d.getProID()).getPrice()}</p>
                                                    </div>
                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <a class="btn btn-outline-primary btn-sm" href="viewOrderDetail.jsp?id=${o.getId()}" type="button">View Details</a>
                                                    </div>
                                                </div>

                                            </c:forEach>
                                            <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                            <div class="row d-flex align-items-center justify-content-between">
                                                <div class="col-md-4 text-center">
                                                    <h6 class="text-muted mb-0">Total: ${dao.getTotalPrice(listD, o.getId())} VND</h6>
                                                </div>
                                                <c:if test="${o.getStatus() == 1}">
                                                    <div class="col-md-4 text-center">

                                                        <form action="MainController" method="get">
                                                            <input type="hidden" name="action" value="cancelOrder"/>
                                                            <input type="hidden" name="id" value="${o.getId()}"/>
                                                            <button class="btn btn-outline-danger">
                                                                Cancel
                                                            </button>
                                                        </form>
                                                    </div>
                                                </c:if>
                                                <c:if test="${o.getStatus() != 1}">
                                                    <div class="col-md-4 text-center">

                                                        <form action="MainController" method="post">
                                                            <input type="hidden" name="action" value="orderAgain"/>
                                                            <input type="hidden" name="id" value="${o.getId()}"/>
                                                            <button class="btn btn-outline-info">
                                                                Order Again
                                                            </button>
                                                        </form>
                                                    </div>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>



                            </div>
                            <div class="card-footer border-0 px-4 py-5"
                                 style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                <div class="pt-5">
                                    <h6 class="mb-0"><a href="HomeServlet" class="text-body"><i class="bi bi-arrow-left"></i>Back to shop</a></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            const stt = document.getElementsByName("dataStatus");
            const span = document.querySelectorAll(".statusColor");
            for (var i = 0; i < stt.length; i++) {
                if (stt[i].value == 1) {
                    span[i].classList.add("badge-success");
                    span[i].classList.add("badge");
                }
                if (stt[i].value == 0) {
                    span[i].classList.add("badge-danger");
                    span[i].classList.add("badge");
                }
                if (stt[i].value == 2) {
                    span[i].classList.add("badge-info");
                    span[i].classList.add("badge");
                }
            }
            const input1 = document.getElementById("start");
            const input2 = document.getElementById("end");
            input2.min = input1.value;
            input1.addEventListener("input", function () {
                input2.min = input1.value;
            });
            const date = new Date();
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            const today = year + "-" + month + "-" + day;
            document.getElementById("start").setAttribute("max", today);
            document.getElementById("end").setAttribute("max", today);
            input2.value = today;
            input2.addEventListener("input", function () {
                input1.max = input2.value;
            });
        </script>
    </body>
</html>
