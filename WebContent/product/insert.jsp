<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- JSTL c for each 문 fn 날짜 -->
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
   <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>니.얼.핏</title>
      <!-- 연동: rel | src | CSS 리스트 -->
      <link rel="stylesheet" href="../home.css" />
      <!-- jQuery -->
      <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
      <!-- 페이지스타일 -->
      <style>
         #divImagehode {width: 780px; margin: auto; overflow: hidden;}
         #divImage {width:300px; float: left;}
         #divdata {width:440px; float: right;}
         #prodtbl{width:420px;}
         #RegistrationHolder{width:440px; float: right; text-align: center}
      </style>
</head>

<body>
   <div id="divPage">
      <header>
         <div id="divHeader"><jsp:include page="../DOM/header.jsp"/></div>
         <div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
      </header>
      
      <!----------------------- 내용 입력 시작 ----------------------------->
         <div id="divContent">
            <div id="divMain">
               <form name="prodfrm" action="insert1" method="post" enctype="multipart/form-data">
               <div id="divImagehode">
                  <div id="divImage">
                     <img src="http://placehold.it/300x500" id="image" width=300 /> 
                     <input type="file" name="image" accept="image/*" style="visibility: hidden;">
                  </div>
                  <div id="divdata">
                  <table id="prodtbl">
                     <tr id="divgoods_id">
                        <td>ID: </td>
                        <td colspan=4><input type="text" size=51 name="goods_id" readonly></td>
                     </tr>
                     <tr class="row1">
                        <td>NAME: </td>
                        <td colspan=4><input type="text" size=51 name="goods_name"></td>
                     </tr>
                     <tr class="row1">
                        <td>PRICE: </td>
                        <td colspan=4><input type="text" size=51 name="price" placeholder="20000"></td>
                     </tr>
                     <tr class="row1">
                        <td>TYPE: </td>
                        <td colspan=4>
                           <select name="type">
                              <option value="outer">outer</option>
                              <option value="top">top</option>
                              <option value="pants">pants</option>
                           </select>
                        </td>
                     </tr>
                     <tr class="row1">
                        <td colspan=5>
                           <textarea rows="10" cols="60" name="content" name="content" placeholder="Description"></textarea>
                        </td>
                     </tr>
                     <tr class="row1">
                        <td>COLOR: </td>
                        <td width=40><input type="text" size=13 name="color" placeholder="BLACK">  </td>
                        <td width=30>STOCK: </td>
                        <td width=40><input type="text" size=13 name="stock" placeholder="50"></td>
                        <td><img src="../image/add.png" id="img-add" width=40></td>
                     </tr>
                     
                     <c:forEach items="${prodCart}" var="vo">
                        <tr class="row1">
                           <td>COLOR: </td>
                           <td> ${vo.color}</td>
                           <td>STOCK: </td>
                           <td> ${vo.stock}</td>
                           <td></td>
                        </tr>
                     </c:forEach>
                     <tr class="row1">
                        <td colspan=5><img src="../image/Registration.png" id="img-Registration" width=200px;><td>
                     </tr>
                     </table>
                  </div>
               </div>
               </form>
            </div>
         </div>
      <!----------------------- 내용 입력 종료 ----------------------------->
   <div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
   </div>
</body>
<script>
var goods_id="${prod.goods_id}";
$("#divgoods_id").hide();

//유효성검사
$("#prodtbl").on("click",".row1 #img-Registration",function() {
   var row=$(this).parent().parent().parent();
   var goods_name=row.find(prodfrm.goods_name).val();
   var goods_id=row.find(prodfrm.goods_id).val();
   var type=row.find(prodfrm.type).val();
   var price=row.find(prodfrm.price).val();
   var content=row.find(prodfrm.content).val();
   var status=row.find(prodfrm.status).val();
   var image=row.find(prodfrm.image).val();
   var color=row.find(prodfrm.color).val();
   var stock=row.find(prodfrm.stock).val();
   var reg =/^[0-9\s]+$/;
   if(name=="" || price=="" || image=="") {
      alert("제품 이름 및 가격, 이미지를 등록해 주십시오.");
   }
   if(!reg.test(price)) {
      alert("가격은 숫자로만 입력해 주십시오.");
      return;
   }
   if(!reg.test(stock)) {
      alert("수량은 숫자로만 입력해 주십시오.");
      return;
   }
});

$("#prodtbl").on("click",".row1 #img-add",function() {
   var row=$(this).parent().parent().parent();
   var image=row.find(prodfrm.image).val();
   if(image==null){
      alert("제품의 이름 및 가격, 이미지순으로 입력 후 add해 주십시오.");
   }
});


//이미지 체인지 insert
$(prodfrm.image).change(function() {
   var row=$(this).parent().parent().parent();
   var goods_name=row.find(prodfrm.goods_name).val();
   var goods_id=row.find(prodfrm.goods_id).val();
   var type=row.find(prodfrm.type).val();
   var price=row.find(prodfrm.price).val();
   var content=row.find(prodfrm.content).val();
   var status=row.find(prodfrm.status).val();
   var image=row.find(prodfrm.image).val();
   if(goods_name==""){
      alert("제품 이름을 입력해주십시오.");
      $(prodfrm.image).val("");
      return;
   }else if(price==""){
      alert("제품의 가격을 입력해주십시오.");
      $(prodfrm.image).val("");
      return;
   }else{
      prodfrm.submit();
   }
});


//get goods_id
getID();
function getID(){
   $.ajax({
      type:"get",
      url:"getID",
      dataType:"json",
      success:function(data) {
         $(prodfrm.goods_id).val(data.goods_id);
      }
   });
}

 //업로드할 이미지 불러오기
   $("#image").on("click",function() {
      $(prodfrm.image).click();
   });
   $(prodfrm.image).on("change",function() {
      var reader=new FileReader();
      reader.onload=function(e){
         $("#image").attr("src", e.target.result);
      }
      reader.readAsDataURL(this.files[0]);
   });

</script>
<script src="home.js"></script>
</html>