	<p>Message to ${userId}</p>
	
	<form:form id="messageForm" commandName="MessageVO" name="dataform">
		<input id="loginUserId" type="hidden" name="sender" value="${user.userId}">
		<!-- <input id="receiver" type="hidden" name="receiver" value="${userId}"> -->
		<input id="receiver" type="hidden" name="receiver" value="Test">
		<textarea id="content" name="content"></textarea><br/>
		<input type="button" id="submitMsgBtn" value="Send" />
	</form:form>
