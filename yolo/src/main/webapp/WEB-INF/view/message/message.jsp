<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/sockjs.min.js"/>"></script>
<script type="text/javascript">
    
    var sock = null;
    
    $(document).ready(function() {
        sock = new SockJS("/yolo/echo-ws")
    });
</script>
</head>
<body>
안녕하세요~
</body>
</html>