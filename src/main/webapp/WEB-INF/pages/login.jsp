<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<style>
.login_container {
	height: 500px;
	width: 400px;
	margin: auto;
	margin-top: 230px;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	border-radius: 20%
}

.username {
	margin: 20% 20% 5% 20%;
	padding-top: 25%;
}

.password {
	margin-left: 20%
}

input {
	font: 300 16px/1.2 Lato;
	width: 230px;
	height: 50px;
	background-image: url('resource/images/witewall_3.png');
	border: 2px solid #999;
	border-radius: 10px;
	background-color: #999;
	opacity: .4;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
}

.submit {
	font: 300 16px/1.2 Lato;
	font-color: white;
	width: 230px;
	height: 50px;
	margin: 25px 20%;
	background-color: #999;
	border: none;
	display: block;
	border-radius: 10px;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	font-weight: bold;
}

::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	color: black;
	opacity: 1;
}

::-moz-placeholder { /* Firefox 19+ */
	color: black;
	opacity: 1;
}

:-ms-input-placeholder { /* IE 10+ */
	color: black;
	opacity: 1;
}

:-moz-placeholder { /* Firefox 18- */
	color: black;
	opacity: 1;
}

p {
	text-align: center;
}

p a {
	color: black;
}

.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	color: #a94442;
}

.emailError {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	color: #a94442;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | Login</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<form name='loginForm'
		action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />"
		method='POST'>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty emailError}">
			<div class="error">${emailError}</div>
		</c:if>
		<div class="login_container">

			<div class="username">
				<input type="text" name="username" placeholder="Username">
			</div>
			<div class="password">
				<input type="password" name="password" placeholder="***********">
			</div>
			<button type="submit" class="submit">Login</button>
			<p>
				Not a member? <a href="./register">Sign up!</a>
			</p>
			<p>
				<a href="./forgotusername">Forgot username?</a>
			</p>
			<p>
				<a href="./forgotpassword">Forgot password?</a>
			</p>
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
</body>
</html>