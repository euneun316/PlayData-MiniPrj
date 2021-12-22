<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%-- 로그인 session에서 정보 불러오기 위함 --%>
<%
	int uNo = 0;
	if (session.getAttribute("uNo") != null) {
			uNo = (Integer) session.getAttribute("uNo");
		}
%>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>mynft product registration</title>

<!-- css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
<link rel="stylesheet" href="assets/css/main.css">
</head>



<%	if(uNo == 0){ //로그아웃 상태 %> 
	<script>
		alert('로그인 후 이용해 주세요.');
		location.href = 'login.jsp';
	</script>
<%}%>

<body>
	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="marketplace.jsp">Marketplace</a></li>
			<li class="active">Product Registration</li>
		</ol>

		<div class="row">

			<!-- 마켓플레이스 -->
			<div class="col-sm-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">상품 등록</h1>
				</header>
				
				

				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 bottom-margin">
					<div class="panel panel-default">
					<div class="panel-body">
					<h2 class="thin text-center"><b>상품 세부정보</b></h2>
					<hr>
					<!-- form -->
					<form method="post" action="addProductController">
						<div class="top-margin">
							<label>작품명</label>
							<input type="text" class="form-control" name="productName" value = "Jjigae Pool Club">
						</div>
						<div class="top-margin">
							<label>작품 가격</label>
							<input type="text" class="form-control" name="productPrice"value = 1000000000>
						</div>
						<div class="top-margin">
							<label>작가</label>
							<input type="text" class="form-control" name="productAuthor"value ="Jjigae Pool Club" >
						</div>
						<div class="top-margin">
						<label>작품 사이즈</label>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<input type="text" class="form-control" name="productWidthSize" placeholder="가로" value = 500>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="productHeightSize" placeholder="세로" value = 400>
							</div>
						</div>
						<div class="top-margin">
							<label>작품 URL</label>
							<input type="text" class="form-control" name="productImgUrl" value = "https://media.niftygateway.com/image/upload/q_auto:good,w_500/v1639413053/Abigail/DistroKid/Sellouts/DropAssets/06041_bvmxz7.png">
						</div>
						<div class="top-margin">
							<label>NFT 코드</label>
							<input type="text" class="form-control"  name="productNft" value = "0x0ba8d86da99c7d0256e508a1373e3f">
						</div>
						<div class="top-margin">
							<label>제작시기</label>
							<input type="date" class="form-control" name="productReleasedDate" min="yyy" max="zzz">
						</div>
						<div class="top-margin">
							<label>작품 소개</label>
							<textarea class="form-control" name="productInfo" placeholder="200자 내외로 작성해주세요"></textarea>
						</div>
						<div class="top-margin">
							<label>카테고리</label>
							<select name="productCategoryNo" class="form-control">
								<option value="1" selected>image</option>
								<option value="2">gif</option>
								<option value="3">video</option>
							</select>
						</div>
						<div class="row text-center">
							<button class="btn btn-action btn-sm" type="submit">
								<b>등록하기</b>
							</button>
							<button class="btn btn-secondary btn-sm" type="reset">
								<b>초기화</b>
							</button>
						</div>
						<br>
					</form>
					<!-- /form -->
					</div>
					</div>
				<br><br><br><br>
				</div>
			</div>
		</div>
	</div>
	<!-- javascript library -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>