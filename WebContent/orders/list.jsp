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
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- handlebars -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
	table {
		margin-top: 60px;
		width: 1190px;
		text-align: center;
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
	}
	</style>
</head>

<body>
	<header>
		<div id="divHeader"><jsp:include page="../DOM/header.jsp" /></div>
		<div id="divMenu"><jsp:include page="../DOM/menu.jsp" /></div>
		<br>
	</header>
	<div id="divPage">
		<!--------------------- 콘텐트시작 ----------------------------------->
		<div id="divContent">
			<%-- 		<div id="divSidebar"><jsp:include page="../DOM/sidebar.jsp" /></div> --%>
			<%-- <div id="divSearchbar"><jsp:include page="searchbar.jsp" /></div> --%>
			<!----------------------- 내용 입력 시작 ----------------------------->
			<div id="divMain">
				<h1>orders list</h1>
				<table id="tbl" width=800 border=1></table>
				<script id="temp" type="text/x-handlebars-template">   
             <tr class="title">
               <td width=250>전화번호</td> 
               <td width=100>상품코드</td>
               <td width=100>주문날짜</td>     
                  <td width=100>색상</td> 
               <td width=100>가격</td>  
               <td width=100>주문수량</td> 
               </tr>     
               {{#each array}}  
               <tr class="row">
               <td class="phone">{{phone}}</td>
               <td class="goods_id">{{goods_id}}</td>   
               <td class="order_date">{{orderDate}}</td>
               <td class="color">{{color}}</td>
               <td class="price">{{price}}</td> 
                   <td class="quantity">{{quantity}}</td> 
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
	<!----------------------- 내용 입력 종료 ----------------------------->
	
</body>
<script>
var key, word, order, desc, perPage, page=1;  
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

   
	//주문 목록  
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
<!-- <script src="home.js"></script> -->
</html>