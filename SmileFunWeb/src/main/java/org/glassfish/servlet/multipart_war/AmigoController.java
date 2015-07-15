package org.glassfish.servlet.multipart_war;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.glassfish.servlet.business.AmigoBO;
import org.glassfish.servlet.persistent.AmigoPO;
import org.glassfish.servlet.persistent.LoginPO;
import org.glassfish.servlet.persistent.UsuarioPO;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class AmigoController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final static String INSERT_OR_EDIT = "/addAmigo.jsp";
    private final static String LIST_AMIGO = "/listAmigo.jsp";
    private AmigoBO amigoBO = new AmigoBO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AmigoController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AmigoController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
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
        String forward="";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int userId = Integer.parseInt(request.getParameter("userId"));
            //dao.borrarUsuario(userId);
            forward = LIST_AMIGO;
            //request.setAttribute("users", dao.listaUsuarios());
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int userId = Integer.parseInt(request.getParameter("userId"));
            //UsuarioPO user = dao.getUsuario(userId);
            //request.setAttribute("user", user);
        } else if (action.equalsIgnoreCase("listAmigo")){
            forward = LIST_AMIGO;
            HttpSession session=request.getSession();
            LoginPO usuario = (LoginPO) session.getAttribute("user");
            request.setAttribute("amigos", amigoBO.getListaAmigos(usuario.getLogId()));
        } else {
            forward = INSERT_OR_EDIT;
            /*HttpSession session=request.getSession();
            LoginPO usuario = (LoginPO) session.getAttribute("user");
            if (usuario != null) request.setAttribute("amigos", amigoBO.getListaAmigos(usuario.getLogId()));
            else request.setAttribute("amigos", new ArrayList<AmigoBO>());*/
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
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
        int amigoId = Integer.parseInt(request.getParameter("amigoId"));
        
        HttpSession session=request.getSession();
        LoginPO usuario = (LoginPO) session.getAttribute("user");
        
        if(usuario == null)
        {
            RequestDispatcher view = request.getRequestDispatcher(LIST_AMIGO);
            request.setAttribute("amigos", new ArrayList<AmigoBO>());
            view.forward(request, response);
        }
        else
        {
            int userId = usuario.getLogId();
            AmigoPO amigo = new AmigoPO();
            amigo.setUserHost(userId);
            amigo.setUserGuest(amigoId);
            
            amigoBO.agregarAmigo(amigo);
            
            RequestDispatcher view = request.getRequestDispatcher(LIST_AMIGO);
            request.setAttribute("amigos", amigoBO.getListaAmigos(userId));
            view.forward(request, response);
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
