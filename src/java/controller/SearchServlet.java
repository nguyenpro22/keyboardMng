/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dung
 */
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String key = request.getParameter("txt");
        ProductDAO dao = new ProductDAO();
        List<Product> list;
        if(!key.isEmpty()) {
            list = dao.getProducts(key, "byname");
        }else{
            list = dao.getTop6Product();
        }
        PrintWriter out = response.getWriter();
        for (Product product : list) {
            out.println("<div class=\"count col-12 col-md-6 col-lg-4\">\n"
                    + "                                    <div class=\"card\">\n"
                    + "                                        <img class=\"card-img-top\" src=\""+product.getImg()+"\" alt=\"Card image cap\" style=\"width: 253px; height: 250px;\">\n"
                    + "                                        <div class=\"card-body\">\n"
                    + "                                            <h4 class=\"\" style=\"height: 90px;\"><a href=\"detail?id="+product.getId()+"\" title=\"View Product\">"+product.getName()+"</a></h4>\n"
                    + "                                            <p class=\"card-text show_txt\">"+product.getDescription()+"</p>\n"
                    + "                                            <div class=\"row\">\n"
                    + "                                                <div class=\"col\">\n"
                    + "                                                    <p class=\"btn btn-danger btn-block\">"+product.getPrice()+" VND</p>\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"col\">\n"
                    + "                                                    <a href=\"addToCart?productID="+product.getId()+"&quantity=1\" class=\"btn btn-success btn-block\">Add to cart</a>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "                                </div>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
