<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Blacklist-니.얼.핏</title>
	<link rel="stylesheet" href="../home.css" />
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<style>
#tbl {margin:auto;}
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
        <div id="divContent">
       <div id="divCondition" style="margin:auto;width:1450px;height:1300px;" >
    	<h2>BlackList</h2>
          <span id="image" style="margin:auto; text-align:center;"> <img 
            src="../image/blacklisticon.png"
            width="130" height="130" style="padding-left:45%;">
         </span>
        <br><br>
        	<div id="divCondition">
            <div id="divSearch">
               <select id="selKey">
                  <option value="user_id">아아디</option>
                  <option value="user_name">이름</option>
               </select>
               <input type="text" id="partWord" placeholder=검색>
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
                  <option value="user_id">아아디</option>
                  <option value="user_name">이름</option>   
                 </select>            
                 <select id="selDesc">          
                    <option value="">오름차순</option>       
                   <option value="desc">내림차순</option>     
                   </select> 
            </div>
            <br><br>
         <table id="tbl" width=500 border=1></table>
         <script id="temp" type="text/x-handlebars-template">   
             <tr class="title">
               <td width=100>이름</td>
               <td width=250>아이디</td>   
            <td>블랙리스트풀기</td>    
             </tr>     
               {{#each blacklist}}
                  <tr class="row">
                     <td>{{user_name}}</td>
                     <td class="user_id">{{user_id}}</td>   
               <td><button>풀기</button></td>
                 </tr>      
              {{/each}}  
           </script>
           <div id="pagination">      
               <button id="btnPre">◀</button>    
               [<span id="curPage"></span>/<span id="totPage"></span>]  
               <button id="btnNext">▶</button>   
            </div> 
      </div>
      	<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
         </div>
      </div>
   </div>
   
   <!-- 내용 입력 종료 --_---------------------------------->
   <hr>
</body>
<script>
var key, word, order, desc, perPage, page=0;  

   getList();
   
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
    /*
    $("#tbl").on("click",".row" ,function(){
      var user_id=$(this).find(".user_id").html();
      location.href="userRead?user_id="+user_id;
   });
   */
   $("#tbl").on("click",".row button",function(){
      var row=$(this).parent().parent();
      var user_id=row.find(".user_id").html();
      alert("밴풀어?");
         $.ajax({
            type:"post",
            url:"positionChange",
            data:{"user_id":user_id},
            success:function(){
               location.href="list.jsp";
            }
         });
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
         url:"/clotheshop_F/user/blacklist",
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