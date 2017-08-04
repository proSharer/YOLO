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
<meta name="google-signin-client_id" content="818893027331-ss8am5r339qu1uespfmobqt23i0hgj41.apps.googleusercontent.com">
<title>Trip List</title>

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
	href="https://fonts.googleapis.com/css?family=Damion|Roboto+Slab|Rokkitt|Abel|Saira+Condensed"
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
#LeftBottomLayerFixed {position:fixed;left:20px;bottom:20px}
</style>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function(){
		$("#keyword").val("");
		var maxHeight = 0;
		var maxWidth = 0;
		$('.img-responsive').each(function() {
			maxHeight = Math.max(maxHeight, $(this).height());
			maxWidth = Math.max(maxWidth, $(this).width());
		});

		$('.portfolio-hover').css({
			height : maxHeight + 'px'
		});
		$('.portfolio-hover').css({
			width : maxWidth + 'px'
		});
		
		$("#SearchBox .dropdown-menu li a").click(function(){
			$("#keyword").val("");
			var selText = $(this).html();
			$(this).parents(".input-group-btn").find(".btn-search").html(selText);
			
			var option = $(this).find("span").data("option");
			
			$("#searchType").val(option);
			
			if ($("#searchType").val() == '5'){
 				$("#regionOptionBtn").show();
 				$("#keyword").hide();
 				$("#keyword").val($("#searchType").val());
			} 
			
			else if ($("#searchType").val() != '5'){
				$("#searchType").val()
 				$("#regionOptionBtn").hide();
 				$("#keyword").show();
 				
			}
		});
		$("#regionBox .dropdown-menu li a").click(function(){
			$("#keyword").val("");
			var selText = $(this).html();
			$(this).parents(".input-group-btn").find(".btn-search").html(selText);
			
			var option = $(this).find("span").data("option");
			var name = $(this).find("span").data("name");
			$("#keyword").val(name);
			
			$("#weatherDiv").load('<c:url value="/weather/"/>'+name);
			$("#weatherDiv").attr('id', 'LeftBottomLayerFixed');
			$("#LeftBottomLayerFixed").css('display', 'block');
			
			console.log($("#searchType").val());
			console.log($("#keyword").val());
		});
		
		$("#keyword").keypress(function(event){
			if(event.which == 13){
				$("#searchBtn").click();
				return false;
			}
		});
		
		$("#regionOptionBtn").hide();
		$("#initBtn").click(function(){
			location.href="<c:url value="/trip/list/init"/>";
		});
		
		$("#loginBtn").click( function() {
			$.post(
				"<c:url value="/user/signIn" />",
				$("#signInForm").serialize(),
				function(data) {
					if (data == "OK") {
						window.location.href = "<c:url value="/home"/>";
					} else if (data == "FAIL") {
						location.reload();
					}
			});
		});
		$("#LeftBottomLayerFixed").css('display', 'none');
	});
	
	Kakao.init('961fe9a368d2a0cd75ebc5dc7b30c7d2');
	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success: function(authObj) {
				var accessToken = authObj.access_token;
				var refreshToken = authObj.refresh_token;
				
				$.post("<c:url value="/user/kakao/savetoken"/>", {
					"accessToken" : accessToken
					, "refreshToken" : refreshToken
				}, function() {});
				
				//alert(JSON.stringify(authObj)); 
				
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						var id = res.id;
						var nickName = res.properties.nickname;
						var email = res.kaccount_email;
						
						$.post("<c:url value="/user/kakao/signin"/>", {
							"id" : id
							, "nickName" : nickName
							, "email" : email
						}, function(response){
							if ( response == "ok" ) {
								location.reload();
							}
						});
						
						//alert(JSON.stringify(res));
				},

					fail: function (error) {
						alert(JSON.stringify(error));
					}
				});
				
				
			},
				fail: function(err) {
				alert(JSON.stringify(err));
			}
		});
	}
	
	//네이버 로그인 
	function loginWithNaver() {
		if (token != null) {
			if (resultCode == "00") {
				var userId = response.id;
				var email = response.email;
				var userName = response.name;
				var profile_image = response.profile_image;
				var enc_id = response.enc_id;
				var age = response.age;
				var gender = response.gender;
				var name = response.nickname;
				var birthday = response.birthday;
				
				$.post("<c:url value="/user/naver/userInfo"/>", {
					"userId" : userId
					, "email" : email
					, "userName" : userName
					, "profile_image" : profile_image
					, "enc_id" : enc_id
					, "age" : age
					, "gender" : gender
					, "name" : name
					, "birthday" : birthday
				}, function(response){
					if ( response == "success" ) {
						console.log("aa");
					}
				});
			} 
			else {
				console.log(JSON.stringify(message));
			}
		}
		
	}
	
	function kakaoSignOut() {
		Kakao.Auth.logout(function() {
			location.href="<c:url value="/user/kakao/signout"/>"
		});
	}

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

	<form id="searchForm" style="text-align: center;"
		class="navbar-form navbar-search" role="search">
		<section id="list">
	
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2 style="font-family: 'Abel', sans-serif; font-weight: normal; color: #333; font-size: 35px" class="section-heading">Trip</h2>
						<br /> <br />
						<h3 class="section-subheading text-muted">- New -</h3>
					</div>
				</div>
		
				<div class="row">
					<div class="input-group">
						<input type="hidden" id="searchType" name="searchType" />
						<input type="hidden" id="regionType" name="regionType" />
						<div id="SearchBox" class="input-group-btn">
							<button type="button"
								class="btn btn-search btn-default dropdown-toggle"
								data-toggle="dropdown" value="1" id="searchOptionBtn">
								<span class="label-icon">Search</span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu pull-left" role="menu">
								<li><a href="#" class="selectOption"> <span
										class="label-icon" data-option="1">제목+총평</span>
								</a></li>
								<li><a href="#" class="selectOption"> <span
										class="label-icon" data-option="2">제목</span>
								</a></li>
								<li><a href="#" class="selectOption"> <span
										class="label-icon" data-option="3">총평</span>
								</a></li>
								<li><a href="#" class="selectOption"> <span
										class="label-icon" data-option="4">세부내용</span>
								</a></li>
								<li><a href="#" class="selectOption"> <span
										class="label-icon" data-option="5">지역</span>
								</a></li>
							</ul>
							
						</div>
						
						<div id="regionBox" class="input-group-btn">
							<button type="button"
								class="btn btn-search btn-default dropdown-toggle"
								data-toggle="dropdown" value="1" id="regionOptionBtn">
								<span class="label-icon">Location</span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu pull-left" role="menu">
								<c:forEach items="${regionList}" var="region">
								<li><a href="#" class="selectOption"> 
								<span class="label-icon" data-option="${region.regionId}" data-name="${region.regionName}">${region.regionName}</span>
								
								</a></li>								
								</c:forEach>
							</ul>
						</div>

						<input id="keyword" name="keyword" type="text"
							class="form-control" value="${sessionScope._SEARCH_.keyword}">

						<div class="input-group-btn">
							<input id="searchBtn" type="button" class="btn btn-search btn-default"
								onclick="movePage(0)" value="&#10140;" />
						</div>
						<div class="input-group-btn">
						<input type="button" class="btn btn-search btn-default" id="initBtn" value="초기화"/>
					
						</div>
					</div>
				</div>
				<br />
				<c:if test="${!empty sessionScope._USER_}">
					<a href="<c:url value="/trip/write"/>" style="text-decoration: none;">글쓰기</a>
				</c:if>
				<br/>
				<br/>
				<br/>
				<div class="row" style="text-align: center;">
					<c:forEach items="${tripList.tripList}" var="trip">
						<div class="col-md-4 col-sm-6">
							<div class="imgDiv portfolio-item">
								<a href="<c:url value="/trip/detail/${trip.tripId}"/>" class="portfolio-link">
									<div class="portfolio-hover">
										<div class="portfolio-hover-content"></div>
									</div>
									<img src="<c:url value="/trip/download/${trip.tripId}"/>" class="img-responsive" alt="" style="width: 360px; height: 260.09px; margin: auto;">
								</a>
							</div><br/>
							<div class="portfolio-caption">
								<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">${trip.title}</h4>
								<p class="text-muted">${trip.userId}</p>
							</div>
							<br/>
						</div>
					</c:forEach>
				</div>
				<br />
				<br />

				<div class="row" style="text-decoration: none;">
					${pager}
					<c:if test="${!empty sessionScope._USER_}">
						
					</c:if>
				</div>
				
			</div>
		</section>
	</form>

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
	
	<!-- signIn Modal -->
	<div class="modal fade" id="signInModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 style="text-align: center;" class="modal-title" id="myModalLabel">Login</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form id="signInForm" style="width: 82%; margin: 0 auto">
								<div class="form-group">
									 <input class="form-control" type="text" name="userId" placeholder="ID">
								</div>
								<div class="form-group">
									<input class="form-control" type="password" name="password" placeholder="Password">
									<!-- <div class="help-block text-right"><a href="">Forget the password ?</a></div> -->
								</div>
								<div class="form-group">
									<button type="submit" id="loginBtn" class="btn btn-primary btn-block" style="height: 30px; padding-top: 5px;">Sign in</button>
								</div>
							</form>
							<div class="social-buttons" style="margin-left: 50px">
								<a id="custom-login-btn" href="javascript:loginWithKakao()">
									<img src="<c:url value="/static/img/kakao.png"/>"width="231" height="auto">
								</a>
								<a id="naver_id_login" href="<c:url value="javascript:loginWithNaver()"/>">
									<script type="text/javascript">
										/* id 쓰고 콜백주소 쓴다. */
										var naver_id_login = new naver_id_login("5jcUw1BzWAus2lCeKdeU", "http://localhost:8080/yolo/user/callback");
										var state = naver_id_login.getUniqState();
										naver_id_login.setButton("green", 3,50);
										naver_id_login.setDomain("http://localhost:8080/yolo/user/naver/signIn");
										naver_id_login.setState(state);
										naver_id_login.setPopup();
										naver_id_login.init_naver_id_login();
									</script>
								</a>
								<%-- <a href="<c:url value="/user/google" /> ">
									<img style="width: 100px;" src="<c:url value="/static/img/btn_google_signin_light_normal_web@2x.png"/> ">
								</a> --%>
							
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="bottom text-center">
						New here ? 
						<a href="<c:url value="/user/signUp"/>"><b>Join Us</b></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Weather Div -->
	<div id="weatherDiv" style="text-align: center; background-color: transparent; font-family: 'Saira Condensed', sans-serif; font-size: 18px; color:#777">
	</div>

</body>

</html>