package user;

import java.io.Console;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// Data Access Object = 데이터에 접근하는 역할을 맡은 객체
public class UserDAO { 

   // 자바랑 db랑 연결하는 객체
   private Connection conn;
   
   // 준비된 문장 = 쿼리 준비
   private PreparedStatement pstmt;
   
   // 쿼리 실행 후 결괄를 담을 객체
   private ResultSet rs;
   
   //생성자
   public UserDAO() {
      System.out.println("step1");
      
      try {
         // jdbc : Java DataBase Connectivity
         String dbURL = "jdbc:mysql://localhost:3306/JSP_TEST?serverTimezone=UTC";
         
         String dbID = "root";
         String dbPassword = "system123";
         System.out.println("step6");
         Class.forName("com.mysql.jdbc.Driver");
         System.out.println("step3");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
         System.out.println("step4");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   // 로그인 기능 수행 함수
   public int login(String userID, String userPassword) {
      
      String SQL = "SELECT userPassword FROM TABLE_USER WHERE userID=?";
      
      try {
         pstmt = conn.prepareStatement(SQL); // 문자열 쿼리를 pstmt에 대입
         pstmt.setString(1, userID); // 첫번째 물음표에 userID값 대입
         // 프로그래밍 언어에서 인덱스는 0부터 시작이지만 쿼리에서는 1부터 시작.
         pstmt.executeQuery(); // 쿼리 실행 후 결과 받기
         if(rs.next()) { //결과의 리스트를 받았는데 다음 행의 데이터가 있으면
            if(rs.getString(1).equals(userPassword)) {
               return 1; // 로그인 성공
            } else {
               return 0; // 로그인 실패
            }
         }
         return -1; //아이디가 없음
         
      } catch (Exception e) {
         // TODO: handle exception
      }
      
      return -2; //데이터베이스 오류
   }
   
}