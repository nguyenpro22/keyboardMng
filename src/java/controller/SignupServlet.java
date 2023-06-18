/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dung
 */
public class SignupServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String email = request.getParameter("email").trim();
            String fullName = request.getParameter("fullname").trim();
            String password = request.getParameter("password").trim();
            String cfpassword = request.getParameter("cfpassword").trim();
            String phone = request.getParameter("phone").trim();
            if (!request.getParameter("password").equals(request.getParameter("cfpassword"))) {
                request.setAttribute("errorPassword", "The confirm password is not correct!!");
            }
            request.setAttribute("email", email);
            request.setAttribute("fullname", fullName);
            request.setAttribute("password", password);
            request.setAttribute("phone", phone);
            AccountDAO dao = new AccountDAO();
            if (email.isEmpty() || fullName.isEmpty() || password.isEmpty() || phone.isEmpty()) {
                request.setAttribute("errorSignup", "The input value must not contain spaces!!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
            if (dao.insertAccount(email, fullName, password, phone, "1", "0")) {
                if (!request.getParameter("password").equals(request.getParameter("cfpassword"))) {
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                    return;
                }
                request.setAttribute("success", "Register Success, Please login to continue!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorSignup", "Email already exited!!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
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
