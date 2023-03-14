/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ninhpd.controller;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import ninhpd.registration.RegistrationDAO;
import ninhpd.registration.RegistrationDTO;
import ninhpd.util.DBHelper;

/**
 *
 * @author TienPhong
 */
public class LoginServlet extends HttpServlet {
//    private final String INVALID_PAGE = "invalid.html";

    private final String INVALID_PAGE = "invalidPage";

//    private final String SEARCH_PAGE = "search.html";
//        private final String SEARCH_PAGE = "search.jsp";
    private final String SEARCH_PAGE = "searchPage";

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
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITE_MAPS");
        String url = siteMaps.getProperty(INVALID_PAGE);
        String button = request.getParameter("btAction");
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");

        try {

            //3.call model
            //3.1 new object
            RegistrationDAO dao = new RegistrationDAO();
            //3.2 call method of object
            RegistrationDTO result = dao.checkLogin(username, password);
            //4. send View
            if (result != null) {
                url = siteMaps.getProperty(SEARCH_PAGE);
                HttpSession session = request.getSession();
                session.setAttribute("USER", result);
                //add cookie to client using resObj
//                    Cookie cookie = new Cookie(username,password);
//                    cookie.setMaxAge(60 * 3);
//                    response.addCookie(cookie);
            }

        } catch (NamingException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            //5.Set value to res Obj
//            response.sendRedirect(url);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
