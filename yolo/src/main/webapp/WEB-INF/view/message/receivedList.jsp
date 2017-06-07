<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Received Message List</title>
</head>
<body>

	<table>
		<tr>
			<th>Message ID</th>
			<th>보낸 이</th>
		</tr>
		<c:forEach items="${messageList}" var="message">
			<tr>
				<td><a href="" onclick='javascript:window.open("/yolo/message/detail/${message.messageId}", "window", "width=400,height=400")'>${message.messageId}</a></td>
				<td>${message.sender}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>