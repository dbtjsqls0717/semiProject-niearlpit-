package QnA;

import user.UserVO;

public class QnAVO extends UserVO{

   private String question_number;
   private String user_id;
   private String questionDate;
   private String writer;
   private String title;
   private String content;
   private String admin_id;
   private String answerDate;
   private String content2;
   private String state;
   
   public String getQuestion_number() {
      return question_number;
   }
   public void setQuestion_number(String question_number) {
      this.question_number = question_number;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getQuestionDate() {
      return questionDate;
   }
   public void setQuestionDate(String questionDate) {
      this.questionDate = questionDate;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getAdmin_id() {
      return admin_id;
   }
   public void setAdmin_id(String admin_id) {
      this.admin_id = admin_id;
   }
   public String getAnswerDate() {
      return answerDate;
   }
   public void setAnswerDate(String answerDate) {
      this.answerDate = answerDate;
   }
   public String getContent2() {
      return content2;
   }
   public void setContent2(String content2) {
      this.content2 = content2;
   }
   public String getState() {
      return state;
   }
   public void setState(String state) {
      this.state = state;
   }
   
   @Override
   public String toString() {
      return "QnAVO [question_number=" + question_number + ", title=" + title + ", content=" + content + "]";
   }
}