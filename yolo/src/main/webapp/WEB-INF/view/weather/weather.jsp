<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
#weatherDiv {
	text-align: center;
	display: inline-block;
	margin: 16px;
}

.weatherIcon {
	width: 180px;
	height: 180px;
}
</style>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		
	});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="weatherDiv">
		<img class="weatherIcon" alt="weatherIcon" src="<c:url value="/weather/download/${realFileName}"/>" /><br/>
		<span>Max : ${tmax}°C</span><br/>
		<span>Min : ${tmin}°C</span>
	</div>
	
</body>
</html>