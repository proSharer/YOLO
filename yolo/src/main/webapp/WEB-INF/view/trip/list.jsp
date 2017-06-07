<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function(){
		
	});

</script>
</head>
<body>
	<table>
		<tr>
			<th>사진</th>
			<th>No</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${tripList.tripList}" var="trip">
		<tr>
			<td><img src="<c:url value="/static/img/${trip.tripPartList[0].realFileName}"/>" width="50px" height="50px"/></td>
			<td>${trip.tripId}</td>
			<td><a href="<c:url value="/trip/detail/${trip.tripId}"/>">${trip.title}</a></td>
			<td>${trip.userId}</td>
			<td>${trip.createDate}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>