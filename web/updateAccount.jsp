<%-- 
    Document   : updateAccount
    Created on : Feb 26, 2023, 5:17:55 PM
    Author     : Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="myCss/updateAccount.css"/>
    </head>
    <body>
        <div class="form-container">
            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="updateAccount"/>
                <div class="header">
                    <h3>${acc.email}</h3>
                </div>
                    <input type="hidden" value="${acc.email}" name="email">
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" value="${acc.fullName}">

                <label for="password">Password:</label>
                <input type="password" id="password" name="password">

                <label for="confirmpassword">Confirm Password:</label>
                <input type="password" id="confirmpassword" name="confirmpassword">

                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" value="${acc.phone}">

                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="">-- Select --</option>
                    <option value="1">Active</option>
                    <option value="0">Inactive</option>
                </select>

                <input type="submit" value="Update">
            </form>
        </div>
        <script>
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmpassword');

            const validatePassword = () => {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity("Passwords don't match");
                } else {
                    confirmPassword.setCustomValidity('');
                }
            };

            password.addEventListener('change', validatePassword);
            confirmPassword.addEventListener('keyup', validatePassword);
        </script>
    </body>
</html>
