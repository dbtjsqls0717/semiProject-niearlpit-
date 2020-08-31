<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Q & A-니.얼.핏</title>
	<link rel="stylesheet" href="../home.css" />
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <style>
	#tbl_qna .title { 
	 overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 100px;
  height: 20px;
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
      <!-- 내용 입력 시작 ------------------------------------->
      <div id="divMain">
      <div id="divContent">
		
         <div id="divContent" style="margin:auto;width:850px;height:900px; margin:auto;">
	 	
	 	<h2>Question & Answer</h2>
         <div id="divSearch">
            <select id="selKey">
               <option value="question_number">글번호</option>
               <option value="title">제목</option>
               <option value="user_id">작성자</option>
            </select> <input type="text" id="txtWord"> <select id="selPerPage">
               <option value="10">10행</option>
               <option value="15">15행</option>
               <option value="20">20행</option>
            </select> <input type="button" id="btnSearch" value="검색"> <span
               style="font-size: 12px;">검색수: <b id="count"></b>건
            </span>
         </div>
         <div id="divSort">
            <select id="selOrder">
               <option value="question_number">번호</option>
               <option value="user_id">작성자</option>
               <option value="title">제목</option>
               <option value="questionDate">작성일</option>
            </select> <select id="selDesc">
               <option value="">오름차순</option>
               <option value="desc">내림차순</option>
            </select>
         </div>
         <br><br><br><br><br><br>
            <table id="tbl_qna"  border=1 style="font-size:19px;"></table>
            <script id="temp" type="text/x-handlebars-template">
               <tr class="title">
                   <td width=150>글번호</td>
                   <td width=250>제목</td>
                   <td width=50>작성자</td>
                   <td width=400>작성일</td>
                  <td width=250>답변상태</td>
                  <c:if test="${position==1}">
                  <td width=150>답변하기</td>
                  </c:if>
                </tr>
                {{#each array}}
                <tr class="row">
                   <td class="question_number">{{question_number}}</td>
                   <td class="title">
                  <a href="read?question_number={{question_number}}">{{title}}</a>
                  </td>
                   <td class="user_id">{{user_id}}</td>
                   <td class="questionDate">{{questionDate}}</td>
                  <td>{{printState state}}</td>
                  <c:if test="${position==1}">
                  <td><button id="btnAnswer">답변하기</button></td>
                  </c:if>
                </tr>
                {{/each}}
             </script>
             <br>
            <div id="pagination">
               <button id="btnPre">◀</button>
               <button id="btnNext">▶</button>
               [<span id="curPage"></span>/<span id="totPage"></span>]
               <button id="btnWord">글쓰기</button>
            </div>
         </div>
      	<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
      </div>
      
   </div>
      </div>

   <!-- 내용 입력 종료 ------------------------------------>
</body>
<script>
   var url="/clotheshop_F/QnA/list";
   var user_id="${user_id}";
   
   $("#tbl").on("click",".row button",function(){
      var question_number=$(this).parent().parent().find(".question_number").html();
      location.href="read?question_number=" + question_number;
   });
   
   //글쓰기버튼
   $("#btnWord").on("click",function(){
      if(user_id==""){
         alert("로그인 후 이용하세요");
      }else if(user_id!=null){
         location.href="insert.jsp";
      }
   });
   
   //답변상태 바꾸기
   Handlebars.registerHelper("printState",function(state){
      var src;
      if(state==1) src="답변완료"; else src="문의중";
      return src;
   });
</script>
 <script>
 var key, word, order, desc, perPage, page=1;  
 //alert(url);
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
  //게시판목록 출력  
  function getList(){      
     key=$("#selKey").val();       
     word=$("#txtWord").val();     
     order=$("#selOrder").val();    
     desc=$("#selDesc").val();    
     perPage=$("#selPerPage").val();   
     
     $.ajax({           
        type:"get",       
        url:url,       
        data:{"key":key,"word":word,"page":page,"perPage":perPage,"order":order,"desc":desc},     
        dataType:"json",   
        success:function(data){             
           var template = Handlebars.compile($("#temp").html());        
           $("#tbl_qna").html(template(data));
           
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