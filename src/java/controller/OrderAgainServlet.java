/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import dto.OrderDetail;
import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Dung
 */
public class OrderAgainServlet extends HttpServlet {

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
        String id = request.getParameter("id");
        OrderDAO dao = new OrderDAO();
        List<OrderDetail> list = dao.getOrderDetailsByOrdID(Integer.parseInt(id));
        HttpSession session = request.getSession();
        HashMap<Product, Integer> cart = (HashMap) session.getAttribute("cart");
        if (cart != null) {
            cart.clear();
        }
        for (OrderDetail orderDetail : list) {
            int pid = orderDetail.getProID();
            int quant = orderDetail.getQuantity();

            ProductDAO pdao = new ProductDAO();
            Product product = pdao.getProduct(Integer.toString(pid));
            if (cart == null) {
                cart = new HashMap<>();
                cart.put(product, quant);
            } else {
                if (cart.containsKey(product)) {
                    int old = cart.get(product);
                    quant += old;
                    cart.replace(product, quant);
                } else {
                    cart.put(product, quant);
                }
            }
            session.setAttribute("cart", cart);
        }
        request.setAttribute("orderStatus", dao.getOrderByOrdID(Integer.parseInt(id)).getStatus());
        request.setAttribute("orderID", dao.getOrderByOrdID(Integer.parseInt(id)).getId());
        request.getRequestDispatcher("CartDetail.jsp").forward(request, response);
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
