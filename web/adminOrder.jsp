<%-- 
    Document   : viewOrder
    Created on : Mar 20, 2023, 6:01:40 AM
    Author     : Dung
--%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.Order"%>
<%@page import="dto.OrderDetail"%>
<%@page import="dao.OrderDAO"%>
<%@ page import="java.util.List" %>
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
        <%@include file="headerAdmin.jsp" %>    
        <section class="h-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-10 col-xl-8">
                        <div class="card" style="border-radius: 10px;">
                            <div class="card-header px-4 py-5 text-center">
                                <h5 class="text-muted mb-0">Admin view Order List</h5>
                            </div>
                            <div class="card-body p-4">
                                <form action="admin" method="post" class="form-inline my-2 my-lg-0">
                                    <input type="hidden" name="action" value="search"/>
                                    <div class="input-group input-group-sm">

                                        <input type="date" name="start" id="start" placeholder="yyyy/MM/dd" value="" min="2010-01-01" max="">
                                        <input type="date" name="end" id="end" placeholder="yyyy/MM/dd" value="" min="" max="">
                                        <input name="accID" type="text" class="form-control" aria-label="small" aria-describedby="inputGroup-sizing-sm" placeholder="AccID" style="width: 60px">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-secondary btn-number">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                <c:set var="listo" value="${requestScope.list}"/>

                                <c:set var="dao" value="<%= new OrderDAO()%>"/>
                                <c:if test="${listo != null}">
                                    <c:forEach items="${listo}" var="o" varStatus="loopStatus">
                                        <form action="admin" method="post" >
                                            <input type="hidden" name="action" value="saveStatus"/>
                                            <input type="hidden" name="id" value="${o.getId()}"/>
                                            <c:set var="listD" value="${dao.getOrderDetailsByOrdID(o.getId())}"/>
                                            <c:set var="acc" value="${sessionScope.acc}"/>
                                            <div class="card shadow-0 border mb-4">
                                                <div class="card-body">
                                                    <div class="row">

                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                            <p class="text-muted mb-0">OrdID</p>
                                                        </div>
                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                            <p class="text-muted mb-0">AccID</p>
                                                        </div>

                                                        <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                                            <p class="text-muted mb-0 small">Total</p>
                                                        </div>
                                                        <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                                            <p class="text-muted mb-0 small">Status:</p>
                                                            <c:if test="${o.getStatus() == 0}">
                                                                <input name="status" type="text" style="border-color:  #E0C4F8; width: 40px" value="${o.getStatus()}" disabled="">
                                                            </c:if>
                                                            <c:if test="${o.getStatus() != 0}">
                                                                <input name="status" type="text" style="border-color:  #E0C4F8; width: 40px" value="${o.getStatus()}">
                                                            </c:if>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                            <p class="text-muted mb-0">${o.getId()}</p>
                                                        </div>
                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                            <p class="text-muted mb-0">${o.getAccID()}</p>
                                                        </div>
                                                        <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                                            <p class="text-muted mb-0 small">${dao.getTotalPrice(listD, o.getId())}</p>
                                                        </div>
                                                        <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                                            <a href="viewOrderDetail.jsp?id=${o.getId()}"><button class="btn btn-outline-primary" type="button">View Details</button></a>
                                                        </div>
                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                            <button class="btn btn-outline-primary" type="submit">Save</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </form>
                                    </c:forEach>
                                </c:if>



                            </div>
                            <div class="card-footer border-0 px-4 py-5"
                                 style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
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
