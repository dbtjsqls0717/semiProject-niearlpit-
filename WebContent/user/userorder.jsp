<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../home.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
#content h1{text-align:center;}
#tbl {margin:auto;}
</style>
</head>
<body>
   <div id="divPage">
      <!--<div id="divSearch">
         <input type="text" id="txtWord"> <input type="button"
            id="btnSearch" value="검색">
      </div>-->
      
      <br><br><br><br>
      <div id="divHeader">
         <jsp:include page="../DOM/header.jsp" />
      </div>

      <div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
      <!-- 내용 입력 시작 ------------------------------------->
      <div id="divCondition">
         <div id="content" >
         <h1>${user_name}님이 주문하신 상품 목록</h1>
      <table id="tbl" border=1></table>
         <script id="temp" type="text/x-handlebars-template">   
             <tr class="title">
               <td width=60>상품번호</td>
               <td width=60>옵션</td>       
               <td width=60>수량</td>     
               <td width=60>상품 금액</td> 
               <td width=60>결제 금액</td> 
             </tr>     
               {{#each user_order}}
                  <tr class="row">
                     <td>{{goods_id}}</td>
                     <td>{{color}}</td>   
                     <td>{{quantity}}</td> 
                     <td>{{price}}</td>  
                     <td>{{sum}}</td>
                 </tr>      
              {{/each}}  
           </script>
 
            <div id="divfooter">
      <jsp:include page="../DOM/footer.jsp" />
   </div>
</body>

<script>
var phone="${phone}";

$.ajax({
   type:"post",
   url:"/clotheshop_F/orders/read",
   data:{"phone":phone},
   dataType:"json",
   success:function(data){
      var template = Handlebars.compile($("#temp").html());        
        $("#tbl").html(template(data));
   }
})
</script>
</html>