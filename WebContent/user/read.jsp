<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting & Privacy-니.얼.핏</title>
<link rel="stylesheet" href="../home.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
<
style>#btnUp {
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

#btnUp:hover {
	background: linear-gradient(to bottom, #485c5c 5%, #353b39 100%);
	background-color: #485c5c;
}

#btnUp:active {
	position: relative;
	top: 1px;
}

#btnUp {
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

#btnDel {
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

#btnDel:hover {
	background: linear-gradient(to bottom, #485c5c 5%, #353b39 100%);
	background-color: #485c5c;
}

#btnDel:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>
	<header>
		<div id="divHeader"><jsp:include page="../DOM/header.jsp" /></div>
		<div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
		<br>
	</header>
	<div id="divPage">
		<!-- 내용 입력 시작 ------------------------------------->
		<div id="divContent">
			<div id="divMain">
				<form name="frm" action="update" method="post">
					<table style="margin: auto; float: center; width: 500px;">
						<tr>
							<td class="title" width=500px; colspan=2>
								<h2 style="font-size: 40px; width: 600px;">General Account
									Settings</h2>
							</td>
						</tr>
						<tr>
							<td class="title" width=240 style="font-size: 20px;">Account</td>
							<td><input type="text" name="user_id"
								style="width: 400px; height: 27px; font-size: 17px;"
								value="${vo.user_id }"></td>
						</tr>
						<tr>
							<td class="title" width=240 style="font-size: 20px;">Password</td>
							<td><input type="password" name="password"
								style="width: 400px; height: 27px; font-size: 17px;"
								value="${vo.password }"></td>
						</tr>
						<tr>
							<td class="title" width=240 style="font-size: 20px;">Confirm
								Password</td>
							<td><input type="password" name="passCheck"
								style="width: 400px; height: 27px; font-size: 17px;"></td>
						</tr>
						<tr>
							<td class="title" width=240 style="font-size: 20px;">Name</td>
							<td><input type="text" name="user_name"
								style="width: 400px; height: 27px; font-size: 17px;"
								value="${vo.user_name }"></td>
						</tr>
						<tr>
							<td class="title" width=240 style="font-size: 20px;">Phone
								number</td>
							<td><input type="text" name="phone" maxlength="11"
								placeholder=" - 없이입력"
								style="width: 400px; height: 27px; font-size: 17px;"
								value="${vo.phone }"></td>
						</tr>
						<tr>
							<td class="title" width=150 style="font-size: 20px;">Birthday</td>
							<td width=300
								style="width: 500px; height: 30px; font-size: 20px;"><input
								type="text" name="yy" size=2 placeholder="yyyy" maxlength="4"
								value=2000 style="width: 80px; height: 30px; font-size: 20px;">년
								<input type="text" name="mm" size=1 placeholder="mm"
								maxlength="2" value=11
								style="width: 80px; height: 30px; font-size: 20px;">월 <input
								type="text" name="dd" size=1 placeholder="dd" maxlength="2"
								value=01 style="width: 80px; height: 30px; font-size: 20px;">일
							</td>
						</tr>
						<tr>
							<td class="title" width=240 style="font-size: 20px;">Address</td>
							<td><input type="text" name="address" maxlength="11"
								style="width: 400px; height: 27px; font-size: 17px;"
								value="${vo.address }"></td>
						</tr>
						<tr>
							<td class="title" width=240 style="font-size: 20px;">Company
								Address</td>
							<td><input type="text" name="address2" maxlength="11"
								style="width: 400px; height: 27px; font-size: 17px;"
								value="${vo.address2 }"></td>
						</tr>
					</table>
					<br>
					<div style="text-align: center">
						<input type="submit" value="수정" id="btnUp"> <input
							type="button" value="회원탈퇴" id="btnDel">
					</div>

				</form>

			</div>
		</div>
	</div>

	<!-- 내용 입력 종료 --_---------------------------------->
	<hr>
	<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
</body>

<script>
	//수정  
	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("Edit?"))
			return;
		alert("Confirmed");
		frm.submit();
	});

	//삭제
	$("#btnDel").on("click", function() {
		var user_id = $(frm.user_id).val();
		if (!confirm("Are you sure you want to change?"))
			return;
		$.ajax({
			type : "post",
			url : "delete",
			data : {
				"user_id" : user_id
			},
			success : function() {
				alert("회원탈퇴 되었습니다.");
				location.href = "/clotheshop_F/DOM/index.jsp";

			}
		});
	});
</script>
<script src="home.js"></script>
</html>