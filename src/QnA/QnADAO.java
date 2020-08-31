package QnA;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SQLVO;


public class QnADAO {
   //QnA 답변 삭제
   public void AnswerDelete(QnAVO vo) {
      try {
         String sql="update qna set admin_id=null,answerDate=null,content2=null,state=0 where question_number=?";;
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getQuestion_number());
         ps.execute();
      }catch(Exception e) {
         System.out.println("답변삭제:" + e.toString());
      }
   }
      
   //QnA 게시판답변
   public void AnswerUpdate(QnAVO vo) {
      try {
         String sql="update qna set admin_id=?,answerDate=now(),content2=?,state=1 where question_number=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getAdmin_id());
         ps.setString(2, vo.getContent2());
         ps.setString(3, vo.getQuestion_number());
         ps.execute();
      }catch(Exception e) {
         System.out.println("게시판답변:" + e.toString());
      }
   }
      
   //QnA 게시글 삭제
   public void delete(String question_number) {
      try {
         String sql = "delete from qna where question_number=?";
         PreparedStatement ps = Database.CON.prepareStatement(sql);
         ps.setString(1, question_number);
         ps.execute();
      }catch(Exception e) {
         System.out.println("게시글 삭제 :" + e.toString());
      }
   }
   //QnA 게시글 수정
   public void update(QnAVO vo) {
      try {
         String sql="update qna set title=?,content=? where question_number=?";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getTitle());
         ps.setString(2, vo.getContent());
         ps.setString(3, vo.getQuestion_number());
         ps.execute();
      }catch(Exception e) {
         System.out.println("게시글 수정:" + e.toString());
      }
   }
   //QnA 수정 게시글 읽기
   public QnAVO updateRead(String question_number) {
      QnAVO vo = new QnAVO();
      try {
         String sql="select * from qna where question_number=?";
         PreparedStatement ps = Database.CON.prepareStatement(sql);
         ps.setString(1,question_number);
         ResultSet rs = ps.executeQuery();
         if(rs.next()) {
            vo.setContent(rs.getString("content"));
            vo.setTitle(rs.getString("title"));
            vo.setUser_id(rs.getString("user_id"));
            vo.setQuestion_number(rs.getString("question_number"));
            vo.setQuestionDate(rs.getString("questionDate"));
         }

      }catch (Exception e) {
         System.out.println("게시글읽기 : " + e.toString());
      }
      return vo;
   }
   
   //QnA 게시글 읽기
      public QnAVO read(String question_number) {
         QnAVO vo = new QnAVO();
         try {
            String sql="select * from qna where question_number=?";
            PreparedStatement ps = Database.CON.prepareStatement(sql);
            ps.setString(1,question_number);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
               vo.setContent2(rs.getString("content2"));
               vo.setAnswerDate(rs.getString("answerDate"));
               vo.setContent(rs.getString("content"));
               vo.setTitle(rs.getString("title"));
               vo.setUser_id(rs.getString("user_id"));
               vo.setQuestion_number(rs.getString("question_number"));
               vo.setQuestionDate(rs.getString("questionDate"));
               vo.setState(rs.getString("state"));
            }

         }catch (Exception e) {
            System.out.println("게시글읽기 : " + e.toString());
         }
         return vo;
      }

   //QnA 게시판 글쓰기
   public boolean insert(QnAVO vo) {
      boolean success=false;
      try {
         String sql="insert into qna(user_id,questionDate,title,content) values(?,now(),?,?)";   
         PreparedStatement ps = Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getUser_id());
         ps.setString(2, vo.getTitle());
         ps.setString(3, vo.getContent());
         ps.execute();
         success=true;   
         
      }catch (Exception e) {
         success=false;
         System.out.println("게시판 글쓰기 :" + e.toString());
      }
      return false;
   }
   //QnA 게시판 목록 출력
   public JSONObject list(SQLVO vo) {
      JSONObject jObject = new JSONObject();
      try {
         String sql="call QnAList(?,?,?,?,?,?,?)";
         CallableStatement cs = Database.CON.prepareCall(sql);
         cs.setString(1, "QnA");
         cs.setString(2, vo.getKey());
         cs.setString(3, vo.getWord());
         cs.setString(4, vo.getOrder());
         cs.setString(5, vo.getDesc());
         cs.setInt(6, vo.getPage());
         cs.setInt(7, vo.getPerPage());
         cs.execute();
         
         ResultSet rs = cs.getResultSet();
         JSONArray jArray = new JSONArray();
         while(rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("question_number", rs.getString("question_number"));
            obj.put("user_id", rs.getString("user_id"));
            obj.put("title", rs.getString("title"));
            obj.put("questionDate", rs.getString("questionDate"));
            obj.put("state", rs.getString("state"));
            jArray.add(obj);   
         }
         jObject.put("array",jArray);
         
         //검색 데이터 갯수
         cs.getMoreResults();
         rs=cs.getResultSet();
         int count=0;
         if(rs.next()) {count = rs.getInt("total");}
         int perPage = vo.getPerPage();
         int totPage = count%perPage==0? count/perPage:count/perPage+1;
         jObject.put("count",count);
         jObject.put("page", vo.getPage());
         jObject.put("perPage", perPage);
         jObject.put("totPage", totPage);
         
      }catch (Exception e) {
         System.out.println("게시판목록 출력 : " + e.toString());
      }
      return jObject;
   }
}