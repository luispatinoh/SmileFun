package org.glassfish.servlet.multipart_war;

import java.io.IOException;
//import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.glassfish.servlet.DAO.LoginDAO;
import org.glassfish.servlet.persistent.LoginPO;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final static String LOGIN_CORRECTO = "/principal.jsp";
    private final static String LOGIN_INCORRECTO = "/login.jsp";
    private final LoginDAO dao;

    public LoginController() {
        super();
        dao = new LoginDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        LoginPO usuario = (LoginPO) session.getAttribute("user");
        try {
            if (usuario==null || usuario.getUser().isEmpty()) {
                RequestDispatcher view = request.getRequestDispatcher(LOGIN_INCORRECTO);
                view.forward(request, response);
            }
            else {
                RequestDispatcher view = request.getRequestDispatcher(LOGIN_CORRECTO);
                view.forward(request, response);
            }
        } catch(Exception e) {
            RequestDispatcher view = request.getRequestDispatcher(LOGIN_CORRECTO);
            view.forward(request, response);
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
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        login.setUser(user);
        login.setPassword(password);
        
        boolean verified = dao.verify(login);
        
        if(verified) {
            RequestDispatcher view = request.getRequestDispatcher(LOGIN_CORRECTO);
            HttpSession session=request.getSession();
            
            login = dao.getLogin(user, password);
            
            session.setAttribute("user",login);  
            //request.setAttribute("user", );
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
