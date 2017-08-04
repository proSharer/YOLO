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

<title>Yolo : My Page</title>

<style type="text/css">

/* /* nav bar search box - drop down menu button */
.navbar .navbar-search .dropdown-menu {
	min-width: 25px;
}

.dropdown-menu .label-icon {
	margin-left: 5px;
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

#tripListBtn, #replyListBtn {
	border: 0px transparent;
	border-radius: 5px;
	height: 25px;
	width: 120px;
	background-color: #d1d0cf;
	color: #777;
	margin-top: 10px;
	margin-left: 10px;
}

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
	margin-left: 43%;
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

.tabs-menu {
	margin-top: 13px;
	height: 32px;
	float: left;
	clear: both;
	list-style:none;
}

.tabs-menu li {
	height: 30px;
	line-height: 30px;
	float: left;
	margin-right: 10px;
	background-color: #ccc;
	border-top: 1px solid #d4d4d1;
	border-right: 1px solid #d4d4d1;
	border-left: 1px solid #d4d4d1;
}

.tabs-menu li.current {
	position: relative;
	background-color: #fff;
	border-bottom: 1px solid #fff;
	z-index: 5;
	border-radius: 3px;
}

.tabs-menu li a {
	padding: 10px;
	text-transform: uppercase;
	color: #fff;
	text-decoration: none;
	border-radius: 3px;
}

.tabs-menu .current a {
	color: #b2b2b2;
}

.tab {
	border: 1px solid #d4d4d1;
	background-color: #fff;
	float: left;
	margin-bottom: 20px;
	width: auto;
}

.tab-content {
	width: 660px;
	padding: 20px;
	display: none;
}

#tripList {
	display: block;
}
</style>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/static/css/bootstrap.min.css"/>"
	rel="stylesheet">

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

