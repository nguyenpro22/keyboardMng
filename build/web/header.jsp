<%-- 
    Document   : header
    Created on : Feb 26, 2023, 1:22:55 AM
    Author     : Dung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="HomeServlet">Keyboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse d-flex justify-content-around" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test="${acc.role == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="admin">Admin</a>
                    </li>
                </c:if>

                <li class="nav-item">
                    <a class="nav-link" href="updateAccount.jsp?email=${acc.email}">Update Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="MainController?action=viewOrder">View Order</a>
                </li>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="MainConTroller?action=login">Logout</a>
                    </li>
                </c:if>
            </ul>

            <form action="MainController" method="post" class="form-inline my-2 my-lg-0">
                <input type="hidden" name="action" value="search"/>
                <div class="input-group input-group-sm">
                    <input oninput="searchByName(this)" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="CartDetail.jsp">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">${cart.size() == null ? 0 : cart.size()}</span>
                </a>
            </form>
        </div>
    </div>
</nav>
