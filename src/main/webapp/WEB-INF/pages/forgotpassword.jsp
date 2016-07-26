<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<style>
.login_container {
	text-align: left;
	width: 400px;
	margin: auto;
	margin-top: 230px;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	border-radius: 20%;
	height: 300px;
}

.username {
	margin: 30px 20% 5% 20%;
	padding-top: 13%;
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

.username p {
	text-align: left;
}

.password p {
	text-align: left;
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
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | Forgot password</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="login_container">
		<div class="username">
			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>
			<p>Please enter your username:</p>
			<input type="password" name="username" placeholder="Username"></input>
		</div>

		<button type="submit" class="submit">Reset password</button>

	</div>
</body>
</html>