<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Q & A Admin Reply-니.얼.핏</title>
	<link rel="stylesheet" href="../home.css" />
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
  <header>
		<div id="divHeader"><jsp:include page="../DOM/header.jsp" /></div>
		<div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
		<br>
	</header>
   <div id="divPage">
      <!-- 내용 입력 시작 ------------------------------------->
      <div id="divCondition" style="margin:auto;width:1450px;height:1100px;">
        <div id="divContent" style="margin:auto;width:850px;height:500px;">
            
               <table width=750 border=1>
                  <tr>
                     <td>Question Number</td>
                     <td>${vo.question_number}</td>
                  </tr>
                  <tr>
                     <td>Title</td>
                     <td>${vo.title}</td>
                  </tr>
                  <tr>
                     <td>Customer Info</td>
                     <td>${vo.user_id}</td>
                  </tr>
                  <tr>
                     <td>Written Date</td>
                     <td>${vo.questionDate}</td>
                  </tr>
               </table>
               -----------------------------------------------------------------------------<br>
            Content : ${vo.content}            
               <c:if test="${user_id==vo.user_id or position==1}">
                  <div>
                  <input type="button" value="수정" id="btnUpdate">
                  <button id="btnDel">삭제</button>
                  </div>
               </c:if>
            <br>
               <form name="frm1">
               <c:if test="${vo.state==1}">
               <table width=500 border=1>
                  <tr>
                     <td>관리자답변</td>
                     <td>답변날짜</td>
                  </tr>
                  <tr>
                     <td>${vo.content2}</td>
                     <td>${vo.answerDate}</td>
                  </tr>
               </table>
               </c:if>               
               <c:if test="${position==1 and vo.state==1}">
               <button>삭제</button>
               </c:if>
               </form>
            <br>
            <form action="AnswerUpdate" method="post" name="frm">
            <c:if test="${position==1}">
            <table width=500 border=1>
               <tr class="row">
                  <td colspan=2><textarea rows="5" cols="70" name="content2"></textarea></td>
               </tr>
            </table>
            <input type="submit" value="답변하기" id="btnInsert">
            </c:if>         
            </form>      
         </div>
         <!-- 내용 입력 종료 --_---------------------------------->
      	<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
      </div>
   </div>

   <hr>
</body>
<script>
   var title = "${vo.title}";
   var content = "${vo.content}";
   var question_number = "${vo.question_number}";
   var content2 = "${vo.content2}";
   var answerDate = "${vo.answerDate}";
   var user_id="${user_id}";
   var position="${position}";
   
   //QnA 답변삭제
   $(frm1).submit(function(e){
      e.preventDefault();
      if(!confirm("답글을 삭제하시겠습니까?")) return;
      $.ajax({
         type:"post",
         url:"AnswerDelete",
         data:{"question_number":question_number},
         success:function(){
            alert("답변이 삭제되었습니다");
            location.href="list.jsp";
         }
      });      
   });
   
   //QnA 관리자 답글 등록
   $(frm).submit(function(e){
      e.preventDefault();
      if(!confirm("답글을 등록하시겠습니까?")) return;
      var content2=$(frm.content2).val();
      $.ajax({
         type:"post",
         url:"AnswerUpdate",
         data:{"content2":content2,"question_number":question_number},
         success:function(){
            alert("답변이 완료되었습니다");
            location.href="list.jsp";
         }
      });      
   });
   //QnA 게시글 수정
   $("#btnUpdate").on("click", function() {
      location.href = "updateRead?question_number=" + question_number;
   });
   //QnA 게시글 삭제
   $("#btnDel").on("click", function() {
      if (!confirm("제목 : " + title + "을(를) 삭제하시겠습니까?"))return;
      $.ajax({
         type : "get",
         url : "delete",
         data : {"question_number" : question_number},
         success : function() {
            alert("제목 : " + title + " (이)가 삭제되었습니다");
            location.href = "list.jsp";
         }
      });
   });
</script>
</html>