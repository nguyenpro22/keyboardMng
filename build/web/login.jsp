<%-- 
    Document   : login
    Created on : Feb 15, 2023, 8:46:34 PM
    Author     : Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="myCss/login.css">
        <link rel="stylesheet" href="myCss/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    </head>
    <body>
        <form action="MainController" class="vh-100 gradient-custom" style="background-color: #FEC8CD; background-image: url(img/keyb.jpg)" method="post">
            <input type="hidden" name="action" value="login"/>
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem; border: none">
                            <div class="card-body p-5 text-center " style="background-color: #DEDDD9 ">

                                <div>

                                    <h2 class="fw-bold mb-2 text-uppercase text-dark login_btn">Login</h2>
                                    <p class="mb-5 email text-info">Please enter your Email and Password!</p>
                                    <div class="border-primary text-success">${requestScope.error}</div>
                                    <div class="border-primary text-success">${requestScope.success}</div>
                                    <div class="form-outline form-white mb-4">
                                        <input type="email" id="typeEmailX" name="email" class="form-control form-control-lg" placeholder="Email" />
                                    </div>

                                    <div class="form-outline form-white mb-4">
                                        <input type="password" id="typePasswordX" name="password" class="form-control form-control-lg" placeholder="Password"/>
                                        <p class="message"></p>
                                    </div>

                                    <button class="btn btn-outline-light text-dark btn-lg px-5"  type="submit">Login</button>

                                    <div class="font-icon d-flex justify-content-center text-center mt-4 pt-1">
                                        <a href="#!"><i class="bi bi-facebook" style="font-size: 50px; padding: 10px"></i></a>
                                        <a href="#!"><i class="bi bi-twitter" style="font-size: 50px; padding: 10px"></i></a>
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/Assignment/loginGoogle&response_type=code
                                           &client_id=298458591622-qnmihcp1otj56c39m87bpi6dq2l881cr.apps.googleusercontent.com&approval_prompt=force"><i class="bi bi-google" style="font-size: 50px; padding: 10px"></i></a>

                                    </div>

                                </div>

                                <div>
                                    <p class="mb-0 text-danger">Don't have an account? <a href="signup.jsp" class="fw-bold text-primary">Sign Up</a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="js/login.js" type="module"></script>
        </form>
    </body>
</html>
