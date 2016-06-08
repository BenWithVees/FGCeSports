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

.container {
	width: 1500px;
	height: 800px;
	margin: 50px auto;
}

.game_section {
	width: 100%;
	height: 400px;
	
}

.game_title {
	font-style: italic;
	color: #999;
	width: 226px;
	border-bottom: 1px solid #999;
}

.player_section {
	list-style: none;
	float: left;
	padding: 0;
	margin-bottom: 50px;
}

.player_section li {
	margin-right: 35px;
}

.daigo {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/daigo-2015.jpg');
	background-size: 200px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.daigo:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.infil {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/cropped_Infilt2.png');
	background-size: 260px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.infil:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.snake {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/snake-eyez.jpg');
	background-size: 295px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.snake:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.tokido {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/tokido.jpg');
	background-size: 350px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.tokido:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.xian {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/RZR-Xian.jpg');
	background-size: 295px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.xian:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.mango {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/mango.jpg');
	background-size: 300px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.mango:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.armada {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/Armada.jpg');
	background-size: 300px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.armada:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.ppmd {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/ppmd.png');
	background-size: 215px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.ppmd:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.hbox {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/hbox.jpg');
	background-size: 300px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.hbox:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}

.m2k {
	width: 200px;
	height: 200px;
	float: left;
	border-radius: 100px;
	background-image: url('resource/images/m2k.png');
	background-size: 190px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
	border-radius: 100px;
}

.m2k:hover {
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
}


.player_section li:hover .name_section {
	animation: zoomIn .2s ease-in-out;
	display: block;
}

.name_section {
	height: 100px;
	width: 200px;
	border-radius: 0 0 100px 100px;
	-moz-border-radius: 0 0 100px 100px;
	-webkit-border-radius: 0 0 100px 100px;
	background: #66ccff;
	margin-right: 10px;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: 2s;
	margin-top: 100px;
	text-align: center;
	box-shadow: inset 0 0 90px #66ccff, inset 5px 0 10px #66ccff, inset -5px
		0 10px #66ccff, inset 5px 0 10px #66ccff, inset -5px 0 40px #66ccff, 0
		0 50px #66ccff, -5px 0 0px #66ccff, 5px 0 0px #66ccff;
	display: none;
	font-weight: bold;
	opacity: .7
}

@-webkit-keyframes zoomIn {
  from {
    opacity: 0;
    -webkit-transform: scale3d(.3, .3, .3);
    transform: scale3d(.3, .3, .3);
  }

  50% {
    opacity: 1;
  }
}

@keyframes zoomIn {
  from {
    opacity: 0;
    -webkit-transform: scale3d(.3, .3, .3);
    transform: scale3d(.3, .3, .3);
  }

  50% {
    opacity: 1;
  }
}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | Players</title>
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
		<div class="game_section">
			<h1 class="game_title">Street Fighter V</h1>
			<ul class="player_section">
				<li class="daigo"><div class="name_section">Daigo "The
						Beast" Umehara</div></li>
				<li class="infil"><div class="name_section">Sun-Woo "Infiltration" Lee</div></li>
				<li class="snake"><div class="name_section">Darryl "Snake Eyez" Lewis</div></li>
				<li class="tokido"><div class="name_section">Hajime "Tokido" Taniguchi</div></li>
				<li class="xian"><div class="name_section">Kun Xian Ho</div></li>
			</ul>	
			
			<div class="game_section">
			<h1 class="game_title" style="width: 350px;">Super Smash Bros. Melee</h1>
			<ul class="player_section">
				<li class="mango"><div class="name_section">Joseph "Mango" Marquez</div></li>
				<li class="armada"><div class="name_section">Adam "Armada" Lindgren</div></li>
				<li class="ppmd"><div class="name_section">Kevin "PPMD" Nanny</div></li>
				<li class="hbox"><div class="name_section">Juan "Hungrybox" Debiedma</div></li>
				<li class="m2k"><div class="name_section">Jason "Mew2king" Zimmerman</div></li>
			</ul>	
		</div>
	</div>
	</div>
</body>
</html>