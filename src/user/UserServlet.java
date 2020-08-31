package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import database.SQLVO;




@WebServlet(value= {"/user/list","/user/logout","/user/login","/user/check","/user/insert","/user/read",
				    "/user/delete","/user/update","/user/userRead","/user/position",
				    "/user/blacklist","/user/positionChange","/user/orderRead"})
public class UserServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
       

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
      UserDAO userdao=new UserDAO();
      UserVO uservo=new UserVO();
      JSONObject json=new JSONObject();
      HttpSession session=request.getSession();
      SQLVO sqlVO=new SQLVO(); 
      String user_id=request.getParameter("user_id");
      String position=request.getParameter("position");
      String user_name=request.getParameter("user_name");
      String key=request.getParameter("key")==null?"user_id":request.getParameter("key");            
        String word=request.getParameter("word")==null?"":request.getParameter("word");            
        String order=request.getParameter("order")==null?"user_name":request.getParameter("order");            
        String desc=request.getParameter("desc")==null?"":request.getParameter("desc");            
        String page=request.getParameter("page")==null?"0":request.getParameter("page");            
        String perPage=request.getParameter("perPage")==null?"5":request.getParameter("perPage");
      switch(request.getServletPath()) {
      case "/user/blacklist" : 
          sqlVO.setKey(key);            
            sqlVO.setWord(word);            
            sqlVO.setOrder(order);            
            sqlVO.setDesc(desc);            
            sqlVO.setPage(Integer.parseInt(page));            
            sqlVO.setPerPage(Integer.parseInt(perPage));    
            out.println(userdao.blacklist(sqlVO)); 
           break;
       case "/user/list" :
           sqlVO.setKey(key);            
            sqlVO.setWord(word);            
            sqlVO.setOrder(order);            
            sqlVO.setDesc(desc);            
            sqlVO.setPage(Integer.parseInt(page));            
            sqlVO.setPerPage(Integer.parseInt(perPage));    
            out.println(userdao.list(sqlVO)); 
           break;
      case "/user/logout" :
            session=request.getSession();
            session.invalidate();
            response.sendRedirect("login.jsp");
            break;
      case "/user/check" :
               uservo=userdao.check(request.getParameter("user_id"));
               int check=-1;
               if(uservo.getUser_id()==null) {
                  check=0;//아이디없음       
               } 
               json.put("check",check);
               out.println(json);
               break;
      case "/user/read"://유저읽기(회원이 자기 정보 보는것)
              request.setAttribute("vo",userdao.read((String) session.getAttribute("user_id")));
              //request.setAttribute("clist", pdao.listAll());
              RequestDispatcher dis=request.getRequestDispatcher("read.jsp");
              dis.forward(request, response);
              break;
      case "/user/userRead"://유저읽기(관리자가 회원정보 보는것)
          System.out.println(position);
           request.setAttribute("uservo",userdao.userRead(user_id));
           //request.setAttribute("clist", pdao.listAll());
           dis=request.getRequestDispatcher("userRead.jsp");
           dis.forward(request, response);
           break;
      case "/user/orderRead":
          String phone=request.getParameter("phone");
          
          session=request.getSession();
          
          session.setAttribute("phone", phone);
          
          
          response.sendRedirect("userorder.jsp");
     break;
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      HttpSession session=request.getSession();
      PrintWriter out=response.getWriter();
      UserVO vo=new UserVO();
      UserDAO userdao=new UserDAO();
      
      String user_id=request.getParameter("user_id");
      String password=request.getParameter("password");
      String user_name=request.getParameter("user_name");
      String phone=request.getParameter("phone");
      String position=request.getParameter("position")==null?"2":request.getParameter("position");
      String yy=request.getParameter("yy");
      String mm=request.getParameter("mm");
      String dd=request.getParameter("dd");
      String address=request.getParameter("address");
      String address2=request.getParameter("address2");
      
      String birthday=yy+"-"+mm+"-"+dd;
      
      switch(request.getServletPath()) {
   
      case "/user/login" :
         vo=userdao.login(user_id);
         int check=0;//아이디가 없는 경우 
         if(vo.getUser_id()!=null) {//아이디가 있는경우 
        	if(!vo.getPassword().equals(password)){
                 check=1;//pass가 일치하지않는경우
            }
        	else if(vo.getPosition().equals("3")) {
               check=3;
            }else if(vo.getPosition().equals("2")) {
               check=4;
            }else{
               check=2;//pass가 일치하는경우
               
               /*out.println(userdao.userRead(user_id));*/
               
               session=request.getSession();
               session.setAttribute("user_id", vo.getUser_id());
               session.setAttribute("user_name", vo. getUser_name());
               session.setAttribute("position", vo.getPosition());
            }
            
            
         }
         JSONObject json=new JSONObject();
         json.put("position",position);
         json.put("check",check);
         out.print(json);
         System.out.println("check:"+ check);
         break;   
         
       case "/user/insert" :
            vo=new UserVO();
            vo.setUser_id(user_id);
            vo.setPassword(password);
            vo.setUser_name(user_name);
            vo.setAddress(address);
            vo.setAddress2(address2);
            vo.setBirthday(birthday);
            vo.setPhone(phone);
            userdao.insert(vo);
            response.sendRedirect("/clotheshop_F/user/login.jsp");
            break;
            
       case "/user/update" :
          vo.setUser_name(user_name);
          vo.setPassword(password);
          vo.setPhone(phone);
          vo.setAddress(address);
           vo.setAddress2(address2);
          vo.setUser_id(user_id);
            
         userdao.update(vo);
         response.sendRedirect("/ClothShop/index.jsp");
            
            break;
       case "/user/position" :
          vo.setUser_id(user_id);
          vo.setPosition(position);
          userdao.position(vo);
          response.sendRedirect("blacklist.jsp");
          break;
          
       case "/user/positionChange" :
          System.out.println(user_id);
          vo.setUser_id(user_id);
          userdao.positionChange(vo);
          response.sendRedirect("list.jsp");
          break;
          
       case "/user/delete" :
         userdao.delete(user_id);
         session=request.getSession();
         session.invalidate();
         
         break;
      }
   }

}