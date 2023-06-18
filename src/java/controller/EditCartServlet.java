/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import dto.Account;
import dto.Order;
import dto.OrderDetail;
import dto.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

/**
 *
 * @author Dung
 */
public class EditCartServlet extends HttpServlet {

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
        String orderStt = request.getParameter("orderStatus");
        String orderID = request.getParameter("orderID");
        String button = request.getParameter("button");
        HttpSession session = request.getSession();
        HashMap<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
        HashMap<Product, Integer> cartTmp = (HashMap<Product, Integer>) session.getAttribute("cartDefault");
        if (orderStt != null && orderStt.equals("0") && cartTmp == null) {
            HashMap<Product, Integer> cartDefault = new HashMap<>();
            cart.forEach((key, value) -> {
                cartDefault.put(key, value);
            });
            session.setAttribute("cartDefault", cartDefault);
            log("" + cartDefault);
        }

        if (id != null) {
            ProductDAO dao = new ProductDAO();
            Product p = dao.getProduct(id);
            if (button.equals("update")) {
                String quantity = request.getParameter("quantity");
                cart.replace(p, Integer.parseInt(quantity));
            } else {
                cart.remove(p);
                session.setAttribute("cart", cart);
            }
        } else {
            OrderDAO ordDAO = new OrderDAO();
            if (orderStt.equals("0")) {
                HashMap<Product, Integer> cartDefault = (HashMap<Product, Integer>) session.getAttribute("cartDefault");
                if (cartDefault != null) {
                    if (ordDAO.compareMaps(cartDefault, cart)) {
                        ordDAO.deleteOrderDetailByOrdID(Integer.parseInt(orderID));
                        ordDAO.deleteOrderByOrdID(Integer.parseInt(orderID));
                    }
                }
                if (cartDefault == null) {
                    ordDAO.deleteOrderDetailByOrdID(Integer.parseInt(orderID));
                    ordDAO.deleteOrderByOrdID(Integer.parseInt(orderID));
                }
            }
            String select = request.getParameter("select");
            Account acc = (Account) session.getAttribute("acc");
            int ship = 0;
            switch (select) {
                case "1": {
                    ship = 5;
                    break;
                }
                case "2": {
                    ship = 6;
                    break;
                }
                case "3": {
                    ship = 7;
                    break;
                }
            }
            LocalDateTime now = LocalDateTime.now();
            LocalDateTime shipDate = now.plusDays(ship);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            String ordDate = now.format(formatter);
            String shipd = shipDate.format(formatter);

            if (cart.isEmpty()) {
                response.sendRedirect("MainController");
                return;
            }
            Order order = new Order(1, ordDate, shipd, 1, acc.getId());
            int ordID = Integer.parseInt(ordDAO.addOrderToDB(order));

            cart.forEach((key, value) -> {
                OrderDetail ordDetail = new OrderDetail(1, ordID, key.getId(), value);
                ordDAO.addOrderDetailsToDB(ordDetail);
            });
            cart.clear();
            response.sendRedirect("MainController");
            return;
        }
        request.setAttribute("orderID", orderID);
        request.setAttribute("orderStatus", orderStt);
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
