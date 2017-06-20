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
		 $("input").last().prev().next().remove();
		 $("#writeForm").append('<input type="file" name="dailyVOList['
								+count+'].file"/><br/>');
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



     function initMap() {
       var map = new google.maps.Map(document.getElementById('map'), {
         zoom: 10,
         center: {lat: 37.554690, lng: 126.970702}
       
       });
       var geocoder = new google.maps.Geocoder();

       document.getElementById('submit').addEventListener('click', function() {
         geocodeAddress(geocoder, map);
       });
     }

     function geocodeAddress(geocoder, resultsMap) {
       var address = document.getElementById('address').value;
       geocoder.geocode({'address': address}, function(results, status) {
         if (status === 'OK') {
           resultsMap.setCenter(results[0].geometry.location);
           var marker = new google.maps.Marker({
             map: resultsMap,
             position: results[0].geometry.location
           });
           
          alert(results[0].geometry.location);
           
           
         } else {
           alert('Geocode was not successful for the following reason: ' + status);
         }
       });
     }
     
   </script>
   <script async defer
   		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBh7sjQRgESM6FjdQPV3Yp1DfyHyWxG36w&callback=initMap">
   </script>



 <style>
       #map {
        height: 400px;
        width: 60%;
       }
        #floating-panel {
    /*     position: absolute;
        top: 10px;
        left: 25%; */
        z-index: 5;
        width: 60%;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>


<title>Insert title here</title>
</head>
<body>
<h1>Write Page</h1>

<br/><br/>
 <div id="floating-panel">
      <input id="address" type="textbox" value="서울역">
      <input id="submit" type="button" value="입력">
    </div>
<div id="map"></div>
<br/><br/><br/>

<form:form id="writeForm"  commandName="DailyVO" name="dataform" enctype="multipart/form-data">
	
		<input type="text" name="title" placeholder="제목을 입력하세요"/><br/>
	
		<div class = "dailyPart">
			
			<input type="text" name="startString" placeholder="시작 시간을 입력하세요"/><br/>
			<input type="text" name="endString" placeholder="끝나는 시간을 입력하세요" /><br/>
			<input type="text" name="timeController" placeholder="오전,오후 " /><br/>
			<input type="text" name="place" placeholder="장소를 입력하세요" /><br/>
			<input type="file" name="dailyVOList[0].file" /><br/>
			<textarea name="dailyVOList[0].content" >간략한 설명을 입력하세요</textarea>
			
		</div>


	<br/>
	
	<textarea id="overAll" name="overAll" >총평을 입력하세요</textarea>
	<button type="button" id="addBtn">++</button>
	<button type="button" id="submitBtn">입력</button>
</form:form>





   
  




</body>
</html>