<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니.얼.핏</title>
<link rel="stylesheet" href="../home.css" />

</head>
<body>
	<div id="divCondition">
		<div id="divSearch">
			<select id="selKey">
				<option value="">sample1</option>
				<option value="">sample2</option>
			</select> <input type="text" id="txtWord"> <select id="selPerPage">
				<option value="3">3행</option>
				<option value="5">5행</option>
			</select> 
				<input type="button" id="btnSearch" value="검색"> <span style="font-size: 12px;">검색수: <b id="count"></b>건
			</span>
		</div>
		<div id="divSort">
			<select id="selOrder">
				<option value="">1</option>
				<option value="">2</option>
			</select> <select id="selDesc">
				<option value="">오름차순</option>
				<option value="desc">내림차순</option>
			</select>
		</div>
	</div>
</body>
</html>