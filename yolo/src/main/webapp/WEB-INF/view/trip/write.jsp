<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Yolo : Trip List</title>

<style type="text/css">

/* nav bar search box - drop down menu button */
.navbar .navbar-search .dropdown-menu {
	min-width: 25px;
}

.dropdown-menu .label-icon {
	margin-left: 5px;
}

/* TODO: 색상바꾸기  */
.dropdown-menu>.active>a {
	background-color: #ccc;
}

.btn-outline {
	background-color: transparent;
	color: inherit;
	transition: all .5s;
}

#list .portfolio-item .portfolio-link .portfolio-hover {
	background: rgba(254, 209, 54, .9);
	position: absolute;
	width: 100%;
	height: 100%;
	opacity: 0;
	transition: all ease .5s;
	-webkit-transition: all ease .5s;
	-moz-transition: all ease .5s;
}

#list .portfolio-item:hover .portfolio-link .portfolio-hover:hover {
	opacity: 1;
}

::-webkit-scrollbar {
	width: 8px;
}

/* Track */
::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px #d1d0cf;
	-webkit-border-radius: 10px;
	border-radius: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
	-webkit-border-radius: 10px;
	border-radius: 10px;
	background: #d1d0cf;
	-webkit-box-shadow: inset 0 0 6px #d1d0cf;
}

::-webkit-scrollbar-thumb:window-inactive {
	background: #d1d0cf;
}

#searchText:focus {
	
}
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

::-webkit-scrollbar {
	width: 8px;
}

/* Track */
::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px #d1d0cf;
	-webkit-border-radius: 10px;
	border-radius: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
	-webkit-border-radius: 10px;
	border-radius: 10px;
	background: #d1d0cf;
	-webkit-box-shadow: inset 0 0 6px #d1d0cf;
}

::-webkit-scrollbar-thumb:window-inactive {
	background: #d1d0cf;
}

</style>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/static/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<c:url value="/static/css/font-awesome.min.css"/>"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link
	href="https://fonts.googleapis.com/css?family=Damion|Roboto+Slab|Rokkitt|Abel"
	rel="stylesheet">
<!-- Theme CSS -->
<link href="<c:url value="/static/css/agency.min.css"/>" rel="stylesheet">
<link href="<c:url value="/static/css/styles.css"/>" rel="stylesheet">


<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrX88apxamUwGdt3GMcN-P3b_C0qFrQBo&libraries=places"></script>
<script src="<c:url value="/static/js/logger.js"/>"></script>


