<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script type="text/javascript">
	$().ready(function () {
		
		/* $("#adminSignInForm").find("input[type=button]").click(function () { */
			$("#adminSignInBtn").click(function(){
				console.log($("#authNm").val());
				console.log($("#authPw").val());
			$.post("<c:url value="/auth/adminSignIn"/>", $("#adminSignInForm").serialize(), function(data) {
				if(data == "OK") {
					alert("로그인 되었습니다.");
					window.location.href="<c:url value="/auth/home"/>";
				}
				else if(data="FAIL_1") {
					alert("비밀번호는 영소문자, 영대문자, 숫자, 특수문자로 이루어진 8글자 이상으로 입력해주세요.");
				}
				else if(data="FAIL_2"){
					alert("ID or Password가 맞지 않습니다.");
				}
			});
		});
		
		$("#adminSignUpBtn").click(function(){
			console.log($("#authNmUp").val());
			console.log($("#authPwUp").val());
			$.post("<c:url value="/auth/adminSignUp"/>", $("#adminSignUpForm").serialize(), function(data) {
				if(data == "OK") {
					alert("가입 완료 되었습니다. HOME으로 이동합니다.");
					window.location.href="<c:url value="/auth/home"/>";
				}
				else if(data="FAIL") {
					alert("비밀번호는 영소문자, 영대문자, 숫자, 특수문자로 이루어진 8글자 이상으로 입력해주세요.");
				}
			});
		});
		
		
		
	});
	
	google.charts.load('current', {packages: ['corechart','line']});  
	
</script>

<title>Auth List</title>
<style>

   /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    
    /* modal style */
    .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  	}
 	 .modal-footer {
      background-color: #f9f9f9;
  }
    
    
    
</style>
</head>

<body>
	<!-- 메인 네비 바 -->
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="#">Logo</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">Home</a></li>
	        <li><a href="#">About</a></li>
	        <li><a href="#">Projects</a></li>
	        <li><a href="#">Contact</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
          	<li><a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> Login</a>
          		<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						 <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header" style="padding:35px 50px;">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
					        </div>
					        <div class="modal-body" style="padding:40px 50px;">
					          <form role="form" id="adminSignInForm">
					            <div class="form-group">
					              <label for="authNm"><span class="glyphicon glyphicon-user"></span> Admin Name</label>
					              <input type="text" class="form-control" name="authNm" id="authNm" placeholder="Enter Admin Name">
					            </div>
					            <div class="form-group">
					              <label for="authPw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
					              <input type="text" class="form-control" name="authPw" id="authPw" placeholder="Enter password">
					            </div>
					              <input type="button" value="Login" id="adminSignInBtn" class="btn btn-success btn-block glyphicon glyphicon-off">
					          </form>
					        </div>
					        <div class="modal-footer" style="padding:35px 50px;">
					          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
						          
						          <input type="button" value="관리자 가입" class="btn btn-info" data-toggle="collapse" data-target="#adminSignUp">
								  <div id="adminSignUp" class="collapse" style="margin-top: 10px;">
								  
								  
						          		<form id="adminSignUpForm" class="signUp">
								              <label for="authNm"><span class="glyphicon glyphicon-user"></span>Admin Name</label>
								              <input type="text" class="form-control" name="authNm" id="authNmUp" placeholder="Enter Name">
								              <label for="authPw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
								              <input type="password" class="form-control" name="authPw" id="authPwUp" placeholder="Enter password">
								              <input type="button" value="완료" id="adminSignUpBtn" class="btn btn-success btn-block glyphicon glyphicon-off">
								              <br/>
								              <div class="g-recaptcha" data-sitekey="6LcLaysUAAAAABcIsw0Z2LiO4dY2qgNY08dnOuw_"></div>
						          		</form>
								  </div>
								  
					        </div>
					      </div>
					</div>
				</div>
          	</li>
     	 </ul>
	    </div>
	  </div>
	</nav>

	<!-- 메인 슬라이드 화면 -->
	<div class="container" style="height: 450px; margin-top: 20px;">
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner">
	      <div class="item active">
	      	<div id="container" style="width: 830px; height: 400px; margin: 0 auto;"></div>
				<script language="JavaScript">
					function drawChart() {
					   var data = new google.visualization.DataTable();
					   data.addColumn('string', 'Month');
					   data.addColumn('number', 'Tokyo');
					   
					   data.addRows([
					      ['1월',  7],
					      ['2월',  20 ],
					      ['3월',  3],
					      ['4월',  10],
					      ['5월',  200],
					      ['6월',  1],
					      ['7월',  140],
					      ['8월',  3],
					      ['9월',  10],
					      ['10월', 90],
					      ['11월',  30],
					      ['12월',  120]
					   ]);
					   
					   // Set chart options
					   var options = {'title' : '회원가입 현황 그래프',
					      hAxis: {
					         title: '2017년'
					      },
					      vAxis: {
					         title: '단위:명'
					      },
					      'background-color': 'gray',
					      'width':800,
					      'height':400,
					      pointsVisible: true	  
					   };
					
					   // Instantiate and draw the chart.
					   var chart = new google.visualization.LineChart(document.getElementById('container'));
					   chart.draw(data, options);
					}
					google.charts.setOnLoadCallback(drawChart);
				</script>
				
			<!-- 슬라이드 문구 -->	
	        <div class="carousel-caption" style="color: black; margin-bottom: 300px;">
	          <h3>회원가입 현황</h3>
	        </div>
	      </div>			
		  <!-- 슬라이드 아이템 -->
	      <div class="item">
	        <div>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		
	      	</div>
	        <div class="carousel-caption">
	          <h3>Chicago</h3>
	          <p>Thank you, Chicago!</p>
	        </div>
	      </div>
	    
	      <div class="item">
	        <div>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		<p align="center">afasdfasdf</p>
	      		
	      	</div>
	        <div class="carousel-caption">
	          <h3>New York</h3>
	          <p>We love the Big Apple!</p>
	        </div>
	      </div>
	  
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="color: black;">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>
	</div>
	
	<div class="container_userList" >
	<a href="#userList" class="btn btn-info" data-toggle="collapse">회원 목록</a>
		<div id="#userList" class="collapse" >
		<p>총 00명</p>
		
		<!-- 사용자 목록 불러오기-->
			<div class="userList" style="margin-top: 20px;">
				<table class="table">
					<thead>
				      <tr>
				        <th>NO.</th>
				        <th>ID</th>
				        <th>NAME</th>
				        <th>JOIN_DATE</th>
				        <th>KAKAO_ID</th>
				        <th>NAVER_ID</th>
				        <th>Authorization</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:forEach items="${userList}" var="user">
				      <tr>
				        <td>${user.index}</td>
				        <td>${user.userId}</td>
				        <td>${user.userName }</td>
				        <td>${user.joinDate }</td>
				        <td>${user.userNaverApiId }</td>
				        <td>${user.userKakaoApiId }</td>
				        <td>${user.authId }</td>
				      </tr>
				     </c:forEach>
				    </tbody>
	  			</table>
			</div>
 		 </div>
	</div>
	
	<div class="row">
		${pager}
		<c:if test="${!empty sessionScope._USER_}"></c:if>
	</div>
	
	

</body>
</html>