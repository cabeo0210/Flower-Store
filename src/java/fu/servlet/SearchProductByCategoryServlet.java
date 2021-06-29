/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlet;

import fu.daos.ProductDAO;
import fu.dtos.ProductDTO;
import fu.dtos.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SearchProductByCategoryServlet", urlPatterns = {"/SearchProductByCategoryServlet"})
public class SearchProductByCategoryServlet extends HttpServlet {

    private final String SEARCH_PAGE = "searchProduct.jsp";

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
        String url = SEARCH_PAGE;
        String pageIndex = request.getParameter("pageIndex");
        int pageSize = 4;
        int endPage = 0;
        String cbSelectCategory = request.getParameter("cbCategory");
        int index = 0;
        boolean isAdmin = false;
        HttpSession session = request.getSession();
        UserDTO dto = (UserDTO) session.getAttribute("USER_LOGIN");
        if (dto != null) {
            isAdmin = dto.isIsAdmin();
        }
        try {
            if (pageIndex != null) {
                index = Integer.parseInt(pageIndex);
            }            
            ProductDAO dao = new ProductDAO();
            int count = dao.countResultSearchCategory(cbSelectCategory, isAdmin);
            endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
            dao.searchProductByCategory(cbSelectCategory, index, pageSize, isAdmin);
            List<ProductDTO> list = dao.getList();
            request.setAttribute("LIST_RESULT", list);
            request.setAttribute("ACTIONFORM", "SearchProductByCategoryServlet");
            request.setAttribute("ENDPAGE", endPage);
        } catch (NamingException ex) {
            Logger.getLogger(SearchProductByCategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchProductByCategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchProductByCategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchProductByCategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
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
