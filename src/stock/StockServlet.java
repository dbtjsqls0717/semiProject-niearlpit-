package stock;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.SQLVO;


@WebServlet(value= {"/stock/list","/stock/update"})
public class StockServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out=response.getWriter();

      switch(request.getServletPath()) {

      case "/stock/list" :
          StockDAO dao= new StockDAO();
          SQLVO sqlVO=new SQLVO(); 
          String key=request.getParameter("key")==null?"product.goods_id":request.getParameter("key");  
           String word=request.getParameter("word")==null?"":request.getParameter("word");        
           String order=request.getParameter("order")==null?"goods_name":request.getParameter("order");    
           String desc=request.getParameter("desc")==null?"":request.getParameter("desc");         
           String page=request.getParameter("page")==null?"1":request.getParameter("page");        
           String perPage=request.getParameter("perPage")==null?"5":request.getParameter("perPage");  
           sqlVO.setKey(key);
            sqlVO.setWord(word);      
            sqlVO.setOrder(order);     
            sqlVO.setDesc(desc);        
            sqlVO.setPage(Integer.parseInt(page));   
            sqlVO.setPerPage(Integer.parseInt(perPage));    
            out.println(dao.list(sqlVO));   //브라우저 출력
            System.out.println(sqlVO);      //콘솔 출력
            break; 
      }
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
      switch(request.getServletPath()) {
      
      case "/stock/update" :
         String goods_id=request.getParameter("goods_id");
         String color=request.getParameter("color");
         String strStock=request.getParameter("stock");
         int stock= Integer.parseInt(strStock);
         
         StockVO vo=new StockVO();
         vo.setGoods_id(goods_id);
         vo.setColor(color);
         vo.setStock(stock);
         StockDAO dao= new StockDAO();
         dao.update(goods_id, color, stock);
         break;
      }
   }

}