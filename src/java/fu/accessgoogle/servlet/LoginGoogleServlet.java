/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.accessgoogle.servlet;

/**
 *
 * @author Asus
 */
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import fu.accessgoogle.common.GooglePojo;
import fu.accessgoogle.common.GoogleUtils;
import fu.daos.UserDAO;
import fu.dtos.UserDTO;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/LoginGoogleServlet"}) 
public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGoogleServlet() {
        super();
    }
    
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.html");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("name", googlePojo.getName());
            request.setAttribute("email", googlePojo.getEmail());
            RequestDispatcher dis = request.getRequestDispatcher("LoadPageSearchServlet");
            dis.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}