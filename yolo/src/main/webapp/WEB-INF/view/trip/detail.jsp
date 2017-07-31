<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

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
<link href="<c:url value="/static/css/agency.min.css"/>"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->
    
<title>Yolo : Trip Detail</title>

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
</style>

<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=133ba8bc69d70d5c725419e305fa20ef&libraries=services"></script>
<script type="text/javascript">

	$().ready(function(){
		var map = "";
		var place = "";
		var index = "";
		<c:forEach items="${tripVO.tripPartVO}" var="item" varStatus="status">
			place = "${item.place}";
			map = "${item.map}";
			index = "${status.count}";
	
			addMarker(map,index,place);

		</c:forEach>
		
		
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
						$("#like").val("true");
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
							<li><a href='<c:url value="/trip/list"/>' class="page-scroll" id="tripBtn">Trip</a>
							</li>
						</ul></li>

					<c:choose>
						<c:when test="${user eq null}">
							<li><a class="page-scroll"
								href="<c:url value="/user/signIn" />" id="loginBtn">Login</a></li>
							<li><a class="page-scroll" href="<c:url value="/user/signUp" />" id="joinBtn">Join</a>
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
	
	<section id="detail">
		<div class="container">
			<div class="row" style="margin: auto 0;">
				<input type="hidden" id="like" value="${like}"/>
				<input type="hidden" id="tripId" value="${tripVO.tripId}"/>
				
				<div style="text-align: center">
					<span style="font-size: x-large; color: #777">${tripVO.title}</span>
				</div>
				<hr/>
				<span style="margin-left: 82%; color: #777" >${tripVO.createDate}  /  ${tripVO.userId}</span>
				<br/>
				<br/>
				<br/>
				<div style="width: 100%; height: 600px">
					<div style="overflow-y:scroll; display: inline-block; width: 50%; height: 600px; margin: auto 0; padding: 16px; text-align: center" >
						<c:forEach items="${tripVO.tripPartVO}" var="tripPart">
							<div>
						 	<img src="<c:url value="/trip/detail/download/${tripPart.tripPartId}"/>" width="400px" height="300px"/><br/>
							시작시간 : ${tripPart.startTime}시<br/>
							끝나는시간 : ${tripPart.endTime}시( ${tripPart.timeControl} )<br/>
							장소 : ${tripPart.place}<br/>
							주소 : ${tripPart.map}<br/><br/>
							${tripPart.content}<br/>
							<div class="x" style="display:none">${tripPart.x}</div>
							<div class="y"style="display:none">${tripPart.y}</div>
							</div><br>
						</c:forEach>
						<br/><br/>총 평 : ${tripVO.overAll}<br/>
					</div>
					<div style="margin: 20px; display: inline-block; width: 49%; height: 600px; margin: auto 0; padding: 16px; text-align: center;">
						<div id="detailMap" style="width:100%;height:100%;"></div>
					</div>
				</div>
				
				<br/><br/>

				<div style="text-align: right; margin-right: 20px">
					좋아요 : <span id="likeCount"> ${tripVO.likeCount}</span>
					<c:if test="${!empty sessionScope._USER_.userId}">
						<c:if test="${!like}">
						<input style="width: 30px; height: 30px; background-color: transparent; border-color: transparent;" type="button" class="likeBtn" value="♡"/>
						</c:if>
						
						<c:if test="${like}">
						<input style="width: 30px; height: 30px; background-color: transparent; border-color: transparent;" type="button" class="likeBtn" value="♥"/>
						</c:if><br/>
						
					</c:if>
					<br/>
					
					<c:if test="${sessionScope._USER_.userId eq tripVO.userId}">
						<a href="<c:url value="/trip/delete/${tripVO.tripId}"/>">삭제하기</a>
						<a href="<c:url value="/trip/update/${tripVO.tripId}"/>">수정하기</a>
					</c:if>
				</div>
				
				<!-- 이부분에 댓글이 보여야함. -->
				<hr/>
				<br/>
				<div style="margin-left: 16px">
					<span style="font-weight: bold">Comment</span>
					<br/><br/>
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
								<a style="font-size: 12px; margin-left: 9px;" class="parentReplyBtn">Reply</a>
								
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
					<br/>
					<c:if test="${!empty sessionScope._USER_.userId}">
						<form id="replyForm" style="margin-left: 20px">	
							<input style="width: 90%; height: 80px" type="text" id="content"> 
							<a id="replyBtn" style="margin-left: 10px">Submit</a>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</section>

<script>
	var markers = [];

	var mapX = "${tripVO.tripPartVO[0].x}";
	var mapY = "${tripVO.tripPartVO[0].y}";
	
	mapX *= 1;
	mapY *= 1;
	
	var mapContainer = document.getElementById('detailMap'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new daum.maps.LatLng(mapX, mapY), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	var linePath = [];
	var addMarker = function (position, index, title) {
		geocoder.addressSearch(position, function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		        
		        var x = result[0].y;
		        var y = result[0].x;
		        linePath.push(new daum.maps.LatLng(x,y));
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
		            content: '<div style="padding:5px;">'+title+'</div>'
		        });
		        //infowindow.open(map, marker); 

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    }

		});

	} 
	
/* 	// 지도에 표시할 선을 생성합니다
	var polyline = new daum.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FFAE00', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
 */
	
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
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