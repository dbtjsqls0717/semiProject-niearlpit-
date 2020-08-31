<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL c for each 문 fn 날짜 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample</title>
<!-- 연동: rel | src | CSS 리스트 -->
<link rel="stylesheet" href="../home.css" />
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- handlebars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>

</style>
</head>

<body>
<h2>회 원 목 록</h2>
	<header>
		<div id="divHeader"><jsp:include page="../DOM/header.jsp" /></div>
		<div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
		<br>
	</header>
	<div id="divPage">
		<!--------------------- 콘텐트시작 ----------------------------------->
		<div id="divContent">
			<%-- <div id="divSidebar"><jsp:include page="../DOM/sidebar.jsp" /></div> --%>
			<div id="divSearchbar"><jsp:include page="../DOM/searchbar.jsp" /></div> 
			<!----------------------- 내용 입력 시작 ----------------------------->
			<div id="divMain">
				      <span id="image"> <img
            src="https://image.made-in-china.com/2f0j00dsfQOZLEZbzo/The-Wholesale-Mens-Dress-Shirts-Models-with-Mens-Casual-Shirts-Men-Wash-and-Wear.jpg"
            width="400" height="400"> <img
            src="https://sc01.alicdn.com/kf/HT16W0kFS0fXXagOFbXb/220128135/HT16W0kFS0fXXagOFbXb.jpg"
            width="200" height="400"> <img
            src="https://i.dmarge.com/2019/07/shacket.jpg" width="600"
            height="400">
         </span>
         <div id="content">
         <h2>회 원 목 록</h2>

         <table id="tbl" width=1150 border=1></table>
         <script id="temp" type="text/x-handlebars-template">   
             <tr class="title">
               <td width=250>이름</td>
               <td width=250>아이디</td>       
               <td width=250>주소</td>     
               <td width=250>주소</td> 
               <td width=150>전화번호</td>
            <td>포인트</td>     
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
              
           <div id="pagination">      
               <button id="btnPre">◀</button>    
               [<span id="curPage"></span>/<span id="totPage"></span>]  
               <button id="btnNext">▶</button>   
            </div> 
         </div>
			<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
			</div>
		<!----------------------- 내용 입력 종료 ----------------------------->
		</div>
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
<!-- <script src="home.js"></script> -->
</html>