<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://fonts.googleapis.com/css?family=Damion|Roboto+Slab|Rokkitt|Abel"
	rel="stylesheet">

<style type="text/css">
.flexsearch--wrapper {
	height: auto;
	width: auto;
	max-width: 100%;
	overflow: hidden;
	background: transparent;
	margin: 0;
	position: static;
}

.flexsearch--form {
	overflow: hidden;
	position: relative;
}

.flexsearch--input-wrapper {
	padding: 0 66px 0 0; /* Right padding for submit button width */
	overflow: hidden;
}

.flexsearch--input {
	width: 100%;
}

/***********************
 * Configurable Styles *
 ***********************/
.flexsearch {
	padding: 0 10px 0 10px; /* Padding for other horizontal elements */
}

.flexsearch--input {
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
	height: 30px;
	padding: 0 46px 0 10px;
	border-color: rgba(209, 208, 207, 0.6);
	border-radius: 13px; /* (height/2) + border-width */
	border-style: solid;
	border-width: 4px;
	margin-top: 15px;
	color: #777;
	font-family: 'Helvetica', sans-serif;
	font-size: 15px;
	-webkit-appearance: none;
	-moz-appearance: none;
}

.flexsearch--submit {
	position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 60px;
	height: 60px;
	padding: 0;
	border: none;
	margin-top: 6px; /* margin-top + border-width */
	background: transparent;
	color: #777;
	font-family: 'Helvetica', sans-serif;
	font-size: 23px;
	line-height: 60px;
}

.flexsearch--input:focus {
	outline: none;
	border-color: #fed136;
}

.flexsearch--input:focus.flexsearch--submit {
	color: #fed136;
}

.flexsearch--submit:hover {
	color: #fed136;
	cursor: pointer;
}

::-webkit-input-placeholder {
	color: #777;
}

input:-moz-placeholder {
	color: #777
}

#submitMsgBtn {
	border: 0px transparent;
	border-radius: 5px;
	height: 25px;
	width: 65px;
	background-color: #d1d0cf;
	color: #777;
	margin-top: 10px;
	margin-left: 80%;
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
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">

	$().ready(function() {
		
		var currentUrl = location.href.split('/');
		if (currentUrl.length > 6) {
			$("#searchDiv").css("display", "none");
			$("#writeDiv").css("display", "block");
		}
		
		var result = document.createElement('div');
		
		$("#userSearchBtn").click(function() {
			var userId = $("#userId").val();
			
			$.ajax({
				type : "POST",
				url : "<c:url value="/user/findById/" />" + userId,
				cache : true,
				data : $("userSearchForm").serialize(),
				success : function(data) {
					result.innerHTML = "<div class='results' data-userId='" + data.userId + "'><a class='userIdA' href='/yolo/message/write/" + data.userId + "'>" + data.userId + " - " + data.userName + "</a></div>";
					document.getElementById('resultDiv').appendChild(result);
				},
				error : function(data) {
					console.log("failed...");
				}
			});
		});
	});
</script>
	
	<div id="searchDiv" style="display: block;">
		<div style="color: #777; margin-left: 13px; margin-top: 15px; font-size: 15px; font-weight: bold;">
		Write ID to find user!
		</div>
		<div class="flexsearch">
			<div class="flexsearch--wrapper">
				<form id="userSearchForm" class="flexsearch--form">
					<div class="flexsearch--input-wrapper">
						<input id="userId" name="userId" class="flexsearch--input" type="text" placeholder="search">
					</div>
					<input id="userSearchBtn" class="flexsearch--submit" type="button" value="&#10140;"/>
				</form>
			</div>
		</div>
		<div id="resultDiv" style="overflow-y:scroll; width: 93%; height: 190px; margin: auto; ">
			
		</div>
	</div>
	
	<div id="writeDiv" style="display: none; margin: 19px">
		<div>
			<span style="margin-left: 8px; color: #777;">Message To </span>
			<span style="font-style: italic; font-size: 17px; color: #333;">${receiverUserId}</span>
		</div>
		<form id="messageForm" name="dataform">
			<input id="loginUserId" type="hidden" name="sender" value="${loginUser.userId}">
			<input id="receiver" type="hidden" name="receiver" value="${receiverUserId}">
			<textarea id="content" name="content" style="margin:9px; height:200px; width:95%; resize:none;"></textarea><br/>
			<input type="button" id="submitMsgBtn" value="Send" />
		</form>
	</div>

	<div><c:import url="http://192.168.201.29:3000"/></div>