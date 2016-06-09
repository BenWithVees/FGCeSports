<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<style>
@import url(http://fonts.googleapis.com/css?family=Lato:300,500);

/*
  pad the body and set default font styles
*/
body {
	font: 300 16px/1.2 Lato;
	background-image: url('resource/images/witewall_3.png');
}

.menu {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #999;
}
/*
  navigation
*/
.nav {
	list-style: none;
	font-size: 20px;
}

/*
  nav list items
  1. side by side
  2. needed for circle positioning
*/
.nav li {
	float: left; /*1*/
}

/*
  nav link items
*/
.nav>li a {
	display: block; /*1*/
	padding: 12px 18px; /*2*/
	text-decoration: none; /*3*/
	color: #999; /*4*/
	transition: all ease .5s;
}

/*
  fade out all links on ul hover
*/
.nav:hover>li a {
	opacity: .5;
	transition: all ease .5s;
}

/*
  override previous rule to highlight current link
*/
.nav>li:hover a {
	opacity: 1;
	color: #E74C3C;
	border-color: #E74C3C;
}

.login_container {
	text-align: left;
	height: 500px;
	width: 400px;
	margin: auto;
	margin-top: 230px;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	border-radius: 20%;
	height: 500px;
}

.username {
	margin: 50px 20% 5% 20%;
	padding-top: 20%;
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
<title>eSports FGC | Settings</title>
</head>
<body>
	<c:set var="username" scope="session"
		value="${pageContext.request.userPrincipal.name}" />
	<div class="menu">
		<ul class="nav">
			<li><a href="./">Home</a><i class="circle"></i></li>
			<li><a href="./games">Games</a></li>
			<li><a href="./players">Players</a></li>
			<li><a href="">News</a></li>
			<li style="float: right"><c:choose>
					<c:when test="${not empty username}">
						<a href="./${username }"><c:out value="${username}" /></a>
					</c:when>
					<c:otherwise>
						<a href="./login">Login/Sign up</a>
					</c:otherwise>
				</c:choose></li>
		</ul>
	</div>
	<form:form modelAttribute="user" method="POST" commandName="user">
		<div class="login_container">
			<div class="username">
				<c:if test="${not empty error}">
					<div class="error">${error}</div>
				</c:if>
				<p>Old password:</p>
				<form:input path="password" type="password" name="username"
					placeholder="***********"></form:input>
			</div>
			<div class="password">
				<p>New password:</p>
				<form:input path="passwordPlaceholder" type="password"
					name="password" placeholder="***********"></form:input>
			</div>
			<button type="submit" class="submit">Reset password</button>

		</div>
	</form:form>
</body>
</html>