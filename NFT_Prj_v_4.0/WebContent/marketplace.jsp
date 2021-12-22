<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.List"%>
<%@ page import="com.nft.Util.Util"%>
<%@ page import="com.nft.product.ProductBean"%>
<%@ page import="com.nft.product.ProductDAO"%>
<%request.setCharacterEncoding("UTF-8");%>

<%-- 로그인 session에서 정보 불러오기 위함 --%>
<%
	int uNo = 0;
	if (session.getAttribute("uNo") != null) {
			uNo = (Integer) session.getAttribute("uNo");
		}
%>

<%
	ProductDAO pDAO = ProductDAO.getInstance();
	List<ProductBean> productList = pDAO.getProductList();
%>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

<title>mynft marketplace</title>

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
			<li class="active">Marketplace</li>
		</ol>

		<div class="row">

			<!-- 마켓플레이스 -->
			<div class="col-sm-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Marketplace</h1>
				</header>
				
				<!--상품 리스트 불러오기-->
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
							<%="$"%><%=Util.DecimalFormat(productResult.getProductPrice())%></p>
						</div>
					</a>
				</div>
				<%}%>
				<!--/Card-->
				<!--상품 등록-->
				
				<form action="./addProduct.jsp">
			
					<div class="col-sm-3 subcontent">
						<button type="submit" class="btn">상품 등록하기</button>
					</div>
					<!--/상품 등록-->
				</form>
			</div>
			<!-- /마켓플레이스 -->


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