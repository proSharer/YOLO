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

<title>Yolo : Trip Update</title>

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


<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrX88apxamUwGdt3GMcN-P3b_C0qFrQBo&libraries=places"></script>
<script src="<c:url value="/static/js/logger.js"/>"></script>


<script type="text/javascript">
	$().ready(function(){
		$(".file").hide();
		$(".preview").hide();
		
		$(".update").click(function(){
			var img = $(this).prev().prev().prev();
			console.log(img);
			$(img).hide();
			$(img).prev().prev().show();
			$(this).hide();
		});
		
 		$(".file").on("change",function(){
 			console.log("test");
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
				<a class="navbar-brand page-scroll" href='<c:url value="/home"/>'>`Solo</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href='<c:url value="/home#main"/>' id="mainBtn">Main</a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Life
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href='<c:url value="/daily/list"/>'
								id="dailyBtn">Daily</a></li>
							<li><a href='<c:url value="/trip/list"/>' id="tripBtn">Trip</a>
							</li>
						</ul></li>

					<c:choose>
						<c:when test="${ sessionScope._USER_.loginType eq '' }">
							<li><a class="page-scroll" href="<c:url value="/user/mypage" />" id="mypageBtn">MyPage</a></li>
							<li><a class="page-scroll" href="<c:url value="/chat" />" id="chatBtn">Chat</a></li>
							<li><a class="page-scroll" href="<c:url value="/user/signOut" />">Logout</a></li>
						</c:when>
						<c:when test="${ sessionScope._USER_.loginType eq 'nvr' }">
							<li><a class="page-scroll" href="<c:url value="/user/mypage" />" id="mypageBtn">MyPage</a></li>
							<li><a class="page-scroll" href="<c:url value="/chat" />" id="chatBtn">Chat</a></li>
							<li><a class="page-scroll" href="<c:url value="/user/naver/signout" />">Logout</a></li>
						</c:when>
						<%-- <c:when test="${ sessionScope._USER_.loginType eq 'ggl' }">
							<li><a class="page-scroll" href="<c:url value="/user/mypage" />" id="mypageBtn">MyPage</a></li>
							<li><a class="page-scroll" href="<c:url value="/chat" />" id="chatBtn">Chat</a></li>
							<li><a class="page-scroll" href="<c:url value="/user/google/signout" />">Logout</a></li>
						</c:when> --%>
						<c:when test="${ sessionScope._USER_.loginType eq 'kko' }">
							<li><a class="page-scroll" href="<c:url value="/user/mypage" />" id="mypageBtn">MyPage</a></li>
							<li><a class="page-scroll" href="<c:url value="/chat" />" id="chatBtn">Chat</a></li>
							<li id="kakaoSignout" ><a href="javascript:void(0)" class="page-scroll" >Logout</a></li>
							<script type="text/javascript">
								$().ready(function() {
									$("#kakaoSignout").click(function() {
										console.log("aa");
										Kakao.Auth.logout(function () {
											location.href="<c:url value="/user/kakao/signout"/>"
										});
									});
								});
							
							</script>
							
						</c:when>
						
						<c:otherwise>
							<li><a class="page-scroll" href="<c:url value="/user/signUp" />" id="joinBtn">Join</a></li>
							<li><a class="page-scroll" data-toggle="modal" data-target="#signInModal" style="text-size:20px;">Login</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<header id="header"> </header>
	
	<section id="update">
		<div class="container">
			<div class="row" style="margin: auto 0;">

			<form id="updateForm" enctype="multipart/form-data">
				<input type="text" name="title" value="${tripVO.title}" class="form-control"><br/>
				<hr/>
					<input type="hidden" id="tripId" value="${tripVO.tripId}">
					<div class="tripPart">
					<div class="row">
					<div class="wrapDiv col-md-6" style="overflow-y:scroll; height: 470px;">
					<c:set var="i" value="-1"/>
					<c:forEach items="${tripVO.tripPartVO}" var="tripPart" varStatus="status">
						<c:set var="i" value="${i+1}"/>
								<div class="part">
									<div class="row">
										<div class="col-md-6">
											<input type="text" name="tripPartVO[0].startTime" value="${tripPart.startTime}" class="form-control"><br/>
										</div>
										<div class="col-md-6">
											<input type="text" name="tripPartVO[0].endTime" value="${tripPart.endTime}" class="form-control"><br/>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<input type="text" class ="place form-control" name="tripPartVO[0].place" value="${tripPart.place}"><br/>
										</div>
										<div class="col-md-6">
											<input id="map0" class="contorls form-control" type="text" name="tripPartVO[0].map" 
												value="${tripPart.map}" size="50" onClick="value=''" />
										</div>
									</div>
									
									<select name="tripPartVO[0].timeControl" class="form-control">
								    <option value="${tripPart.timeControl}">${tripPart.timeControl}</option>
							  		  <c:if test="${tripPart.timeControl eq '오후'}">
							  		  	<option value="오전">오전</option>
									  </c:if>
							  		  <c:if test="${tripPart.timeControl eq '오전'}">
							    			<option value="오후">오후</option>
							   		 </c:if>
									</select><br/>

									
							        <input type="file" name="tripPartVO[0].file" id="imgInp0" class="file" ><br/>

								<img src="<c:url value="/trip/detail/download/${tripPart.tripPartId}" />" width="400px" height="300px"/><br/>
								<img src="#" class="preview"  style='display: block;'/>
								<div style="text-align: right; margin-bottom: 5px;">
									<input type="button" class="update" value="수정하기"/>
								</div>
									<textarea name="tripPartVO[0].content" placeholder="내용을 입력해주세요" class="form-control" style="height:150px;">${tripPart.content}</textarea><br/><hr/>
								</div>
						</c:forEach>
					</div>
					</div>
					</div>
		
					
					<textarea id="overAll" class="form-control" name="overAll" style="height: 150px; margin-top: 20px;">${tripVO.overAll}</textarea> <br/>
					<textarea id="hashTag" name="hashTag" class="form-control" style="height: 80px; margin-top:16px">${tripVO.hashTag}</textarea>
					<div style="text-align: center;">
						<input type="button" id="updateBtn" value="submit" class="btn btn-success btn-sm" style="width: 250px; margin-top: 35px; font-family: 'Open Sans', sans-serif; font-size: 12px; letter-spacing: 4px; text-transform: uppercase;">
					</div>
			</form>
			</div>
		</div>
	</section>

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