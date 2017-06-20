<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded',function(){
		$("#messageForm").find("#submitMsgBtn").click(function() {
			$.post( "<c:url value = "/message/write/${userId}"/>",$("#messageForm").serialize(),function(response){
				console.log(response);
			});
		});
	});
	
</script>
</head>
<body>

	<a href="/yolo/message/list/received">[받은 메세지]</a>
	<a href="/yolo/message/list/sent">[보낸 메세지]</a>
	<a href="" onclick='javascript:window.open("/yolo/message/write/test", "window", "width=400,height=400")'>[새 메세지]</a>
	<br/><br/>
	<div><c:import url="http://192.168.201.29:3000"/></div>
	<%@include file="/WEB-INF/view/message/write.jsp"%>

</body>
</html>