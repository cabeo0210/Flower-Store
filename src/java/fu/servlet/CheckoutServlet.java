/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlet;

import fu.cart.CartObject;
import fu.daos.OrderDAO;
import fu.daos.OrderDetailsDAO;
import fu.daos.ProductDAO;
import fu.dtos.OrderDTO;
import fu.dtos.ProductDTO;
import fu.dtos.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {
    
    private final String ORDER_FAIL = "orderFail.jsp";
    private final String ORDER_SUCCESS = "orderSuccess.jsp";
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
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String userID = ((UserDTO) session.getAttribute("USER_LOGIN")).getId();
        String phoneNumber = request.getParameter("txtPhoneNumber");
        String address = request.getParameter("txtAddress");
        String totalPrice = request.getParameter("txtTotalPrice");
        float totalPriceConvert = Float.parseFloat(totalPrice);
        java.util.Date date = new java.util.Date();
        Date dateOrder = new Date(date.getTime());
        Time timeOrder = new Time(date.getTime());
        String url = ORDER_FAIL;
        try {
            CartObject obj = (CartObject) session.getAttribute("CART_USER");
            ProductDAO productDao = new ProductDAO();
            OrderDAO orderDao = new OrderDAO();
            OrderDTO dto = new OrderDTO(userID, address, phoneNumber, dateOrder, timeOrder, totalPriceConvert);
            OrderDetailsDAO orderDetailsDao = new OrderDetailsDAO();
            boolean result = orderDao.insertOrder(dto);
            if (result) {
                int orderID = orderDao.getLastOrderID();
                if (orderID != 0) {
                    Iterator<Map.Entry<String, ProductDTO>> iterator = obj.getList().entrySet().iterator();
                    while (iterator.hasNext()) {
                        Map.Entry<String, ProductDTO> entry = iterator.next();
                        ProductDTO value = entry.getValue();
                        orderDetailsDao.insertOrderDetails(orderID, value.getId(), value.getQuantity(), totalPriceConvert);
                        productDao.updateQuantityAfterSold(value.getId(), value.getQuantity());
                        url = ORDER_SUCCESS;
                        iterator.remove();
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            response.sendRedirect(url);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
