/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DispatchServlet extends HttpServlet {

    private final String LOGIN_PAGE = "login.html";
    private final String LOGIN_CONTROLLER = "LoginServlet";
    private final String LOGOUT_CONTROLLER = "LogoutServlet";
    private final String SEARCHPRODUCT_CONTROLLER = "LoadPageSearchServlet";
    private final String SEARCHPRODUCTBYNAME_CONTROLLER = "SearchProductByNameServlet";
    private final String SEARCHPRODUCTBYCATEGORY_CONTROLLER = "SearchProductByCategoryServlet";
    private final String DELETEPRODUCT_CONTROLLER = "DeleteProductServlet";
    private final String VIEWHISTORY_CONTROLLER = "ViewHistoryServlet";
    private final String UPDATEPRODUCT_CONTROLLER = "UpdateProductServlet";
    private final String CREATEPRODUCT_CONTROLLER = "CreateProductServlet";
    private final String ADDPRODUCT_CONTROLLER = "AddProductServlet";
    private final String ADDTOCART_CONTROLLER = "AddToCartServlet";
    private final String VIEWCART_PAGE = "viewCart.jsp";
    private final String REMOVEFROMCART = "RemoveFromCartServlet";
    private final String UPDATEFROMCART = "UpdateFromCartServlet";
    private final String CHECKOUTPRODUCT = "CheckoutServlet";
    private final String VIEWORDER_CONTROLLER = "ViewOrderServlet";

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
        PrintWriter out = response.getWriter();
        String url = SEARCHPRODUCT_CONTROLLER;
        String button = request.getParameter("btnAction");

        try {
            if ("Login".equals(button)) {
                url = LOGIN_CONTROLLER;
            } else if ("Logout".equals(button)) {
                url = LOGOUT_CONTROLLER;
            } else if ("Search Product".equals(button)) {
                url = SEARCHPRODUCT_CONTROLLER;
            } else if ("SearchProductByNameServlet".equals(button)) {
                url = SEARCHPRODUCTBYNAME_CONTROLLER;
            } else if ("SearchProductByCategoryServlet".equals(button)) {
                url = SEARCHPRODUCTBYCATEGORY_CONTROLLER;
            } else if ("Search by name".equals(button)) {
                url = SEARCHPRODUCTBYNAME_CONTROLLER;
            } else if ("Search by category".equals(button)) {
                url = SEARCHPRODUCTBYCATEGORY_CONTROLLER;
            } else if ("Remove chk Product".equals(button)) {
                url = DELETEPRODUCT_CONTROLLER;
            } else if ("View History".equals(button)) {
                url = VIEWHISTORY_CONTROLLER;
            } else if ("Save Change".equals(button)) {
                url = UPDATEPRODUCT_CONTROLLER;
            } else if ("Create Product".equals(button)) {
                url = CREATEPRODUCT_CONTROLLER;
            } else if ("Add Product".equals(button)) {
                url = ADDPRODUCT_CONTROLLER;
            } else if ("LoginToBuy".equals(button)) {
                url = LOGIN_PAGE;
            } else if("Add to Cart".equals(button)){
                url = ADDTOCART_CONTROLLER;
            } else if("ViewCartPage".equals(button)){
                url = VIEWCART_PAGE;
            } else if("RemoveItemFromCart".equals(button)){
                url = REMOVEFROMCART;
            } else if("UpdateItemFromCart".equals(button)){
                url = UPDATEFROMCART;
            } else if("OrderProduct".equals(button)){
                url = CHECKOUTPRODUCT;
            } else if("ViewOrder".equals(button)){
                url = VIEWORDER_CONTROLLER;
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
