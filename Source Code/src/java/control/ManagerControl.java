/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Category;
import entity.Order;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author trinh
 */
@WebServlet(name = "ManagerControl", urlPatterns = {"/manager"})
public class ManagerControl extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			doGet_All(request, response);
		} else {
			if (action.equalsIgnoreCase("order")) {
				doGet_Order(request, response);
			}
		}
	}
    //lay product ben manager product
    protected void doGet_All(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        int id = a.getId();
        DAO dao = new DAO();
        List<Product> list = dao.getProductBySellID(id);
        List<Category> listC = dao.getAllCategory();
        String begin = request.getParameter("begin");
        String end = request.getParameter("end");
        if(begin==null || end==null){
            begin="0";end="5";
        }
        request.setAttribute("listCC", listC);
        request.setAttribute("listP", list);
        request.setAttribute("begin",begin);
        request.setAttribute("end",end);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
	}
    
    //xem tat ca order
    protected void doGet_Order(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
                HttpSession session = request.getSession();
                Account a = (Account) session.getAttribute("acc");
                DAO dao = new DAO();
                if(a.getRole().equals("admin")){   //neu la admin thi xem tat ca order
                    List<Order> list = dao.getAllOrders("admin");
                    request.setAttribute("listO", list);    
                }
                else if(a.getRole().equals("seller")){ // neu role la seller thi chi dc xem cac mon hang dang ban cua seller do
                    List<Order> list = dao.getAllOrders("seller");
                    request.setAttribute("listO", list);
                }
                String begin = request.getParameter("begin");
                String end = request.getParameter("end");
                if(begin==null || end==null){
                    begin="0";end="5";
                }
                request.setAttribute("begin",begin);
                request.setAttribute("end",end);
                request.getRequestDispatcher("ManageOrder.jsp").forward(request, response);
	}
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet_All(request, response);
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
