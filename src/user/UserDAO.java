package user;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import database.Database;
import database.SQLVO;



public class UserDAO {
	
	public int posRead(String user_id) {
	      
	      int position=-1;
	      try {
	         String sql="select position from users where user_id=?";
	         PreparedStatement ps= Database.CON.prepareStatement(sql);
	         ps.setString(1, user_id);
	         ResultSet rs= ps.executeQuery();
	         
	         if(rs.next()) {
	            position= rs.getInt("position");
	         }
	      }catch(Exception e) {
	         System.out.println("포지션 읽기"+e.toString());
	      }
	      return position;
	   }
	   
   //블랙리스트
   public JSONObject blacklist(SQLVO vo) {
      JSONObject json=new JSONObject();
      try {
         String sql="call blacklist(?,?,?,?,?,?,?)";
         CallableStatement cs=Database.CON.prepareCall(sql);
         cs.setString(1, "users");
         cs.setString(2, vo.getKey());
         cs.setString(3, vo.getWord());
         cs.setString(4, vo.getOrder());
         cs.setString(5, vo.getDesc());
         cs.setInt(6, vo.getPage());
         cs.setInt(7, vo.getPerPage());
         cs.execute();
         
         ResultSet rs=cs.getResultSet();
         JSONArray array=new JSONArray();
         while(rs.next()) {
            JSONObject obj=new JSONObject();
            obj.put("user_id",rs.getString("user_id"));
            obj.put("user_name",rs.getString("user_name"));                
            array.add(obj);   
      }json.put("blacklist",array);
      
      cs.getMoreResults();
      rs=cs.getResultSet();
      int count=0;
      
      if(rs.next()) {count=rs.getInt("total");}
         
      int perPage =vo.getPerPage();
      int totPage=count%perPage==0?count/perPage:count/perPage+1;
      json.put("count", count);
      json.put("page", vo.getPage());
      json.put("prePage", vo.getPerPage());
      json.put("totPage", totPage);
      }catch(Exception e) {
         System.out.println("유저목록:"+e.toString());
      }return json;
   }
   //position바꾸기 (블랙리스트)
   public void position(UserVO vo) {
      try {
         String sql="update users set position=? where user_id=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, "2");
         ps.setString(2, vo.getUser_id());
         ps.execute();
      }catch(Exception e) {
         System.out.println("position바꾸기:"+e.toString());
      }
   }
   
   //position바꾸기 (블랙리스트)
      public void positionChange(UserVO vo) {
         try {
            String sql="update users set position=? where user_id=?";
            PreparedStatement ps=Database.CON.prepareStatement(sql);
            ps.setString(1, "0");
            ps.setString(2, vo.getUser_id());
            ps.execute();
         }catch(Exception e) {
            System.out.println("position바꾸기:"+e.toString());
         }
      }
      
   //회원정보읽기(관리자가)
   public UserVO userRead(String user_id) {
      UserVO vo=new UserVO();
      try {
         String sql="select * from users where user_id=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, user_id);
         ResultSet rs=ps.executeQuery();
         if(rs.next()) {
            vo.setUser_id(rs.getString("user_id"));
            vo.setUser_name(rs.getString("user_name"));
            vo.setPassword(rs.getString("password"));
            vo.setBirthday(rs.getString("birthday"));
            vo.setAddress(rs.getString("address"));
            vo.setAddress2(rs.getString("address2"));
            vo.setPoint(rs.getInt("point"));
            vo.setImage(rs.getString("image"));
            vo.setPosition(rs.getString("position"));
         }
         
      }catch(Exception e) {
         System.out.println("관리자가 회원읽기:"+e.toString());
      }return vo;
   }
   //수정
   public void update(UserVO vo){
      try {
         String sql="update users set user_name=?,password=?,phone=?,address=?,address2=? where user_id=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getUser_name());
         ps.setString(2, vo.getPassword());
         ps.setString(3, vo.getPhone());
         ps.setString(4, vo.getAddress());
         ps.setString(5, vo.getAddress2());
         ps.setString(6, vo.getUser_id());
         ps.execute();
      }catch(Exception e) {
         System.out.println("수정:"+e.toString());
      }
   }
   //회원탈퇴
   public void delete(String user_id) {
      try {
         String sql="delete from users where user_id=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, user_id);
         ps.execute();
      }catch(Exception e) {
         System.out.println("회원탈퇴:"+e.toString());
      }
   }
    //회원정보읽기(회원이)
   public UserVO read(String user_id) {
      UserVO vo=new UserVO();
      try {
         String sql="select * from users where user_id=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, user_id);
         ResultSet rs=ps.executeQuery();
         if(rs.next()) {
            vo.setUser_id(rs.getString("user_id"));
            vo.setPassword(rs.getString("password"));
            vo.setUser_name(rs.getString("user_name"));
            vo.setPhone(rs.getString("phone"));
            vo.setAddress(rs.getString("address"));
            vo.setAddress2(rs.getString("address2"));
            vo.setPoint(rs.getInt("point"));
         }
      }catch(Exception e) {
         System.out.println("읽기:"+e.toString());
      }
      return vo;
   }
     //회원가입
      public void insert(UserVO vo) {
         try {
            String sql="insert into users(user_id,password,user_name,birthday,position,address,address2,point,phone,image) values(?,?,?,?,0,?,?,0,?,null)";
            PreparedStatement ps=Database.CON.prepareStatement(sql);
            ps.setString(1, vo.getUser_id());
            ps.setString(2, vo.getPassword());
            ps.setString(3, vo.getUser_name());
            ps.setString(4, vo.getBirthday());
            ps.setString(5, vo.getAddress());
            ps.setString(6, vo.getAddress2());
            ps.setString(7, vo.getPhone());
            ps.execute();
         }catch(Exception e) {
            System.out.println("회원가입"+e.toString());
         }
      }

