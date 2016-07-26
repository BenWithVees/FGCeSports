<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<style>
.container {
	width: 1500px;
	height: 800px;
	margin: auto;
	margin-top: 50px;
}

.games {
	position: relative;
	z-index: 2;
	width: 400px;
	height: 300px;
	float: left;
	background-color: #CCCCCC;
	background-image: url('resource/images/ryu_sfv.jpg');
	background-size: 600px;
	background-position: 50%;
	background-repeat: no-repeat;
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	-webkit-transition: width 3s; /* Safari */
	-webkit-transition-delay: 1s; /* Safari */
	transition: .3s;
}

.title {
	box-shadow: inset 0 0 90px #999, inset 5px 0 10px #999, inset -5px 0
		10px #999, inset 5px 0 10px #999, inset -5px 0 40px #999, 0 0 50px
		#999, -5px 0 0px #999, 5px 0 0px #999;
	width: 400px;
	height: 50px;
	font-size: 20px;
	position: absolute;
	z-index: 1;
	background-color: white;
	margin-top: 250px;
	text-align: center;
	transition: .3s;
}

.games:hover {
	z-index: 1;
	filter: blur(5px);
	-webkit-filter: blur(5px);
	-moz-filter: blur(5px);
	-o-filter: blur(5px);
	-ms-filter: blur(5px);
	-o-filter: blur(5px);
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | Games</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="container">
		<div class="inner-wrapper">
			<div class="games"></div>
			<div class="title">STREET FIGHTER</div>
		</div>
	</div>
</body>
</html>