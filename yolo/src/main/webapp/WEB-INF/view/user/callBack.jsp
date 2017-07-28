<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 로그인</title>
<script type="text/javascript" src="<c:url value="/static/js/naverLogin_implicit-1.0.3-min.js"/>" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>

</head>
<body>

    
<script type="text/javascript">
	var naver_id_login = new naver_id_login("5jcUw1BzWAus2lCeKdeU", "http://localhost:8080/yolo/user/callback");
	// 접근 토큰 값 출력
	console.log(naver_id_login.oauthParams.access_token);
	
	$.post("<c:url value="/user/naver/savetoken"/>", {"accessToken": naver_id_login.oauthParams.access_token}, function(response) {});
	
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		console.log(naver_id_login.getProfileData('email'));
		console.log(naver_id_login.getProfileData('nickname'));
		console.log(naver_id_login.getProfileData('age'));
	
		opener.document.location.href="<c:url value="/home"/>";
		self.close();
	}
</script>
</body>
</html>