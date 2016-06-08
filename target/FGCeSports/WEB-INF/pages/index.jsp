<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.container {
	width: 900px;
	height: 80%;
	margin-left: 400px;
	margin-top: 50px;
	float: left;
}

.article_section {
	width: 100%;
	height: 200px;
	margin-bottom: 75px;
}

.articles_SF {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/sfv_logo.png');
	background-size: 230px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.articles_SF:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 10px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.articles_words {
	height: 150px;
	width: 500px;
	float: right;
	margin-right: 100px;
	margin-top: 25px;
	margin-left: 20px;
}

.headline th {
	border-bottom: 1px solid #999;
	text-align: left;
	font-size: 30px;
}

.articles_SM {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image:
		url('resource/images/Super_Smash_Bros._Melee_logo.png');
	background-size: 190px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.articles_SM:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 10px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.tournament_section {
	height: 800px;
	width: 400px;
	float: right;
	margin: 50px 100px 0 0;
}

.tournament_game {
	height: 450px;
	width: 400px;
	margin: auto;
	margin-top: 230px;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 10px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	border-radius: 20%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
}

.tournament_result {
	margin: auto;
	margin-top: 20px;
}

.tournament_result th {
	padding-top: 20px;
	font-size: 30px;
	margin: auto;
}

.tournament_result tr td {
	padding: 10px;
	height: 20px;
}

.tournament_result tr td:nth-child(1) {
	border-right: 1px solid #999;
}
</style>
<!-- Logout -->
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
<!-- 	Logout -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | Home</title>
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
	<div class="container">
		<div class="article_section">
			<div class="articles_SF"></div>
			<div class="articles_words">
				<table class="headline">
					<tr>
						<th>RZR | Infiltration wins EVO 2016</th>
					</tr>
					<tr>
						<td>words words >words words >words words v>words words
							>words words>words words>words words>words words>words words
							words words >words words >words words v>words words >words
							words>words words>words words>words words>words words</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="article_section">
			<div class="articles_SM"></div>
			<div class="articles_words">
				<table class="headline">
					<tr>
						<th>Cloud9 | Mang0 wins Dreamhack Austin</th>
					</tr>
					<tr>
						<td>words words >words words >words words v>words words
							>words words>words words>words words>words words>words words
							words words >words words >words words v>words words >words
							words>words words>words words>words words>words words</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="article_section">
			<div class="articles_SM"></div>
			<div class="articles_words">
				<table class="headline">
					<tr>
						<th>Johnny "S2J" Kim sponsored by Tempo Storm</th>
					</tr>
					<tr>
						<td>words words >words words >words words v>words words
							>words words>words words>words words>words words>words words
							words words >words words >words words v>words words >words
							words>words words>words words>words words>words words</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<div class="tournament_section">
		<h1
			style="margin: auto; width: 300px; text-align: center; border-bottom: 1px solid #999;">EVO
			2016</h1>
		<div class=tournament_game>
			<h1
				style="margin: auto; text-align: center; padding-top: 20px; border-bottom: 1px solid #999; width: 250px;">Street
				Fighter V</h1>
			<table class="tournament_result">
				<tr>
					<td>1st</td>
					<td>RZR | Infiltration</td>
				</tr>
				<tr>
					<td>2nd</td>
					<td>MCZ | Tokido</td>
				</tr>
				<tr>
					<td>3rd</td>
					<td>MCZ | Daigo Umehara</td>
				</tr>
				<tr>
					<td>4th</td>
					<td>EG | Ricky Ortiz</td>
				</tr>
				<tr>
					<td>5th</td>
					<td>RZR | Xian</td>
				</tr>
				<tr>
					<td>6th</td>
					<td>Aver | Gamerbee</td>
				</tr>
				<tr>
					<td>7th</td>
					<td>Redbull | Snake Eyez</td>
				</tr>
				<tr>
					<td>8th</td>
					<td>Chris Tatarian</td>
				</tr>
			</table>
		</div>
		<div class=tournament_game>
			<h1
				style="margin: auto; text-align: center; padding-top: 20px; border-bottom: 1px solid #999; width: 350px;">Super Smash Bros. Melee</h1>
			<table class="tournament_result">
				<tr>
					<td>1st</td>
					<td>C9 | Mang0</td>
				</tr>
				<tr>
					<td>2nd</td>
					<td>Liquid | Hungrybox</td>
				</tr>
				<tr>
					<td>3rd</td>
					<td>Echo Fox | Mew2king</td>
				</tr>
				<tr>
					<td>4th</td>
					<td>EG | PPMD</td>
				</tr>
				<tr>
					<td>5th</td>
					<td>Alliance | Armada</td>
				</tr>
				<tr>
					<td>6th</td>
					<td>SM | Leffen</td>
				</tr>
				<tr>
					<td>7th</td>
					<td>Tempo | Westballz</td>
				</tr>
				<tr>
					<td>8th</td>
					<td>Tempo | Axe</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>