package product;

import java.io.File;
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

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import stock.StockDAO;
import stock.StockVO;


@WebServlet(value = {"/product/getID", "/product/insert1", "/product/insert", 
					"/product/add","/product/session","/product/productInfo",
					"/product/sessionDelete","/product/update","/product/insert2",
					"/product/mainList","/product/stockInfo",
				      "/product/miniCartIn","/product/miniCartDelete",
				      "/product/index","/product/typeList","/product/AllList"})
public class ProductServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      request.setCharacterEncoding("UTF-8");
      PrintWriter out = response.getWriter();
      JSONObject jObject = new JSONObject();
      ProductDAO prodDAO = new ProductDAO();
      ProductVO prodVO = new ProductVO();
      ProductDAO dao=new ProductDAO();
      String goods_id=request.getParameter("goods_id");
      HttpSession session=request.getSession();

      switch (request.getServletPath()) {
      case "/product/getID":
         jObject.put("goods_id", prodDAO.getID());
         out.println(jObject);
         break;
         
      case "/product/insert2":
         goods_id = request.getParameter("goods_id");
         request.setAttribute("prod", prodDAO.read(goods_id));;
         RequestDispatcher dis=request.getRequestDispatcher("insert1.jsp");
         dis.forward(request, response);
         prodDAO.read(goods_id);
         break;
         
         
      case "/product/index":
          ArrayList<Stock2VO> orderCart=(ArrayList<Stock2VO>)session.getAttribute("orderCart");
          if(orderCart!=null) {
          orderCart.clear();
          }
          response.sendRedirect("/clotheshop_F/DOM/index.jsp");
          break;
       case "/product/mainList":
          out.print(dao.mainList());
          break;
       case "/product/typeList":
          String type=request.getParameter("type");
          
          orderCart=(ArrayList<Stock2VO>)session.getAttribute("orderCart");
          if(orderCart!=null) {
             orderCart.clear();
          }
          ArrayList<ProductVO> array = dao.typeList(type);
             request.setAttribute("type",array);
             dis = request.getRequestDispatcher("type.jsp");
             dis.forward(request, response);

          break;
       case "/product/productInfo":
          goods_id=request.getParameter("goods_id");
          ArrayList<Stock2VO> array2 = dao.stock(goods_id);
          
          request.setAttribute("pvo",dao.orderList(goods_id));
          request.setAttribute("stockInfo",array2);
           dis = request.getRequestDispatcher("read.jsp");
          dis.forward(request, response);
          break;
       
          
       case "/product/miniCartIn":
          System.out.println("!");
          goods_id=request.getParameter("goods_id");
          String color=request.getParameter("color");
          int price=Integer.parseInt(request.getParameter("price"));
          System.out.println(price);
          session=request.getSession();
          orderCart=(ArrayList<Stock2VO>)session.getAttribute("orderCart");
          
          Stock2VO minicartVO=new Stock2VO();
          minicartVO.setGoods_id(goods_id);
          minicartVO.setColor(color);
          minicartVO.setPrice(price);
          minicartVO.setQuan(1);
          minicartVO.setSum(minicartVO.getPrice(), minicartVO.getQuan());
          
          if(orderCart == null) {
             orderCart = new ArrayList<Stock2VO>();
             orderCart.add(minicartVO);
          }else {
             boolean find = false;
             for(Stock2VO v:orderCart) {
                if(v.getGoods_id().equals(goods_id) && v.getColor().equals(color)) {
                   v.setQuan(v.getQuan()+1);
                   v.setSum(price, v.getQuan());
                   find=true;
                }
             }
             if(find==false) {
                
                orderCart.add(minicartVO);
             }
          }

          session.setAttribute("orderCart", orderCart);
          break;
          
       case  "/product/AllList":
    	   orderCart=(ArrayList<Stock2VO>)session.getAttribute("orderCart");
           if(orderCart!=null) {
              orderCart.clear();
           }
           response.sendRedirect("/clotheshop_F/DOM/index2.jsp");
    	   break;
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      request.setCharacterEncoding("UTF-8");
      HttpSession session = request.getSession();
      ArrayList<StockVO> ssession=(ArrayList<StockVO>)session.getAttribute("ssession");
      ProductDAO prodDAO = new ProductDAO();
      ProductVO prodVO = new ProductVO();
      StockVO stockVO=new StockVO();
      PrintWriter out = response.getWriter();
      ProductDAO dao=new ProductDAO();
      String goods_id=request.getParameter("goods_id");

      switch (request.getServletPath()) {
      
      case "/product/miniCartIn":
          goods_id=request.getParameter("goods_id");
          String color=request.getParameter("color");
          int price=Integer.parseInt(request.getParameter("price"));
          session=request.getSession();
          ArrayList<Stock2VO> orderCart=(ArrayList<Stock2VO>)session.getAttribute("orderCart");
          
          Stock2VO minicartVO=new Stock2VO();
          minicartVO.setGoods_id(goods_id);
          minicartVO.setColor(color);
          minicartVO.setPrice(price);
          minicartVO.setQuan(1);
          minicartVO.setSum(minicartVO.getPrice(), minicartVO.getQuan());
          
          if(orderCart == null) {
             orderCart = new ArrayList<Stock2VO>();
             orderCart.add(minicartVO);
          }else {
             boolean find = false;
             for(Stock2VO v:orderCart) {
                if(v.getGoods_id().equals(goods_id) && v.getColor().equals(color)) {
                   v.setQuan(v.getQuan()+1);
                   v.setSum(price, v.getQuan());
                   find=true;
                }
             }
             if(find==false) {
                
                orderCart.add(minicartVO);
             }
          }
          session.setAttribute("orderCart", orderCart);
          break;
          
       case "/product/miniCartDelete":
          color=request.getParameter("color");
          goods_id=request.getParameter("goods_id");
          session=request.getSession();
          orderCart=(ArrayList<Stock2VO>)session.getAttribute("orderCart");

          for(Stock2VO v:orderCart) {
             if(v.getGoods_id().equals(goods_id) && v.getColor().equals(color)) {
                orderCart.remove(v);
                break;
             }
          }
          break;
      
      
      
       case "/product/update":
           String uploadPath = "c:" + File.separator + "clothshop" + File.separator + "product" + File.separator;
             File mdPath = new File(uploadPath);
             if (!mdPath.exists()) mdPath.mkdir();
             MultipartRequest multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 10, "UTF-8",
                   new DefaultFileRenamePolicy());
             String image = multi.getFilesystemName("image");
             prodVO.setGoods_id(multi.getParameter("goods_id"));
             prodVO.setGoods_name(multi.getParameter("goods_name"));
             prodVO.setType(multi.getParameter("type"));
             prodVO.setPrice(Integer.parseInt(multi.getParameter("price")));
             prodVO.setContent(multi.getParameter("content"));
             prodVO.setStatus(multi.getParameter("status"));
             //prodVO.setImage(image);
             prodVO.setStatus("0");
           prodDAO.update(prodVO);
           StockDAO stockDAO=new StockDAO();
           for(StockVO svo:ssession) {
              stockDAO.insert(svo);
           }
           session.invalidate();
           response.sendRedirect("/clotheshop_F/product/insert.jsp");
           break;

       case "/product/productInfo":
          System.out.println("???"+prodVO.getGoods_id());
             request.setAttribute("prod", prodDAO.read(prodVO.getGoods_id()));;
             session.setAttribute("ssession", ssession);
             RequestDispatcher dis=request.getRequestDispatcher("insert1.jsp");
             dis.forward(request, response);
             break;
        case "/product/sessionDelete":
           goods_id=request.getParameter("goods_id");
           color=request.getParameter("color");
           int stock=Integer.parseInt(request.getParameter("stock"));
           System.out.println("delete: "+goods_id+"/"+color);
            session=request.getSession();
            ssession=(ArrayList<StockVO>)session.getAttribute("ssession");

            for(StockVO v:ssession) {
               if(v.getColor().equals(color) && v.getStock()==stock) {
                  ssession.remove(v);
                  break;
               }
            }
            break;
            
         case "/product/add":
          uploadPath = "c:" + File.separator + "clothshop" + File.separator + "product" + File.separator;
           mdPath = new File(uploadPath);
           if (!mdPath.exists()) mdPath.mkdir();
           multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 10, "UTF-8",
                 new DefaultFileRenamePolicy());
           image = multi.getFilesystemName("image");
           prodVO.setGoods_id(multi.getParameter("goods_id"));
           prodVO.setGoods_name(multi.getParameter("goods_name"));
           prodVO.setType(multi.getParameter("type"));
           prodVO.setPrice(Integer.parseInt(multi.getParameter("price")));
           prodVO.setContent(multi.getParameter("content"));
           prodVO.setStatus(multi.getParameter("status"));
           prodVO.setImage(image);
           prodVO.setStatus("0");
            goods_id=multi.getParameter("goods_id");
            color=multi.getParameter("color");
            stock=Integer.parseInt(multi.getParameter("stock"));
            System.out.println("咯变 技记捞具");
             System.out.println("尝夸渴!!!"+color+"/"+stock);
             stockVO.setGoods_id(goods_id);
             stockVO.setColor(color);
             stockVO.setStock(stock);
             session=request.getSession();
             System.out.println("stockVO!!: "+stockVO.getGoods_id()+"/"+stockVO.getColor()+"/"+stockVO.getStock());
             boolean isFind = false;
             if(ssession == null) {
                ssession = new ArrayList<StockVO>();
                ssession.add(stockVO);
             }else {
                for(StockVO v:ssession) {
                   if(v.getGoods_id().equals(goods_id) && v.getColor().equals(color)) {
                      v.setStock(v.getStock()+stock);
                      isFind=true;
                   }
                }
                if (!isFind)ssession.add(stockVO);
             }
             session.setAttribute("ssession", ssession);
             break;
      case "/product/insert1":
         uploadPath = "c:" + File.separator + "clothshop" + File.separator + "product" + File.separator;
         mdPath = new File(uploadPath);
         if (!mdPath.exists()) mdPath.mkdir();
         multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 10, "UTF-8",
               new DefaultFileRenamePolicy());
         image = multi.getFilesystemName("image");
         System.out.println(image+"@#$!@#$@#$");
         prodVO.setGoods_id(multi.getParameter("goods_id"));
         prodVO.setGoods_name(multi.getParameter("goods_name"));
         prodVO.setType(multi.getParameter("type"));
         prodVO.setPrice(Integer.parseInt(multi.getParameter("price")));
         prodVO.setContent(multi.getParameter("content"));
         prodVO.setStatus(multi.getParameter("status"));
         prodVO.setImage(image);
         prodVO.setStatus("0");
         prodDAO.insert1(prodVO);
         System.out.println("insert1: "+prodDAO.read(prodVO.getGoods_id()));
         request.setAttribute("prod", prodDAO.read(prodVO.getGoods_id()));;
         dis=request.getRequestDispatcher("insert1.jsp");
         dis.forward(request, response);
         break;
   
      }
   }

}