/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlet;

import fu.daos.HistoryDAO;
import fu.daos.ProductDAO;
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


@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/DeleteProductServlet"})
public class DeleteProductServlet extends HttpServlet {

    private final String DELETE_ERROR = "deleteError.html";
    private final String DELETE_DESC = "Delete";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String[] checkBoxRemove = request.getParameterValues("ckRemove");        
        String lastRemoveUser = request.getParameter("lastUserDelete");
        String actionSearch = request.getParameter("btnActionSearch");
        String searchName = request.getParameter("txtSearchValueName");
        String minPrice = request.getParameter("txtMinPrice");
        String maxPrice = request.getParameter("txtMaxPrice");
        String category = request.getParameter("cbCategory");
        String productStatus = request.getParameter("productStatus");
        String pageIndex = request.getParameter("pageIndex");
        int index;
        String url = DELETE_ERROR;
        int pageSize = 4;
        int endPage = 0;
        boolean isAdmin = false;
        if (pageIndex == null) {
            index = 0;
        } else {
            index = Integer.parseInt(pageIndex);
        }
        try {
            if (checkBoxRemove != null) {
                ProductDAO dao = new ProductDAO();
                HistoryDAO daoHis = new HistoryDAO();
                java.util.Date date = new java.util.Date();
                Date lastUpdateDate = new Date(date.getTime());
                boolean result = false;
                for (String objID : checkBoxRemove) {
                    result = dao.deleteProduct(objID, lastRemoveUser, lastUpdateDate, "Inactive");
                    if (result) {
                        daoHis.insertHistory(objID, lastRemoveUser, lastUpdateDate, DELETE_DESC);
                    }
                }
                if (result) {
                    int count = dao.countResultSearchAll(isAdmin);
                    endPage = count / pageSize;
                    if (count % pageSize != 0) {
                        endPage++;
                    }
                    url = "DispatchServlet"
                            + "?btnAction=" + actionSearch
                            + "&txtSearchNameFood=" + searchName
                            + "&txtRangeMinMoney=" + minPrice
                            + "&txtRangeMaxMoney=" + maxPrice
                            + "&cbCategory=" + category
                            + "&pageIndex=" + index;
                    request.setAttribute("ENDPAGE", endPage);
                }
            }
        } catch (SQLException ex) {
            log("DeleteProductServlet_SQLEx: " + ex.getMessage());
        } catch (NamingException ex) {
            log("DeleteProductServlet_NamingEx: " + ex.getMessage());
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
            Logger.getLogger(DeleteProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DeleteProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
