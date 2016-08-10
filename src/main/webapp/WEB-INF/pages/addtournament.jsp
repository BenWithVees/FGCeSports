<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<style>
.container {
	width: 70%;
	height: 90%;
	margin: auto;
	width: 70%;
	margin-top: 50px;
}

.container input {
	width: 50%;
	height: 40px;
	font-size: 20px;
	margin-bottom: 30px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADD TOURNAMENT</title>
</head>
<jsp:include page="./menu.jsp" />
<body>
	<div class="container">
		<form:form commandName="tournaments" method="POST"
			modelAttribute="tournaments">
			<form:input path="tournamentName" type="text"
				placeholder="Ex: EVO 2016, Final Round 2016..."></form:input>
			<form:input path="gameName" type="text"
				placeholder="Ex: Street Fighter V, Killer Instinct..."></form:input>

			<form:input path="firstPlace" type="text"
				placeholder="1st place winner"></form:input>
			<form:input path="secondPlace" type="text"
				placeholder="2nd place winner"></form:input>
			<form:input path="thirdPlace" type="text"
				placeholder="3rd place winner"></form:input>
			<form:input path="fourthPlace" type="text"
				placeholder="4th place winner"></form:input>
			<form:input path="fifthPlace" type="text"
				placeholder="5th place winner"></form:input>
			<form:input path="fifthPlaceSecond" type="text"
				placeholder="5th place winner"></form:input>
			<form:input path="seventhPlace" type="text"
				placeholder="7th place winner"></form:input>
			<form:input path="seventhPlaceSecond" type="text"
				placeholder="7th place winner"></form:input>
			<button type="submit">Submit</button>
		</form:form>
	</div>
</body>
</html>