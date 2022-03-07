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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author trinh
 */
@WebServlet(name = "DeleteControl", urlPatterns = {"/delete"})
public class DeleteControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
		if (action.equalsIgnoreCase("product")) {
			doGet_Product(request, response);
		} else {
			if (action.equalsIgnoreCase("account")) {
				doGet_Account(request, response);
                        
		}
        
    }
    }
    
    protected void doGet_Product(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	String pid = request.getParameter("pid");
        DAO dao = new DAO();
        dao.deleteProduct(pid);
        response.sendRedirect("manager");
        
    }

    protected void doGet_Account(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String id = request.getParameter("id");
            DAO dao = new DAO();
            dao.deleteAccount(id);
            response.sendRedirect("AccountControl");
        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

   
