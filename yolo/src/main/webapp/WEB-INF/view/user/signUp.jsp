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

<title>Yolo : Sign Up</title>

<style type="text/css">

/* /* nav bar search box - drop down menu button */
.navbar .navbar-search .dropdown-menu {
	min-width: 25px;
}

.dropdown-menu .label-icon {
	margin-left: 5px;
}

* /

.wrap {
	width: 100%;
	height: 100%;
	min-height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 99;
}

p.form-title {
	font-family: 'Open Sans', sans-serif;
	font-size: 20px;
	font-weight: 600;
	text-align: center;
	color: #7f7f7f;
	margin-top: 5%;
	text-transform: uppercase;
	letter-spacing: 4px;
}

form {
	width: 250px;
	margin: 0 auto;
}

form.login input[type="text"], form.login input[type="password"] {
	width: 100%;
	margin: 0;
	padding: 5px 10px;
	background: 0;
	border: 0;
	border-bottom: 1px solid #ccc;
	outline: 0;
	font-style: italic;
	font-size: 12px;
	font-weight: 400;
	letter-spacing: 1px;
	margin-bottom: 5px;
	color: #ccc;
	outline: 0;
}

form.login input[type="submit"] {
	width: 100%;
	font-size: 14px;
	text-transform: uppercase;
	font-weight: 500;
	margin-top: 16px;
	outline: 0;
	cursor: pointer;
	letter-spacing: 1px;
}

form.login input[type="submit"]:hover {
	transition: background-color 0.5s ease;
}

form.login .remember-forgot {
	float: left;
	width: 100%;
	margin: 10px 0 0 0;
}

form.login .forgot-pass-content {
	min-height: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
}

form.login label, form.login a {
	font-size: 12px;
	font-weight: 400;
	color: #FFFFFF;
}

form.login a {
	transition: color 0.5s ease;
}

form.login a:hover {
	color: #d66f11;
}

.pr-wrap {
	width: 100%;
	height: 100%;
	min-height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 999;
	display: none;
}

.show-pass-reset {
	display: block !important;
}

.pass-reset {
	margin: 0 auto;
	width: 250px;
	position: relative;
	margin-top: 22%;
	z-index: 999;
	background: #FFFFFF;
	padding: 20px 15px;
}

.pass-reset label {
	font-size: 12px;
	font-weight: 400;
	margin-bottom: 15px;
}

.pass-reset input[type="email"] {
	width: 100%;
	margin: 5px 0 0 0;
	padding: 5px 10px;
	background: 0;
	border: 0;
	border-bottom: 1px solid #000000;
	outline: 0;
	font-style: italic;
	font-size: 12px;
	font-weight: 400;
	letter-spacing: 1px;
	margin-bottom: 5px;
	color: #000000;
	outline: 0;
}

.pass-reset input[type="submit"] {
	width: 100%;
	border: 0;
	font-size: 14px;
	text-transform: uppercase;
	font-weight: 500;
	margin-top: 10px;
	outline: 0;
	cursor: pointer;
	letter-spacing: 1px;
}

.pass-reset input[type="submit"]:hover {
	transition: background-color 0.5s ease;
}

.posted-by {
	position: absolute;
	bottom: 26px;
	margin: 0 auto;
	color: #FFF;
	background-color: rgba(0, 0, 0, 0.66);
	padding: 10px;
	left: 45%;
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

</head>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	$().ready(function () {
		
		$('.forgot-pass').click(function(event) {
			$(".pr-wrap").toggleClass("show-pass-reset");
		}); 
			
		$('.pass-reset-submit').click(function(event) {
			$(".pr-wrap").removeClass("show-pass-reset");
		}); 

		$("#signUpForm").find("input[type=button]").click(function () {
			$.post("<c:url value="/user/signUp"/>", $("#signUpForm").serialize(), function(data){
				if(data == "OK") {
					alert("회원가입이 완료 되었습니다.");
					window.location.href="<c:url value="/yolo/home"/>";
				}
				else if(data=="FAIL") {
					alert("비밀번호는 영소문자, 영대문자, 숫자, 특수문자로 이루어진 8글자 이상으로 입력해주세요.");
				}
			});
		});
		
		$("#loginBtn").click( function() {
			$.post(
				"<c:url value="/user/signIn" />",
				$("#signInForm").serialize(),
				function(data) {
					if (data == "OK") {
						location.reload();
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
				var user = {
					userId : userId
					, email : email
					, userName : userName
					, profile_image : profile_image
					, enc_id : enc_id
					, age : age
					, gender : gender
					, name : name
					, birthday : birthday
				};
				
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
					alert("user.userName = " + user.userName);
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
				<a class="navbar-brand page-scroll" href="<c:url value="/home" />">`Solo</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href="<c:url value="/home#main" />" id="mainBtn">Main</a>
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
	<section id="list">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="wrap">
						<p class="form-title" style="margin-bottom: 45px;">Sign Up</p>
						<form id="signUpForm" class="login">
							<input type="text" name="userId" placeholder="아이디를 입력하세요" style="color: #7f7f7f; margin-bottom: 20px;"/><br/>
							<input type="text" name="password" placeholder="비번을 입력하세요" style="color: #7f7f7f; margin-bottom: 20px;"/><br/>
							<input type="text" name="userName" placeholder="이름을 입력하세요" style="color: #7f7f7f; margin-bottom: 20px;"/><br/>
							<input type="button" id="signUpButton" class="btn btn-success btn-sm" value="Submit" 
								style=" width: 250px; margin-top: 25px; font-family: 'Open Sans', sans-serif; font-size: 12px; letter-spacing: 4px; text-transform: uppercase;"/>			
						</form>
					</div>
				</div>
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
	
	<!-- SignIn Modal -->
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