<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
	<sec:authorize access="hasRole('ROLE_${userName }')">
		<h1>
			You are logged in as ${username } | Click here to <a
				href="javascript:formSubmit()"> logout</a>
		</h1>
	</sec:authorize>
	<p>You are viewing ${userName }'s profile</p>
</body>
</html>