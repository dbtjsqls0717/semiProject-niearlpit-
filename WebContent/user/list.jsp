<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custoemr Info-니.얼.핏</title>
<link rel="stylesheet" href="../home.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<style>
body {
	background-attachment: scroll;
	margin: 0;
	padding: 0;
}
#tbl{margin:auto;}
#tbl .title{
font-size:32px;
}
#tbl .row{
text-align:center;
}
#tbl .row:hover{
background:#E5E8E8;
}

</style>
<body>
    <header>
		<div id="divHeader"><jsp:include page="../DOM/header.jsp" /></div>
		<div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
		<br>
	</header>
	<div id="divPage">
		<!--------------------- 콘텐트시작 ----------------------------------->
        <div id="divContent">
         <h2>Customer Information</h2>
         <div id="divMain">
          
         <table id="tbl" style="width:800px; border:solid 1px black;"></table>
         <script id="temp" type="text/x-handlebars-template">   
             <tr class="title">
               <td width=250>Name</td>
               <td width=250>Account</td>       
               <td width=250>Address 1</td>     
               <td width=250>Address 2</td> 
               <td width=150>Phone number</td>
          	   <td width=150>Points</td>     
             </tr>     
               {{#each userlist}}
                  <tr class="row">
                     <td>{{user_name}}</td>
                     <td class="user_id">{{user_id}}</td>   
                     <td>{{address}}</td> 
                     <td>{{address2}}</td>  
                     <td>{{phone}}</td>
                     <td>{{point}}</td>
                 </tr>      
              {{/each}}  
           </script>
             <br>
         </div>
         <div id="pagination">      
               <button id="btnPre">◀</button>    
               [<span id="curPage"></span>/<span id="totPage"></span>]  
               <button id="btnNext">▶</button>   
          </div> 
      	<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
      </div>
      </div>
   
   <!-- 내용 입력 종료 ------------------------------------>
 
</body>
<script>
var key, word, order, desc, perPage, page=1;  

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
    
    $("#tbl").on("click",".row" ,function(){
      var user_id=$(this).find(".user_id").html();
      location.href="userRead?user_id="+user_id;
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