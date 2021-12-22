<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.List"%>
<%@ page import="com.nft.product.ProductBean"%>
<%@ page import="com.nft.product.ProductDAO"%>
<%@ page import="com.nft.user.UserDAO"%>
<%request.setCharacterEncoding("UTF-8");%>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

<title>mynft user</title>

<!-- image/font load -->
<link rel="shortcut icon" href="assets/images/gt_favicon.png">
<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">

<!-- css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
<link rel="stylesheet" href="assets/css/main.css">
</head>
<%
	UserDAO uDAO = UserDAO.getInstance();
	int uNo = 0; // 0이랑  null이랑 찍히는 게 이상함
	String uName = null;
	
	if(session.getAttribute("uNo") != null && (Integer) session.getAttribute("uNo") != 0 ) {
		uNo = (Integer) session.getAttribute("uNo");%>
	<%} else if(uNo == 0){ //null
%>
	
	<script>
		alert("먼저 로그인해주시기 바랍니다.")
		location.href = './login.jsp';
	</script>
<%
	}
	if (session.getAttribute("uName") != null) {
		uName = (String) session.getAttribute("uName");
	}
	
	ProductDAO pDAO = ProductDAO.getInstance();
	List<ProductBean> UserBoughtProductList = pDAO.getUserBoughtProductList(uNo);
	List<ProductBean> UserSoldProductList = pDAO.getUserSoldProductList(uNo);
	
	// uNo가 판매한 재품의 구매자 이름 가져오기 (por)
	List<String> purchaserName = uDAO.getUserProductPurchaserNames(uNo);
%>

<body class="home">
	<!-- header.jsp 헤더 영역입니다 -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- /header.jsp -->
	<header id="head" class="secondary"></header>	
	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">User</li>
		</ol>

		<div class="row">

			<!-- Article main content -->
			<div class="col-sm-12 maincontent">

				<h1><%=uName %>님의 거래 활동 이력입니다.</h1>
				<br>
				<br>
				<h3>
					<b>구매 이력</b>
				</h3>
				<table class="table">
					<thead class="thead-dark">
						<tr class="d-flex">
							<th scope="col" class="col-xs-1">구분</th>
							<th scope="col" class="col-xs-1">상품번호</th>
							<th scope="col" class="col-xs-3">제품</th>
							<th scope="col" class="col-xs-2">작가</th>
							<th scope="col" class="col-xs-3">가격</th>
							<th scope="col" class="col-xs-2">판매 정보</th>
						</tr>
					</thead>
					<tbody>
						<!-- User의 구매 이력 for문 -->
					<%for (int i=0; i<UserBoughtProductList.size(); i++){%>
					<tr>
						<th scope="row" class="col-xs-1"><%= i+1 %></th>
						<td class="col-xs-1"><%= UserBoughtProductList.get(i).getProductNo() %></td>
						<td class="col-xs-1"><%= UserBoughtProductList.get(i).getProductName() %></td>
						<td class="col-xs-2"><%= UserBoughtProductList.get(i).getProductAuthorName() %></td>
						<td class="col-xs-3"><%= UserBoughtProductList.get(i).getProductPrice() %></td>
						<td class="col-xs-2"> 구매완료 </td>
					</tr>
					<% } %>
					</tbody>
				</table>
				<br>
				<br>
				<h3>
					<b>판매 이력</b>
				</h3>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col" class="col-xs-1">구분</th>
							<th scope="col" class="col-xs-1">상품번호</th>
							<th scope="col" class="col-xs-3">제품</th>
							<th scope="col" class="col-xs-2">구매자</th>
							<th scope="col" class="col-xs-3">가격</th>
							<th scope="col" class="col-xs-2">판매 정보</th>
						</tr>
					</thead>
					<tbody>
						<%for (int i=0; i<UserSoldProductList.size(); i++){%>
						<tr>
							<th scope="row" class="col-xs-1"><%= i+1 %></th>
							<td class="col-xs-1"><%= UserSoldProductList.get(i).getProductNo() %></td>
							<td class="col-xs-3"><%= UserSoldProductList.get(i).getProductName() %></td>
							<td class="col-xs-2"><%= purchaserName.get(i) %></td>
							<td class="col-xs-3"><%= UserSoldProductList.get(i).getProductPrice() %></td>
							<td class="col-xs-2"> 판매완료 </td>
						</tr>
						<% } %>
					</tbody>
				</table>
				<br>
				<br>
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