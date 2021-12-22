package com.nft.UserController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logoutController
 */
@WebServlet("/logout")
public class logoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public logoutController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		request.setAttribute("msg", "정상적으로 로그아웃되었습니다");
		request.setAttribute("loc", "index.jsp");
		request.getRequestDispatcher("/userMsg.jsp").forward(request, response);
		
		
	}
}
