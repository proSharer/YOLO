<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 리스트 페이지</h1>
<table>
	<tr>
		<th>아이디</th>
		<th>제목</th>
		<th>생성일자</th>
		<th>유저아이디</th>
		<th>좋아요</th>
	</tr>

<c:forEach items = "${dailyMainListVO}"  var = "dailyMains">
	<tr>
	
	<td>
		<img src = "<c:url value ="/download/${dailyMains.dailyId}"/>" width="150px" height="150px" /><br/>
	</td>
		<td>
			<a href="<c:url value ="/daily/detail/${dailyMains.dailyId}"/>"   >${dailyMains.dailyId}</a>
		</td>
		<td>${dailyMains.title}</td>
		<td>${dailyMains.createDate}</td>

		
		<td>${dailyMains.userId}</td>
		<td>${dailyMains.likeCount}</td>
	</tr>
</c:forEach>

</table>


</body>
</html>