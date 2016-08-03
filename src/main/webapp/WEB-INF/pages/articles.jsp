<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<style>
.container {
	margin: auto;
	width: 70%;
	margin-top: 30px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSports eSports</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="container">
		<h1>${articles.articleTitle }</h1>
		${articles.body}
	</div>
</body>
</html>