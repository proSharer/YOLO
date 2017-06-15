<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="Content-Type" content="text/html"/>
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
$().ready(function () {
	$("#signInForm").find("input[type=button]").click(function () {
		$.post("<c:url value="/user/signIn" />", $("#signInForm").serialize(), function(data) {
			if ( data == "OK" ) {
				window.location.href = "<c:url value="/home"/>";
			}
			else if (data == "FAIL") {
				alert("로그인 실패");
				location.reload();
			}
		});
	});
});
	
</script>
</head>

<body>
	<form id="signInForm">
		<input type="text" name="userId" placeholder="아이디를 입력하세요" /><br />
		<input type="text" name="password" placeholder="비빌번호를 입력하세요" /><br /> 
		<input type="button" value="Submit" />
	</form>
	
	<a href="<c:url value="/user/loginByKakao"/>">카카오 로그인</a>

	<a href="<c:url value="/user/signUp"/>">회원가입</a>
</body>
</html>