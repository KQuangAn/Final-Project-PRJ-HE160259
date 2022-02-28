/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author trinh
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
        PrintWriter pr = response.getWriter();
        Cookie [] a = request.getCookies();
        String xValue = MyLib.searchCookie(a, "currUser");
        if(xValue==null || xValue.trim().equals("")) {
           pr.print("<h3> No data in cookie! </h3>");
           request.getRequestDispatcher("Login.jsp").include(request, response);
           return;
         }
        String [] b = xValue.split("[|]+");
        String xName = b[0];
        String xPass = b[1];
        DAO dao = new DAO();
        Account acc = dao.login(xName, xPass);
        request.getSession().setAttribute("acc", acc);
        String logResult = "";
        if(acc==null) { 
          logResult = "Sorry, username and/or password are/is invalid!";  
         }
         else {
          logResult = "Login is successful! Welcome back";  
          } 
        pr.print(logResult);  
        request.getRequestDispatcher("/index.html").include(request, response);
        response.sendRedirect("home");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String xName = request.getParameter("user");
        String xPass = request.getParameter("pass");
        String Xrem = request.getParameter("remember");
        DAO dao = new DAO();
        Account a = dao.login(xName, xPass);
        if (a == null) {
            request.setAttribute("mess", "Wrong user or pass");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            session.setMaxInactiveInterval(1000);
            if(Xrem != null) {
            String namePass = xName.trim() + "|" + xPass.trim();
            Cookie y = new Cookie("currUser",namePass);
            y.setMaxAge(60*60*24); // 1 day
            response.addCookie(y);
            }
            response.sendRedirect("home");
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
