 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {margin: 0;padding: 0;}
li {list-style: none}
a{text-decoration: none}
.hide { margin-top:55px; font:90% dotum;z-index:1}
.detail { margin-top:55px; font:90% dotum;z-index:2}
#header {position:relative;z-index:2}
#body {overflow: hidden;zoom: 1;position:relative;z-index:1}
.container {
  width: 300px;
  height: 50px;
  margin: 0 auto;
  position: absolute;

  
}

.nav {
  float: left;
  width: 100%;
  overflow: hidden;
}

.nav>li {
  float: left;
  width: 25%;
  box-sizing: border-box;
}

.nav>li>a {
  display: block;
  width: 100%;
  text-align: center;
  line-height: 3.4;
  color: #fcfcfc;
  font-size: 15px;
}

.nav>li>a:hover{
  background-color: black;
}

.sub {
  width: 300px;
  margin: 0 auto;
  position: absolute;
  top: 50px;
  left: 0;
  z-index: 1;
  display: none;
}

.sub2 {
  left: 300px;
}

.sub3 {
  left: 600px;
}

.sub4 {
  left: 900px;
}

.sub>li {
  width: 120px;
  height: 50px;
  border-bottom: 1px solid #000;
  color: #fff;
  background-color: #white;
  box-sizing: border-box;
}

.sub>li:last-child {

  border: 0;

}

.sub>li>a:hover {

  background-color: #FFA7A7;

  color: #fff;

}

.sub>li>a {

  display: block;

  width: 100%;

  text-align: center;

  line-height: 3.4;

  font-size: 15px;

  font-weight: 500;

}
#menu{background:black;}
</style>
<body>
   <div class="container">
      <ul class="nav">
         <li id="menu"><a href="">메뉴1</a>
            <ul class="sub sub1">
               <li><a href="#">메뉴1-1</a></li>
               <li><a href="#">메뉴1-2</a></li>
               <li><a href="#">메뉴1-3</a></li>
            </ul>
         </li>
      </ul>
   </div>
</body>
<script>

$(".nav li").hover(function() {

        $(this).children("ul").stop().slideToggle(500)

      })
</script>