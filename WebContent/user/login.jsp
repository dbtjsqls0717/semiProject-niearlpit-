<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- JSTL c for each 문 fn 날짜 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in - 니.얼.핏</title>
<!-- 연동: rel | src | CSS 리스트 -->
<link rel="stylesheet" href="../home.css" />
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- handlebars -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
.btn1 {
   box-shadow:inset 0px 1px 3px 0px #91b8b3;
   background:linear-gradient(to bottom, #353b39 5%, #485c5c 100%);
   background-color:#353b39;
   border-radius:5px;
   border:1px solid #566963;
   display:inline-block;
   cursor:pointer;
   color:#ffffff;
   font-family:Arial;
   font-size:17px;
   font-weight:bold;
   padding:11px 45px;
   text-decoration:none;
   text-shadow:0px -1px 0px #2b665e;
}
.btn1:hover {
   background:linear-gradient(to bottom, #485c5c 5%, #353b39 100%);
   background-color:#485c5c;
}
.btn1:active {
   position:relative;
   top:1px;
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
         <div id="divContent">
         <!--여기에 내용출력 시작------------------------------>
         	<div id="divMain">
		        <form name="frm" action="login" method="post">
		            <table style="margin:auto; width:550px; height:250px;" id="tbl2">
		               <tr>
		                  <td class="title" width=100 colspan=2>
		                     <h2>Sign in</h2>
		                  </td>
		               </tr>
		               <tr>
		                  <td class="title" width=150 style="font-size:20px;">ID</td>
		                  <td><input type="text" style="width:400px;height:30px;font-size:20px;" name="user_id" placeholder="Username"></td>
		               </tr>
		               <tr>
		                  <td class="title" width=150 style="font-size:20px;">PASSWORD</td>
		                  <td><input type="password" name="password" style="width:400px;height:30px;font-size:20px;" placeholder="Enter your password"></td>
		               </tr>
		            </table>
		            <br>
		               <table style="margin:auto;">
		               <tr>
		                  <td><input type="submit" value="Sign in" class="btn1"></td>
				          <td><a href="/clotheshop_F/user/newuser.jsp" class="btn1">CREATE A NEW ACCOUNT</a></td>               
		               </table>
		         </form>
      		   <div id=btn1 style="text-align:center;"></div>
         <!--여기에 내용출력 종료---------------------------- -->
      		</div>
		<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
         </div>
   </div>
</body>
<script>
$("#btn1").on("click",function(){
    location.href="newuser.jsp";
 });
   
   $(frm).submit(function(e){
      e.preventDefault();
      var user_id=$(frm.user_id).val();
      var password=$(frm.password).val();
      $.ajax({
         type:"post",
         url:"login",
         data:{"user_id":user_id, "password":password},
         dataType:"json",
         success:function(data){
            if(data.check==0){
               alert("아이디가 없음");
            }else if(data.check==1){
               alert("비밀번호가 틀림");
            }else if(data.check==3){
            	alert("회원탈퇴 계정입니다.");
            }else if(data.check==4){
            	alert("정지된 계정입니다.");
            }
            else{
               location.href="/clotheshop_F/DOM/index.jsp";
            }
         }
      });
   });
</script>
</html>