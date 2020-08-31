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
#content{ width:900px;margin:auto;}
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
         <h1>주 문 / 결 제</h1>
      <hr>

      <h3>구매자 정보</h3>
      <table id="tbl1" width=600px>
         <tr  id="name">
            <td>이름</td>
            <c:if test="${user_id!=null}">
               <td><input type="text" id="user_name" size=10 value="${user.user_name}"></td>
            </c:if>
             <c:if test="${user_id==null}">
                <td><input type="text" id="user_name" size=10 value="비회원"></td>
             </c:if>
         </tr>
         <tr id="address">
            <td >배송주소</td>
            <td>
            <c:if test="${user_id!=null}">
               <select id="orderinfo" style="height:30px;">
                  <option selected>선택 해주세요!</option>
                  <option value="${user.address}">${user.address}</option>
                  <option value="${user.address2}">${user.address2}</option>
               </select>
           </c:if>
           <c:if test="${user_id==null}">
               <input type=text id=address3>&nbsp&nbsp<button>v</button>
           </c:if>
            </td>
         </tr>
         <tr id=phone>
            <td >연락처</td>
            <c:if test="${user_id!=null}">
               <td><input type="text" size=20 value="${user.phone}" id="user_phone"></td>
            </c:if>
            <c:if test="${user_id==null}">
               <td><input type="text" size=20 id="user_phone"></td>
            </c:if>
         </tr>
      </table>
      
      <h3>상 품 정 보</h3>
      <!----------------------- 내용 입력 종료 ----------------------------->
      
         <c:forEach items="${orderCart}" var="cart">
         <tr class="row">
            <td><input type=hidden gid="${cart.goods_id}" id="goods_id"></td>
            <td class="orderInfo" color="${cart.color}">Color      :      ${cart.color}      /      Size      :      free            ${cart.sum}원      </td>
            <td>${cart.quan}개</td><br>
         </tr>
      </c:forEach>
      <h3>결제 정보</h3>
         
         <table id="tbl2" width=900>
         
         <tr>
            <td >총 상품 가격</td>
            <td id="">${totSum}원</td>
            
         </tr>
         <tr id="po">
            <td class="">포인트</td>
            <c:if test="${user_id!=null}">
               <td><input type="text" id="point" size=5 value="${user.point}" readonly ><button id=btnpoint1>사용</button></td>
            </c:if>
            <c:if test="${user_id==null}">
               <td><input type="text" id="point" size=5><button id=btnpoint2>사용</button></td>
            </c:if>
         </tr>
         <tr id="title">
            <td >배송주소</td>
            <td><input type="text" id="address2" size=55 readonly></td>
         </tr>
         <tr>
            <td class="">총 결제 금액</td>
            <c:if test="${user_id!=null}">
            <td id="">${totSum}원 // 적립금    <span id=savemoney></span>2%</td>
            </c:if>
            <c:if test="${user_id==null}">
            <td id="">${totSum}원</td>
            </c:if>
         </tr>
         
         <tr>
            <td class="">결제 후 포인트</td>
            <td > <span id=andmoney></span>원</td>
         </tr>
      </table>
      <br><br>
      <div>
         <c:if test="${user_id!=null}">
            <input type="button" id="payment" value="결제하기">
         </c:if>
      <c:if test="${user_id==null}">
            <input type="button" id="payment2" value="결제하기">
      </c:if>
      </div>
         </div>
      </div>
   </div>
   <!-- 내용 입력 종료 --_---------------------------------->
         <hr>
            <div id="divfooter">
      <jsp:include page="../DOM/footer.jsp" />
   </div>
</body>

<script>
var savemoney=Math.floor("${totSum*0.02}");
var point=$("#tbl2 #po").find("#point").val();
var point2="";
var totSum="${totSum}";
getmoney();

function getmoney(){
   $("#savemoney").html(savemoney+"원   //   ");
}

