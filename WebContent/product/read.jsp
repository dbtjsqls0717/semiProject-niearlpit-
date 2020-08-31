<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="../home.css">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	.box {float:left; text-align:center;padding:80px;}
	/*#divfooter {width:1500px;text-align:center;}*/
	#content{ width:90%}
	#imgInfo{float:left;margin-left:300px;}
	#goodsInfo{float:right; width:300px;margin-right:150px;}
	#order_read_tbl #btnRow button{width:200px;height:100px;font-size:40px;}
	#order_read_tbl .row, #infoRow{text-align:center;}
	#order_read_tbl .row button{float:right;}
	</style>
</head>
<body>
   <div id="divPage">
      <!-- <div id="divSearch">
         <input type="text" id="txtWord"> <input type="button"
            id="btnSearch" value="검색">
      </div> -->
      <br><br><br><br>
      <div id="divHeader">
         <jsp:include page="../DOM/header.jsp" />
      </div>

      <div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
      <!-- 내용 입력 시작 ------------------------------------->
      <div id="divCondition">
         <div id="content" >
         
            <span id="imgInfo">
            <br><br>
               <img src="/clotheshop_F/proimg/${pvo.image}" width=400 height=400>
            </span>
            
            <span id="goodsInfo">
            <br><br><br>
               <div id=row>
                       ${pvo.goods_name}<br><br>
                       ${pvo.price}원<br><br><hr>
                     <table id=order_read_tbl>
                        <tr>
                        <td>필수 옵션 :</td>
                        
                        
                           <td>       
                           <select id="info" style="height:30px;">
                              <option selected>선택 해주세요!</option>
                              <option disabled>------------------------------------</option>
                              <c:forEach items="${stockInfo}" var="cvo">
                                 <option value="${cvo.color}" >
                                 Color      :      ${cvo.color}      /      Size      :      free
                                 </option>
                              </c:forEach>
                           </select>
                           </td>
                        </tr>
                        <tr>
                           <td colspan=2><hr></td>
                        </tr>
                        <tr id=infoRow>
                           <td>선택옵션</td>
                           <td>수량</td>
                        </tr>
                           <tr>
                           <td colspan=2><hr></td>
                        </tr>
                     <c:forEach items="${orderCart}" var="cart">
                        <tr class="row">
                           
                           <td class="orderInfo" color="${cart.color}">Color      :      ${cart.color}      /      Size      :      free            ${cart.sum}원      </td>
                           <td><input type=text value="${cart.quan}" size=1 readonly><button>x</button></td>
                        </tr>
                     </c:forEach>
                        <tr>
                           <td colspan=2><hr></td>
                        </tr>
                        <tr id=btnRow>
                           <td><button id=btnOrder>주문하기</button></td>
                        </tr>
                  </table>
                     

                 </div>
            </span>
               
            
         </div>
         
      </div>
         

   </div>
   
   <!-- 내용 입력 종료 --_---------------------------------->


</body>

<script>
var goods_id="${pvo.goods_id}";
var price="${pvo.price}";
var user_id="${user_id}";


$("#info").change(function(){
      var color=$(this).val();
      $.ajax({
         type:"post",
         url:"miniCartIn",
         data:{"goods_id":goods_id,"color":color,"price":price},
         success:function(){
            location.href="productInfo?goods_id="+goods_id;
         }
      })
   })
   
   $("#order_read_tbl").on("click",".row button",function(){
      var color=$(this).parent().parent().find(".orderInfo").attr("color");
      
      $.ajax({
         type:"post",
         url:"miniCartDelete",
         data:{"color":color,"goods_id":goods_id},
         success:function(){
            location.href="productInfo?goods_id="+goods_id;
         }
      })
   })
   
   $("#order_read_tbl").on("click","#btnRow #btnOrder",function(){
      var color=$("#order_read_tbl .row .orderInfo").attr("color");
      if(!confirm("주문하시겠습니까?"))return;
      
      if(color==null){
         alert("선택한 상품이 없습니다.");
      }
      else{
      location.href="/clotheshop_F/orders/read?goods_id="+goods_id+"&user_id="+user_id;
      }
   })
</script>
</html>