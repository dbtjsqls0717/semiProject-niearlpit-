<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니 얼 핏</title>
<link rel="stylesheet" href="../home.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
#tbl{margin:auto;}
#info{text-align:center;} 
</style>
</head>
<body>
   <div id="divPage">
      <div id="divSearch">
         <input type="text" id="txtWord"> <input type="button"
            id="btnSearch" value="검색">
      </div>
      <div id="divHeader">
         <jsp:include page="../DOM/header.jsp" />
      </div>

      <div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
      <!-- 내용 입력 시작 ------------------------------------->
      <div id="divCondition">
          
            <h2>구매자 정보</h2>
            
            <span id="info" style="text-align:center; margin-left:45%;">${phone}</span> 님의 주문 정보
            <br><br>
         
         <table id="tbl" width=800 border=1 height=100></table>
         <script id="temp" type="text/x-handlebars-template">
            <tr>   
               <td class="title" width=100>상품코드</td>
               <td class="title" width=100>가 격</td>
               <td class="title" width=100>수 량</td>
               <td class="title" width=100>색 상</td>
            <tr>
               <td class="goods_id">{{goods_id}}</td>
               <td >{{tot}}</td>
               <td>{{quantity}}</td>
               <td>{{color}}</td>
            </tr> 
        
           </script>
         </div>
      </div>

   <!-- 내용 입력 종료 --_---------------------------------->
   <hr>
   <div id="divfooter"><jsp:include page="../DOM/footer.jsp" /></div>
</body>
<script>
   var phone=$("#info").html();
   
   var goods_id=$("#tbl")
   
   
   getList();
   function getList(){
   $.ajax({
      type:"get",
      url:"/clotheshop_F/purchase/read2",
      data:{"phone":phone},
      dataType:"json",
      success:function(data){
         var template = Handlebars.compile($("#temp").html());        
         $("#tbl").html(template(data));
         
      }
   });
   }
   
</script>
</html>