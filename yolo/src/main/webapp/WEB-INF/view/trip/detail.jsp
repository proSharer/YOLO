<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/static/css/styles.css"/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>

<script type="text/javascript">

	$().ready(function(){
	 
	});
</script>
</head>
<body>

	<c:forEach items="${tripPartList}" var="tripPart">
		<div>
		<img src="<c:url value="/static/img/${tripPart.realFileName}"/>" width="400px" height="300px"/><br/>
		시작시간 : ${tripPart.startTime}
		끝나는시간 : ${tripPart.endTime}
		시간 구분 : ${tripPart.timeControl}
		장소 : ${tripPart.place}
		주소 : ${tripPart.map}
		설명 : ${tripPart.content}
		</div><br>
	</c:forEach>
	
	<a href="<c:url value="/trip/delete/${tripId}"/>">삭제하기</a>
	
</body>
</html>