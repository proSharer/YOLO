<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	border-color: #d1d0cf;
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

#closeBtn {
	border: 0px transparent;
	border-radius: 5px;
	height: 25px;
	width: 65px;
	background-color: #d1d0cf;
	color: #777;
	margin-top: 10px;
	margin-left: 80%;
}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Message</title>

</head>


<body>

	<div id="writeDiv" style="margin: 19px;">
		<div>
			<span style="margin-left: 8px; color: #777;">Message To</span>
			<span style="font-style: italic; font-size: 17px; color: #333;"> ${message.receiver}</span>
		</div>
		<form id="messageForm" name="dataform">
			<div id="content" name="content" style="margin:9px; height:200px; width:95%; resize:none; border:solid 1px #d1d0cf;"><div style="margin:10px;">${message.content}</div></div><br/>
			<input type="button" id="closeBtn" value="close" onclick="javascript:self.close()"/>
		</form>
	</div>

</body>
</html>