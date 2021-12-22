<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.List"%>
<%@ page import="com.nft.user.UserBean"%>
<%@ page import="com.nft.user.UserDAO"%>
<%@page import="java.net.URLEncoder"%>

<%request.setCharacterEncoding("UTF-8");%>

<%
	UserDAO uDAO = UserDAO.getInstance();
	List<UserBean> userList = uDAO.getUserList();
%>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

<title>mynft admin</title>

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
	<!-- 여기서부터 채워주세요 -->

	<header id="head">
		<div class="container">
			<div class="row">
				<h1 class="lead">
					MyNFT<br>
					<b>관리자용 페이지</b>
				</h1>
			</div>
		</div>
	</header>
	<!-- /Header -->

	<!-- Intro -->
	<div class="container text-center">
		<br> <br>
		<h3 class="thin">
			<b>회원 관리 테이블</b>
		</h3>
		<hr>
		<div class="container text-left">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">이름</th>
						<th scope="col">ID</th>
						<th scope="col">PW</th>
						<th scope="col">이메일</th>
						<th scope="col">연락처</th>
						<th scope="col">가입일</th>
						<th scope="col">성별</th>
						<th scope="col">권한</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>

				<tbody>
					<%for (UserBean userResult : userList) {%>
					<tr>
						<td><%=userResult.getuNo()%></td>
						<td><%=userResult.getuName()%></td>
						<td><%=userResult.getuId()%></td>
						<td><%=userResult.getuPw()%></td>
						<td><%=userResult.getuEmail()%></td>
						<td><%=userResult.getuPhone()%></td>
						<td><%=userResult.getuSubDate()%></td>
						<td><%=userResult.getuGender()%></td>
						<td><%=(userResult.getuGrade() == 0) ? "admin" : "user"%></td>
						<td>
						<% 
							String url = "./userdelete?deleteuNo=" + userResult.getuNo();
/* 							request.setAttribute("uNo", userResult.getuNo()); */
						%>
<!-- 						<form method="get" action="./userdelete">
							<input type="button" value="삭제" onclick="return buttonClick()"> -->
							<input type="button" value="삭제" onclick="location.href='<%=url%>'"/>
<!-- 						</form> -->
						</td>
						
					</tr>
					<%}%>
				</tbody>
			</table>
		</div>
	</div>
	<!-- /Intro-->

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