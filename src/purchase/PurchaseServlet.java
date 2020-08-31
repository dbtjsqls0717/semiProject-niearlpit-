package purchase;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.SQLVO;


@WebServlet(value= {"/purchase/list","/purchase/insert","/purchase/read","/purchase/read2"})
public class PurchaseServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");     
      PrintWriter out=response.getWriter();
      SQLVO vo = new SQLVO();
      String key=request.getParameter("key")==null?"phone":request.getParameter("key");
      String word=request.getParameter("word")==null?"":request.getParameter("word");
      String order=request.getParameter("order")==null?"user_name":request.getParameter("order");
      String desc=request.getParameter("desc")==null?"":request.getParameter("desc");
      String page=request.getParameter("page")==null?"1":request.getParameter("page");
      String perPage=request.getParameter("perPage")==null?"3":request.getParameter("perPage");
      vo.setKey(key);
      vo.setWord(word);
      vo.setOrder(order);
      vo.setDesc(desc);
      vo.setPage(Integer.parseInt(page));
      vo.setPerPage(Integer.parseInt(perPage));
      
      PurchaseDAO pdao=new PurchaseDAO();
      switch(request.getServletPath()) {
      case "/purchase/list" :
         out.println(pdao.list(vo));
         break;
      case "/purchase/read" :
          String phone= request.getParameter("phone");
          String user_name=request.getParameter("user_name");
         
          request.setAttribute("phone", phone);
          request.setAttribute("user_name", user_name);
          RequestDispatcher dis=request.getRequestDispatcher("read.jsp");
           dis.forward(request, response);
          
         break;
      case "/purchase/read2" :
          phone= request.getParameter("phone");
          
          PurchaseDAO dao=new PurchaseDAO();
          System.out.println(dao.read(phone));
          out.println(dao.read(phone));
         break;
      }
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   }

}