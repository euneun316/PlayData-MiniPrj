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

@WebServlet("/addProductController")
public class addProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public addProductController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		int uNo = 0; // 로그인 session
		if (session.getAttribute("uNo") != null) {
			uNo = (Integer) session.getAttribute("uNo");
		}

		String productName = request.getParameter("productName");
		long productPrice = Long.parseLong(request.getParameter("productPrice"));
		int productWidthSize = Integer.parseInt(request.getParameter("productWidthSize"));
		int productHeightSize = Integer.parseInt(request.getParameter("productHeightSize"));
		String productImgUrl = request.getParameter("productImgUrl");
		String productNft = request.getParameter("productNft");
		String productReleasedDate = request.getParameter("productReleasedDate");
		String productAuthor = request.getParameter("productAuthor");
		String productInfo = request.getParameter("productInfo");
		int productCategoryNo = Integer.parseInt(request.getParameter("productCategoryNo"));

		int result = 0;
		RequestDispatcher rd = request.getRequestDispatcher("/alert.jsp");

		if ((productName == null) || (productPrice == 0) || 
			(productWidthSize == 0) || (productHeightSize == 0) || (productImgUrl == null) || 
			(productNft == null) || (productReleasedDate == null) || (productCategoryNo == 0) 
			|| ("".equals(productReleasedDate))) {
			request.setAttribute("alert", "입력이 안 된 사항이 있습니다.");
			request.setAttribute("goPage", "addProduct.jsp");

		} else {
			ProductDAO pDAO = ProductDAO.getInstance();
			result = pDAO.productRegister(new ProductBean(uNo, productName, productPrice, productWidthSize, 
					productHeightSize, productImgUrl, productNft, productReleasedDate, productAuthor, productInfo, productCategoryNo));
			if (result == -1) {
				request.setAttribute("alert", "예기치 못한 오류가 발생했습니다.a관리자(admin@email.com)에게 문의바랍니다.");
				request.setAttribute("goPage", "addProduct.jsp");

			} else {
				request.setAttribute("alert", "상품 등록이 완료되었습니다.");
				request.setAttribute("goPage", "marketplace.jsp");

			}
			
		}
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		doGet(request, response);
	}
	
}
