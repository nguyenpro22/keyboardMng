/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dung
 */
public class MainController extends HttpServlet {

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
        String redirectUrl = "";
        String action = request.getParameter("action");

        if (null == action) {
            redirectUrl = "HomeServlet";
        } else switch (action) {
            case "home":
                redirectUrl = "HomeServlet";
                break;
            case "login":
                redirectUrl = "LoginServlet";
                break;
            case "signup":
                redirectUrl = "SignupServlet";
                break;
            case "search":
                redirectUrl = "search";
                break;
            case "addToCart":
                redirectUrl = "addToCart";
                break;
            case "viewCart":
                redirectUrl = "detail";
                break;
            case "editCart":
                redirectUrl = "editCart";
                break;
            case "deleteCartItem":
                redirectUrl = "deleteCartItem";
                break;
            case "checkout":
                redirectUrl = "checkout";
                break;
            case "logout":
                redirectUrl = "logout";
                break;
            case "viewAllOrders":
                redirectUrl = "viewAllOrders";
                break;
            case "viewOrderDetail":
                redirectUrl = "viewOrderDetail";
                break;
            case "updateAccount":
                redirectUrl = "AccountServlet";
                break;
            case "changeOrderStatus":
                redirectUrl = "changeOrderStatus";
                break;
            case "viewOrder":
                redirectUrl = "viewOrderServlet";
                break;
            case "orderAgain":
                redirectUrl = "OrderAgainServlet";
                break;
            case "cancelOrder":
                redirectUrl = "UpdateCancelOrderServlet";
                break;
            case "searchOrder":
                redirectUrl = "SearchOrderByDate";
                break;
            default:
                redirectUrl = "home";
                break;
        }
//        log(redirectUrl);
        request.getRequestDispatcher(redirectUrl)
                .forward(request, response);
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
