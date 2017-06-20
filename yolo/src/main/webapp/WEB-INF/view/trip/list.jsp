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
		$("#regionSearch").hide();
		
		$("#searchType").change(function(){
			$("#keyword").val("");
			if ($("#searchType").val() == '5'){
 				$("#regionSearch").show();
 				$("#keyword").hide();
 				$("#keyword").val($("#searchType").val());
			} 
			else if ($("#searchType").val() != '5'){
 				$("#regionSearch").hide();
 				$("#keyword").show();
 				
			}
		});

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
			<td><img src="<c:url value="/static/img/${trip.tripPartVO[0].realFileName}"/>" width="50px" height="50px"/></td>
			<td>${trip.tripId}</td>
			<td><a href="<c:url value="/trip/detail/${trip.tripId}"/>">${trip.title}</a></td>
			<td>${trip.userId}</td>
			<td>${trip.createDate}</td>
		</tr>
		</c:forEach>
	</table>
	
	<form id="searchForm">
		${pager}<br/>
 		<select id="searchType" name="searchType">
			<option value="1">제목+총평</option>
			<option value="2">제목</option>
			<option value="3">총평</option>
			<option value="4">세부내용</option>
			<option value="5">지역</option>
		</select>
		
		
		<select id="regionSearch" name="regionSearch">
			<c:forEach items="${regionList}" var="region">
				<option value="${region.regionId}">${region.regionName}</option>
			</c:forEach>
		</select>
		
		<input type="text" id="keyword" name="keyword" value="${sessionScope._SEARCH_.keyword}"/>
		<input type="button" value="search" onclick="movePage(0)" />
		<input type="button" value="검색 초기화" onclick="location.href='<c:url value="/trip/list/init"/>'"/>
	</form>
		<c:if test="${!empty sessionScope._USER_}">
			<a href="<c:url value="/trip/write"/>">글쓰기</a>
		</c:if>
</body>
</html>