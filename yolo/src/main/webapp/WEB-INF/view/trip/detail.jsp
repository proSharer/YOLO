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
		
		$(".parentReplyBtn").click(function(){
			var parentReply = "<ul>└ <input type='text' class='data' placeholder='댓글을 입력해주세요'/> <input type='button' class='parentReply' value='submit'/></ul>";
			$(this).after(parentReply);
	 	});
		
	 	$(".replyBox").on("click",'.parentReply',function(){
	 		var replyBox = $(this).closest('.replyBox');
	 		var data = replyBox.find('.data').val(); // 댓글내용  
	 		var replyId = replyBox.data('id'); // 댓글 아이디 ( 부모 아이디 )
	 		$.post("<c:url value="/trip/reply/write"/>",{
	 				"content" : data,
	 				"parentReplyId" : replyId,
	 				"tripId" : $("#tripId").val()
	 		},function(response){
	 			var res = JSON.parse(response);
				if( res.status == "success") {
					//alert("댓글 등록 완료!");
					location.reload();
				}
				else if ( res.status == "fail"){
					alert("댓글 등록 실패!");
				}
	 		});
	 		
	 	});
	 	
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
		
		$("#replyBtn").click(function(){
			$.post("<c:url value="/trip/reply/write"/>",
					{
						"content" : $("#content").val(),
						"tripId" : $("#tripId").val(),
						"parentReplyId" : ""
					},function(response){
						var res = JSON.parse(response);
						if( res.status == "success") {
							//alert("댓글 등록 완료!");
							location.reload();
						}
						else if ( res.status == "fail"){
							alert("댓글 등록 실패!");
						}
					});
		});
		
	});
</script>
</head>
<body>
	<input type="hidden" id="like" value="${like}"/>
	<input type="hidden" id="tripId" value="${tripVO.tripId}"/>
	<c:forEach items="${tripVO.tripPartVO}" var="tripPart">
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
		</c:if><br/>
		
	</c:if>
	<br/>
	
	<c:if test="${sessionScope._USER_.userId eq tripVO.userId}">
		<a href="<c:url value="/trip/delete/${tripVO.tripId}"/>">삭제하기</a>
		<a href="<c:url value="/trip/update/${tripVO.tripId}"/>">수정하기</a>
	</c:if>

	
	<!-- 이부분에 댓글이 보여야함. -->
	<hr/>

	Comment <br/>
		<c:set var="depth" value="0"/>
	<ul>
	<c:forEach items="${tripReply}" var="reply">
		<c:if test="${reply.level < prevLevel}">
			<c:forEach var="i" begin="0" end="${(prevLevel - reply.level)-1}" step="1">
				<c:set var="depth" value="${depth - 1}"/>
				</ul>
			</c:forEach>
		</c:if>
	
		<c:if test="${reply.level > prevLevel}">
		<c:set var="depth" value="${depth + 1}"/>
			<ul>
		</c:if>
			<li class="replyBox" data-id="${reply.tripReplyId}"> ${reply.userVO.userName}(${reply.userId}) : ${reply.content}
			<c:if test="${!empty sessionScope._USER_.userId}">
			<input type="button" class="parentReplyBtn" value="댓글">
			
			</c:if> </li>
		<c:set var="prevLevel" value="${reply.level}"/>
	</c:forEach>
	</ul>
	<c:if test="${depth > 0}">
		<c:forEach var="i" begin="0" end="${depth}" step="1">
		</ul>
		</c:forEach>  
	</c:if> 
<%-- 	<c:forEach items="${tripReply}" var="reply">
		${reply.userVO.userName}(${reply.userId}) : ${reply.content}
	</c:forEach>
	 --%>
	<c:if test="${!empty sessionScope._USER_.userId}">

	<form id="replyForm">	
		<input type="text" id="content"> 
		<input type="button" id="replyBtn" value="submit"/>
	</form>
	</c:if>
	
</body>
</html>