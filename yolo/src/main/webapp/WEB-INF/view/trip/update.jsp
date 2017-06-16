<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function(){
		$(".file").hide();
		$(".preview").hide();
		
		$(".update").click(function(){
			var img = $(this).prev().prev();
			$(img).hide();
			$(img).prev().prev().show();
			$(this).hide();
		});
		
 		$(".file").on("change",function(){
            readtoURL(this);
        	var that = $(this);
        	console.log(that);
        	
			function readtoURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function (e) {
							$(that).next().next().attr('src', e.target.result);
							$(that).next().next().show();
		            	}
		          reader.readAsDataURL(input.files[0]);
		        	}
			}
	   	}); 
 		
 		$("#updateBtn").click(function(){
 			
 			$("#updateForm").attr({
 				"action" : "<c:url value="/trip/update/"/>"+$("#tripId").val(),
 				"method" : "post"
 			}).submit();
 		});
 		
 		
	});

</script>
</head>
<body>

	<form:form id="updateForm" commandName="tripVO" enctype="multipart/form-data">
			<input type="text" name="title" value="${tripVO.title}">
			<input type="hidden" id="tripId" value="${tripVO.tripId}">
			<div class="tripPart">
			
			<c:set var="i" value="-1"/>
			<c:forEach items="${tripVO.tripPartVO}" var="tripPart" varStatus="status">
				<c:set var="i" value="${i+1}"/>
				<div class="part">
					<input type="hidden" name="tripPartVO[${i}].tripPartId" value="${tripPart.tripPartId}"><br/>
					<input type="text" name="tripPartVO[${i}].startTime" value="${tripPart.startTime}"><br/>
					<input type="text" name="tripPartVO[${i}].endTime" value="${tripPart.endTime}"><br/>
					<input type="text" name="tripPartVO[${i}].place" value="${tripPart.place}"><br/>
					<input type="text" name="tripPartVO[${i}].map" value="${tripPart.map}"><br/>
					<select name="tripPartVO[${i}].timeControl">
					    
					    <option value="${tripPart.timeControl}">${tripPart.timeControl}</option>
					    <c:if test="${tripPart.timeControl eq '오후'}">
					    	<option value="오전">오전</option>
					    </c:if>
					    <c:if test="${tripPart.timeControl eq '오전'}">
					    	<option value="오후">오후</option>
					    </c:if>
					    
					</select>
					
					<input type="file" name="tripPartVO[${i}].file" class="file" ><br/>
					<img src="<c:url value="/static/img/${tripPart.realFileName}"/>">
					<img src="#" class="preview"  style='display: block;'/>
					<input type="button" class="update" value="수정하기"/>
					
					<textarea name="tripPartVO[${i}].content" placeholder="내용을 입력해주세요">${tripPart.content}</textarea><br/><hr/>
				</div>
				</c:forEach>
			</div>

			
			<textarea id="overAll" name="overAll">${tripVO.overAll}</textarea>
			
			<input type="button" id="updateBtn" value="submit">
			
	</form:form>
</body>
</html>