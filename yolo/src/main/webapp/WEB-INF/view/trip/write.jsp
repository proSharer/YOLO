<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<c:url value="/static/css/styles.css"/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrX88apxamUwGdt3GMcN-P3b_C0qFrQBo&libraries=places"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.geocomplete.min.js"/>"></script>
<script src="<c:url value="/static/js/logger.js"/>"></script>
<script type="text/javascript">

	$().ready(function(){
	    var options = {
		   map: ".map_canvas",
		   location: "방배역"
		};
		        
		$("#geocomplete0").geocomplete(options);
		
		var i=0;
		
		$("#addBtn").click(function(){
			
			i++;

			var appendPart = "<div class='part'>" +"<input type='text' name='tripPartVO["+i+"].startTime' placeholder='시작시간'><br/>"+
			"<input type='text' name='tripPartVO["+i+"].endTime' placeholder='끝나는시간'><br/>"+
			"<input type='text' name='tripPartVO["+i+"].place' placeholder='장소를 입력해주세요'><br/>"
			+"<input id='geocomplete"+i+"' class='contorls' type='text' name='tripPartVO["+i+"].map'"+
				"placeholder='상세주소를 입력해주세요.' size='90' onClick='value=''' />"+
			"<div class='map_canvas'></div>"+
			"<select name='tripPartVO["+i+"].timeControl'>"+
			    "<option value=''>시간구분</option>"+
			    "<option value='오전'>오전</option>"+
			    "<option value='오후'>오후</option>"+
			"</select>"+ "<input type='file' name='tripPartVO["+i+"].file' id='imgInp"+ i +"'><br/><img id='blah"+ i +"' src='#' /> <br/>" + 
			"<textarea name='tripPartVO["+i+"].content' placeholder='내용을 입력해주세요'></textarea><br/><hr/>"+
			"</div> </div>";
			
			$(".tripPart").append(appendPart);
			
			var imgInp = "imgInp" + i;
			var blah = "blah"+ i;
			
/* 			console.log(geocomplete);
			$(geocomplete).geocomplete(options); */
			
	        $(".tripPart").on("change","#"+imgInp ,function(){
	            readtoURL(this);
	        
				function readtoURL(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();
							reader.onload = function (e) {
								$('#'+blah).attr('src', e.target.result);
			            	}
			          reader.readAsDataURL(input.files[0]);
			        	}
				}
		   	});
			
	        
	        
	    });
	   


		
        $("#imgInp0").on('change', function(){
            readURL(this);
        });
   

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#blah0').attr('src', e.target.result);
            	}
          reader.readAsDataURL(input.files[0]);
        	}
   		}
		
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

	<form:form id="writeForm" commandName="writeFrm" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="제목">
		<div class="tripPart">
			<div class="part">
				<input type="text" name="tripPartVO[0].startTime" placeholder="시작시간"><br/>
				<input type="text" name="tripPartVO[0].endTime" placeholder="끝나는시간"><br/>
				<input type="text" name="tripPartVO[0].place" placeholder="장소를 입력해주세요"><br/>
			
					<input id="geocomplete0" class="contorls" type="text" name="tripPartVO[0].map" 
					placeholder="상세주소를 입력해주세요." size="90" onClick="value=''" />
	
				<div class="map_canvas"></div>
				
				
				<select name="tripPartVO[0].timeControl">
				    <option value="">시간구분</option>
				    <option value="오전">오전</option>
				    <option value="오후">오후</option>
				</select>
				
					
		        <input type="file" name="tripPartVO[0].file" id="imgInp0"><br/>
		        <img id="blah0" src="#" /><br/>

				<textarea name="tripPartVO[0].content" placeholder="내용을 입력해주세요"></textarea><br/><hr/>
			</div>
		</div>
		<input type="button" id="addBtn" value="+">
		
		<textarea id="overAll" name="overAll" placeholder="총평을 입력해주세요"></textarea>
		
		<input type="button" id="writeBtn" value="submit">
		
	</form:form>
	
</body>
</html>