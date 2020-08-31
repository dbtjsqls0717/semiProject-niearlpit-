<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Q & A Post -니.얼.핏</title>
	<link rel="stylesheet" href="../home.css" />
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
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
.btn{
margin-left:50%;
margin:auto;
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
      <div id="divCondition"  style="margin:auto;width:1650px;height:1300px; margin:auto;">
         <div id="divContent" style="margin:auto;width:1550px;height:1100px; margin:auto;">
            <h2>QnA</h2>
            <form action="insert" method="post" name="frm">
            <c:if test="${user_id==null}">
               <input type="hidden" value="guest" name="user_id">
            </c:if>
            <c:if test="${user_id!=null}">
               <input type="hidden" value="${user_id}" name="user_id">
            </c:if>
            <table id="tbl" border=1 width=900>
               <tr class="row">
                  <td class="title" width=120>제목</td>
                  <td><input type="text" name="title" size=150></td>
               </tr>
               <tr class="row">
                  <td colspan=2>
                     <textarea rows="15" cols="150" name="content"></textarea>
                  </td>
               </tr>
            </table>
            <br>
            <input type="submit" value="Save" class="btn1">
            <input type="reset" value="Cancel" class="btn1">
            </form>
      	<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
         </div>
      </div>
   </div>
   </div>
   <!-- 내용 입력 종료 --_---------------------------------->
</body>
<script>
   $(frm).submit(function(e){
      e.preventDefault();
      if(!confirm("저장하시겠습니까?")) return;
      
      var title=$(frm.title).val();
      var content=$(frm.content).val();
      
      if(title==""){
         alert("제목을 입력하세요");
         $(frm.title).focus();
      }else if(content==""){
         alert("내용을 입력하세요");
         $(frm.content).focus();
      }else{
         frm.submit();
      }
   });
</script>
</html>