$("#orderinfo").change(function(){
   var address2=$(this).val();
   $("#tbl2 #title #address2").val(address2);
});

$("#tbl2").on("click","#po #btnpoint1",function(){
   if(point>totSum){
      $("#andmoney").html(point-totSum+savemoney);
   }
   else if(point<totSum) {
      alert("포인트를 충전해주세요");
   }
});

$("#tbl2").on("click","#btnpoint2",function(){
   point2=$("#tbl2 #po").find("#point").val();
   if(point2>=totSum)
      $("#andmoney").html(point2-totSum);
   else
      alert("포인트를 충전해주세요");
});


$("#tbl1").on("click","#address button",function(){
   $("#address2").val($("#address3").val());
})

$("#payment").on("click",function(){
   if(point<totSum){
      alert("포인트를 충전해주세요");
   }
   else{
      if(!confirm("결제 하시겠습니까?")) return;
      var phone=$("#tbl1 #phone").find("#user_phone").val();
      var address=$("#tbl2 #title ").find("#address2").val();
      var andmoney=$("#andmoney").html();
      
      if(phone==""){
         alert("전화번호를 입력 해주세요");
      }
      else if(address==""){
         alert("주소를 선택하거나 입력해주세요");
      }
      else if(andmoney==""){
         alert("포인트 사용을 클릭해주세요!");
      }
      else{
         var user_name=$("#tbl1 #name").find("#user_name").val();
         var user_phone=$("#tbl1 #phone").find("#user_phone").val();
         var address=$("#tbl2 #title #address2").val();
         var goods_id="${goods_id}";
         $.ajax({
            type:"post",
            url:"/clotheshop_F/orders/purIn",
            data:{"user_name":user_name,"user_phone":user_phone,"address":address,"goods_id":goods_id},
            success:function(){
               orderIn();
               pointUpDate();
            }
               
         })
         
      }
   }
});
$("#payment2").on("click",function(){
   var user_name=$("#tbl1 #name").find("#user_name").val();
   if(point2<totSum){
      alert("포인트를 충전해주세요");
   }
   else{
      if(!confirm("결제 하시겠습니까?")) return;
      var phone=$("#tbl1 #phone").find("#user_phone").val();
      var address=$("#tbl2 #title ").find("#address2").val();
      var andmoney=$("#andmoney").html();
      
      if(phone==""){
         alert("전화번호를 입력 해주세요");
      }
      else if(address==""){
         alert("주소를 선택하거나 입력해주세요");
      }
      else if(andmoney==""){
         alert("포인트 사용을 클릭해주세요!");
      }
      else{
         var user_name=$("#tbl1 #name").find("#user_name").val();
         var user_phone=$("#tbl1 #phone").find("#user_phone").val();
         var address=$("#tbl2 #title #address2").val();
         var goods_id="${goods_id}";
         $.ajax({
            type:"post",
            url:"/clotheshop_F/orders/purIn",
            data:{"user_name":user_name,"user_phone":user_phone,"address":address,"goods_id":goods_id},
            success:function(){
               orderIn();
            }
               
         })
      }
   }
});
var phone="${phone}";


function orderIn(){
   var user_phone=$("#tbl1 #phone").find("#user_phone").val();
   var goods_id="${goods_id}";
   $.ajax({
      type:"post",
      url:"/clotheshop_F/orders/OrdIn",
      data:{"user_phone":user_phone,"goods_id":goods_id},
      success:function(){
         alert("주문완료!"+"!");
        	 location.href="/clotheshop_F/DOM/index.jsp";
      }
         
   })
}

var user_id="${user_id}";

function pointUpDate(){
   var money=point-totSum+savemoney;
   phone=$("#tbl1 #phone").find("#user_phone").val();
   $.ajax({
      type:"post",
      url:"/clotheshop_F/orders/poin",
      data:{"user_id":user_id,"point":money},
      success:function(){
         location.href="/clotheshop_F/user/orderRead?phone="+phone;
      }
   })
}
</script>
</html>