package product;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import product.Stock2VO;

public class ProductDAO {
	public JSONObject mainList() {
	      JSONObject jObject = new JSONObject();
	      try {
	         String sql="select * from product";
	         PreparedStatement ps=Database.CON.prepareStatement(sql);
	         ResultSet rs=ps.executeQuery();
	         
	         
	         JSONArray jArray=new JSONArray();
	         while(rs.next()) {
	            JSONObject obj=new JSONObject();
	            obj.put("goods_id",rs.getString("goods_id"));
	            obj.put("goods_name",rs.getString("goods_name"));
	            obj.put("type",rs.getString("type"));
	            obj.put("price",rs.getInt("price"));
	            obj.put("content",rs.getString("content"));
	            obj.put("status",rs.getString("status"));
	            obj.put("image",rs.getString("image"));
	            
	            jArray.add(obj);
	         }
	         jObject.put("MainList",jArray);
	      }catch(Exception e) {
	         System.out.println(e.toString());
	      }
	      return jObject;
	   }
	   public ArrayList<ProductVO> typeList(String type) {
	      ArrayList<ProductVO> array=new ArrayList<ProductVO>();
	      try {
	         String sql="select * from product where type=?";
	         PreparedStatement ps=Database.CON.prepareStatement(sql);
	         ps.setString(1, type);
	         ResultSet rs=ps.executeQuery();
	         
	         
	         while(rs.next()) {
	            ProductVO vo=new ProductVO();
	            vo.setGoods_id(rs.getString("goods_id"));
	            vo.setGoods_name(rs.getString("goods_name"));
	            vo.setType(rs.getString("type"));
	            vo.setPrice(rs.getInt("price"));
	            vo.setContent(rs.getString("content"));
	            vo.setStatus(rs.getString("status"));
	            vo.setImage(rs.getString("image"));
	            
	            array.add(vo);
	         }
	      }catch(Exception e) {
	         System.out.println(e.toString());
	      }
	      return array;
	   }
	   public ProductVO orderList(String goods_id) {
	      ProductVO vo=new ProductVO();
	      try {
	         String sql="select * from product where goods_id=?";
	         PreparedStatement ps=Database.CON.prepareStatement(sql);
	         ps.setString(1, goods_id);
	         ResultSet rs=ps.executeQuery();
	         
	         
	         if(rs.next()) {
	            vo.setGoods_id(rs.getString("goods_id"));
	            vo.setGoods_name(rs.getString("goods_name"));
	            vo.setType(rs.getString("type"));
	            vo.setPrice(rs.getInt("price"));
	            vo.setContent(rs.getString("content"));
	            vo.setStatus(rs.getString("status"));
	            vo.setImage(rs.getString("image"));
	         }
	      }catch(Exception e) {
	         System.out.println(e.toString());
	      }
	      return vo;
	   }
	   public ArrayList<Stock2VO> stock(String goods_id) {
	      ArrayList<Stock2VO> array=new ArrayList<Stock2VO>();
	      try {
	         String sql="select * from stock where goods_id=?";
	         PreparedStatement ps=Database.CON.prepareStatement(sql);
	         ps.setString(1, goods_id);
	         ResultSet rs=ps.executeQuery();
	         
	         
	         while(rs.next()) {
	            Stock2VO vo=new Stock2VO();
	            vo.setGoods_id(rs.getString("goods_id"));
	            vo.setColor(rs.getString("color"));
	            vo.setStock(rs.getInt("stock"));
	            
	            array.add(vo);
	         }
	      }catch(Exception e) {
	         System.out.println(e.toString());
	      }
	      return array;
	   }
	
   //update
   public void update(ProductVO vo) {
      try{
         String sql="update product set goods_name=?, type=?, price=?, content=?, status=? where goods_id=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getGoods_name());
         ps.setString(2, vo.getType());
         ps.setInt(3, vo.getPrice());
         ps.setString(4, vo.getContent());
         ps.setString(5, vo.getStatus());
         ps.setString(6, vo.getGoods_id());
         ps.execute();
      }catch(Exception e) {
         System.out.println("prod update (DAO): "+e.toString());
      }
   }
   
   //정보 read
   public ProductVO read(String goods_id) {
      ProductVO vo=new ProductVO();
      try {
         String sql="select * from product where goods_id=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, goods_id);
         ResultSet rs=ps.executeQuery();
         if(rs.next()) {
            vo.setGoods_id(rs.getString("goods_id"));
            vo.setGoods_name(rs.getString("goods_name"));
            vo.setType(rs.getString("type"));
            vo.setPrice(rs.getInt("price"));
            vo.setContent(rs.getString("content"));
            vo.setStatus(rs.getString("status"));
            vo.setImage(rs.getString("image"));
         }
      }catch(Exception e) {
         System.out.println("상품 read(DAO): "+e.toString());
      }
      return vo;
   }
   
   //이미지insert
   public void insert1(ProductVO vo) {
      try{
         String sql="insert into product (goods_id,goods_name,type,price,content,status,image) value (?,?,?,?,?,?,?)";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getGoods_id());
         ps.setString(2, vo.getGoods_name());
         ps.setString(3, vo.getType());
         ps.setInt(4, vo.getPrice());
         ps.setString(5, vo.getContent());
         ps.setString(6, vo.getStatus());
         ps.setString(7, vo.getImage());
         ps.execute();
      }catch(Exception e) {
         System.out.println("prod img insert1 (DAO): "+e.toString());
      }
   }
   
   //new goods_id
   public String getID() {
      String id="";
      try {
         String sql="select max(goods_id) id from product";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         if(rs.next()) {
            String maxID=rs.getString("id").substring(2);
            id="P_"+(Integer.parseInt(maxID)+1);
         }
      }catch(Exception e) {
         System.out.println("새로운 상품 코드 DAO: "+e.toString());
      }
      return id;
   }
   
   //product,stock insert
   /*public void insert(ProductVO vo) {
      try {
         String sql="call add_product(?,?,?,?,?,?,?,?,?,?)";
         CallableStatement cs=Database.CON.prepareCall(sql);
         cs.setString(1, vo.getGoods_id());
         cs.setString(2, vo.getGoods_name());
         cs.setString(3, vo.getType());
         cs.setInt(4, vo.getPrice());
         cs.setString(5, vo.getContent());
         cs.setString(6, vo.getStatus());
         cs.setString(7, vo.getImage());
         cs.setString(8, vo.getColor());
         cs.setInt(9, vo.getStock());
         cs.registerOutParameter(10, java.sql.Types.INTEGER);
         cs.execute();
      }catch(Exception e) {
         System.out.println("상품 insert(dao): "+e.toString());
      }
   }*/
}