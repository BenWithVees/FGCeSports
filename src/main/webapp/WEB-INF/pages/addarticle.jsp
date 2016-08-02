<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<style>
.container {
	margin: auto;
	padding-top: 50px;
	width: 70%;
	height: 70%;
}

.article_title {
	width: 100%;
	height: 40px;
	font-size: 18px;
	margin: 50px;
}

.article_thumbnail {
	width: 100%;
	height: 40px;
	font-size: 18px;
	margin: 50px;
}

.article_body {
	width: 100%;
	height: 80%;
	font-size: 18px;
	margin: 50px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADMIN | ADD ARTICLE</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="container">
		<p>Article title:</p>
		<input class="article_title" name="input" type="text"
			placeholder="Enter the article title...">
		<p>Article thumbnail</p>
		<input type="text" class="article_thumbnail" name="input"
			placeholder="Enter the article thumnail...">
		<p>Article body</p>
		<textarea class="article_body" name="input"
			placeholder="Enter the article body.."></textarea>
	</div>
</body>
</html>