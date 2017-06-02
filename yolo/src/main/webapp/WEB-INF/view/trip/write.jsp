<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/static/css/styles.css"/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrX88apxamUwGdt3GMcN-P3b_C0qFrQBo&libraries=places"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.geocomplete.js"/>"></script>
<script src="<c:url value="/static/js/logger.js"/>"></script>
<script type="text/javascript">

	$().ready(function(){
	    var options = {
		   map: ".map_canvas",
		   location: "방배역"
		};
		        
		$(".geocomplete").geocomplete(options);

		$("#addBtn").click(function(){
	
			var appendPart = $(".part").html(); 
			console.log(appendPart);
			
			$(".tripPart").append(appendPart);
		});
		
		$("#writeBtn").click(function(){
			$("#writeForm").attr({
				"action" : "<c:url value="/trip/write"/>",
				"method" : "post"
			}).submit();
		});
	});
</script>
</head>
<body>

	<form id="writeForm">
		<input type="text" name="title" placeholder="제목">
		<input type="text" name="userId" placeholder="userId">
		<div class="tripPart">
			<div class="part">
				<input type="text" name="tripPartListVO.startTime" placeholder="시작시간"><br/>
				<input type="text" name="tripPartListVO.endTime" placeholder="끝나는시간"><br/>
				
			
					<input class="geocomplete" class="contorls" type="text" name="tripPartListVO.place" 
					placeholder="주소를 입력해주세요." size="90" onClick="value=''" />
	
				<div class="map_canvas"></div>
				
				<input type="text" class="timeControl" name="tripPartListVO.timeControl" placeholder="시간구분"><br/>
				<input type="text" name="tripPartListVO.map" placeholder="지도"><br/>
				<textarea name="tripPartListVO.content" placeholder="내용을 입력해주세요"></textarea><br/><hr/>
			</div>
		</div>
		<input type="button" id="addBtn" value="+">
		
		<textarea id="overAll" name="overAll" placeholder="총평을 입력해주세요"></textarea>
		
		<input type="button" id="writeBtn" value="submit">
		
	</form>
	
</body>
</html>