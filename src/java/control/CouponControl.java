/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author khuat
 */
public class CouponControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String xCode = request.getParameter("couponCode");
        DAO dao = new DAO();
        int Discount = dao.couponCheck(xCode);
        if(Discount==0){
            request.setAttribute("mess", "Wrong discount code or expired");
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        }
        else
        {
            request.setAttribute("mess", "Success");
            request.setAttribute("Discount", Discount);
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        }
    }   

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
