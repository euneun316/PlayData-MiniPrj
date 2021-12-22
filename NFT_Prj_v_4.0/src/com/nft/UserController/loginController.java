package com.nft.UserController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import com.nft.user.*;

@WebServlet("/login")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		HttpSession session = request.getSession();
		
		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		
		int uGrade = 1;
		int uNo = 0;
		String uName = null;
		
		if (uId.equals("")  || uPw.equals("")) {
			request.setAttribute("alert", "입력이 안 된 사항이 있습니다.");
			request.setAttribute("goPage", "login.jsp");
//			request.getRequestDispatcher("/userMsg.jsp").forward(request, response);
		} else {
			UserDAO uDAO = UserDAO.getInstance();
			int result = uDAO.userLogin(uId, uPw);
			uNo = uDAO.getUserNo(uId);
			uGrade = uDAO.getUserGrade(uId);
			uName = uDAO.getUserName(uId);
				
				// 로그인이 성공적일 때
				if (result == 1) {
					session.setAttribute("uNo", uNo);
					session.setAttribute("uGrade", uGrade);
					session.setAttribute("uName", uName);
				
					if (uGrade == 0){						
						request.setAttribute("alert", "관리자님으로 로그인되었습니다.");
						request.setAttribute("goPage", "admin.jsp");
						request.getRequestDispatcher("/alert.jsp").forward(request, response);
						
					} else if (uGrade == 1) {
						request.setAttribute("alert", "성공적으로 로그인되었습니다.");
						request.setAttribute("goPage", "index.jsp");
						request.getRequestDispatcher("/alert.jsp").forward(request, response);
					}				
				// 비밀번호가 틀릴 때

				}
				// 로그인이 성공적이지 못할 때
				else if (result == 0){
					request.setAttribute("alert", "비밀번호가 틀립니다.");
				
				// 아이디가 존재하지 않을 때
				}  else if (result == -1) {
					request.setAttribute("alert", "존재하지 않는 아이디입니다.");;
				}
				request.setAttribute("goPage", "login.jsp");
		}
		request.getRequestDispatcher("/alert.jsp").forward(request, response);
	}
}
