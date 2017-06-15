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
		
	 	
		$(".likeBtn").click(function(){
			var likeVal = $("#like").val();
			if( likeVal == "false" ){
				$.ajax({
				url : "<c:url value="/trip/likeCountPlus"/>",
				dataType : "json",
				type : "post",
				data : {
					"tripId" : $("#tripId").val()
				}, 
				success: function(response) {
					if( response.status == "success"){
						$(".likeBtn").val("♥");
						$("#likeCount").html(response.likeCount);
						$("#like").val("true")
						console.log(response.likeCount)
					}
			    },
			    error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"error:"+error);
			    }
			 
				});
			}
			else {
				$.ajax({
				url : "<c:url value="/trip/likeCountMinus"/>",
				dataType : "json",
				type : "post",
				data : {
					"tripId" : $("#tripId").val()
				}, 
				success: function(response) {
					if( response.status == "success"){
						$(".likeBtn").val("♡");
						$("#likeCount").html(response.likeCount);
						$("#like").val("false")
						console.log(response.likeCount)
					}
			    },
			    error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"error:"+error);
			    }
			 
				});
			}

		});

	});
</script>
</head>
<body>
	<input type="hidden" id="like" value="${like}"/>
	<input type="hidden" id="tripId" value="${tripVO.tripId}"/>
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
	
	
	좋아요 : <span id="likeCount"> ${tripVO.likeCount}</span>
	<c:if test="${!empty sessionScope._USER_.userId}">
		<c:if test="${!like}">
		<input type="button" class="likeBtn" value="♡"/>
		</c:if>
		
		<c:if test="${like}">
		<input type="button" class="likeBtn" value="♥"/>
		</c:if>
		
	</c:if>
	<br/>
	
	<c:if test="${sessionScope._USER_.userId eq tripVO.userId}">
		<a href="<c:url value="/trip/delete/${tripVO.tripId}"/>">삭제하기</a>
		<a href="<c:url value="/trip/update/${tripVO.tripId}"/>">수정하기</a>
	</c:if>
	
</body>
</html>