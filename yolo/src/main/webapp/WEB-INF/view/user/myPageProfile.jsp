<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
$("#userModifyForm").find("input[type=button]").click(function () {
	$.post("<c:url value="/user/mypage"/>", $("#userModifyForm").serialize(), function(data){
		if(data == "OK") {
			alert("수정이 완료 되었습니다.");
			window.location.href="<c:url value="/home"/>";
		}
		else if(data=="FAIL") {
			alert("수정이 실패 하였습니다.");
		}
	});
});

</script>
<title></title>
</head>
<body>
	<form id="userModifyForm" class="modify" >
		ID : ${user.userId}<br/>
		PW : <input type="text" name="password" value="${user.password}"><br/>
		NAME : <input type="text" name="userName" value="${user.userName}"><br/>
		Grade : ${user.authId}<br/>
		Join Date : ${user.joinDate}<br/>
		<input type="button" id="modifyBtn" value="submit">
	</form>

	

</body>
</html>