package QnA;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.SQLVO;

@WebServlet(value= {"/QnA/list","/QnA/read","/QnA/AnswerDelete","/QnA/insert","/QnA/updateRead","/QnA/delete","/QnA/update","/QnA/AnswerUpdate"})
public class QnAServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out=response.getWriter();
      QnADAO dao=new QnADAO();
      QnAVO vo = new QnAVO();      
      RequestDispatcher dis = null;
      
      switch(request.getServletPath()) {
      case "/QnA/updateRead":
            request.setAttribute("vo", dao.read(request.getParameter("question_number")));
            dis = request.getRequestDispatcher("update.jsp");
            dis.forward(request, response);
            break;
      
      case "/QnA/delete":
         dao.delete(request.getParameter("question_number"));
         break;
         
      case "/QnA/read":         
         request.setAttribute("vo", dao.read(request.getParameter("question_number")));
         dis = request.getRequestDispatcher("read.jsp");
         dis.forward(request, response);
         break;
         
      case "/QnA/list":
    	 SQLVO SQLVO=new SQLVO();
         String key=request.getParameter("key")==null?"question_number":request.getParameter("key");
         String word=request.getParameter("word")==null?"":request.getParameter("word");
         String order=request.getParameter("order")==null?"question_number":request.getParameter("order");
         String desc=request.getParameter("key")==null?"":request.getParameter("desc");
         String page=request.getParameter("page")==null?"1":request.getParameter("page");
         String perPage=request.getParameter("perPage")==null?"5":request.getParameter("perPage");
         
         SQLVO.setKey(key);
         SQLVO.setWord(word);
         SQLVO.setOrder(order);
         SQLVO.setDesc(desc);
         SQLVO.setPage(Integer.parseInt(page));
         SQLVO.setPerPage(Integer.parseInt(perPage));
         out.println(dao.list(SQLVO));

         break;
      }
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      QnADAO dao=new QnADAO();
      QnAVO vo = new QnAVO();
      RequestDispatcher dis = null;
      
      switch(request.getServletPath()) {
      case "/QnA/AnswerDelete":
         vo.setQuestion_number(request.getParameter("question_number"));
         dao.AnswerDelete(vo);
         break;
      case "/QnA/insert":
         vo.setUser_id(request.getParameter("user_id"));
         vo.setTitle(request.getParameter("title"));
         vo.setContent(request.getParameter("content"));
         dao.insert(vo);
         response.sendRedirect("list.jsp");
         break;
      
      case "/QnA/update":
         vo.setQuestion_number(request.getParameter("question_number"));
         vo.setTitle(request.getParameter("title"));
         vo.setContent(request.getParameter("content"));
         dao.update(vo);
         break;

      case "/QnA/AnswerUpdate":
         vo.setQuestion_number(request.getParameter("question_number"));
         vo.setAdmin_id(request.getParameter("admin_id"));
         vo.setContent2(request.getParameter("content2"));
         dao.AnswerUpdate(vo);
         break;
      }
   }

}