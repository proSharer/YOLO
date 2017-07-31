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
	</style>

</head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
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
				<a class="navbar-brand page-scroll" href="#page-top">`Solo</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href="#main" id="mainBtn">Main</a>
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
	<section id="main">
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
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal1" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/roundicons.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Round Icons</h4>
						<p class="text-muted">Graphic Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/startup-framework.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Startup Framework</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal3" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/treehouse.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Treehouse</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal4" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/golden.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Golden</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal5" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/escape.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Escape</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal6" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/dreams.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Dreams</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
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
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal1" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/roundicons.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Round Icons</h4>
						<p class="text-muted">Graphic Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal2" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/startup-framework.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Startup Framework</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal3" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/treehouse.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Treehouse</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal4" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/golden.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Golden</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal5" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img src="<c:url value="/static/img/escape.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Escape</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a href="#portfolioModal6" class="portfolio-link"
						data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content"></div>
						</div> <img src="<c:url value="/static/img/dreams.png"/>"
						class="img-responsive" alt="">
					</a>
					<div class="portfolio-caption">
						<h4 style="text-transform: none; margin: 0; font-family: 'Abel', sans-serif; font-size: 19px;">Dreams</h4>
						<p class="text-muted">Website Design</p>
					</div>
				</div>
			</div>
		</div>
	</section>



	<%@include file="/WEB-INF/view/common/commonfooter.jsp"%>

	<!-- Portfolio Modals -->
	<!-- Use the modals below to showcase details about your portfolio projects! -->

	<!-- Portfolio Modal 1 -->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-lg-offset-2">
							<div class="modal-body">
								<!-- Project Details Go Here -->
								<h2>Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-responsive img-centered"
									src="img/portfolio/roundicons-free.png" alt="">
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<p>
									<strong>Want these icons in this portfolio item
										sample?</strong>You can download 60 of them for free, courtesy of <a
										href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>,
									or you can purchase the 1500 icon set <a
										href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.
								</p>
								<ul class="list-inline">
									<li>Date: July 2014</li>
									<li>Client: Round Icons</li>
									<li>Category: Graphic Design</li>
								</ul>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">
									<i class="fa fa-times"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <div><c:import url="http://192.168.201.29:3000"/></div> --%>
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

</body>

</html>