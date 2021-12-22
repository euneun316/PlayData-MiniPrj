<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	
	<title>mynft about</title>
	
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
			<li><a href="index.jsp">Home</a></li>
			<li class="active">About</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-sm-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">About us</h1>
				</header>
				<div class="introduce">
					<img src="assets/images/about.jpg"></img>
					<h1><b>보다 많은 일상에 예술의 경험과 기쁨을 전달하겠습니다.</b></h1>
					
					<p><br>
					MyNFT는 2021년 설립된 국내 NFT 미술품 구매 회사로,<br> 지속적으로 NFT 시장 점유율과 거래 기록에서 한국 미술 디지털 거래 시장을 리딩하는 기업입니다.<br> 한국 고미술과 근현대 미술은 물론 콜렉터블 아트, 와인, 보석, 건축에 이르기까지 다양한 취향을 반영한 미술품을 선보이고 있습니다.<br> 엄선된 아트와 영감을 가져다줄 컬렉터블스 그리고 편리하고 안전한 거래를 약속하는 플랫폼으로<br> 많은 사람들과 일상 속 예술의 경험과 기쁨을 나누고자 합니다.</p>
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