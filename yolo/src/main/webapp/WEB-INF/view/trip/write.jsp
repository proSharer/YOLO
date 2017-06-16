<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>

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

#searchText:focus {
	
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->

</head>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrX88apxamUwGdt3GMcN-P3b_C0qFrQBo&libraries=places"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.geocomplete.min.js"/>"></script>
<script src="<c:url value="/static/js/logger.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		var options = {
		   map: ".map_canvas",
		   location: "방배역"
		};
		        
		$("#geocomplete0").geocomplete(options);
		
		var i=0;
		
		$("#addBtn").click(function(){
			
			i++;

			var appendPart = "<div class='part'>" +"<input type='text' name='tripPartVO["+i+"].startTime' placeholder='시작시간'><br/>"+
			"<input type='text' name='tripPartVO["+i+"].endTime' placeholder='끝나는시간'><br/>"+
			"<input type='text' name='tripPartVO["+i+"].place' placeholder='장소를 입력해주세요'><br/>"
			+"<input id='geocomplete"+i+"' class='contorls' type='text' name='tripPartVO["+i+"].map'"+
				"placeholder='상세주소를 입력해주세요.' size='90' onClick='value=''' />"+
			"<div class='map_canvas'></div>"+
			"<select name='tripPartVO["+i+"].timeControl'>"+
			    "<option value=''>시간구분</option>"+
			    "<option value='오전'>오전</option>"+
			    "<option value='오후'>오후</option>"+
			"</select>"+ "<input type='file' name='tripPartVO["+i+"].file' id='imgInp"+ i +"'><br/><img id='blah"+ i +"' src='#' /> <br/>" + 
			"<textarea name='tripPartVO["+i+"].content' placeholder='내용을 입력해주세요'></textarea><br/><hr/>"+
			"</div> </div>";
			
			$(".tripPart").append(appendPart);
			
			var imgInp = "imgInp" + i;
			var blah = "blah"+ i;
			
/* 			console.log(geocomplete);
			$(geocomplete).geocomplete(options); */
			
	        $(".tripPart").on("change","#"+imgInp ,function(){
	            readtoURL(this);
	        
				function readtoURL(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();
							reader.onload = function (e) {
								$('#'+blah).attr('src', e.target.result);
			            	}
			          reader.readAsDataURL(input.files[0]);
			        	}
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
					<input type="text" name="title" placeholder="제목">
					<div class="tripPart">
						<div class="part">
							<input type="text" name="tripPartVO[0].startTime" placeholder="시작시간"><br/>
							<input type="text" name="tripPartVO[0].endTime" placeholder="끝나는시간"><br/>
							<input type="text" name="tripPartVO[0].place" placeholder="장소를 입력해주세요"><br/>
						
								<input id="geocomplete0" class="contorls" type="text" name="tripPartVO[0].map" 
								placeholder="상세주소를 입력해주세요." size="90" onClick="value=''" />
				
							<div class="map_canvas"></div>
							
							
							<select name="tripPartVO[0].timeControl">
							    <option value="">시간구분</option>
							    <option value="오전">오전</option>
							    <option value="오후">오후</option>
							</select>
							
								
					        <input type="file" name="tripPartVO[0].file" id="imgInp0"><br/>
					        <img id="blah0" src="#" /><br/>
			
							<textarea name="tripPartVO[0].content" placeholder="내용을 입력해주세요"></textarea><br/><hr/>
						</div>
					</div>
					<input type="button" id="addBtn" value="+">
					
					<textarea id="overAll" name="overAll" placeholder="총평을 입력해주세요"></textarea>
					
					<input type="button" id="writeBtn" value="submit">
					
				</form:form>
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