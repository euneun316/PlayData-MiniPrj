<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.nft.user.UserDAO" %>
<%@ page import="com.nft.user.UserBean" %>

<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="user" class="com.nft.user.UserBean"></jsp:useBean>
	<jsp:setProperty property="*"  name="user"/>
	
<%
	if ((user.getuName() == null) || (user.getuId() == null) || (user.getuPw() == null) || 
	(user.getuEmail() == null) || (user.getuPhone() == null) || (user.getuGender() == null)){
%>		
		<script>
		alert('입력이 안 된 사항이 있습니다.');
		location.href="signup.jsp"
		</script>
<% 
	} else {
		
		if (user.getuName().length() > 10) {
%>
		<script>
		alert('이름을 정확하게 입력해주시기 바랍니다. 문제가 계속 발생할시 관리자(admin@email.com)에게 문의바랍니다.');
		location.href="signup.jsp"
		</script>
<%			
		}
%>
<%
			if (user.getuPhone().length() != 11){
%>
				<script>
				alert('핸드폰 번호를 정확하게 입력해주시기 바랍니다. \n 예시.01012345678');
				location.href="signup.jsp"
				</script>
<%				
			}
%>
<%
			if (user.getuPw().length() < 4 || user.getuPw().length() > 20){
%>
				<script>
				alert('비밀번호는 최소 4글자 최대 20자로 설정해주시기 바랍니다.');
				location.href="signup.jsp"
				</script>
<%				
			}
%>
<%		
			UserDAO uDAO = UserDAO.getInstance();
			int uIdDuplicate = uDAO.userIdDuplicateCheck(user.getuId());
			if (uIdDuplicate == 1){
%>
				<script>
				alert('이미 존재하는 아이디입니다. 다른 아이디를 기입해주시기 바랍니다.');
				location.href="signup.jsp"
				</script>
<%
			}
			
			int uEmailDuplicate = uDAO.userEmailDuplicateCheck(user.getuId());
			if (uEmailDuplicate == 1){
%>
				<script>
				alert('이미 존재하는 이메일입니다. 다른 이메일을 기입해주시기 바랍니다.');
				location.href="signup.jsp"
				</script>
<%
			}
			
			
			LocalDateTime now = LocalDateTime.now();
			String formNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
			int result = uDAO.userRegister(new UserBean(
					user.getuName(), user.getuId(), user.getuPw(), user.getuEmail(), 
					user.getuPhone(), formNow, user.getuGender(), user.getuGrade()));
			if (result == -1){
%>
				<script>
				alert('예기치 못한 오류가 발생했습니다. 관리자(admin@email.com)에게 문의바랍니다.');
				location.href="signup.jsp"
				</script>
<% 
			} 
			else {
%>
				<script>
				alert('회원가입이 완료되었습니다. 로그인해주시기 바랍니다.');
				location.href="index.jsp"
				</script>
<%
			}
	}
%>