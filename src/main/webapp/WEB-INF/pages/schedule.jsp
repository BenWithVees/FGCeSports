<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<style>
.container {
	width: 90%;
	height: 90%;
	margin: auto;
}

.today h1 {
	border-bottom: 1px solid #999;
}

.today {
	width: 50%;
	color: #999;
	font-style: italic;
	margin-bottom: 70px;
}

.october h1 {
	border-bottom: 1px solid #999;
}

.october {
	width: 70%;
	color: #999;
	font-style: italic;
	margin-bottom: 70px;
}

.december h1 {
	border-bottom: 1px solid #999;
}

.december {
	width: 70%;
	color: #999;
	font-style: italic;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports FGC | Schedule</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="container">
		<div class="today">
			<h1>Today</h1>
			<img src="resource/images/Evo_Championship_Series_Logo.png" />
		</div>
		<div class="october">
			<h1>October</h1>
			<img src="resource/images/NECimg.png" /> <img
				src="resource/images/SJimg1.png" />
		</div>
		<div class="december">
			<h1>December</h1>
			<img src="resource/images/capcom-pro-tour-2016.png" /> <img
				src="resource/images/DreamHack-logo.png" />
		</div>

	</div>
</body>
</html>