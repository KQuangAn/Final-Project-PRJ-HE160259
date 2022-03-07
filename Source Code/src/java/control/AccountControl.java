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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khuat
 */
@WebServlet(name = "AccountControl", urlPatterns = {"/AccountControl"})
public class AccountControl extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        List<Account> listA = dao.getAllAccount();
        //b2: set data to jsp
        request.setAttribute("listA", listA);
        request.getRequestDispatcher("Admin_Mangager_Account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            int id = a.getId();
            String user = request.getParameter("user");
            String oldpass = request.getParameter("oldpass");
            String pass = request.getParameter("pass");
            String re_pass = request.getParameter("repass");
            if(!pass.equals(re_pass)){
                request.setAttribute("thongbao","Password khong trung khop!");
                response.sendRedirect("Profile.jsp");
            }else{
                DAO dao = new DAO();
                if(dao.checkAccountPassword(user,oldpass)){ //kiem tra pass word cu co dung k
                        dao.editAccount(user, pass,id);
                        request.setAttribute("thongbao","Mat khau da duoc thay doi! Vui long dang nhap lai");
                        response.sendRedirect("logout");
                    }
                else{
                        request.setAttribute("thongbao","Password khong chinh xac!");
                        response.sendRedirect("Profile.jsp");
                    }
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
