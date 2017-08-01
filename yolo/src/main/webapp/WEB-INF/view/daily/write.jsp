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




    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

    function initMap() {
      var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 37.554690, lng: 126.970702},
        zoom: 13
      });
      var input = /** @type {!HTMLInputElement} */(
          document.getElementById('pac-input'));

      var types = document.getElementById('type-selector');
      map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
      map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

      var autocomplete = new google.maps.places.Autocomplete(input);
      autocomplete.bindTo('bounds', map);

      var infowindow = new google.maps.InfoWindow();
      var marker = new google.maps.Marker({
        map: map,
        anchorPoint: new google.maps.Point(0, -29)
      });

      autocomplete.addListener('place_changed', function() {
        infowindow.close();
        marker.setVisible(false);
        var place = autocomplete.getPlace();
        if (!place.geometry) {
          // User entered the name of a Place that was not suggested and
          // pressed the Enter key, or the Place Details request failed.
          window.alert("No details available for input: '" + place.name + "'");
          return;
        }

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
          map.fitBounds(place.geometry.viewport);
        } else {
          map.setCenter(place.geometry.location);
          map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setIcon(/** @type {google.maps.Icon} */({
          url: place.icon,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(35, 35)
        }));
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        var address = '';
        if (place.address_components) {
          address = [
            (place.address_components[0] && place.address_components[0].short_name || ''),
            (place.address_components[1] && place.address_components[1].short_name || ''),
            (place.address_components[2] && place.address_components[2].short_name || '')
          ].join(' ');
        }

        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map, marker);
      });

      // Sets a listener on a radio button to change the filter type on Places
      // Autocomplete.
      function setupClickListener(id, types) {
        var radioButton = document.getElementById(id);
        radioButton.addEventListener('click', function() {
          autocomplete.setTypes(types);
        });
      }

      setupClickListener('changetype-all', []);
      setupClickListener('changetype-address', ['address']);
      setupClickListener('changetype-establishment', ['establishment']);
      setupClickListener('changetype-geocode', ['geocode']);
    }
  
   </script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBh7sjQRgESM6FjdQPV3Yp1DfyHyWxG36w&libraries=places&callback=initMap"
        async defer></script>




 <style>
     #map {
        height: 80%;
        width: 600px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 300px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
    </style>
 


<title>Insert title here</title>
</head>
<body>
<h1>Write Page</h1>

<br/><br/>
   <input id="pac-input" class="controls" type="text"
        placeholder="Enter a location">
    <div id="type-selector" class="controls">
      <input type="radio" name="type" id="changetype-all" checked="checked">
      <label for="changetype-all">All</label>

      <input type="radio" name="type" id="changetype-establishment">
      <label for="changetype-establishment">Establishments</label>

      <input type="radio" name="type" id="changetype-address">
      <label for="changetype-address">Addresses</label>

      <input type="radio" name="type" id="changetype-geocode">
      <label for="changetype-geocode">Geocodes</label>
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