<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="google-signin-client_id" content="818893027331-ss8am5r339qu1uespfmobqt23i0hgj41.apps.googleusercontent.com">

<title>Yolo : Share Your Life!</title>
<!-- SignIn CSS -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/static/css/bootstrap.min.css"/>"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="<c:url value="/static/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Damion|Roboto+Slab|Rokkitt|Abel" rel="stylesheet">
<!-- Theme CSS -->
<link href="<c:url value="/static/css/agency.min.css"/>" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
	<![endif]-->
	<style type="text/css">
	
		@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
		
		#login-dp{
		min-width: 250px;
		padding: 14px 14px 0;
		overflow:hidden;
		background-color:rgba(255,255,255,.8);
		}
		#login-dp .help-block{
			font-size:12px    
		}
		#login-dp .bottom{
			background-color:rgba(255,255,255,.8);
			border-top:1px solid #ddd;
			clear:both;
			padding:14px;
		}
		#login-dp .social-buttons{
			margin:12px 0    
		}
		#login-dp .social-buttons a{
			width: 49%;
		}
		#login-dp .form-group {
			margin-bottom: 10px;
		}
		.btn-fb{
			color: #fff;
			background-color:#3b5998;
		}
		.btn-fb:hover{
			color: #fff;
			background-color:#496ebc 
		}
		.btn-tw{
			color: #fff;
			background-color:#55acee;
		}
		.btn-tw:hover{
			color: #fff;
			background-color:#59b5fa;
		}
		@media(max-width:768px){
			#login-dp{
				background-color: inherit;
				color: #fff;
			}
			#login-dp .bottom{
				background-color: inherit;
				border-top:0 none;
			}
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
		
		#RightTopLayerFixed {position:fixed;right:100px;top:100px;}
	</style>

</head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		
		var userId = '${sessionScope._USER_.userId}'
		console.log('${sessionScope._USER_.userNaverApiId}')
		console.log(userId)
		
		if ( '${sessionScope._USER_}' ){
			if ( userId == "" ) {
				$('#addUserIdModal').modal('show');
			}
		}
		
		$("#submitBtm").click(function() {
			$.post("<c:url value="/user/plusId" />", $("#addUserIdForm").serialize(), function(data) {
				if ( data == "OK" ) {
					location.reload();
				}
			});
		});
		
		$("#loginBtn").click( function() {
			$.post(
				"<c:url value="/user/signIn" />",
				$("#signInForm").serialize(),
				function(data) {
					if (data == "OK") {
						window.location.href = "<c:url value="/home"/>";
					} else if (data == "FAIL") {
						alert("아이디와 비밀번호를 확인해 주세요!");
						location.reload();
					}
			});
		});
		
		$("#popularTagsDiv").attr('id', 'RightTopLayerFixed');
		$("#LeftBottomLayerFixed").css('display', 'none');
		
		$(".tagBtn").click( function() {
			if ($("#contentDiv").css('display') == 'none') {
				$("#contentDiv").css('display', 'block');
			} else if ($("#contentDiv").css('display') == 'block') {
				$("#contentDiv").css('display', 'none');
			}
		});
		
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
						}, function(){});
						
						location.reload();
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

	<!-- Header -->
	<header id="header">
		<div class="container">
			<div class="intro-text">
				<div class="intro-lead-in">Share Your Life!</div>
				<div class="intro-heading">Yolo</div>
				<a href="#main" class="page-scroll btn btn-xl">Look Around</a>
			</div>
		</div>
	</header>

	<!-- Main Grid Section -->
	<section id="main" style="z-index: 1;">
	
		<!-- 추천 -->
		<c:if test="${!empty sessionScope._USER_.userId}">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2 class="section-heading"
							style="font-family: 'Abel', sans-serif; font-weight: normal; color: #333; font-size: 35px">New Post</h2>
						<br /> <br />
						<h3 class="section-subheading text-muted">- 회원님을 위한 추천 -</h3>
					</div>
				</div>
				<div class="row" style="text-align: center;">
					<c:forEach items="${recommendList}" var="trip">
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
			</div>
		</c:if><br/>
		
 		<!-- Daily -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading"
						style="font-family: 'Abel', sans-serif; font-weight: normal; color: #333; font-size: 35px">New Post</h2>
					<br /> <br />
					<h3 class="section-subheading text-muted">- Daily Life -</h3>
				</div>
			</div>
			<div class="row" style="text-align: center;">
				<c:forEach items="${tripList}" var="trip">
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
		</div>
		<br />
		
		<!-- Trip -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h3 class="section-subheading text-muted">- Trip -</h3>
				</div>
			</div>
			<div class="row" style="text-align: center;">
				<c:forEach items="${tripList}" var="trip">
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
		</div> 
	</section>



	<%@include file="/WEB-INF/view/common/commonfooter.jsp"%>

	<div>
		<input id="loginUserId" type="hidden" name="sender" value="${user.userId}">
		<input id="receiver" type="hidden" name="receiver" value="This is not a asdf">
		<input id="content" type="hidden" name="content" value="">
	</div>
	
	<div><c:import url="http://192.168.201.29:3000"/></div>

	<!-- jQuery -->
	<script src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>

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
									<input class="btn btn-primary btn-block" type="button" id="loginBtn" value="Sign in" style="height: 30px; padding-top: 5px;"/>
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
	
	<!-- addUserId -->
	<div class="modal fade" id="addUserIdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 style="text-align: center;" class="modal-title" id="myModalLabel">
						홈페이지에서 사용할 ID를 입력해주세요!
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form id="addUserIdForm" style="width: 82%; margin: 0 auto">
								<div class="form-group">
									<input class="form-control" type="hidden" name="userNaverApiId" value="${sessionScope._USER_.userNaverApiId}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" name="userId" placeholder="ID">
								</div>
								<div class="form-group">
									<input class="btn btn-primary btn-block" type="button" id="submitBtm" value="Submit" style="height: 30px; padding-top: 5px;"/>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<style>
