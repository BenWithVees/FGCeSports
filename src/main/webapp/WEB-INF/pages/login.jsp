<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<style>
@import url(http://fonts.googleapis.com/css?family=Lato:300,500);

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
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | Login</title>
</head>
<body>
	<div class="menu">
		<ul class="nav">
			<li><a href="./">Home</a><i class="circle"></i></li>
			<li><a href="">Games</a></li>
			<li><a href="./players">Players</a></li>
			<li><a href="">News</a></li>
			<li style="float: right"><a href="./login">Login/Sign up</a></li>
		</ul>
	</div>
	<form name='loginForm'
		action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />"
		method='POST'>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
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
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
</body>
</html>