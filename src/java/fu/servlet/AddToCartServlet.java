/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlet;

import fu.cart.CartObject;
import fu.dtos.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

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
        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String image = request.getParameter("txtImage");
        String price = request.getParameter("txtPrice");
        float convertPrice = Float.parseFloat(price);
        int quantity = 1;
        String currentUserBuy = request.getParameter("currentUserBuy");
        String categoryID = request.getParameter("txtCategory");
        java.util.Date date = new java.util.Date();
        Date lastUpdateDate = new Date(date.getTime());
        String actionSearch = request.getParameter("btnActionSearch");
        String searchName = request.getParameter("txtSearchValueName");
        String minPrice = request.getParameter("txtMinPrice");
        String maxPrice = request.getParameter("txtMaxPrice");
        String categoryName = request.getParameter("cbCategory");        
        String pageIndex = request.getParameter("pageIndex");

        try {
            HttpSession session = request.getSession();
            CartObject obj = (CartObject) session.getAttribute("CART_USER");
            if (obj == null) {
                obj = new CartObject();
            }
            ProductDTO dto = new ProductDTO(id, name, convertPrice, currentUserBuy, quantity, categoryID, image);
            obj.addToCart(dto);
            session.setAttribute("CART_USER", obj);
        } finally {
            String urlRewriting = "DispatchServlet"
                    + "?btnAction=" + actionSearch
                    + "&txtSearchNameFood=" + searchName
                    + "&txtRangeMinMoney=" + minPrice
                    + "&txtRangeMaxMoney=" + maxPrice
                    + "&cbCategory=" + categoryName
                    + "&pageIndex=" + pageIndex;
            response.sendRedirect(urlRewriting);
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
