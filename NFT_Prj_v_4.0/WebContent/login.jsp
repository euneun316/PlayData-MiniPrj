<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	
	<title>mynft login</title>
	
	<!-- image/font load -->
	<link rel="shortcut icon" href="assets/images/gt_favicon.png">
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	
	<!-- css -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
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
			<li><a href="user.jsp">User</a></li>
			<li class="active">Log In</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Log In</h1>
				</header>
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2 class="thin text-center"><b>로그인</b></h2>
							<hr>
							
							<form method="post" action="./login">
								<div class="top-margin">
									<label> 아이디 <span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="uId">
								</div>
								<div class="top-margin">
									<label> 비밀번호 <span class="text-danger">*</span></label>
									<input type="password" class="form-control" name="uPw">
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-8">
										<b><a href="signup.jsp">회원가입</a></b>
									</div>
									<div class="col-lg-4 text-center">
										<button class="btn btn-action" type="submit"><b>로그인</b></button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->


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