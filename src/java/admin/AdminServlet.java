/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dao.ProductDAO;
import dto.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dung
 */
public class AdminServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        String url = "";
        if (action == null) {
            // No action specified
            url = "product.jsp";
            response.sendRedirect(url);
            return;
        }
        
        switch (action) {
            case "deleteProduct":{
                url = "deleteProduct";
                break;
            }
            case "editProduct":{
                url = "editProduct";
                break;
            }  
            case "viewProduct":{
                url = "editProduct.jsp";
                break;
            }  
            case "updateAccount":{
                url = "updateAccount";
                break;
            }  
            case "viewAccount":{
                url = "account.jsp";
                break;
            } 
            case "deleteAccount":{
                url = "deleteAccount";
                break;
            }
            case "addAccount":{
                url = "addAccount";
                break;
            }
            case "addProduct":{
                url = "addProduct";
                break;
            }
            case "addCategory":{
                url = "addCategory";
                break;
            }
            case "deleteCategory":{
                url = "deleteCategory";
                break;
            }
            case "viewOrder":{
                url = "ViewAllOrderServlet";
                break;
            }
            case "saveStatus":{
                url = "UpdateStatusServlet";
                break;
            }
            case "search":{
                url = "AdminSearchOrderServlet";
                break;
            }
        }
        request.getRequestDispatcher(url)
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