    //로그인체크
      public UserVO check(String user_id) {
         UserVO vo=new UserVO();
         try {
            String sql="select * from users where user_id=?";
            PreparedStatement ps=Database.CON.prepareStatement(sql);
            ps.setString(1, user_id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()) {
               vo.setUser_id(rs.getString("user_id"));
               vo.setPassword(rs.getString("password"));
               vo.setUser_name(rs.getString("user_name"));
            }
         }catch(Exception e) {
            System.out.println("로그인체크"+e.toString());
         }
         return vo;
      }

   //로그인
   public UserVO login(String user_id) {
      UserVO vo=new UserVO();
      try {
         String sql="select * from users where user_id=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, user_id);
         ResultSet rs=ps.executeQuery();
         if(rs.next()) {
            vo.setUser_id(rs.getString("user_id"));
            vo.setPassword(rs.getString("password"));
            vo.setUser_name(rs.getString("user_name"));
            vo.setPosition(rs.getString("position"));
            vo.setPhone(rs.getString("phone"));
         }
      }catch(Exception e) {
         System.out.println("로그인:"+e.toString());
      }
      return vo;
   }


   //유저목록
   public JSONObject list(SQLVO vo) {
      JSONObject json=new JSONObject();
      try {
         String sql="call list(?,?,?,?,?,?,?)";
         CallableStatement cs=Database.CON.prepareCall(sql);
         cs.setString(1, "users");
         cs.setString(2, vo.getKey());
         cs.setString(3, vo.getWord());
         cs.setString(4, vo.getOrder());
         cs.setString(5, vo.getDesc());
         cs.setInt(6, vo.getPage());
         cs.setInt(7, vo.getPerPage());
         cs.execute();
         
         ResultSet rs=cs.getResultSet();
         JSONArray array=new JSONArray();
         while(rs.next()) {
            JSONObject obj=new JSONObject();
            obj.put("user_id",rs.getString("user_id"));
            obj.put("user_name",rs.getString("user_name"));
            obj.put("position",rs.getString("position"));
            obj.put("address",rs.getString("address"));
            obj.put("address2",rs.getString("address2"));
            obj.put("phone",rs.getString("phone"));
            obj.put("image",rs.getString("image"));
            obj.put("birthday",rs.getString("birthday"));
            
            DecimalFormat df=new DecimalFormat("#,###");                
            obj.put("point", df.format(rs.getInt("point")));
                         
            array.add(obj);   
      }json.put("userlist",array);
      
      cs.getMoreResults();
      rs=cs.getResultSet();
      int count=0;
      
      if(rs.next()) {count=rs.getInt("total");}
         
      int perPage =vo.getPerPage();
      int totPage=count%perPage==0?count/perPage:count/perPage+1;
      json.put("count", count);
      json.put("page", vo.getPage());
      json.put("prePage", vo.getPerPage());
      json.put("totPage", totPage);
      }catch(Exception e) {
         System.out.println("유저목록:"+e.toString());
      }return json;
   }
}