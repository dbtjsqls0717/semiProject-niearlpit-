<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL c for each 문 fn 날짜 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니.얼.핏</title>
<!-- 연동: rel | src | CSS 리스트 -->
<link rel="stylesheet" href="../home.css" />
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- handlebars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
.btn1 {
	box-shadow: inset 0px 1px 3px 0px #91b8b3;
	background: linear-gradient(to bottom, #353b39 5%, #485c5c 100%);
	background-color: #353b39;
	border-radius: 5px;
	border: 1px solid #566963;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 17px;
	font-weight: bold;
	padding: 11px 45px;
	text-decoration: none;
	text-shadow: 0px -1px 0px #2b665e;
}

.btn1:hover {
	background: linear-gradient(to bottom, #485c5c 5%, #353b39 100%);
	background-color: #485c5c;
}

.btn1:active {
	position: relative;
	top: 1px;
}

/* hover image */
.image {
	opacity: 1;
	display: block;
	width: 100%;
	height: auto;
	transition: .5s ease;
	backface-visibility: hidden;
}

.middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);

}

.imageMain:hover .image {
	opacity: 0.3;
}

.imageMain:hover .middle {
	opacity: 1;
}

.text {
	background-color: #4CAF50;
	color: white;
	font-size: 16px;
	padding: 16px 32px;
}
</style>
</head>

<body>
<h1>cartlist</h1>
	<header>
		<div id="divHeader"><jsp:include page="../DOM/header.jsp" /></div>
		<div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
		<br>
	</header>
	<div id="divPage">
		<!--------------------- 콘텐트시작 ----------------------------------->
		<div id="divContent">
			<%-- <div id="divSidebar"><jsp:include page="../DOM/sidebar.jsp" /></div> --%>
			<%-- <div id="divSearchbar"><jsp:include page="searchbar.jsp" /></div> --%>
			<!----------------------- 내용 입력 시작 ----------------------------->
			<div id="divMain">
				<!-- 버튼 -->
				<div id=btn1 style="text-align: center;">
					<a href="#" class="btn1">회원가입</a>
				</div>

				<table id="tbl1" style="height: 80px;">
					<tr class="title">
						<td width=100p class="row">GoodsID</td>
						<td width=100px class="row">color</td>
						<td width=100px class="row">Quantity</td>
						<td width=100px class="row">Price</td>
					<tr>
						<td class="row">ss</td>
						<td class="row">ss</td>
						<td class="row"><input type="text" value=1
							style="width: 20px; text-align: center;"></td>
						<td class="row">원</td>
					</tr>
				</table>
				<br>
				<hr>
				<br>
				<table id="tbl2">
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>1d</td>
					<tr>
					<tr>
						<td>dd</td>
					<tr>
				</table>
				<table id="tbl3">
					<tr>
						<td>dd</td>
						<td>dd</td>
						<td>dd</td>
					</tr>
					<tr>
						<td>dd</td>
						<td>dd</td>
						<td>dd</td>
					</tr>
				</table>
			</div>

			<div class="imageMain">
				<img src="../image/P_999.png" style="width:500px;height:400px";>
				<div class="middle">
					<div class="text">John Doe</div>
				</div>
			</div>
			<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
		</div>
		<!----------------------- 내용 입력 종료 ----------------------------->
	</div>

</body>
<script>
	/* jQuery Ajax */
</script>
<!-- <script src="home.js"></script> -->
</html>