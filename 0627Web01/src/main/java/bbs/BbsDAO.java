package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


//Data Access Object = 데이터에 접근하는 역할을 맡은 객체
//ctrl shift o : 자동 import     alt shift s : source
public class BbsDAO {
	
	private Connection conn;	//자바랑 db랑 연결하는 객체
	private PreparedStatement pstmt;	//준비된문장 = 쿼리 준비
	private ResultSet rs;		//쿼리실행후 결과를 담을 객체
	
	//생성자
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/JSP_TEST?serverTimezone=UTC";
			//jdbc : Java DataBase Connectivity
			String dbId = "root";
			String dbPassword = "system123";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			//데이터베이스 드라이버를 로드할뿐 연결에 관한 행동은 아무것도 안한다.
			conn = DriverManager.getConnection(dbURL, dbId, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//글쓰기화면에서 내용작성후에 글쓰기버튼누르면 실행될 함수
	//글id, 글의 제목, 내용, 글쓴이, 글쓴시간, 삭제여부를 db에 저장해야한다.
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(SQL);	//문자열 쿼리를 pstmt에 대입
			pstmt.setInt(1, getNext());	//id
			pstmt.setString(2, bbsTitle);	//bbsTitle. 제목
			pstmt.setString(3, userID);	//writer
			pstmt.setString(4, getDate());	//crDate
			pstmt.setString(5, bbsContent);	//bbsContent
			pstmt.setInt(6, 1);	//bbsAvailable
			System.out.println("끝");
			return pstmt.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "select max(bbsID) from BBS";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;	//다음에 들어갈수 = 현재 들어있는 최고숫자 +1
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	//에러
	}
	
	public String getDate() {
		String SQL = "select NOW() from dual";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);	//데이터리스트의 첫번째꺼
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
