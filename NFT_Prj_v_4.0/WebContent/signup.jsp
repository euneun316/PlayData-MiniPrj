<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

<title>mynft signup</title>

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
			<li><a href="user.jsp">User</a></li>
			<li class="active">Sign Up</li>
		</ol>

		<div class="row">
			  <!-- 이용약관 -->
			  <div class="modal fade" id="policies" role="dialog">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">×</button>
			          <h4 class="modal-title">이용약관</h4>
			        </div>
			        <div class="modal-body">
			          <strong>제1조(목적)</strong>
						<br>
						본 회원약관은 MyNFT-마이엔에프(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.
						<br>
						<br>
						<strong>제2조 (약관의 효력)</strong>
						<br>
						<form method="post" action=“./User/signupAction.jsp”>
						1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.
						<br>
						2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
						<br>
						3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.
						<br>
						<br>
						<strong>제3조 (약관 이외의 준칙)</strong>
						<br>
						이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.
						<br>
						<br>
						<strong>제4조 (이용계약의 체결)</strong>
						회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.
						<br>
						<br>
						<strong>제5조 (용어의 정의)</strong>
						<br>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						<br>
						1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자
						<br>
						2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합
						<br>
						3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합
						<br>
						<br>
						<strong>제6조 (이용신청)</strong>
						<br>
						1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.
						<br>
						2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.
						<br>
						<br>
						<strong>제7조 (회원가입의 승낙)</strong>
						<br>
						'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.
						<br>
						<br>
						<strong>제8조(회원가입 신청거절 및 강제 탈퇴)</strong>
						<br>
						1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.
						<br>
						2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의 자격을 강제 탈퇴시킬 수 있다.
						<br>
						<br>
						<strong>제9조 (서비스 제공의 중지)</strong>
						<br>
						'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다
						<br>
						1.설비의 보수 등을 위하여 부득이한 경우 
						<br>
						2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우 
						<br>
						3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.
						<br>
						<br>
						<strong>제10조 ('갑'의 의무)</strong>
						<br>
						1. '갑'은  계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.
						<br>
						2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.   
						<br>
						<br>
						<strong>제11조 (개인정보보호)</strong>
						<br>
						1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다. 
						<br>
						2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나  제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로 합니다. 
						<br>
						 ①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우  
						<br>
						 ②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
						<br>
						 ③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
						<br>
						 ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
						<br>
						<br>
						3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.
						<br>
						<br>
						<strong>제12조 (회원의 의무)</strong>
						<br>
						1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다.
						<br>
						2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.
						<br>
						3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
						<br>
						4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.
						<br>
						5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다. 
						<br>
						  ①다른 회원의 아이디(ID)를 부정 사용하는 행위 
						<br>
						  ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 
						<br>
						  ③선량한 풍속, 기타 사회질서를 해하는 행위
						<br>
						  ④타인의 명예를 훼손하거나 모욕하는 행위  
						<br>
						  ⑤타인의 지적재산권 등의 권리를 침해하는 행위 
						<br>
						  ⑥해킹행위 또는 컴퓨터바이러스의 유포행위  
						<br>
						  ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위  
						<br>
						  ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
						<br>
						  ⑨기타 관계법령에 위배되는 행위  
						<br>
						  ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위
						<br>
						</form>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
			      </div>  
			  	</div>
			  </div>
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Sign Up</h1>
				</header>

				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2 class="thin text-center">
								<b>회원가입</b>
							</h2>
							<hr>

							<form method="post" action="signupAction.jsp">
								<div class="top-margin">
									<label>아이디<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="uId">
								</div>
								<div class="top-margin">
									<label>비밀번호<span class="text-danger">*</span></label>
									<input type="password" class="form-control" name="uPw">
								</div>
								<div class="top-margin">
									<label>이름<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="uName">
								</div>
								<div class="top-margin">
									<label>이메일<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="uEmail">
								</div>
								<div class="top-margin">
									<label>휴대폰 번호<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="uPhone">
								</div>
								<div class="top-margin">
									<label>성별<span class="text-danger">*</span></label>
									<select name="uGender" class="form-control">
										<option value="M" selected>남성</option>
										<option value="F">여성</option>
									</select>
								</div>

								<hr>

								<div class="row">
									<div class="col-lg-8">
										<label class="checkbox">
											<input type="checkbox"> <a href=#policies data-toggle="modal">이용약관</a>에 동의합니다.
										</label>
									</div>
									<div class="col-lg-4 text-right">
										<button class="btn btn-action" type="submit">
											<b>가입하기</b>
										</button>
									</div>
								</div>
							</form>
							<!-- Modal -->
						</div>
					</div>

				</div>

			</article>
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