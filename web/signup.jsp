<%-- 
    Document   : register
    Created on : Feb 17, 2023, 1:40:23 AM
    Author     : Dung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <link rel="stylesheet" href="myCss/mySignup.css" />
    </head>
    <body >
        <div class="login-box">
            <h2>SignUp</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="signup"/>
                <div class="border-primary" style="color: #FFA300">${errorSignup}</div>
                <div class="user-box">
                    <input type="email" name="email" value="${requestScope.email}" required="" autocomplete="off">
                    <label>Email</label>
                </div>
                <div class="user-box">
                    <input type="password" name="password" value="${requestScope.password}" required="" autocomplete="off">
                    <label>Password</label>
                </div>
                <div class="border-primary" style="color: #FFA300">${requestScope.errorPassword}</div>  
                <div class="user-box">
                    <input type="password" name="cfpassword" required="" autocomplete="off">
                    <label>Confirm Password</label>
                </div>
                <div class="user-box">
                    <input type="text" name="fullname" value="${requestScope.fullname}" required="" autocomplete="off">
                    <label>Full Name</label>
                </div>
                <div class="user-box">
                    <input type="text" name="phone" required="" value="${requestScope.phone}" autocomplete="off">
                    <label>Phone Number</label>
                </div> 
                <input class="actived" type="submit" value="Submit">
            </form>
        </div>
    </body>
</html>
