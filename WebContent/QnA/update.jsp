<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A Admin-니.얼.핏</title>
<link rel="stylesheet" href="../home.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
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

#btnInsert {
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

#btnInsert:hover {
	background: linear-gradient(to bottom, #485c5c 5%, #353b39 100%);
	background-color: #485c5c;
}

#btnInsert:active {
	position: relative;
	top: 1px;
}

#btnInsert .btn1 {
	text-align: center;
	margin: auto;
}
</style>

<body>
	<header>
		<div id="divHeader"><jsp:include page="../DOM/header.jsp" /></div>
		<div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
		<br>
	</header>
	<div id="divPage">
		<!-- 내용 입력 시작 ------------------------------------->
		<div id="divMain">
			<div id="divContent"
				style="margin: auto; width: 1450px; height: 1550px; margin: auto;">
				<h2>Admin Reply</h2>

				<form name="frm" action="update" method="post">
					<table id="tbl" border=1 width=700>

						<tr class="row">
							<td class="title" width="150px;font-size:20px;" >제목</td>
							<td><input type="text" value="${vo.title}" name="title"
								size=140> <input type="hidden"
								value="${vo.question_number}" name="question_number"></td>
						</tr>
						<tr class="row">
							<td colspan=2><textarea rows="20" cols="150" name="content">${vo.content}</textarea>
							</td>
						</tr>
					</table>
					<br>
					<input type="submit" value="저장" id="btnInsert" style="margin:auto;margin-left:45%;">
					 <input type="reset" value="취소"
						onClick="location.href='/clotheshop_F/QnA/list.jsp'" class="btn1">
					<br>
				</form>
				<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
			</div>
			<!-- 내용 입력 종료 --_---------------------------------->
		</div>
	</div>
	<hr>
	</div>
</body>
<script>
	//수정버튼 눌렀을때

	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("수정 하시겠습니까?"))
			return;
		var t = $(frm.title).val();
		var q = $(frm.question_number).val();
		var c = $(frm.content).val();
		$.ajax({
			type : "post",
			url : "update",
			data : {
				"title" : t,
				"question_number" : q,
				"content" : c
			},
			success : function() {
				alert("수정이 완료되었습니다");
				location.href = "list.jsp";
			}
		});
	});
</script>
</html>