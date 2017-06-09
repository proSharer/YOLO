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
		
		/* $.getJSON ("/yolo/message/list/received", function(result){
			console.log(result);
		}); */

		//document.getElementById('button').addEventListener('click',function(){
			if (! ('Notification' in window) ){
				alert('Sorry, your browser is not good enough to display notification');
				return;
			}
			else {
				
				var title;
				var options;
		
				event.preventDefault();
		
				title = "test title";
				options = {
					body : "test body",
					tag : 'custom',
					icon:'http://www.moneygram.com/us/en/assets/images/NXT%20US/Icon%20Images/1_mail_icon.png',
					dir: 'auto'
				};
				
		
				Notification.requestPermission(function(permission) {
					var notification = new Notification(title, options);
					setTimeout(notification.close.bind(notification), 5000);
				});
			} 
			/* var showAlert = setTimeout(function() {
			      alert('Wow!!!');
			   }, 5000); */
		//});
	});
</script>
</head>
<body>

	<a href="/yolo/message/list/received">[받은 메세지]</a>
	<a href="/yolo/message/list/sent">[보낸 메세지]</a>
	<a href="" onclick='javascript:window.open("/yolo/message/write/test", "window", "width=400,height=400")'>[새 메세지]</a>
	<br/><br/>
	
</body>
</html>