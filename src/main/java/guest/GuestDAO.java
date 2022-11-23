package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	private String url = "jdbc:mysql://localhost:3306/javaworks";
	private String user = "root";
	private String password = "1234";
	GuestVO vo = null;
	
	// 객체 생성시 DB연동
	public GuestDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패!");
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 실패!");
		}
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

	// 빙명록 전체 리스트
	public ArrayList<GuestVO> getGuestList() {
		ArrayList<GuestVO> vos = new ArrayList<>();
		try {
			sql = "select * from guest order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!"+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 방명록 글 작성처리
	public int setGuInput(GuestVO vo) {
		int res = 0;
		try {
			sql = "insert into guest values(default,?,?,?,default,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomePage());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getContent());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 방명록의 글 삭제 처리
	public int setGuDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from guest where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	
}
