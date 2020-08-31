<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock List-니.얼.핏</title>
<link rel="stylesheet" href="../home.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   
</head>
<body>
  <header>
		<div id="divHeader"><jsp:include page="../DOM/header.jsp" /></div>
		<div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
		<br>
	</header>
   <div id="divPage">
    <div id="divMain">
       <div id="divContent" style="margin:auto;width:1500px;height:1200px; margin:auto;">
      <!-- 내용 입력 시작 ------------------------------------->
      <div id="divCondition" style="margin:auto;width:800px;height:600px; margin:auto;">
         <div id="content">
         <h2>Stock List</h2>
            <div id="divSearch">
               <select id="selKey">
                  <option value="stock.goods_id">상품코드</option>
                  <option value="color">컬러</option>
                  <option value="stock">재고</option>
               </select>
               <input type="text" id="partWord">
                  <select id="selPerPage">               
                     <option value="3">3행</option>       
                      <option value="5">5행</option>  
                      <option value="10">10행</option>   
                  </select>
                <input type="button" id="partSearch" value="검색">            
                <span style="font-size:12px;">검색수: <b id="count"></b>건</span> 
            </div>
            <div id="divSort">
                <select id="selOrder">              
                    <option value="product.goods_id">상품코드</option>
                  <option value="product.goods_name">상품이름</option>
                  <option value="color">컬러</option>
                  <option value="stock">재고</option>      
                 </select>            
                 <select id="selDesc">          
                    <option value="">오름차순</option>       
                   <option value="desc">내림차순</option>     
                   </select> 
            </div>
            <br><br>
         <table id="tbl" width=1150 border=1 style="font-size:19px;"></table>
         <script id="temp" type="text/x-handlebars-template">   
             <tr class="title" style="font-size:19px;">
               <td width=550>Product Name</td>
               <td width=450>Product Code</td>       
               <td width=250>Color</td>     
                  <td width=250>Stock</td> 
               <td width=150>Edit</td>      
               </tr>     
               {{#each array}}  
               <tr class="row">
               <td class="goods_name">{{goods_name}}</td>
               <td class="goods_id">{{goods_id}}</td>   
               <td class="color">{{color}}</td> 
                   <td><input type="text" class="stock" value={{stock}}></td>  
               <td><button>수정</button></td>
              </tr>      
              {{/each}}  
           </script>
            <br>
           <div id="pagination">      
               <button id="btnPre">◀</button>    
               [<span id="curPage"></span>/<span id="totPage"></span>]  
               <button id="btnNext">▶</button>   
            </div> 
         </div>
      </div>
		<div id="divFooter" style="margin-left:20px;"><jsp:include page="../DOM/footer.jsp" /></div>
      </div>
    </div>
   </div>
   
   <!-- 내용 입력 종료 --_---------------------------------->
   <hr>
</body>
<script>
var key, word, order, desc, perPage, page=1;  

   getList();
   
   
   
   //재고 수정
   $("#tbl").on("click",".row button",function(){
      var stock=$(this).parent().parent().find(".stock").val();
      var color=$(this).parent().parent().find(".color").html();
      var goods_id=$(this).parent().parent().find(".goods_id").html();
      
      $.ajax({
         type:"post",
         url:"update",
         data:{"goods_id":goods_id,"stock":stock,"color":color},
         success:function(){
            alert("수정 완료");
         }
      });
   });
   
   $("#partSearch").on("click", function(){
       page=1; 
       getList(); 
       });    
    $("#selOrder, #selDesc, #selPerPage").change(function(){
       page=1; 
       getList(); 
       });   
    $("#txtWord").keydown(function(key){  
       if(key.keyCode==13){
          page=1;
          getList(); 
          }    
       });   
    $("#btnNext").click(function(){
       page++;
       getList(); 
       });    
    $("#btnPre").click(function(){
       page--; 
       getList(); 
       });
    
   function getList(){
      key=$("#selKey").val();       
      word=$("#partWord").val();     
      order=$("#selOrder").val();    
      desc=$("#selDesc").val();    
      perPage=$("#selPerPage").val();
      
      $.ajax({
         type:"get",
         dataType:"json",
         url:"list",
         data:{"key":key,"word":word,"order":order,"desc":desc,"perPage":perPage,"page":page},
         success: function(data){
            var template = Handlebars.compile($("#temp").html());        
             $("#tbl").html(template(data));
             
             if(data.page==1){       
                   $("#btnPre").attr("disabled",true);  
                   } else {
                      $("#btnPre").attr("disabled",false);
                      }
                
                if(data.page==data.totPage){  
                   $("#btnNext").attr("disabled",true);    
                   } else {
                      $("#btnNext").attr("disabled",false);
                      }
                
                   $("#curPage").html(data.page);        
                   $("#totPage").html(data.totPage);       
                   $("#count").html(data.count); 
         }
      });
   }

</script>
</html>