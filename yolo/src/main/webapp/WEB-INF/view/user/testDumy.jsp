<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
/* YOLO LOGIN */
$().ready(function () {
	// SignIn Btn
	$("#signInForm").find("input[type=button]").click(function () {
		$.post("<c:url value="/user/loginTotal" />", $("#signInForm").serialize(), function(data) {
			if ( data == "OK" ) {
				window.location.href = "<c:url value="/yolo/home"/>";
			}
			else if (data == "FAIL") {
				alert("아이디 또는 비밀번호를 확인해 주세요.");
				//location.reload().href="<c:url value="/user/login"/>";
			}
		});
	}); 
	
	// SignUp Btn
	 $("#signUpForm").find("input[type=button]").click(function () {
	$.post("<c:url value="/user/signUp"/>", $("#signUpForm").serialize(), function(data){
			if(data == "OK") {
				alert("회원가입이 완료 되었습니다. 로그인 하십시요.");
				window.location.href="<c:url value="/user/login"/>";
			}
			else if(data=="FAIL") {
				alert("비밀번호는 영소문자, 영대문자, 숫자, 특수문자로 이루어진 8글자 이상으로 입력해주세요.");
			}
		});
	}); 
	
	// MainPage LoginBtn
	$(".loginBtn1").on("click", function(){
		$(".overay").show();
	});
	
	// SIGNUP
	$(".signUpBtn").on("click", function(){
		$(".SignUp").animate({"height":"toggle"}, function(){
			$(".classicLogin").hide();
		});
	});
});
</script> 

<title>loginTotal</title>

<style type="text/css">

	 body{
		position: relative;
	}
	
	html,body{
		width: 100%;
		height: 100%
	} 
	.loginBtn1{
		cursor: pointer;
	}
	
	.overay{ 
		overflow: hidden;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
		position: relative;
		display: none;
		z-index: 1;
	}
	
	 .classicLogin{
		width: 200px;
		height: 300px;
		position: relative;
		background-color: #fefefe;
		margin: 15% auto; /* 15% from the top and centered */
		padding: 10px;
		border: 1px solid #888;
		width: 30%;
	} 
	
	  .SignUp{
		width: 200px;
		height: 300px;
		position: relative;
		background-color: #fefefe;
		margin: -15% auto; /* 15% from the top and centered */
		padding: 10px;
		border: 1px solid #888;
		width: 30%;
	} 
	 
	.sns{
		
	}
</style>

</head>
<body>
<p class="loginBtn1">로그인</p>
	<div class="overay">
		<div class="classicLogin" align="left">
			<form id="signInForm">
				ID  <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" /><br/>
				PW <input type="password" id="password" name="password" placeholder="비빌번호를 입력하세요" /><br/>
				<input type="button" class="loginBtn2" value="로그인" />
			</form>
			아직 회원이 아니세요?? <input type="button" id="signUpBtn" class="loginBtn2" value="회원가입 " />
				
			 <div class="SignUp"> 
			 
				<!-- <form id="signUpForm">
					<input type="text" name="userId" placeholder="아이디를 입력하세요" /><br/>
					<input type="text" name="password" placeholder="비번을 입력하세요" /><br/>
					<input type="text" name="userName" placeholder="이름을 입력하세요" /><br/>
					<input type="button" id="signUpButton" value="가입하기" />			
				</form> -->
			</div> 
			
			<hr/>
			
			<div class="sns" align="center">
				<!-- NAVER LOGIN -->
				<a href="#" onclick=" window.open('<c:url value="/user/loginNaver"/>','window팝업','width=300, height=300, menubar=no, status=no, toolbar=no' );">
					<img src="<c:url value="/static/img/naver.png"/>" width="222" height="49">
				</a>
				<p> </p>
				<!-- KAKAO LOGIN --> 
			<a id="custom-login-btn" href="javascript:loginWithKakao()">
				<img src="<c:url value="/static/img/kakao.png"/>">
			</a>
			<br/>
			<script type='text/javascript'>
				Kakao.init('0f781a605b819e1f04c6b923541b8eb9');
				function loginWithKakao() {
				// 로그인 창을 띄웁니다.
					Kakao.Auth.login({
						success: function(authObj) 
						{
							alert(JSON.stringify(authObj));
						},
						fail: function(err) 
						{
						alert(JSON.stringify(err));
						}
					});
				};
			</script>
			</div>
		</div>
	</div>
	 <script type="text/javascript">
	
	</script>
	

	
</body>
</html>