/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlet;

import fu.daos.ProductDAO;
import fu.dtos.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CreateProductServlet", urlPatterns = {"/CreateProductServlet"})
public class CreateProductServlet extends HttpServlet {
    private final String CREATE_SUCCESS = "LoadPageSearchServlet";

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
        String desc = request.getParameter("txtDesc");
        String quantity = request.getParameter("txtQuantity");
        int convertQuantity = Integer.parseInt(quantity);
        String price = request.getParameter("txtPrice");
        float convertPrice = Float.parseFloat(price);
        String category = request.getParameter("cbCategory");
        String userInsert = request.getParameter("userInsert");
        java.util.Date date = new java.util.Date();
        Date createDate = new Date(date.getTime());
        String url = CREATE_SUCCESS;
        try {
            ProductDAO dao = new ProductDAO();
            ProductDTO dto = new ProductDTO(id, name, image, desc, convertPrice, createDate, createDate, userInsert, convertQuantity, category, "Active");
            boolean result = dao.insertProduct(dto);
            if(result){
                url = CREATE_SUCCESS;
            }            
        } catch (Exception e) {
            String errString = e.getMessage().trim();
            System.out.println(errString);
            if (errString.contains("duplicate")) {
                request.setAttribute("ERROR_PRODUCTID", "The product ID is exist! Please add product with another ID");
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
