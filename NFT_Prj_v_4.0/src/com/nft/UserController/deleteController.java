package com.nft.UserController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nft.user.*;


@WebServlet("/userdelete")
public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int deleteuNo = Integer.parseInt(request.getParameter("deleteuNo"));
		System.out.print(deleteuNo);
		
 		UserDAO uDAO = UserDAO.getInstance();
		int result = uDAO.userDelete(deleteuNo);
		
		if (result == 1) {
			request.setAttribute("alert", "삭제가 완료되었습니다.");
			request.setAttribute("goPage", "admin.jsp");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		}
		
		else {
			request.setAttribute("alert", "오류가 발생했습니다.");
			request.setAttribute("goPage", "admin.jsp");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		}

	}
}
