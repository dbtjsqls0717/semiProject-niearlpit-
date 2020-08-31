<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL c for each 문 fn 날짜 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>니.얼.핏</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 연동: rel | src | CSS 리스트 -->
<link rel="stylesheet" href="../home.css" />
<!-- jQuery -->
<script src="http://codea.jquery.com/jquery-3.1.1.min.js"></script>
<!-- handlebars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- 페이지스타일 -->
<style>
body {
	background-attachment: scroll;
	margin: 0;
	padding: 0;
	height:700px;
}
/* 영상 */
header {
	position: relative;
	background-color: black;
	height: 60vh;
	min-height: 0rem;
	width: 100%;
	overflow: hidden;
	margin: auto;
}

header video {
	position: relative;
	left: 43%;
	min-width: 1900px;
	min-height: 100px;
	width: auto;
	height: auto;
	z-index: 0;
	-ms-transform: translateX(-50%) translateY(-50%);
	-moz-transform: translateX(-50%) translateY(-50%);
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
}

#f1 {
	color: #111;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 205px;
	font-weight: bold;
	letter-spacing: -1px;
	line-height: 1;
	text-align: center;
	
text-shadow: 4px 3px 0px #fff, 9px 8px 0px rgba(0,0,0,0.15);
}
#f2{
font-weight:bold;
text-shadow: 4px 3px 0px #fff, 9px 8px 0px rgba(0,0,0,0.15);
}
</style>
</head>

<body>


		
	<div id="divHeader"><jsp:include page="header.jsp" /></div>
	
	<div id="divMenu"><jsp:include page="menu.jsp" /></div>
	<br>
	<div id="divPage">
	<c:if test="${position==1}">
				<div id="divSidebar"><jsp:include page="sidebar.jsp" /></div>
			</c:if>
		<!--------------------- 콘텐트시작 ----------------------------------->
		<div id="divContent">

			
			<%-- <div id="divSearchbar"><jsp:include page="searchbar.jsp" /></div>--> --%>
			<!----------------------- 내용 입력 시작 ----------------------------->
			<div id="divMain">
				<header>
					<div class="overlay"></div>
					<video playsinline="playsinline" autoplay="autoplay" muted="muted"
						loop="loop">
						<source src="../image/video.mp4" type="video/mp4">
					</video>
				</header>
			</div>
			<div>
				<br>
				<br>
				<div style="text-align: center;" id="f1">COMING SOON JULY
					EVENT!</div>
				<br>
				<div style="text-align: center;font-size:50px;" id="f2">DON"T MISS IT OUT</div>
				<br>
				<table>
					<tr>
						<td>
							<div id="divMain">
								<header>
									<div class="overlay"></div>
									<video playsinline="playsinline" autoplay="autoplay"
										muted="muted" loop="loop">
										<source src="../image/video2.mp4" type="video/mp4">
									</video>
								</header>
							</div>
						</td>
					</tr>
				</table>
				<br>
				<br>
				<table style="margin: auto;">
					<tr>
						<td><img src="../image/P_999.png" width=500px;></td> &nbsp
						<td><img src="../image/P_998.jpg" width=340px;></td>
						<td><img src="../image/P_997.png" width=230px;></td>
					</tr>
				</table>

			</div>
			<br>
			<div id="divFooter"><jsp:include page="/DOM/footer.jsp" /></div>
		</div>
		<!----------------------- 내용 입력 종료 ----------------------------->
	</div>
</body>
<script>
	/* jQuery Ajax */
</script>
<!-- <script src="home.js"></script> -->
</html>