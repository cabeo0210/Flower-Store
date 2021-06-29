/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlet;
import fu.daos.HistoryDAO;
import fu.daos.ProductDAO;
import fu.dtos.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

    private final String UPDATEERROR_PAGE = "updateError.html";
    private final String UPDATE_ACTION = "Update";

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
        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String image = request.getParameter("txtImage");
        String desc = request.getParameter("txtDesc");
        String price = request.getParameter("txtPrice");
        float convertPrice = Float.parseFloat(price);
        String quantity = request.getParameter("txtQuantity");
        int convertQuantity = Integer.parseInt(quantity);
        String lastUpdateUser = request.getParameter("lastUserDelete");
        java.util.Date date = new java.util.Date();
        Date lastUpdateDate = new Date(date.getTime());
        String actionSearch = request.getParameter("btnActionSearch");
        String searchName = request.getParameter("txtSearchValueName");
        String minPrice = request.getParameter("txtMinPrice");
        String maxPrice = request.getParameter("txtMaxPrice");
        String categoryName = request.getParameter("cbCategory");
        String productStatus = request.getParameter("productStatus");
        String pageIndex = request.getParameter("pageIndex");
        String url = UPDATEERROR_PAGE;
        
        try {
            ProductDAO dao = new ProductDAO();           
            ProductDTO dto = new ProductDTO(id, name, image, desc, convertPrice, lastUpdateDate, lastUpdateUser, convertQuantity, categoryName, productStatus);
            boolean result = dao.updateProduct(dto);            
            if (result) {
                HistoryDAO hisDao = new HistoryDAO();
                hisDao.insertHistory(id, lastUpdateUser, lastUpdateDate, UPDATE_ACTION);
                url = "DispatchServlet"
                        + "?btnAction=" + actionSearch
                        + "&txtSearchNameFood=" + searchName
                        + "&txtRangeMinMoney=" + minPrice
                        + "&txtRangeMaxMoney=" + maxPrice
                        + "&cbCategory=" + categoryName
                        + "&pageIndex=" + pageIndex;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
