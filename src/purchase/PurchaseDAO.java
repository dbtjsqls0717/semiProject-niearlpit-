package purchase;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SQLVO;

public class PurchaseDAO {
   public void insert(PurchaseVO vo) {
      try {
         String sql="insert into purchase(phone,user_name,address,orderDate) values(?,?,?,now())";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getPhone());
         ps.setString(2, vo.getUser_name());
         ps.setString(3, vo.getAddress());
         ps.execute();
      }catch(Exception e) {
         
      }
   }
   public void pointUpdate(String user_id,int point) {
      try {
         String sql="update users set point=? where user_id=?";
         PreparedStatement ps = Database.CON.prepareStatement(sql);
         ps.setInt(1, point);
         ps.setString(2, user_id);
         ps.execute();
      }catch(Exception e) {
         
      }
   }
   
   /*��ȣDAO*/
   
   //������ ���� �б�
   public JSONObject read(String phone) {
      JSONObject jObject=new JSONObject();
      try {
         String sql="select * from orders where phone=?";
         PreparedStatement ps= Database.CON.prepareStatement(sql);
         ps.setString(1, phone);
         ResultSet rs= ps.executeQuery();
         
         if(rs.next()) {
            JSONObject obj= new JSONObject();
            jObject.put("goods_id", rs.getString("goods_id"));
            jObject.put("color", rs.getString("color"));
            jObject.put("orderDate", rs.getString("orderDate"));
            jObject.put("price", rs.getInt("price"));
            jObject.put("quantity", rs.getInt("quantity"));
            jObject.put("paytype", rs.getInt("paytype"));
            jObject.put("status", rs.getInt("status"));
            int price=rs.getInt("price");
            int quantity=rs.getInt("quantity");
            int tot= price* quantity;
            jObject.put("tot", tot);
         }
         
      }catch(Exception e) {
         System.out.println("������ ���� �б� :"+e.toString());
      }
      
      return jObject;
   }
   
   //������ ����Ʈ
   
   public JSONObject list(SQLVO vo) {
      JSONObject jObject= new JSONObject();
      try {
         String sql="call list(?,?,?,?,?,?,?)";
         CallableStatement cs=Database.CON.prepareCall(sql);
         cs.setString(1, "purchase");
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
            obj.put("user_name", rs.getString("user_name"));
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

   
   
   
}