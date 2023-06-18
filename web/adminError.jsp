<%-- 
    Document   : adminError
    Created on : Mar 25, 2023, 8:59:48 AM
    Author     : Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                background-color: #f2f2f2;
            }
            .container {
                max-width: 500px;
                margin: 0 auto;
                text-align: center;
                padding: 50px 0;
            }
            h1 {
                font-size: 48px;
                margin-bottom: 20px;
                color: #333;
            }
            p {
                font-size: 24px;
                margin-bottom: 40px;
                color: #666;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Error</h1>
            <p>You don't have permission to view the admin page.</p>
            <a href="MainController">Back to shop</a>
        </div>
    </body>
</html>
