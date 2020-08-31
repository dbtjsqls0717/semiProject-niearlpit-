<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>


<style>
body {
	margin: 0;
	padding: 0;
}

.nav ul {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
	color: black; $
	blur: 4px; . sticky { position : sticky;
	top: 0;
	padding: 24px;
	text-align: center;
	background-color: white;
	border: 1px solid black;
	box-shadow: rgba(black, 0.4) 0 4px$blur;
	position: absolute;
	z-index: 1;
	left: 1100px;
	top: 60px;
}

.wrapper {
	margin: 60px auto;
	max-width: 800px;
	border: 1px solid lightgray;
}

body {
	padding: 24px;
}

p {
	font-size: 1em;
	line-height: 1.4;
	margin-bottom: 24px;
}

}
.nav li {
	display: inline-block;
}

.nav a {
	text-decoration: none;
	width: 140px;
	display: block;
	font-size: 20px;
	font-family: Arial, Helvetica, sans-serif;
	color: black;
	float: left;
}

.nav .item:hover {
	text-decoration: underline;
}

#orderlist:hover {
	text-decoration: underline;
}

#cartbutton:hover {
	text-shadow: #FC0 1px 0 10px;
}

.mainLogin {
	float: right;
	margin-left: 30px;
}

.mainLogin:hover {
	text-shadow: #FC0 1px 0 10px;
}
</style>
<body>

	<c:if test="${user_id!=null}">
		<c:if test="${position==1}">
			<div class="nav">
				<ul>
				<%-- <div id="divSidemenu" style="float:left;"><jsp:include page="sidebar.jsp" /></div> --%>
					<li><a href="/clotheshop_F/product/AllList" class="item">ALL List</a></li>
					<li><a href="/clotheshop_F/product/typeList?type=outer" class="item">Outer</a></li>
					<li><a href="/clotheshop_F/product/typeList?type=top" class="item">Top</a></li>
					<li><a href="/clotheshop_F/product/typeList?type=pants" class="item">Pants</a></li>
					<li><a href="/clotheshop_F/QnA/list.jsp" class="item">Q & A</a></li>
			
					<!-- <li id=sidemenu><jsp:include page="sidemenu.jsp"></jsp:include></li>-->
					<li><span style="font-size: 20px">WELCOME ${user_name}</span>
						<a href="/clotheshop_F/user/logout">Sign out</a></li>
						
				</ul>

			</div>
		</c:if>
	</c:if>

	<c:if test="${user_id!=null}">
		<c:if test="${position==0}">
			<div class="nav">
				<ul>
					<li><a href="/clotheshop_F/DOM/index2.jsp" class="item">ALL List</a></li>
					<li><a href="/clotheshop_F/product/typeList?type=outer" class="item">Outer</a></li>
					<li><a href="/clotheshop_F/product/typeList?type=top" class="item">Top</a></li>
					<li><a href="/clotheshop_F/product/typeList?type=pants" class="item">Pants</a></li>
					<li><a href="/clotheshop_F/QnA/list.jsp" class="item">Q & A</a></li>
					<li id=orderlist><a href="/clotheshop_F/orders/list.jsp"
					style="font-size: 20px;">OrderList</a></li>
					<li><a href="/clotheshop_F/user/logout">Sign out</a></li>
					<li><span style="font-size: 20px;"> WELCOME <i><b>${user_name}</b></i>&nbsp님
					</span></li>
					
					<input type=button value="내 정보 보기" id="personalInfo"> 
				</ul>

			</div>
		</c:if>
	</c:if>

	<c:if test="${user_id==null}">
		<div class="nav">
			<ul>
				<li><a href="/clotheshop_F/DOM/index2.jsp" class="item">ALL List</a></li>
				<li><a href="/clotheshop_F/product/typeList?type=outer" class="item">Outer</a></li>
				<li><a href="/clotheshop_F/product/typeList?type=top" class="item">Top</a></li>
				<li><a href="/clotheshop_F/product/typeList?type=pants" class="item">Pants</a></li>
				<li><a href="/clotheshop_F/QnA/list.jsp" class="item">Q & A</a></li>
				
				<li><a href="/clotheshop_F/user/login.jsp">Sign in</a></li>
			</ul>
		</div>
	</c:if>
</body>
<script>
	var user_id="${user_id}";
	   $("#personalInfo").on("click",function(){
	      location.href="/clotheshop_F/user/read?user_id="+user_id;
	   });
</script>