@import "https://fonts.googleapis.com/css?family=Source+Sans+Pro:700";

a>.tagBtn {
	color: #333;
	text-decoration: none;
	transition: 0.3s all ease;
	padding: 0px 20px;
	margin: 0;
	font-family: "Source Sans Pro", sans-serif;
	background: #F4F5EE;
	-webkit-font-smoothing: antialiased;
}

a>.tagBtn:hover {
	color: #B15947;
	text-decoration: none;
}

a>.tagBtn:focus {
	text-decoration: none;
	text-decoration: none;
}

a>.tagBtn:active {
	color: #FFF;
	text-decoration: none;
}

.flex {
	display: flex;
	align-items: center;
	justify-content: center;
	width: auto;
	height: auto;
}

.bttn {
	width: 70px;
	height: 70px;
	line-height: 70px;
	text-align: center;
	text-transform: uppercase;
	letter-spacing: 2px;
	font-weight: bold;
	position: relative;
	text-decoration: none;
}

.bttn:after {
	transition: 0.3s all ease;
	content: '';
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	border-radius: 3px;
	border: 2.4px solid #B15947;
	text-decoration: none;
}

.bttn:before {
	content: '';
	position: absolute;
	border-radius: 3px;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	background: transparent;
	z-index: -1;
	text-decoration: none;
}

.bttn:hover:after {
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	text-decoration: none;
}

.bttn:active {
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
	text-decoration: none;
}

.bttn:active:before {
	background-color: transparent;
	text-decoration: none;
}

.bttn:active:after {
	border-color: #f1481b;
	text-decoration: none;
}

.t1 {
	font-size: 12px;
	color: #7b94b0;
}

.t2 {
	font-size: 13px;
	color: #6a89b0;
}

.t3 {
	font-size: 14px;
	color: #5880b0;
}

.t4 {
	font-size: 16px;
	color: #4676b0;
}

.t5 {
	font-size: 18px;
	color: #356cb0;
}

.t6 {
	font-size: 19px;
	color: #2363b0;
}

.t7 {
	font-size: 24px;
	color: #1259b0;
}
</style>
	
	<div id="popularTagsDiv" style="z-index: 2;">
		<div class="flex"><a href="#0" class="bttn tagBtn" style="text-decoration: none">Tags</a></div>
		<div id="contentDiv" style="width:200px; height: 200px; display: none; margin-top: 20px;">
			<script type="text/javascript">
				var contentArray = [];
				var sizeArray = [];
				
				<c:forEach items="${contentArray}" var="content">
					contentArray.push("${content}");
				</c:forEach>
				
				<c:forEach items="${sizeArray}" var="size">
					sizeArray.push("${size}");
				</c:forEach>
				
				for ( var i in contentArray) {
					document.write("<a href='#' class='t" + sizeArray[i] + "' data-keyword='" + contentArray[i] + "' style='font-family: 'Nanum Pen Script''>"+ contentArray[i] + "</a>\n");
				}
			</script>
		</div> 
	</div>

</body>

</html>