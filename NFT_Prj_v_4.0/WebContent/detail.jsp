<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<%@ page import="com.nft.Util.Util"%>
<%@ page import="com.nft.product.ProductBean"%>
<%@ page import="com.nft.product.ProductDAO"%>

<%request.setCharacterEncoding("UTF-8");%>

<%-- 로그인 session에서 정보 불러오기 위함 --%>
<% 
	int beforeuNo = 0; // 로그아웃 상태
	if (session.getAttribute("uNo") != null) {
		beforeuNo = (Integer) session.getAttribute("uNo");
	}
	session.setAttribute("uNo", beforeuNo);
%>

<%
	ProductDAO pDAO = ProductDAO.getInstance();
	int pNo =  Integer.parseInt(request.getParameter("pNo")); //클릭한 productNo
	int uNo = (Integer) session.getAttribute("uNo"); //로그인 userNo
	String pStatus = request.getParameter("pStatus"); //클릭한 productStatus
	List<ProductBean> productList = pDAO.getProductNoProductList(pNo);
	
	System.out.println("pNo: " + session.getAttribute("pNo")); // 0
	System.out.println("uNo: " + session.getAttribute("uNo")); // 0
	System.out.println("pStatus: " + session.getAttribute("pStatus")); // 0
%>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

<title>mynft detail</title>

<!-- image/font load -->
<link rel="shortcut icon" href="assets/images/gt_favicon.png">
<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">

<!-- css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
<link rel="stylesheet" href="assets/css/main.css">
</head>

<body class="home">
	<!-- header.jsp 헤더 영역입니다 -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- /header.jsp -->
	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="marketplace.jsp"> Marketplace </a></li>
			<li class="active">Detail</li>
		</ol>

		<div class="row">

			<!-- Article main content -->
			<div class="col-sm-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Detail</h1>
				</header>

				<!--카드 영역-->
				<div class="container bootdey">
					<div class="col-md-12">
						<section class="panel">
							<div class="panel-body">
								<!--상품 이미지-->
								<%for (ProductBean productResult : productList) {%>
								
								<!--다음 페이지에 넘겨줌-->
								<% session.setAttribute("pNo", productResult.getProductNo());%>
								<% session.setAttribute("pStatus", productResult.getProductStatus());%>
								<% session.setAttribute("pSellerNo", productResult.getProductSellerNo());%>
								
								<div class="col-md-6 text-center">
									<img src="	<%=productResult.getProductImgUrl()%>" alt="">
								</div>
								<!--상품 설명-->
								<div class="col-md-6">
									<h1 class="productName">
										<b><%=productResult.getProductName()%>
										</b>
									</h1>
									<div class="description">
										<b>작가: </b><%=productResult.getProductAuthorName()%><br> 
										<b>크기: </b><%=productResult.getProductHeightSize()%> X <%=productResult.getProductWidthSize()%><br> 
										<b>유형: </b><%=productResult.getProductCategoryName()%><br> 
										<b>제작시기: </b><%=Util.dateFormatYms(productResult.getProductReleasedDate())%> <br> 
										<b>가격: </b><%="$" %> <%=Util.DecimalFormat(productResult.getProductPrice())%><br> 
										<b>NFT: </b><%=productResult.getProductNft() %><br>
										<%}%>
									</div>
								<!--  <form action="./product/buyProductAction.jsp"> -->	
									<form method = "post" action="buyProductContoller">
										<!--클릭한 상품의 판매자 정보-->
										<%int pSellerNo = (Integer) session.getAttribute("pSellerNo"); %>
										
										<div class="text-bottom">
											<!--pStatus(상품 판매 상태) Y일 때-->									
											<% if("Y".equals(pStatus)){%>
												<button class="btn btn-secondary btn-lg btn-rounded" type="button">Sold Out</button>
												
											<!--pStatus(상품 판매 상태) N일 때-->	
											
											<%}else if(uNo!= pSellerNo){%>
												<button class="btn btn-primary btn-lg btn-rounded" type="submit">Buy Now</button>
											<!--판매자 == 구매자 -->
							
											<%}else{%>
												<button class="btn btn-secondary btn-lg btn-rounded" type="button">등록한 상품입니다.</button>
											<%}%>
										</div>
									</form>
								</div>
							</div>
						</section>
					</div>
					<div class="description_detail">
						<%for (ProductBean productResult : productList) {%>
						<%=productResult.getProductInfo()%><br><%}%>
						<!--세부설명 DAO-->
					</div>
				</div>

				<!--카드 영역-->
			</div>
			<!-- /Article -->


		</div>
	</div>
	<!-- /container -->

	<!-- footer.jsp 푸터 영역입니다 -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- /footer.jsp -->

	<!-- javascript library -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>