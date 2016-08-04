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
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports eSports</title>
</head>
<body>
	
	<div class="container">
		<h1>${articles.articleTitle }</h1>

		${articles.body}
	</div>
</body>
</html>