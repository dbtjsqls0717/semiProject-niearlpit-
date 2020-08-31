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
         #tbltbl{width:440px; float: right;}
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
            <div id="divImagehode">
               <form name="prodfrm" action="update" method="post" enctype="multipart/form-data">
                  <div id="divImage">
                  <c:if test="${prod.image==null}">
                     <img src="http://placehold.it/300x500" id="image" width=300 /> 
                  </c:if>
                  <c:if test="${prod.image!=null}">
                     <img src="/img/product/${prod.image}" id="image" width=300 />
                  </c:if>
                     <input type="file" name="image" accept="image/*" style="visibility: hidden;">
                  </div>
                  <div id="divdata">
                  <table id="prodtbl">
                     <tr id="divgoods_id">
                        <td>ID: </td>
                        <td colspan=4><input type="text" size=51 name="goods_id" value="${prod.goods_id}" readonly></td>
                     </tr>
                     <tr class="row1">
                        <td>NAME: </td>
                        <td colspan=4><input type="text" size=51 name="goods_name" value="${prod.goods_name}"></td>
                     </tr>
                     <tr class="row1">
                        <td>PRICE: </td>
                        <td colspan=4><input type="text" size=51 name="price" value="${prod.price}" placeholder="20000"></td>
                     </tr>
                     <tr class="row1">
                        <td>TYPE: </td>
                        <td colspan=4>
                           <select name="type">
                              <option value="outer" <c:out value="${prod.type=='outer'?'selected':''}"/>>outer</option>
                              <option value="top" <c:out value="${prod.type=='top'?'selected':''}"/>>top</option>
                              <option value="pants" <c:out value="${prod.type=='pants'?'selected':''}"/>>pants</option>
                           </select>
                        </td>
                     </tr>
                     <tr class="row1">
                        <td colspan=5>
                           <textarea rows="10" cols="60" name="content"  placeholder="Description">${prod.content}</textarea>
                        </td>
                     </tr>
                     <tr class="row1">
                        <td>COLOR: </td>
                        <td width=40><input type="text" size=13 name="color" placeholder="BLACK"></td>
                        <td width=30>STOCK: </td>
                        <td width=40><input type="text" size=13 name="stock" placeholder="50"></td>
                        <td><img src="../image/add.png" id="img-add" width=40></td>
                     </tr>
                     
                     <c:forEach items="${ssession}" var="vo">
                        <tr class="row2">
                           <td>COLOR: </td>
                           <td class="scolor" width=100>${vo.color}</td>
                           <td>STOCK: </td>
                           <td class="sstock" width=46>${vo.stock}</td>
                           <td><img src="../image/x.png" id="img-delete" width=20></td>
                        </tr>
                     </c:forEach>
                     </table>
                  </div>
                  </form>
                  <div id="tbltbl">
                  <table id="looktbl">
                     <c:forEach items="${ssession}" var="vo">
                        <tr class="row1">
                           <td>COLOR: </td>
                           <td class="scolor"  width=125 color="${vo.color}">${vo.color}</td>
                           <td>STOCK: </td>
                           <td class="sstock"  width=125 stock="${vo.stock}">${vo.stock}</td>
                           <td><img src="../image/x.png" id="img-delete" width=20></td>
                        </tr>
                     </c:forEach>
                     <tr class="row1">
                        <td colspan=5><img src="../image/Registration.png" id="img-Registration" width=200px;><td>
                     </tr>
                  </table>
                  </div>
               </div>
            </div>
         </div>
      <!----------------------- 내용 입력 종료 ----------------------------->
   <div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
   </div>
</body>
<script>

$("#divgoods_id").hide();
$(".row2").hide();

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

$("#looktbl").on("click",".row1 #img-delete",function() {
   var goods_id=$("#prodtbl #divgoods_id").find(prodfrm.goods_id).val();
   var color=$(this).parent().parent().find(".scolor").attr("color");
   var stock=$(this).parent().parent().find(".sstock").attr("stock");

   $.ajax({
      type:"post",
        url:"sessionDelete",
        data:{"goods_id":goods_id,"color":color,"stock":stock},

        success:function(){
           location.href="insert2?goods_id="+goods_id;
        }
   });
});

$("#prodtbl").on("click",".row1 #img-add",function() {
   var row=$(this).parent().parent().parent();
   var goods_name=row.find(prodfrm.goods_name).val();
   var goods_id=row.find(prodfrm.goods_id).val();
   var type=row.find(prodfrm.type).val();
   var price=row.find(prodfrm.price).val();
   var content=row.find(prodfrm.content).val();
   var status=row.find(prodfrm.status).val();
   var image=row.find(prodfrm.image).val();
   var stock=row.find(prodfrm.stock).val();
   var color=row.find(prodfrm.color).val();
   var regcolor=/^[A-Z\s]+$/;
   var reg =/^[0-9\s]+$/;
   var form = $(prodfrm)[0];
   var data = new FormData(form);
   if(color=="" || stock=="") {
      alert("색상과 입고수량을 입력해주십시오.");
   }else if(!regcolor.test(color)){
      alert("색상은 영문 대문자로 입력해주십시오.");
   }else if(!reg.test(stock)) {
      alert("입고 수량은 숫자로만 입력해주십시오.");
   }else{
      $.ajax({
        type:"post",
        enctype: 'multipart/form-data',
        url:"add",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success:function(){
           $.ajax({
              type:"post",
                enctype: 'multipart/form-data',
                url:"productInfo",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success:function(){
                   location.href="insert2?goods_id="+goods_id;
                }
           });
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("fail"+e);
        }
     });
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
   if(goods_name==null){
      alert("제품 이름을 입력해주십시오.");
      return;
   }
   if(price==null){
      alert("제품의 가격을 입력해주십시오.")
      return;
   }
});


//Registrationd click
   $("#looktbl").on("click",".row1 #img-Registration",function() {
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
      if(!confirm("입력하시겠습니까?")) return;
      prodfrm.submit();

      
   }); 
   

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