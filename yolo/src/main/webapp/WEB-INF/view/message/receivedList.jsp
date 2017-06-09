<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Received Message List</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		/* var messageList = new Array();
		
		<c:forEach items="${messageList}" var="message">
			var data = new Object();
			
			data.messageId = "${message.messageId}";
			data.sender = "${message.sender}";
			data.sendTime = "${message.sendTime}";
			messageList.push(data);
		</c:forEach>
		
		var jsonData = JSON.stringify(messageList); */
		
		/* $.ajax({
			url : "/yolo/message/list/received",
			type : 'POST',
			dataType : 'json',
			data : jsonData,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(data) {
				alert("success");
			},
			error : function(data, status, er) {
				alert("error: " + data + " status: " + status + " er:" + er);
			}
		}); */
		
		/* $.post("/yolo/message/list/received",
				jsonData,
				function(data) {
			alert("success");
		}); */
		
		/* $.ajax({ url: "/yolo/message/list/received",
			method: "post", 
			type: "json", 
			contentType: "application/json", 
			data: jsonData, 
			success: function(data){
				console.log(data); 
			}
		}); */
		
	});
</script>
</head>
<body>
	<table>
		<tr>
			<th>Message ID</th>
			<th>보낸 이</th>
			<th>받은 날짜</th>
		</tr>
		<c:forEach items="${messageList}" var="message">
			<tr>
				<td><a href="" onclick='javascript:window.open("/yolo/message/detail/${message.messageId}", "window", "width=400,height=400")'>${message.messageId}</a></td>
				<td>${message.sender}</td>
				<td>${message.sendTime}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>