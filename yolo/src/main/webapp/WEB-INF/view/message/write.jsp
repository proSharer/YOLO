	<p>Message to ${userId}</p>
	
	<form:form id="messageForm" commandName="MessageVO" name="dataform">
		<input id="loginUserId" type="hidden" name="sender" value="${user.userId}">
		<!-- <input id="receiver" type="hidden" name="receiver" value="${userId}"> -->
		<input id="receiver" type="hidden" name="receiver" value="test">
		<textarea id="content" name="content"></textarea><br/>
		<input type="button" id="submitMsgBtn" value="Send" />
	</form:form>

	<div><c:import url="http://192.168.201.29:3000"/></div>