package org.glassfish.servlet.multipart_war;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.glassfish.servlet.DAO.LoginDAO;
import org.glassfish.servlet.persistent.LoginPO;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String LOGIN_CORRECTO = "/principal.jsp";
    private static String LOGIN_INCORRECTO = "/login.jsp";
    private LoginDAO dao;

    public LoginController() {
        super();
        dao = new LoginDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = (String) request.getAttribute("user");
        try {
            if (usuario.isEmpty()) {
                RequestDispatcher view = request.getRequestDispatcher(LOGIN_INCORRECTO);
                view.forward(request, response);
            }
            else {
                RequestDispatcher view = request.getRequestDispatcher(LOGIN_CORRECTO);
                view.forward(request, response);
            }
        } catch(Exception e) {
        }
    }

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
        LoginPO login = new LoginPO();
        login.setUser(request.getParameter("user"));
        login.setPassword(request.getParameter("password"));
        
        boolean verified = dao.verify(login);
        
        if(verified) {
            RequestDispatcher view = request.getRequestDispatcher(LOGIN_CORRECTO);
            request.setAttribute("user", login.getUser());
            view.forward(request, response);
        }
        else {
            request.setAttribute("str_MsgLogin", "Usuario o contraseña incorrecta");
            processRequest(request, response);
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
