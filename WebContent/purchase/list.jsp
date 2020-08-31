<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니 얼 핏</title>
<link rel="stylesheet" href="../home.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
#tbl {margin:auto;}
</style>
</head>
<body>
   <div id="divPage">
      <div id="divSearch">
      </div>
      <div id="divHeader">
         <jsp:include page="../DOM/header.jsp" />
      </div>

      <div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
      <!-- 내용 입력 시작 ------------------------------------->
      <div id="divCondition">
         <div id="divSearch">
            <select id="selKey">
               <option value="phone">전화번호</option>
               <option value="address">주소</option>
               <option value="user_name">성명</option>
               <option value="email">이메일</option>
            </select> <input type="text" id="txtWord"> <select id="selPerPage">
               <option value="3">3행</option>
               <option value="5" >5행</option>
               <option value="10" selected>10행</option>
            </select> <input type="button" id="btnSearch" value="검색"> <span
               style="font-size: 12px;">검색수: <b id="count"></b>건
            </span>
         </div>
         <div id="divSort">
            <select id="selOrder">
               <option value="phone">전화번호</option>
               <option value="address">주소</option>
               <option value="user_name">성명</option>
               <option value="email">이메일</option>
            </select> <select id="selDesc">
               <option value="">오름차순</option>
               <option value="desc">내림차순</option>
            </select>
         </div>

         <h2>구매자 목록</h2>

         <table id="tbl" width=800 border=1></table>
         <script id="temp" type="text/x-handlebars-template">   
             <tr class="title">
               <td width=250>전화번호</td> 
               <td width=100>성명</td>
               </tr>     
               {{#each array}}  
               <tr class="row">
               <td class="phone">{{phone}}</td>
               <td class="user_name">{{user_name}}</td>   
              </tr>      
              {{/each}}  
           </script>

         <div id="pagination">
            <button id="btnPre">◀</button>
            [<span id="curPage"></span>/<span id="totPage"></span>]
            <button id="btnNext">▶</button>
         </div>
      </div>
      <div id="divfooter"><jsp:include page="../DOM/footer.jsp" /></div>
   </div>

   <!-- 내용 입력 종료 --_---------------------------------->
   <hr>
   
</body>
<script>
var key,word,order,desc,perPage,page=1;

   $("#tbl").on("click",".row",function(){
      var phone=$(this).find(".phone").html();
      var user_name=$(this).find(".user_name").html();

      location.href="read?phone="+phone+"&user_name="+user_name;
   });

    getList();
   
    $("#btnSearch").on("click", function(){
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
       word=$("#txtWord").val();     
       order=$("#selOrder").val();    
       desc=$("#selDesc").val();    
       perPage=$("#selPerPage").val();   
       
       $.ajax({           
          type:"get",       
          url:"list",       
          data:{"key":key,"word":word,"page":page,"perPage":perPage,"order":order,"desc":desc},     
          dataType:"json",   
          success:function(data){             
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