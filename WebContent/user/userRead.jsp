<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Admin Customer List-니.얼.핏</title>
<link rel="stylesheet" href="../home.css" />
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<style>
#btnUser {
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
#btnUser:hover {
   background:linear-gradient(to bottom, #485c5c 5%, #353b39 100%);
   background-color:#485c5c;
}
#btnUser:active {
   position:relative;
   top:1px;
}
#backlist {
   box-shadow:inset 0px 1px 3px 0px #91b8b3;
   background:linear-gradient(to bottom, #353b39 5%, #485c5c 100%);
   background-color:#353b39;
   border-radius:5px;
   border:1px solid #566963;
   display:inline-block;
   cursor:pointer;
   color:#ffffff;
   font-family:Arial;
   font-size:20px;
   font-weight:bold;
   padding:12px 45px;
   text-decoration:none;
   text-shadow:0px -1px 0px #2b665e;
}
#backlist:hover {
   background:linear-gradient(to bottom, #485c5c 5%, #353b39 100%);
   background-color:#485c5c;
}
#backlist:active {
   position:relative;
   top:1px;
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
       <div id="divContent">
         <form name="frm" action="position" method="post">
            <table style="margin:auto;float:center;width:500px;">
               <tr>
                  <td class="title" width=600px; colspan=2>
                     <h2 style="font-size:50px;width:600px; text-align:center;margin-left:13%;">Admin-Customer Information</h2>
                  </td>
               </tr>
               <tr>
                  <td class="title" width=240 style="font-size:20px;">Account</td>
                  <td><input type="text" name="user_id" style="width:400px;height:27px;font-size:17px;" value="${uservo.user_id }" readOnly></td>
               </tr>
               <tr>
                  <td class="title" width=240 style="font-size:20px;">비밀번호</td>
                  <td><input type="password" name="password" style="width:400px;height:27px;font-size:17px;" value="${uservo.password }" readOnly></td>
               </tr>  
               <tr>
                  <td class="title" width=240 style="font-size:20px;">비밀번호 확인</td>
                  <td><input type="password" name="passCheck" style="width:400px;height:27px;font-size:17px;"></td>
               </tr>     
               <tr>
                  <td class="title" width=240 style="font-size:20px;">이름</td>
                  <td><input type="text" name="user_name" style="width:400px;height:27px;font-size:17px;" value="${uservo.user_name }" readOnly></td>
               </tr>   
               <tr>
                  <td class="title" width=240 style="font-size:20px;">전화번호</td>
                  <td><input type="text" name="phone" style="width:400px;height:27px;font-size:17px;" maxlength="11" placeholder=" - 없이입력" value="${uservo.phone }" readOnly></td>
               </tr> 
               <tr>
                     <td class="title" width=240 style="font-size:20px;">생년월일</td>
                   <td class="title" width=240 style="font-size:20px;">
                           <input type="text" name="yy" size=2 placeholder="yyyy" maxlength="4" value=2000 value="${fn:substring(vo.hiredate,0,4) }"style="width:80px;height:30px;font-size:20px"; readOnly>년
                           <input type="text" name="mm" size=1 placeholder="mm" maxlength="2" value=11 value="${fn:substring(vo.hiredate,5,7) }" style="width:80px;height:30px;font-size:20px";readOnly>월
                           <input type="text" name="dd" size=1 placeholder="dd" maxlength="2" value=01 value="${fn:substring(vo.hiredate,8,10) }"style="width:80px;height:30px;font-size:20px"; readOnly>일
                   </td>
                </tr>  
                <tr>
                   <td class="title" width=240 style="font-size:20px;">자택</td>
                   <td><input type="text" name="address" maxlength="11" style="width:400px;height:27px;font-size:17px;" value="${uservo.address }" readOnly></td>
                </tr>
                <tr>
                   <td class="title" width=240 style="font-size:20px;">회사</td>
                   <td><input type="text" name="address2" maxlength="11" style="width:400px;height:27px;font-size:17px;" value="${uservo.address2 }" readOnly></td>
                </tr>
                <tr>
                   <td class="title" width=240 style="font-size:20px;">포인트</td>
                   <td><input type="text" name="point" maxlength="11" style="width:400px;height:27px;font-size:17px;" value="${uservo.point }" ></td>
                </tr>
                <tr>
                   <td class="title" width=240 style="font-size:20px;">포지션</td>
                   <td><input type="text" name="point" maxlength="11" style="width:400px;height:27px;font-size:17px;" value="${uservo.position }" ></td>
                </tr>
            </table>
            <br>
            <div style="text-align:center">
               <input type="button" value="유저목록" id="btnUser">
               <input type="submit" value="blacklist" id="backlist">
            </div>

         </form>
      	<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
         
         </div>
      </div>

   
   <!-- 내용 입력 종료 --_---------------------------------->
   <hr>
</body>
<script>
   
   var position="${uservo.position }"
   
      $(frm).submit(function(e){
         e.preventDefault();
         if(!confirm("애밴?"))return;
         alert("밴완료");
         frm.submit();
      });
   
   $("#btnUser").on("click",function(){
      location.href="list.jsp"
   });
   /*
   $("#blacklist").on("click",function(){
      //var position=$(this).parent().parent().fidn(".")
      //alert(position);
      $.ajax({
         type:"post",
         url:"/user/blacklist",
         data:{"user_id":user_id,"position":position},
         success:function(){
            alert("블랙리스트 추가 완료 ");
         }
      });
   });
   */
</script>
<script src="home.js"></script>
</html>