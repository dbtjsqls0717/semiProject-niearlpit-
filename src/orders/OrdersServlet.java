package orders;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.SQLVO;
import product.ProductDAO;
import purchase.PurchaseDAO;
import purchase.PurchaseVO;
import product.Stock2VO;
import user.UserDAO;

@WebServlet(value= {"/orders/read","/orders/purIn","/orders/OrdIn","/orders/poin","/orders/list"})
public class OrdersServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8");
         response.setContentType("text/html;charset=UTF-8");
         HttpSession session=request.getSession();
         PrintWriter out = response.getWriter();
         switch(request.getServletPath()) {
         
         case "/orders/list" :
             OrderDAO odao=new OrderDAO();
               SQLVO sqlVO=new SQLVO();           
                  String key=request.getParameter("key")==null?"goods_id":request.getParameter("goods_id");            
                  String word=request.getParameter("word")==null?"":request.getParameter("word");            
                  String order=request.getParameter("order")==null?"goods_id":request.getParameter("order");            
                  String desc=request.getParameter("desc")==null?"":request.getParameter("desc");            
                  String page=request.getParameter("page")==null?"1":request.getParameter("page");            
                  String perPage=request.getParameter("perPage")==null?"5":request.getParameter("perPage");
                  sqlVO.setKey(key);            
                  sqlVO.setWord(word);            
                  sqlVO.setOrder(order);            
                  sqlVO.setDesc(desc);            
                  sqlVO.setPage(Integer.parseInt(page));            
                  sqlVO.setPerPage(Integer.parseInt(perPage));    
                  out.println(odao.list(sqlVO));
                  break;
                  
         case "/orders/read":
            ArrayList<Stock2VO> orderCart=(ArrayList<Stock2VO>)session.getAttribute("orderCart");
            Stock2VO svo = new Stock2VO();
            for(Stock2VO v:orderCart) {
               svo.setTotSum(svo.getTotSum()+v.getSum());
            }
            session.setAttribute("totSum", svo.getTotSum());
            session.setAttribute("orderCart", orderCart);
            
            String goods_id = request.getParameter("goods_id");
            session.setAttribute("goods_id", goods_id);
            ProductDAO pdao=new ProductDAO();
            request.setAttribute("prod", pdao.orderList(goods_id));
            
            
            
            String user_id = request.getParameter("user_id");
            UserDAO udao=new UserDAO();
            request.setAttribute("user", udao.read(user_id));
            RequestDispatcher dis = request.getRequestDispatcher("order.jsp");
            dis.forward(request, response);
            break;
         }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8");
         response.setContentType("text/html;charset=UTF-8");
         HttpSession session=request.getSession();
         PrintWriter out = response.getWriter();
         String user_name=request.getParameter("user_name");
         String user_phone=request.getParameter("user_phone");
         String address=request.getParameter("address");
         String goods_id=request.getParameter("goods_id");
         switch(request.getServletPath()) {
        
         case "/orders/purIn":
            System.out.println("purchase in");
            PurchaseVO pvo=new PurchaseVO();
            PurchaseDAO pdao=new PurchaseDAO();
            session=request.getSession();
              
              session.setAttribute("phone", user_phone);
            
            pvo.setPhone(user_phone);
            pvo.setUser_name(user_name);
            pvo.setAddress(address);
            System.out.println(user_phone+user_name+address);
            
            pdao.insert(pvo);
            
            break;
         case "/orders/OrdIn":
            System.out.println("order in");
            user_phone=request.getParameter("user_phone");
            goods_id=request.getParameter("goods_id");
            OrderVO vo=new OrderVO();
            OrderDAO dao=new OrderDAO();
            
            
         ArrayList<Stock2VO> orderCart=(ArrayList<Stock2VO>)session.getAttribute("orderCart");
            for(Stock2VO v:orderCart) {
               vo.setPhone(user_phone);
               vo.setGoods_id(goods_id);
               vo.setColor(v.getColor());
               vo.setPrice(v.getPrice());
               vo.setQuantity(v.getQuan());
               dao.insert(vo);
            }
            System.out.println("¿Ï·á");
            
            break;
         case "/orders/poin":
            String user_id=request.getParameter("user_id");
            int point = Integer.parseInt(request.getParameter("point"));
            pdao= new PurchaseDAO();
            pdao.pointUpdate(user_id,point);
            break;
            
         case "/orders/read":
            String phone = request.getParameter("phone");
            OrderDAO odao= new OrderDAO();
            out.print(odao.uoread(phone));
            break;
         }
   
   }
}