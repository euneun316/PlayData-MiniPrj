<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("<%=request.getAttribute("msg") %>");
		location.href = "<%=request.getAttribute("loc") %>";
	</script>
</body>
</html>