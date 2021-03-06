<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE>
<html>
<style>
.container {
	width: 900px;
	height: 80%;
	margin-left: 10%;
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
<title>eSports FGC</title>
<!-- Logout -->
<jsp:include page="./menu.jsp" />
<div class="container">
	<c:forEach items="${list}" var="list">
		<a href="./news/${list.articleTitle }">
			<div class="article_section">
				<div class="articles_SF"></div>
				<div class="articles_words">
					<table class="headline">
						<tr>
							<th>${list.articleTitle}</th>
						</tr>
						<tr>
							<td>${fn:substring(list.body,0, 367)}...</td>
						</tr>
					</table>
				</div>
			</div>
		</a>
	</c:forEach>
</div>

<div class="tournament_section">

	<h1
		style="margin: auto; width: 300px; text-align: center; border-bottom: 1px solid #999;">${tournamentName }</h1>
	<c:forEach items="${tournaments}" var="tournaments">
		<div class=tournament_game>
			<h1
				style="margin: auto; text-align: center; padding-top: 20px; border-bottom: 1px solid #999; width: 250px;">${tournaments.gameName }</h1>
			<table class="tournament_result">
				<tr>
					<td>1st</td>
					<td>${tournaments.firstPlace}</td>
				</tr>
				<tr>
					<td>2nd</td>
					<td>${tournaments.secondPlace}</td>
				</tr>
				<tr>
					<td>3rd</td>
					<td>${tournaments.thirdPlace}</td>
				</tr>
				<tr>
					<td>4th</td>
					<td>${tournaments.fourthPlace}</td>
				</tr>
				<tr>
					<td>5th</td>
					<td>${tournaments.fifthPlace}</td>
				</tr>
				<tr>
					<td>5th</td>
					<td>${tournaments.fifthPlaceSecond}</td>
				</tr>
				<tr>
					<td>7th</td>
					<td>${tournaments.seventhPlace}</td>
				</tr>
				<tr>
					<td>7th</td>
					<td>${tournaments.seventhPlaceSecond}</td>
				</tr>
			</table>
			<p style="float:middle;">Edit</p>
		</div>
	</c:forEach>
</div>
</body>
</html>