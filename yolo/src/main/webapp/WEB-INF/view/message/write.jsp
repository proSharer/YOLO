<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript"></script>
</head>
<body>
	
	<p>Message</p>
	
	<form:form id="messageForm" commandName="MessageVO" name="dataform">
		<input type="text" name="title" placeholder="Title" />
		<textarea name="content"></textarea>
		<input type="submit" value="Send" />
	</form:form>
	
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function () {
		
		$("#messageForm").find("#submitBtn").click(function () {
			$("#messageForm").attr({
				action: "<c:url value = "/message/write"/>",
				method: "post" 
			});
			
			$("#messageForm").submit();
		});
		
	});
</script>
</head>
<body>
	
	<p>Message</p>
	
	<form:form id="messageForm" commandName="MessageVO" name="dataform">
		<input type="hidden" name="sender" value="test">
		<input type="hidden" name="receiver" value="${param.userId}">
		<textarea name="content"></textarea>
		<input type="button" id="submitBtn" value="Send" />
	</form:form>
	
</body>
>>>>>>> ec84d1370c9272f2042c8bd887192802fa20e1e4
</html>