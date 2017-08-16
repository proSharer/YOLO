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
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
$().ready(function(){
	

	$(".likeBtn").click(function(){
		var likeVal = $("#like").val();
		if( likeVal == "false" ){
			$.ajax({
			url : "<c:url value="/daily/likeCountPlus"/>",
			dataType : "json",
			type : "post",
			data : {
				"dailyId" : $("#dailyId").val()
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
			url : "<c:url value="/daily/likeCountMinus"/>",
			dataType : "json",
			type : "post",
			data : {
				"dailyId" : $("#dailyId").val()
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
	
	
	
});

</script>






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

</style>




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
<h1> 디테일 페이지</h1>
<input type="hidden" id="like" value="${like}"/>
<input type="hidden" id="dailyId" value="${dailyVO.dailyId}"/>

<table>
	
<c:forEach items = "${dailyVOs}"  var = "dailyParts">
	

	<tr>
		<td><h2>${dailyParts.dailyPartId}</h2></td>
	</tr>
	<tr>
		<td>시간 : ${dailyParts.timeController} ${dailyParts.startTime}시~${dailyParts.endTime}시</td>
	</tr>   
	<tr>
	    <td>장소 : ${dailyParts.place}</td> 
	</tr>
	<br/>
	
	<tr>
		<td>
			<img src = "<c:url value ="/daily/download/${dailyParts.dailyPartId}"/>" width="600px" height="600px" /><br/>
		</td>
	<tr/>
	<tr>
		<td>${dailyParts.content}</td>
	<tr/>
	
</c:forEach>








</table>

	<div style="text-align: right; margin-right: 20px">
					좋아요 : <span id="likeCount"> ${dailyMain.dailyId}</span>
					<c:if test="${!empty sessionScope._USER_.userId}">
						<c:if test="${!like}">
							<input style="width: 30px; height: 30px; background-color: transparent; border-color: transparent;" type="button" class="likeBtn" value="♡"/>
						</c:if>
						
						<c:if test="${like}">
							<input style="width: 30px; height: 30px; background-color: transparent; border-color: transparent;" type="button" class="likeBtn" value="♥"/>
						</c:if><br/>
						
					</c:if> 



	<p>
		<a href="<c:url value ="/daily/delete/${dailyVO.dailyId}"/>" >삭제하기</a>
	</p>
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