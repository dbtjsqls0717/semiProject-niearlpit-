package stock;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SQLVO;

public class StockDAO {
	//��� ����
	   public void update(String goods_id, String color,int stock) {
	      
	      try {
	         String sql="update stock set stock.stock=? where goods_id=? and color=?";
	         PreparedStatement ps=Database.CON.prepareStatement(sql);
	         ps.setInt(1, stock);
	         ps.setString(2, goods_id);
	         ps.setString(3, color);
	         ps.execute();
	      }catch(Exception e) {
	         System.out.println("��� ���� : "+e.toString());
	      }
	   }

	   //��� ����Ʈ
	   public JSONObject list(SQLVO vo) {
	      
	      JSONObject jObject=new JSONObject();
	      try {
	         String sql="call stocklist(?,?,?,?,?,?)";
	         CallableStatement cs=Database.CON.prepareCall(sql);
	         cs.setString(1, vo.getKey());
	         cs.setString(2, vo.getWord());
	         cs.setString(3, vo.getOrder());
	         cs.setString(4, vo.getDesc());
	         cs.setInt(5, vo.getPage());
	         cs.setInt(6, vo.getPerPage());
	         cs.execute();
	         
	         ResultSet rs=cs.getResultSet();
	            
	         JSONArray jArray=new JSONArray();
	         while(rs.next()) {
	            JSONObject obj=new JSONObject();
	            obj.put("goods_id", rs.getString("goods_id"));
	            obj.put("color", rs.getString("color"));
	            obj.put("stock", rs.getString("stock"));
	            obj.put("goods_name", rs.getString("goods_name"));
	            jArray.add(obj);
	         }
	         jObject.put("array", jArray);
	         //�˻� ������ ����
	         cs.getMoreResults();
	         rs=cs.getResultSet();
	         int count=0;
	         if(rs.next()) { count=rs.getInt("total"); }
	         int perPage=vo.getPerPage();
	         int totPage=count%perPage==0?count/perPage:count/perPage+1;
	            jObject.put("count", rs.getInt("total")); //��ü ������ ����
	            jObject.put("page", vo.getPage());//���� ������ ����
	            jObject.put("perPage", perPage); //�������� ����
	            jObject.put("totPage", totPage); //��ü������
	         
	         
	      } catch(Exception e) {
	         System.out.println("��� ���: " + e.toString());
	      }
	      return jObject;
	   }
   
   //stock insert
   public void insert(StockVO vo) {
      try {
         String sql="insert into stock (goods_id,color,stock) value (?,?,?)";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getGoods_id());
         ps.setString(2, vo.getColor());
         ps.setInt(3, vo.getStock());
         ps.execute();
      }catch(Exception e) {
         System.out.println("stock insert(DAO): "+e.toString());
      }
   }
}