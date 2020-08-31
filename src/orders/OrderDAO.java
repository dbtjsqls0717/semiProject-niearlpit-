package orders;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SQLVO;

public class OrderDAO {
	 public JSONObject list(SQLVO vo) {
	      JSONObject jObject= new JSONObject();
	      try {
	         String sql="call list(?,?,?,?,?,?,?)";
	         CallableStatement cs=Database.CON.prepareCall(sql);
	         cs.setString(1, "orders");
	         cs.setString(2, vo.getKey());
	         cs.setString(3, vo.getWord());
	         cs.setString(4, vo.getOrder());
	         cs.setString(5, vo.getDesc());
	         cs.setInt(6, vo.getPage());
	         cs.setInt(7, vo.getPerPage());
	         cs.execute();
	         
	         ResultSet rs=cs.getResultSet();
	            
	         JSONArray jArray=new JSONArray();
	         while(rs.next()) {
	            JSONObject obj=new JSONObject();
	            obj.put("phone", rs.getString("phone"));
	            obj.put("goods_id", rs.getString("goods_id"));
	            obj.put("orderDate", rs.getString("orderDate"));
	            obj.put("color", rs.getString("color"));
	            obj.put("price", rs.getString("price"));
	            obj.put("quantity", rs.getInt("quantity"));
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
	         
	      }catch(Exception e) {
	         System.out.println("������ ����Ʈ");
	      }
	      return jObject;
	      
	   }

	
   public void insert(OrderVO vo) {
      try {
         String sql="insert into orders values(?,?,now(),?,?,?)";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getPhone());
         ps.setString(2, vo.getGoods_id());
         ps.setString(3, vo.getColor());
         ps.setInt(4, vo.getPrice());
         ps.setInt(5, vo.getQuantity());
         ps.execute();
      }catch(Exception e) {
         
      }
   }
     //�ֹ� ���� �б�
      public JSONObject uoread(String phone) {
         JSONObject jObject=new JSONObject();
         try {
            String sql="select * from orders where phone=?";
            PreparedStatement ps= Database.CON.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs= ps.executeQuery();
            JSONArray array = new JSONArray();
            while(rs.next()) {
               JSONObject obj= new JSONObject();
               obj.put("goods_id", rs.getString("goods_id"));
               obj.put("color", rs.getString("color"));
               obj.put("orderDate", rs.getString("orderDate"));
               obj.put("price", rs.getInt("price"));
               obj.put("quantity", rs.getInt("quantity"));
               obj.put("sum",rs.getInt("price")*rs.getInt("quantity"));
               array.add(obj);
            }
            jObject.put("user_order",array);
         }catch(Exception e) {
            System.out.println("�ֹ� ���� �б� :"+e.toString());
         }
         
         return jObject;
      }
}