<script type="text/javascript">

	$().ready(function(){
	
		$('.blah').hide();

		var i=0;
			
		$("#addBtn").click(function(){
			$("#keyword").attr('value',"");
			i++;

			var appendPart = "<div class='part'>" +"<div class='row'><div class='col-md-6'><input type='text' name='tripPartVO["+i+"].startTime' placeholder='시작시간' class='form-control'></div>"+
			"<div class='col-md-6'><input type='text' name='tripPartVO["+i+"].endTime' placeholder='끝나는시간' class='form-control'></div></div><br/>"+
			"<div class='row'><div class='col-md-6'><input type='text' id='place"+i+"' name='tripPartVO["+i+"].place' placeholder='장소를 입력해주세요' class='form-control'></div>"
			+"<div class='col-md-6'><input class='contorls form-control' type='text' id='map"+i+"' name='tripPartVO["+i+"].map'"+
				"placeholder='상세주소를 입력해주세요.' size='90' onClick='value=''' /> </div></div><br/>"+
				"<select name='tripPartVO["+i+"].timeControl' class='form-control'>"+
				    "<option value=''>시간구분</option>"+
				    "<option value='오전'>오전</option>"+
				    "<option value='오후'>오후</option>"+
				"</select><br/>"+ "<input type='hidden' id='x"+i+"' name='tripPartVO["+i+"].x' />"+
				"<input type='hidden' id='y"+i+"' name='tripPartVO["+i+"].y' />" +
				"<input class='form-control' type='file' name='tripPartVO["+i+"].file' id='imgInp"+ i +"'><br/><img class='blah' id='blah"+ i +"' src='#' /> <br/>" + 
				"<textarea style='height: 150px;' class='form-control' name='tripPartVO["+i+"].content' placeholder='내용을 입력해주세요'></textarea><br/><hr/>"+
				"</div> </div>";
				
			var blah = "blah"+ i;
				
			$(".part").append(appendPart);
			$(".part").find('#'+blah).hide();
				
			var imgInp = "imgInp" + i;
				
				
		    $(".tripPart").on("change","#"+imgInp ,function(){
		            readtoURL(this);
		        
					function readtoURL(input) {
							if (input.files && input.files[0]) {
								var reader = new FileReader();
								reader.onload = function (e) {
									$('#'+blah).attr('src', e.target.result);
									$('#'+blah).show();
				            	}
				         	 	reader.readAsDataURL(input.files[0]);
				        	}
					}
			});
		    
		    var place = "place"+i;
			$("#"+place).keypress(function (e) {
				if (e.which == 13){
					$("#keyword").attr('value',$(this).val());
					searchPlaces();// 실행할 이벤트
					
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
						$('#blah0').show();
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
			
			$("#place0").keypress(function (e) {
				
				if (e.which == 13){
					$("#keyword").attr('value',$(this).val());
					searchPlaces();// 실행할 이벤트
			 	}
			 });
			  
			$("#submitMap").click(function(){
				searchPlaces();
				return false;
			});
			
			var index = 0;
			$("#placesList").on('click',"h5", function(){
				index++;
				var place = $(this).text();
				var address = $(this).next().text();
				
   				addressSearch(place,address,index, function(results) {
   					
   	   				var x = results[0];
   	   				var y = results[1];
   	   				
	   	   			var i = index-1;
	   				var placeId = "place" + i;
	   				var mapId = "map" + i;
	   				var xId = "x"+i;
	   				var yId = "y"+i;
	   				
	   				$("#"+placeId).val(place); 
	   				$("#"+mapId).val(address);
	   				$("#"+xId).val(x);
	   				$("#"+yId).val(y);
	   				
   				});
   				
			});
	});
</script>
</head>
<body id="page-top" class="index">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="<c:url value="/home"/>">`Solo</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href="<c:url value="/home#main" />"
						id="mainBtn">Main</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Life
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href='<c:url value="/daily/list" />' id="dailyBtn">Daily</a>
							</li>
							<li><a href='<c:url value="/trip/list" />' id="tripBtn">Trip</a>
							</li>
						</ul></li>

					<c:choose>
						<c:when test="${user eq null}">
							<li><a class="page-scroll"
								href="<c:url value="/user/signIn" />" id="loginBtn">Login</a></li>
							<li><a class="page-scroll" href="#signUp" id="joinBtn">Join</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a class="page-scroll"
								href="<c:url value="/user/mypage" />" id="mypageBtn">MyPage</a>
							</li>
							<li><a class="page-scroll" href="/yolo/user/signOut">Logout</a>
							</li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<header id="header"> </header>
	
	<section id="write">
		<div class="container">
			<div class="row" style="margin: auto 0;">
				<form:form id="writeForm" commandName="writeFrm" enctype="multipart/form-data">
					
					<div class="tripPart">
						<input type="text" name="title" placeholder="제목" class="form-control"><br/>
						<hr/>
						
						<div class="row">
							<div class="part col-md-6" style="overflow-y:scroll; height: 470px;">
								<input type="button" id="addBtn" value="+" style="margin-left: 96%;"><br/><br/>
								<div class="row">
									<div class="col-md-6">
										<input type="text" name="tripPartVO[0].startTime" placeholder="시작시간" class="form-control"><br/>
									</div>
									<div class="col-md-6">
										<input type="text" name="tripPartVO[0].endTime" placeholder="끝나는시간"class="form-control"><br/>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<input type="text" class ="place form-control" id="place0" name="tripPartVO[0].place" placeholder="장소를 입력해주세요"><br/>
									</div>
									<div class="col-md-6">
										<input id="map0" class="contorls form-control" type="text" name="tripPartVO[0].map" 
											placeholder="상세주소를 입력해주세요." size="50" onClick="value=''" />
									</div>
								</div>
								
								<select name="tripPartVO[0].timeControl" class="form-control">
								    <option value="">시간구분</option>
								    <option value="오전">오전</option>
								    <option value="오후">오후</option>
								</select><br/>
								
								<input type="hidden" id="x0" name="tripPartVO[0].x" />
								<input type="hidden" id="y0" name="tripPartVO[0].y" />
								
						        <input type="file" name="tripPartVO[0].file" id="imgInp0" class="form-control"><br/>
						        <img class="blah" id="blah0" src="#" /><br/>
				
								<textarea name="tripPartVO[0].content" placeholder="내용을 입력해주세요" class="form-control" style="height:150px;"></textarea><br/><hr/>
							</div>
							
							<div class="map_wrap col-md-6">
							<div id="map" style="width: 550px; height: 470px; position: relative; overflow: hidden;"></div>
		
								<div id="menu_wrap" class="bg_white" style="width: 230px">
									<div class="option">
										<div>
											키워드 : <input type="text" value="" id="keyword" size="15">
											<button id="submitMap">검색하기</button>
										</div>
									</div>
									<hr>
									<ul id="placesList"></ul>
									<div id="pagination"></div>
								</div>
							</div>
						</div>
						
					</div>
					
					<textarea id="overAll" name="overAll" placeholder="총평을 입력해주세요" class="form-control" style="height: 150px;"></textarea>
					
					<div class="row" style="text-align: center;">
						<br/><br/><input type="button" id="writeBtn" value="submit" class="btn btn-success btn-sm" style="width: 250px; margin-top: 25px; font-family: 'Open Sans', sans-serif; font-size: 12px; letter-spacing: 4px; text-transform: uppercase;">
					</div>
					
				</form:form>
			</div>
		</div>
	
	</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=133ba8bc69d70d5c725419e305fa20ef&libraries=services"></script>
<script>
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();


// 주소로 좌표를 검색합니다
var addressSearch = function (place,address,index, cb) {
		// place : 장소명 (keyword) , address : 주소 , index : 1,2,3...마커순서 , 
		// cb: 콜백함수 ( 결과값을 반환하기 위해 )
		var results = [];
		geocoder.addressSearch(address, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        
	        var x = result[0].y;
	        var y = result[0].x;
 	        
	        var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, ((index-1)*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: coords, // 마커의 위치
	            image: markerImage
	            
	        }); 
			
/* 	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords,
	            text : name
	        });  */
	        marker.setMap(map); // 지도 위에 마커를 표출합니다
	        markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
 	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="padding:5px;">'+place+'</div>'
	        });
	        infowindow.open(map, marker); 
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	        results.push(x);
	        results.push(y);
			
	        cb(results);
	        
	    }

	});
	
	// return results;
}
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
            removeMarker();
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}


// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
	var address = places.road_address_name;

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

	<%@include file="/WEB-INF/view/common/commonfooter.jsp"%>

	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value="/static/js/bootstrap.min.js"/>"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"
		integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb"
		crossorigin="anonymous"></script>

	<!-- Contact Form JavaScript -->
	<script src="<c:url value="/static/js/jqBootstrapValidation.js"/>"></script>
	<script src="<c:url value="/static/js/contact_me.js"/>"></script>

	<!-- Theme JavaScript -->
	<script src="<c:url value="/static/js/agency.min.js"/>"></script>

</body>

</html>