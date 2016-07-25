<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

.container {
	height: 600px;
	width: 800px;
	margin: auto;
	margin-top: 150px;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	border-radius: 100px
}

.left_side {
	width: 350;
	height: 250px;
	float: left;
	margin: 30px 0 0 0;
}

.right_side {
	width: 350;
	height: 250px;
	float: right;
	margin: 30px 0 0 0;
}

.username {
	float: left;
	margin: 10px 0 0 60px;
}

.email {
	float: left;
	margin: 30px 0 0 60px;
}

.password {
	float: left;
	margin: 10px 50px 0 60px;
}

.confirm {
	float: left;
	margin: 30px 50px 0 60px;
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

.submit_button {
	width: 300px;
	height: 100px;
	float: left;
	margin-left: 200px;
	margin-top: 100px;
}

.submit {
	font: 300 16px/1.2 Lato;
	font-color: white;
	width: 230px;
	height: 50px;
	margin: auto;
	background-color: #999;
	border: none;
	display: block;
	border-radius: 10px;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	font-weight: bold;
	background-color: #999
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

.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	color: #a94442;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | Register</title>
</head>
<body>
	<c:set var="username" scope="session"
		value="${pageContext.request.userPrincipal.name}" />
	<div class="menu">
		<ul class="nav">
			<li><a href="./">Home</a><i class="circle"></i></li>
			<li><a href="">Games</a></li>
			<li><a href="./players">Players</a></li>
			<li><a href="">News</a></li>
			<li><a href="./streams">Streams</a></li>
			<li style="float: right"><c:choose>
					<c:when test="${not empty username}">
						<a href="javascript:formSubmit()"><c:out value="${username}" /></a>
					</c:when>
					<c:otherwise>
						<a href="./login">Login/Sign up</a>
					</c:otherwise>
				</c:choose></li>
		</ul>
	</div>
	<form:form modelAttribute="user" commandName="user" method="POST">
		<div class="container">
			<c:if test="${not empty error }">"${error }"</c:if>
			<c:if test="${not empty errorEmail }">"${errorEmail }"</c:if>
			<h1 style="text-align: center; margin-top: 50px;">Please enter
				your info...</h1>
			<div class="left_side">
				<div class="username">
					<p>Username:</p>
					<form:input type="text" name="username" placeholder="Username"
						path="username" />
				</div>
				<div class="email">
					<p>Email:</p>
					<form:input type="text" name="email"
						placeholder="example@email.com" path="email" />
				</div>
			</div>
			<div class="right_side">
				<div class="password">
					<p>Password:</p>
					<form:input type="password" name="password" placeholder="*********"
						path="password" />
				</div>

				<div class="confirm">
					<p>Confirm password:</p>
					<input type="password" name="confirm" placeholder="*********" />
				</div>

			</div>
			<div class=submit_button>
				<button type="submit" class="submit">Register</button>
			</div>
		</div>
	</form:form>
</body>

</html>
<script>
	function myFunction() {
		var pass1 = document.getElementById("password").value;
		var pass2 = document.getElementById("confirm").value;
		var ok = true;
		if (pass1 != pass2) {
			//alert("Passwords Do not match");
			document.getElementById("pass1").style.borderColor = "#E34234";
			document.getElementById("pass2").style.borderColor = "#E34234";
			ok = false;
		} else {
			alert("Passwords Match!!!");
		}
		return ok;
	}
</script>