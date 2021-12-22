package com.nft.ProductController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nft.product.ProductBean;
import com.nft.product.ProductDAO;

@WebServlet("/buyProductContoller")
public class buyProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO pDAO = ProductDAO.getInstance();
	
	public buyProductController() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int uNo = 0; // 로그인 session
		if (session.getAttribute("uNo") != null) {
			uNo = (Integer) session.getAttribute("uNo");
		}
		
		int pNo = (Integer) session.getAttribute("pNo"); // 상품 번호
		String pStatus = (String) session.getAttribute("pStatus"); // 거래상태
		RequestDispatcher rd = request.getRequestDispatcher("/alert.jsp");
		
		if (uNo == 0) {
			
			request.setAttribute("alert", "로그인 후 이용해 주세요!.");
			request.setAttribute("goPage", "login.jsp");
			
		} else if ("N".equals(pStatus)) { // 로그인 일때, pStatus 한번 더 체크(오류 방지 위함)
			
			int buyResultCnt = pDAO.productBuy(pNo); // 구매 시 pStatus 업데이트
			int dealResulCnt = pDAO.insertDealTable(uNo, pNo); // 거래 정보 테이블 업데이트

			if (buyResultCnt > 0 && dealResulCnt > 0) {
				request.setAttribute("alert", "제품 구매 예약이 완료 되었습니다.");
				request.setAttribute("goPage", "marketplace.jsp");
			}
		
		}rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
