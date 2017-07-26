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

<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function () {
		$("#profileDivBtn").click(function() {
			$("#change1Div").css({"display" : "none"});
			$("#change2Div").css({"display" : "block"});
		});
		
		$("#postDivBtn").click(function() {
			$("#change1Div").css({"display" : "block"});
			$("#change2Div").css({"display" : "none"});
		});
		
		$("#modifyBtn").click(function () {
			$.post("<c:url value="/user/mypage/profile"/>", $("#userModifyForm").serialize(), function(data){
				if(data == "OK") {
					alert("수정이 완료 되었습니다.");
					window.location.href="<c:url value="/home"/>";
				}
				else if(data=="FAIL") {
					alert("수정이 실패 하였습니다.");
				}
			});
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
							<li><a href='<c:url value="/trip/list" />' class="page-scroll" id="tripBtn">Trip</a>
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
								href="#myPage" id="mypageBtn">MyPage</a>
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
				<div style="display:inline-block; float:left; width: 25%; height: 640px;">
					<div style="border-top position: absolute; top: 50%; height: 120px; top: 50%; height: 120px; margin-left: 24px;">
<!-- 					<div style="border:1px solid; position: absolute; top: 50%; height: 120px; top: 50%; height: 120px; margin-left: 24px;"> -->
						<a href="#" id="profileDivBtn">My Profile</a><br/>
						<a href="#" id="postDivBtn">My Post/Reply/Msg</a>
					</div>
				</div>
				<div id="change1Div" style="display:block;">
					<div style="display:inline-block; float:left; width: 40%; height: auto;">
						<div style="background-color: green; height:320px;"></div>
						<div style="background-color: orange; height:320px;"></div>
					</div>
					<div style="background-color: red; display:inline-block; float:left; width: 35%; height: 640px"></div>
				</div>
				<div id="change2Div" style="display:none;">
					<%-- <jsp:include page="/WEB-INF/view/user/myPageProfile.jsp"></jsp:include> --%>
					<form id="userModifyForm" class="modify" >
						<input type="hidden" name="userId" value="${user.userId}"/>
						ID : ${user.userId}<br/>
						PW : <input type="text" name="password" value="${user.password}"><br/>
						NAME : <input type="text" name="userName" value="${user.userName}"><br/>
						Grade : ${user.authId}<br/>
						Join Date : ${user.joinDate}<br/>
						<input type="button" id="modifyBtn" value="submit">
					</form>
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

</body>

</html>