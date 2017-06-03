<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">

$().ready(function () {
	
	var count = 0;
	$("#writeForm").find("#addBtn").click(function () {
		
		parseInt(count);
		count = count + 1;
		
		
		//복사
		$("#writeForm").append($(".dailyPart").html());
		//삭제
		 $("textarea").last().prev().next().remove();
		 $("#writeForm").append('<textarea  name="dailyVOList['
								+count+'].content">간략한 설명을 입력하세요</textarea><br/>');
		
		
		
		$("#writeForm").append($("#overAll"));
		$("#writeForm").append($("#addBtn"));
		$("#writeForm").append($("#submitBtn"));
	});
	
	
	
	$("#writeForm").find("#submitBtn").click(function () {
		$("#writeForm").attr({
			action: "<c:url value = "/daily/write"/>",
			method: "post" 
			
		});
		
		$("#writeForm").submit();
		
		
		
	});
	
});




</script>




<title>Insert title here</title>
</head>
<body>

<form:form id="writeForm"  commandName="DailyVO" name="dataform">
	
	
		<div class = "dailyPart">
			
			<input type="text" name="startString" placeholder="시작 시간을 입력하세요"/><br/>
			<input type="text" name="endString" placeholder="끝나는 시간을 입력하세요" /><br/>
			<input type="text" name="timeController" placeholder="오전,오후 " /><br/>
			<input type="text" name="place" placeholder="장소를 입력하세요" /><br/>
			
			<textarea name="dailyVOList[0].content" >간략한 설명을 입력하세요</textarea>
			
		</div>


	<br/>
	<textarea id="overAll" >총평을 입력하세요</textarea>
	<button type="button" id="addBtn">++</button>
	<button type="button" id="submitBtn">입력</button>
</form:form>




</body>
</html>