<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready( function() {
		$("#profileDivBtn").click(function() {
			$("#pw").val("");
			$("#change1Div").css({
				"display" : "none"
			});
			$("#change3Div").css({
				"display" : "none"
			});
			$("#change2Div").css({
				"display" : "block"
			});
		});

		$("#postDivBtn").click(function() {
			$("#change1Div").css({
				"display" : "block"
			});
			$("#change2Div").css({
				"display" : "none"
			});
		});

		$("#modifyBtn").click(function() {
			$.post(
				"<c:url value="/user/mypage/profile"/>",
				$("#userModifyForm").serialize(),
				function(data) {
					if (data == "OK") {
						alert("수정이 완료 되었습니다.");
						window.location.href = "<c:url value="/home"/>";
					} else if (data == "FAIL") {
						alert("수정이 실패 하였습니다.");
					}
			});
		});
		$("#tripListBtn").click(function(){
			$("#tripList").css({
				"display" : "block"
			});
			$("#replyList").css({
				"display" : "none"
			});
		});
		$("#replyListBtn").click(function(){
			$("#replyList").css({
				"display" : "block"
			});
			$("#tripList").css({
				"display" : "none"
			});
		});
		$("#confirmBtn").click(function(){
			$.post("<c:url value="/user/cofrimPassword"/>",{
				"password" : $("#pw").val()
			},function(response){
				var res = JSON.parse(response);
				if( res.status == "success") {
					//alert("성공!");
					$("#pwCheck").css("display","none");
					$("#change3Div").css({
						"display" : "block"
					});
					$("#change2Div").css({
						"display" : "none"
					});
					
				}
				else{
					alert("올바르지 않은 비밀번호 입니다.");
				}
			});
		});
		$("#modifyBtn").click(function(){
			$.post("<c:url value="/user/verify"/>",{
				"password" : $("#modifyPw").val()
			},function(response){
				var res = JSON.parse(response);
				if ( res.status == "fail" ){
					alert("비밀번호는 영소문자, 영대문자, 숫자, 특수문자로 이루어진 8글자 이상으로 입력해주세요.");
				}
				else{
					$("#modifyForm").attr({
						"action" : "<c:url value="/user/modify"/>",
						"method" : "post"
					}).submit();
				}
			});
		});
 		$("#confirmPw").keydown(function() {
 			console.log("움직");
			if( $("#modifyPw").val() != $("#confirmPw").val() ){
				$("#pwCheck").css("display","block");
			}
			if( $("#modifyPw").val() == $("#confirmPw").val() ){
				$("#pwCheck").css("display","none");
			}
		});
		$("#confirmPw").keyup(function() {
			if( $("#modifyPw").val() != $("#confirmPw").val() ){
				$("#pwCheck").css("display","block");
			}
			if( $("#modifyPw").val() == $("#confirmPw").val() ){
				$("#pwCheck").css("display","none");
			}
		});
		
		$(".tabs-menu a").click(function(event) {
	        event.preventDefault();
	        $(this).parent().addClass("current");
	        $(this).parent().siblings().removeClass("current");
	        var tab = $(this).attr("href");
	        $(".tab-content").not(tab).css("display", "none");
	        $(tab).fadeIn();
	    });
	});
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
							<li><a href='<c:url value="/trip/list" />'
								class="page-scroll" id="tripBtn">Trip</a></li>
						</ul></li>

					<c:choose>
						<c:when test="${user eq null}">
							<li><a class="page-scroll"
								href="<c:url value="/user/signIn" />" id="loginBtn">Login</a></li>
							<li><a class="page-scroll"
								href="<c:url value="/user/signUp" />" id="joinBtn">Join</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="page-scroll" href="#myPage" id="mypageBtn">MyPage</a>
							</li>
							<li><a class="page-scroll" href="<c:url value="/chat" />" id="chatBtn">Chat</a>
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
	<section id="myPage">
		<div class="container">
			<div class="row" style="margin: auto;">
				<div style="display: inline-block; float: left; width: 25%; height: 640px;">
					<div style="border-top position: absolute; top: 50%; height: 120px; top: 50%; height: 120px; margin-left: 24px;">
						<a href="#" id="profileDivBtn">My Profile</a><br /> 
						<a href="#" id="postDivBtn" style="margin-top: 20px;">My Post/Reply/Msg</a>
					</div>
				</div>
				<div id="change1Div" style="display: block;">
					<div style="display: inline-block; float: left; width: 40%; height: auto;">
						<div style="margin-bottom: 3px; vertical-align:middle; height: 40px; font-family: Montserrat, Helvetica Neue, Helvetica, Arial, sans-serif; padding-top: 7px;">
							<div style="font-size: 15px; display: inline-block; color: #b2b2b2; padding-right: 76%;">
							Message
							</div>
							<input id="writeMessageBtn" type="button" value="+" style="border-bottom-color: #e2b81f; border-style: double; border-right-color: #e2b81f; border-top-color: transparent; border-left-color: transparent; border-radius: 3px; font-weight: bold; color: white; background-color: rgba(255, 204, 20, 0.6);"
								onclick="window.open('/yolo/message/write','window', 'width=450,height=400')"/>
						</div>
						<div style="border-radius: 7px; border: 1px solid #d4d4d1; height: 290px; margin-bottom: 17px; width: 96%">
							<div style="padding:10px; padding-left: 23px;"> 
								받은쪽지함<br/><br/>
								<table> 
									<tr>
										<th style="width:25%;">Sender</th>
										<th style="width:40%;">Content</th>
										<th style="width:50%;">Date</th>
									</tr>
									<c:forEach items="${MessagesByReceiver}" var="message">
										<tr>
											<td>${message.sender} </td>
											<td>
												 <a href="#"><p style="display:inline;" onclick="window.open('/yolo/message/receive/detail/${message.messageId}','window', 'width=500,height=410')"> ${message.content} </p></a>
											</td> 
										 	<td>${message.sendTime}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						
						<div style="border-radius: 7px; border: 1px solid #d4d4d1; height: 290px; width: 96%">
							<div style="padding:10px; padding-left: 23px;"> 
								보낸쪽지함<br/><br/>
								<table>
									<tr>
										<th style="width:25%;">Receiver</th>
										<th style="width:40%;">Content</th>
										<th style="width:50%;">Date</th>
									</tr>
									<c:forEach items="${MessagesBySender}" var="message">
										<tr>
											<td>${message.receiver} </td>
											<td>
												 <a href="#"><p style="display:inline;" onclick="window.open('/yolo/message/send/detail/${message.messageId}','window', 'width=500,height=410')"> ${message.content} </p></a>
											</td> 
										 	<td>${message.sendTime}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					
					<div id="tabs-container" style="display: inline-block; float: left; width: 35%; height: 640px">
						<ul class="tabs-menu">
							<li class="current"><a href="#tripList">My Post</a></li>
							<li><a href="#replyList">My Reply</a></li>
						</ul>
						<div class="tab" style="border-radius: 7px; width: 100%; height: 93.5%; margin-top: -13px;">
								<div class="tab-content" id="tripList" style="padding:10px; padding-left: 30px;"> 
			 						<table>
										<tr>
											<th style="width:55%;">Title</th>
											<th style="width:40%;">Date</th>
										</tr>
										<c:forEach items="${tripList}" var="trip">
											<tr>
												<td>
													 <a href="#"><p style="display:inline;" onClick="javascript:self.location='/yolo/trip/detail/${trip.tripId}';"> ${trip.title}</p></a>
													
												</td>
												<td>${trip.createDate}</td>
											</tr>
										</c:forEach>
									</table>
								</div>	
								<div class="tab-content" id="replyList" style="padding:10px; padding-left: 30px; display:none;"> 
			 						<table>
										<tr>
											<th style="width:35%;">Writer</th>
											<th style="width:30%;">Content</th>
										</tr>
										<c:forEach items="${tripReplyList}" var="reply">
											<tr>
												<td>${reply.userId}</td>
												<td>
													 <a href="#"><p style="display:inline;" onClick="javascript:self.location='/yolo/trip/detail/${reply.tripId}';">${reply.content}</p></a>
													
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
						</div>
					</div>
					
				</div>
				<div id="change2Div" style="display: none;">
					<div class="wrap">
 						<p class="form-title" style="margin-bottom: 45px;">비밀번호 확인</p> 
						<form id="confirmForm" class="login">
							<input type="password" name="password" id="pw" placeholder="비밀번호를 입력하세요" style="color: #7f7f7f; margin-bottom: 20px;"/><br/>
							<input type="button" id="confirmBtn" class="btn btn-success btn-sm" value="Submit" 
								style=" width: 250px; margin-top: 25px; font-family: 'Open Sans', sans-serif; font-size: 12px; letter-spacing: 4px; text-transform: uppercase;"/>			
						</form>
					</div>
				</div>
				<div id="change3Div" style="display: none;">
					<div class="wrap">
 						<p class="form-title" style="margin-bottom: 45px;">비밀번호 변경</p> 
						<form id="modifyForm" class="login">
							<input type="text" name="userId" value="${user.userId}" readonly style="color: #7f7f7f; margin-bottom: 20px;"/><br/>
							<input type="text" name="userName" value="${user.userName}" readonly style="color: #7f7f7f; margin-bottom: 20px;"/><br/>
							<input type="password" id="modifyPw" name="password" placeholder="새로운 비밀번호를 입력하세요" style="color: #7f7f7f; margin-bottom: 20px;"/><br/>
							<input type="password" id="confirmPw" placeholder="비밀번호 확인" style="color: #7f7f7f; margin-bottom: 5px;"/><br/>
							<p id="pwCheck" style="color: red; display: none;"> 일치한 비밀번호를 입력해주세요. </p>
							<input type="button" id="modifyBtn" class="btn btn-success btn-sm" value="Submit" 
								style=" width: 250px; margin-top: 25px; font-family: 'Open Sans', sans-serif; font-size: 12px; letter-spacing: 4px; text-transform: uppercase;"/>			
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/WEB-INF/view/common/commonfooter.jsp"%>

	<div>
		<c:import url="http://192.168.201.29:3000" />
	</div>
	<div>
		<input id="loginUserId" type="hidden" name="sender"
			value="${user.userId}"> <input id="receiver" type="hidden"
			name="receiver" value="This is not a asdf"> <input
			id="content" type="hidden" name="content" value="">
	</div>

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