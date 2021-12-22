<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.List"%>
<%@ page import="com.nft.product.ProductBean"%>
<%@ page import="com.nft.product.ProductDAO"%>
<%request.setCharacterEncoding("UTF-8");%>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

<title>mynft index</title>

<!-- image/font load -->
<link rel="shortcut icon" href="assets/images/gt_favicon.png">
<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">

<!-- css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
<link rel="stylesheet" href="assets/css/main.css">
</head>

<%
	ProductDAO pDAO = ProductDAO.getInstance();
	List<ProductBean> productList = null;
	String keyword = "";
	if (request.getParameter("keyword") != "") {
		keyword = request.getParameter("keyword");
		// Keyword로 검색한 제품 정보 가져오기
		productList = pDAO.searchProductList(keyword);
	}
%>

<body class="home">
	<!-- header.jsp 헤더 영역입니다 -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- /header.jsp -->

	<header id="head">
		<div class="container">
			<div class="row">
				<h1 class="lead">
					<b>새로운 NFT 미술품 거래 플랫폼, 지금 시작해보세요!</b>
				</h1>
				<p class="tagline">보다 많은 사람의 일상에 예술의 경험과 기쁨을 전달하겠습니다.</p>
				<form action="./index.jsp" method="get">
				<div class="input-group col-md-6 col-md-offset-3">
					<input type="search" id="form1" name="keyword" class="form-control input-lg" placeholder="찾으시는 미술품을 알려주세요." />
					<span class="input-group-btn">
						<button type="submit" class="btn btn-action">검색</button>
					</span>
				</div>
				</form>

			</div>
		</div>
	</header>
	<!-- /Header -->
	<!-- Intro -->
	<div class="container text-center">
		<br> <br>


<% 
	if (keyword == "" || keyword == null) {
%>
		<iframe width="1190" height="669" 
		src="https://www.youtube.com/embed/cLftKHybvV8
			?autoplay=1&mute=1&loop=1&autohide=1&modestbranding=1
			&rel=0&showinfo=0&controls=0&disablekb=1&enablejsapi=1
			&iv_load_policy=3&origin=https%3A%2F%2Fplaydata.io&widgetid=1" 
		title="YouTube video player" frameborder="0" 
		allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
		allowfullscreen></iframe>
<% 
	} else if (productList==null || productList.isEmpty()) {
%>		
		<br>
		<h3 class="thin">찾으시는 미술품이 없습니다.</h3>
		<br><br>
<%
	} else {
%>
		<div class="col-sm-12 maincontent">
			<%for (ProductBean productResult : productList) {%>

			<div class="col-sm-3 subcontent">
				<a href="detail.jsp?pNo=<%=productResult.getProductNo()%>
				&pStatus=<%=productResult.getProductStatus()%>">
					<img src="<%=productResult.getProductImgUrl()%>" class="thumb-nail">
					<div class="thumb-body">
						<div class="thumb-autor">
							<b><%=productResult.getProductAuthorName()%></b>
						</div>
						<p class="thumb-title">
							<b><%=productResult.getProductName()%></b>
						</p>
						<p class="thumb-price">
						<%="$"%><%=productResult.getProductPrice()%></p>
					</div>
				</a>
			</div>
			<%}%>
		</div>
<%
	}
%>
	</div>
	<!-- /Intro-->

	<!-- footer.jsp 푸터 영역입니다 -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- /footer.jsp -->

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>