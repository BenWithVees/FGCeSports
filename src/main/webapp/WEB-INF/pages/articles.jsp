<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<jsp:include page="./menu.jsp" />
<style>
body {
	background-image: url('../resource/images/witewall_3.png');
}

.container {
	margin: auto;
	width: 70%;
	margin-top: 30px;
	white-space: pre-line;
}

.article_header {
	height: 60px;
	width: 100%;
	margin-bottom: 100px;
	float: right;
}

.article_header h1 {
	float: left;
	padding-right: 40px;
}

.article_header p {
	color: #999;
	font-style: italic;
	font-size: 15px
	
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports </title>
</head>
<body>
	<div class="container">
		<div class="article_header">
			<h1>${articles.articleTitle }</h1>
			<p>By ${articles.author } on ${date}</p>
		</div>
		${articles.body}
	</div>
</body>
</html>