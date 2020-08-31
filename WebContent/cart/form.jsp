<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL c for each 문 fn 날짜 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample</title>
<!-- 연동: rel | src | CSS 리스트 -->
<link rel="stylesheet" href="../home.css" />
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- handlebars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>

</style>
</head>

<body>
<h1>sample</h1>
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