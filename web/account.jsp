<%-- 
    Document   : account.jsp
    Created on : Mar 18, 2023, 7:39:58 AM
    Author     : Dung
--%>
<%@page import="dto.Account"%>
<%@page import="dao.AccountDAO"%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />

        <link rel="stylesheet" href="myCss/fontawesome.min.css" />
        <link rel="stylesheet" href="myCss/bootstrap.min.css" />
        <link rel="stylesheet" href="myCss/templatemo-style.css">
        <style>
            .tab-content-item{
                display: none;
            }
            .tab-content-item.actived{
                display: block;
            }
        </style>
    </head>
    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="headerAdmin.jsp" %>
            <div class="container mt-5">
                <div class="row tm-content-row">
                    <div class="">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">
                            <div class="tm-product-table-container">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Password</th>
                                            <th scope="col">FullName</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>

                                    <tbody> 
                                        <% 
                                    AccountDAO dao = new AccountDAO();
                                    List<Account> list = dao.getAccounts();
                                    for (Account acc : list) { 
                                        %>

                                        <tr>
                                    <form action="${pageContext.request.contextPath}/admin" >
                                        <input type="hidden" name="action" value="updateAccount"/>
                                        <input type="hidden" name="email" value="<%= acc.getEmail() %>"/>
                                        <td><%= acc.getId() %></td>
                                        <td><%= acc.getEmail() %></td>
                                        <td><input name="password" type="text" style="background-color: #50697F; border: none; color: white;" value="<%= acc.getPassword() %>"></td>
                                        <td><input name="fullname" type="text" style="background-color: #50697F; border: none; color: white" value="<%= acc.getFullName() %>"></td>
                                        <td><input name="phone" type="text" style="background-color: #50697F; border: none; color: white" value="<%= acc.getPhone() %>"></td>
                                        <td><input name="status" type="text" style="background-color: #50697F; border: none; color: white;width: 30px;
                                                   font-size: 14px;" value="<%= acc.getStatus() %>"></td>

                                        <td><input name="role" type="text" style="background-color: #50697F; border: none; color: white;width: 30px;
                                                   font-size: 14px;" value="<%= acc.getRole() %>"></td>
                                        <td>

                                            <button type="submit" class="btn btn-secondary btn-lg" >Save</button>

                                        </td>
                                    </form>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/admin" method="post">
                                            <input type="hidden" name="action" value="deleteAccount"/>
                                            <input type="hidden" name="id" value="<%= acc.getId() %>"/>
                                            <button type="submit" class="btn"><i class="far fa-trash-alt tm-product-delete-icon"></i></button>

                                        </form>
                                    </td>
                                    </tr>
                                    <% } %>

                                    </tbody>
                                </table>
                            </div>
                            <!-- table container -->

                            <div>
                                <button class="navtab-btn btn btn-primary btn-block text-uppercase mb-3" >Add new Account</button>
                                <div class="tab-content-item ">
                                    <div class="tm-product-table-container">
                                        <table class="table table-hover tm-table-small tm-product-table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Password</th>
                                                    <th scope="col">FullName</th>
                                                    <th scope="col">Phone</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Role</th>
                                                    <th scope="col">&nbsp;</th>
                                                </tr>
                                            </thead>

                                            <tbody> 

                                                <tr>
                                            <form action="${pageContext.request.contextPath}/admin" >
                                                <input type="hidden" name="action" value="addAccount"/>
                                                <td><input name="email" type="text" style="background-color: #50697F;  color: white;" ></td>
                                                <td><input name="password" type="text" style="background-color: #50697F;  color: white;"></td>
                                                <td><input name="fullname" type="text" style="background-color: #50697F; color: white"></td>
                                                <td><input name="phone" type="text" style="background-color: #50697F;  color: white"></td>
                                                <td><input name="status" type="text" style="background-color: #50697F; color: white;width: 30px;
                                                           font-size: 14px;"></td>

                                                <td><input name="role" type="text" style="background-color: #50697F; color: white;width: 30px;
                                                           font-size: 14px;"></td>
                                                <td>

                                                    <button type="submit" class="btn btn-secondary btn-lg" >Save</button>

                                                </td>
                                            </form>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <footer class="tm-footer row tm-mt-small">
                        <div class="col-12 font-weight-light">
                            <p class="text-center text-white mb-0 px-4 small">
                                Copyright &copy; <b>2018</b> All rights reserved. 

                                Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                            </p>
                        </div>
                    </footer>
                </div>

                <script src="../js/jquery-3.3.1.min.js"></script>
                <script src="../js/bootstrap.min.js"></script>
                <script>
                    let btn = document.querySelector(".navtab-btn");
                    let content = document.querySelector(".tab-content-item");
                    btn.addEventListener("click", (event) => {
                        if (content.classList.contains("actived"))
                            content.classList.remove("actived");
                        else
                            content.classList.add("actived");
                    });

                </script>
                </body>
                </html>
