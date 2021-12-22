<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

<title>mynft header</title>

<!-- image/font load -->
<link rel="shortcut icon" href="assets/images/gt_favicon.png">
<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">

<!-- css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
<link rel="stylesheet" href="assets/css/main.css">
</head>

<body class="home">
<%
	int uNo = 0;
	int uGrade = 1;
	
	if(session.getAttribute("uNo") != null && (Integer) session.getAttribute("uNo") != 0) {
		uNo = (Integer) session.getAttribute("uNo");
	}
	if (session.getAttribute("uGrade") != null) {
		uGrade = (Integer) session.getAttribute("uGrade");
		System.out.println("2");
		System.out.println(uGrade);
	}
%>
	<!-- navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">
					<img src="assets/images/logo.png" alt="Progressus HTML5 template">
				</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="marketplace.jsp">Marketplace</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="user.jsp">User</a></li>
					<%
						if (uGrade == 0) {
					%>
					<li><a href="admin.jsp">Manage</a></li>
					<%
						}
					%>
					<%
						if (uNo == 0) {
					%>
					<li><a class="btn" href="login.jsp">Log In</a></li>
					<%
						} else {
					%>
					<li><a class="btn" href="./logout">Log Out</a></li>
					<%
						}
					// 로그인시 가입버튼 제거
					if (uNo == 0) {
					%>
					<li><a class="btn" href="signup.jsp">Sign Up</a></li>
					<%}%>


				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->

	<!-- javascript library -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>