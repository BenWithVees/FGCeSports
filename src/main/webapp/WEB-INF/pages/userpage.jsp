<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	color: #a94442;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | ${userName}</title>
</head>
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
<body>
	<jsp:include page="./menu.jsp" />
	<sec:authorize access="hasRole('ROLE_${userName }')">
		<h1>
			You are logged in as ${username } | Click here to <a
				href="javascript:formSubmit()"> logout</a>
		</h1>
	</sec:authorize>
	<img src="data:image/jpg;base64, ${picture}" alt="Error" width="200"
		height="200" />

	<p>You are viewing ${userName }'s profile</p>
	<sec:authorize access="hasRole('ROLE_${userName }')">
		<p>
			<a href="./newpassword">Reset Password</a>
		</p>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<form:form method="POST" commandName="user"
			enctype="multipart/form-data">
			<input type="file" name="file" />
			<input type="submit" value="Upload" />
		</form:form>
	</sec:authorize>

</body>
</html>