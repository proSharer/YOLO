<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Send Message</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function () {
		
		/* $("#messageForm").find("#submitBtn").click(function () {
			$("#messageForm").attr({
				action: "<c:url value = "/message/write/${userId}"/>",
				method: "post" 
			});
			
			$("#messageForm").submit();
		}); */
		
		$("#messageForm").find("#submitBtn").click(function() {
			$.post( "<c:url value = "/message/write/${userId}"/>",$("#messageForm").serialize(),function(response){
				console.log(response);
			});
		});

	});
</script>
</head>
<body>
	
	<p>Message to ${userId}</p>
	
	<form:form id="messageForm" commandName="MessageVO" name="dataform">
		<input id="loginUserId" type="hidden" name="sender" value="${loginUser.userId}"><!-- Session UserId value값으로 바꿔주기! -->
		<input id="receiver" type="hidden" name="receiver" value="${userId}">
		<textarea id="content" name="content"></textarea><br/>
		<input type="button" id="submitBtn" value="Send" />
	</form:form>
	
</body>
</html>