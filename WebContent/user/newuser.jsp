<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Your Account - 니.얼.핏</title>
<!-- 연동: rel | src | CSS 리스트 -->
<link rel="stylesheet" href="../home.css" />
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- handlebars -->
<script>
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
.btn1 {
   box-shadow:inset 0px 1px 3px 0px #91b8b3;
   background:linear-gradient(to bottom, #353b39 5%, #485c5c 100%);
   background-color:#353b39;
   border-radius:5px;
   border:1px solid #566963;
   display:inline-block;
   cursor:pointer;
   color:#ffffff;
   font-family:Arial;
   font-size:17px;
   font-weight:bold;
   padding:11px 45px;
   text-decoration:none;
   text-shadow:0px -1px 0px #2b665e;
}
.btn1:hover {
   background:linear-gradient(to bottom, #485c5c 5%, #353b39 100%);
   background-color:#485c5c;
}
.btn1:active {
   position:relative;
   top:1px;
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
         <div id="divContent">
         <!--여기에 내용출력 시작------------------------------>
         <div id="divMain">
          <form name="frm" action="insert" method="post">
            <table style="margin:auto;float:center;width:500px;">
             <tr>
		         <td class="title" width=500px; height=40px; colspan=2>
		              <h2>Create an account </h2>
		         </td>
               <tr>
                  <td><input type="text" name="user_id" style="width:300px;height:30px;font-size:20px;"  placeholder="New Id"></td>
                  <td><input type="button" name="btnCheck" value="ID Duplicate Check" style="height:35px;width:190px;font-size:18px;"></td>
               </tr>
               <tr>
                 <td><span><input type="password" name="password" style="width:300px;height:30px;font-size:20px;" placeholder="Password"></span>
               </tr>
               <tr>
                 <td><input type="password" name="passCheck" style="width:300px;height:30px;font-size:20px;" placeholder="Confirm"></td>
               </tr>
               <tr>
                  <td><input type="text" name="user_name" style="width:300px;height:30px;font-size:20px;" placeholder="First & Last Name"></td>
               </tr>   
               <tr>
                  <td><input type="text" name="phone" maxlength="11" style="width:300px;height:30px;font-size:20px;" placeholder=" Phone Number (-)"></td>
               </tr> 
               <tr>
                   <td style="width:500px;height:30px;font-size:20px;">
                           <input type="text" name="yy" size=2 placeholder="yyyy" maxlength="4" style="width:80px;height:30px;font-size:20px;">년
                           <input type="text" name="mm" size=1 placeholder="mm" maxlength="2"  style="width:60px;height:30px;font-size:20px;">월
                           <input type="text" name="dd" size=1 placeholder="dd" maxlength="2" style="width:60px;height:30px;font-size:20px;">일
                </tr>  
                <tr>
                   <td><input type="text" name="address" style="width:300px;height:30px;font-size:20px;" placeholder="Address"></td>
                </tr>
                <tr>
                   <td><input type="text" name="address2" style="width:300px;height:30px;font-size:20px;" placeholder="Address2"></td>
                </tr>
            </table>
            <br>
            <table style="margin:auto;">
            	<td><input type="submit" value="회원가입" class="btn1"></td>
  				<td><input type="reset" value="취소" onClick="location.href='/clotheshop_F/user/login.jsp';"/ class="btn1"></td>               
            </table>
            
         </form>
         
         <!-- 내용 입력 종료 --_---------------------------------->
         </div>
		<div id="divFooter"><jsp:include page="../DOM/footer.jsp" /></div>
      </div>
   </div>
   <hr>
</body>
<script>

var check=null;

   $(frm.btnCheck).on("click",function(){
       user_id=$(frm.user_id).val();
       if(user_id==""){
          alert("아이디입력해여");
       }else{
          $.ajax({
             type:"get",
             url:"check",
             data:{"user_id":user_id},
             dataType:"json",
             success:function(data){
                if(data.check==0){
                   alert("사용가능한 아이디입니다");
                   check=user_id;
                }else{
                   alert("이미사용중인 아이디입니다");
                   $(frm.id).val("");
                }
             }
          });
       }
       
    });

    $(frm).submit(function(e){
         e.preventDefault();
         var user_id=$(frm.user_id).val();
         var password=$(frm.password).val();
         var user_name=$(frm.user_name).val();
         var birthday=$(frm.birthday).val();
         var address=$(frm.address).val();
         var address2=$(frm.address2).val();
         var phone=$(frm.phone).val();
         var yy=$(frm.yy).val();
         var mm=$(frm.mm).val();
         var dd=$(frm.dd).val();
         var passCheck=$(frm.passCheck).val();
         //alert(user_id+password+user_name+yy+mm+dd+address+address2+phone);
         if(user_id==""||password==""||user_name==""||address==""||birthday==""||phone==""){
            alert("모든값을 입력하세여");
         }else if(user_id==check){
            if(password==passCheck){
               alert("회원가입되었습니다");
               frm.submit();
            }else{
               alert("비밀번호확인이 잘못되었습니다");
            }   
         }else {
            alert("중복체크된 아이디가 아닙니다");
         }
         
      });
</script>
</html>