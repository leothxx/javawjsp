package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn { 
	/* 싱글톤은 외부에서 생성할 수 없기에, private으로 준다. 외부에서 사용하기 위한 메소드를 만들어야함 */
	/* 데이터베이스 생성할 객체(싱글톤) 역할 */
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaworks"; /* 호스팅 업체 맡길때 localhost 아이피를 싱글톤을 사용하지 않으면 모든 dao파일을 수정해야 하지만, 싱글톤을 이용하면 싱글톤객체에서만 수정하면 된다는 장점이 존재. */
	private String user = "root";
	private String password = "1234";
	
	private static GetConn instance = new GetConn();
	
	// 객체 생성시 DB연동
	public GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패!");
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 실패!");
		}
	}
	
	public Connection getConn() { //연결해주는 역할을 하는 Connection 타입을 리턴타입으로 준다.
		return conn;
	}
	// 객체 소멸처리 [싱글톤을 사용할것이기에 conn객체는 닫지 않는다.]
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {}
		}
	}

	public static GetConn getInstance() {return instance;} //instance는 여는게 목적이기에 getter만 생성함.
	
}
