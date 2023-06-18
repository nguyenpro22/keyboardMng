<%-- 
    Document   : product
    Created on : Mar 18, 2023, 7:45:31 AM
    Author     : Dung
--%>
<%@page import="dto.Product"%>
<%@page import="dto.Category"%>
<%@page import="dao.ProductDAO"%>
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
    </head>

    <body id="reportsPage">
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <div class="container mt-5">
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-9 col-xl-9 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">
                            <div class="tm-product-table-container">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">PRODUCT NAME</th>
                                            <th scope="col">PRICE</th>
                                            <th scope="col">IMG</th>
                                            <th scope="col">CateID</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>

                                    <tbody> 
                                    <% 
                                ProductDAO dao = new ProductDAO();
                                List<Product> productList = dao.getAllProduct();
                                List<Category> list = dao.getCategory();
                                for (Product product : productList) { 
                                    %>

                                    <tr>
                                        <td class="tm-product-name"><a href="editProduct.jsp?id=<%= product.getId() %>" style="text-decoration: none"><%= product.getName() %></a></td>
                                        <td><%= product.getPrice() %></td>
                                        <td><img src="<%= product.getImg() %>" width="150px" height="150px" alt="alt"/></td>
                                        <td><%= product.getCateID() %></td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/admin" method="post">
                                                <input type="hidden" name="action" value="deleteProduct"/>
                                                <input type="hidden" name="ProductID" value="<%= product.getId() %>"/>
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
                            <button class="navtab-btn btn btn-primary btn-block text-uppercase mb-3" >Add new Product</button>
                            <div class="tab-content-item ">
                                <div class="tm-product-table-container">
                                    <table class="table table-hover tm-table-small tm-product-table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">CateID</th>
                                                <th scope="col">&nbsp;</th>
                                            </tr>
                                        </thead>

                                        <tbody> 

                                            <tr>
                                        <form action="${pageContext.request.contextPath}/admin" >
                                            <input type="hidden" name="action" value="addProduct"/>
                                            <td><input name="name" type="text" style="background-color: #50697F;  color: white;" ></td>
                                            <td><input name="price" type="text" style="background-color: #50697F; color: white;width: 100px;
                                                       font-size: 14px;"></td>
                                            <td><input name="img" type="text" style="background-color: #50697F; color: white"></td>
                                            <td><textarea name="description" style="background-color: #50697F;  color: white"></textarea></td>
                                            <td><select style="background-color: #50697F; color: white" name="select">
                                                    <% 
                                    for (Category c : list) { 
                                                    %>
                                                    <option value="<%= c.getCateID() %>"><%= c.getCateName() %></option>
                                                    <% } %>
                                                </select></td>
                                            <td>

                                                <button type="submit" class="btn btn-secondary btn-sm" >Add</button>

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
                <div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                        <h2 class="tm-block-title">Product Categories</h2>
                        <div class="tm-product-table-container">
                            <table class="table tm-table-small tm-product-table">
                                <tbody>
                                    <% 
                                for (Category c : list) { 
                                    %>
                                    <tr>
                                        <td class="tm-product-name"><%= c.getCateName() %></td>
                                        <td class="text-center">
                                            <a href="admin?action=deleteCategory&name=<%= c.getCateName() %>">
                                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <div>
                            <button class="navtab-btn btn btn-primary btn-block text-uppercase mb-3" >Add new Category</button>
                            <div class="tab-content-item ">
                                <div class="tm-product-table-container">
                                    <table class="table table-hover tm-table-small tm-product-table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Name</th>
                                                <th scope="col">&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <form action="${pageContext.request.contextPath}/admin" >
                                            <tbody> 

                                                <tr>

                                            <input type="hidden" name="action" value="addCategory"/>
                                            <td><input name="name" type="text" style="background-color: #50697F;  color: white; width: 100px" ></td>
                                            <td>

                                                <button type="submit" class="btn btn-secondary btn-sm" >Add</button>

                                            </td>
                                            </tr>


                                            </tbody>
                                        </form>
                                    </table>
                                </div>
                            </div>
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

        <script src="../js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="../js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>
</html>