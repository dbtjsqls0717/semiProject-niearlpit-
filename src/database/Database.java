package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

   public static Connection CON;
   static {
      try {
         Class.forName("com.mysql.jdbc.Driver");
         CON=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb", "shop", "pass");
         System.out.println("立加己傍");
      }catch(Exception e) {
         System.out.println("立加角菩:" + e.toString());
      }
   }
}