<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
   font-family: "Lato", sans-serif;
}

.sidebar {
   height: 100%;
   width: 0;
   position: fixed;
   z-index: 1;
   top: 0;
   left: 1670px;
   background-color: #111;
   overflow-x: hidden;
   transition: 0.5s;
   padding-top: 60px;
}

.sidebar a {
   padding: 8px 8px 8px 32px;
   text-decoration: none;
   font-size: 25px;
   color: #818181;
   display: block;
   transition: 0.3s;
}

.sidebar a:hover {
   color: #f1f1f1;
}

.sidebar .closebtn {
   position: absolute;
   top: 0;
   right: 100px;
   font-size: 36px;
   margin-left: 50px;
}

.openbtn {
   font-size: 20px;
   cursor: pointer;
   background-color: #111;
   color: white;
   padding: 10px 15px;
   border: none;
}

.openbtn:hover {
   background-color: #444;
}

#main {
   transition: right 0.5s ease;
   padding: 16px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
   .sidebar {
      padding-top: 15px;
   }
   .sidebar a {
      font-size: 18px;
   }
}
</style>
</head>
<body>

   <div id="mySidebar" class="sidebar">
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
      
       <a href="/clotheshop_F/user/blacklist.jsp">BlackList</a>
           <a href="/clotheshop_F/user/list.jsp">UserList</a>
           <a href="/clotheshop_F/product/insert.jsp">Product ADD</a>
   </div>

   <div id="main">
      <button class="openbtn" onclick="openNav()">☰ </button>

      
   </div>

   <script>
      function openNav() {
         document.getElementById("mySidebar").style.width = "250px";
         document.getElementById("main").style.marginLeft = "0px";
      }

      function closeNav() {
         document.getElementById("mySidebar").style.width = "0";
         document.getElementById("main").style.marginLeft = "0";
      }
   </script>

</body>
</html>