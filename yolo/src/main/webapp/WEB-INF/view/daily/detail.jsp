<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>










</head>
<body>
<h1> 디테일 페이지</h1>

<table>
	
<c:forEach items = "${dailyVOs}"  var = "dailyParts">
	

	<tr>
		<td><h2>${dailyParts.dailyPartId}</h2></td>
	</tr>
	<tr>
		<td>시간 : ${dailyParts.timeController} ${dailyParts.startTime}시~${dailyParts.endTime}시</td>
	</tr>   
	<tr>
	    <td>장소 : ${dailyParts.place}</td> 
	</tr>
	<br/>
	
	<tr>
		<td>
			<img src = "<c:url value ="/daily/download/${dailyParts.dailyPartId}"/>" width="600px" height="600px" /><br/>
		</td>
	<tr/>
	<tr>
		<td>${dailyParts.content}</td>
	<tr/>
	
</c:forEach>








</table>



	<p>
		<a href="<c:url value ="/daily/delete/${dailyVO.dailyId}"/>" >삭제하기</a>
	</p>




</body>
</html>