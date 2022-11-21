package study.work1120;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JusorokDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	JusorokVO vo = null;
	
	public JusorokDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/javaworks";
			String user = "root";
			String password = "1234";
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패!"+e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패!"+e.getMessage());
		}
	}
	
	// 사용한 객체 반납.
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(pstmt != null) {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {}
		}
	}

	//로그인 체크!
	public JusorokVO loginCheck(String mid, String pwd) {
		vo = new JusorokVO();
		try {
			sql = "select * from jusorok where mid=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생 !"+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 로그아웃 처리
	public void logOut() {
		// 종료전에 DB에 처리해야 할 내용들을 기록...
		
	}

	//아이디로 회원정보 조회.
	public JusorokVO getMemberSearch(String mid) {
		vo = new JusorokVO();
		try {
			sql = "select * from jusorok where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생 !"+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 방문포인터증가와 최종방문일자 업데이트 작업
	public void setVisitUpdate(int visitPoint, String mid) {
		try {
			sql ="update jusorok set point=?, lastDate=now() where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, visitPoint);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생 !"+e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	public int setJoinOK(JusorokVO vo) {
		int res = 0;
		try {
			sql = "insert into jusorok (mid, pwd, name) values (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getMid());
			pstmt.setString(2,vo.getPwd());
			pstmt.setString(3,vo.getName());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생 !"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<JusorokVO> getMemberList() {
		ArrayList<JusorokVO> vos = new ArrayList<>();
		try {
			sql = "select * from jusorok order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new JusorokVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생 !"+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public int idSearch(JusorokVO vo) {
		int sw = 0;
		try {
			sql = "select * from jusorok where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				sw = 1;
				break;
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생 !"+e.getMessage());
		} finally {
			rsClose();
		}
		return sw;
	}

	public int signUp(JusorokVO vo) {
		int signPass = 0;
		try {
			sql = "insert into jusorok values (default,?,?,?,default,default);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.executeUpdate();
			signPass = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생 !"+e.getMessage());
		} finally {
			pstmtClose();
		}
		return signPass;
	}

	public String getDate(String mid) {
		String today="";
		try {
			sql = "select lastDate from jusorok where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				today = rs.getString("lastDate");
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생 !"+e.getMessage());
		} finally {
			rsClose();
		}
		return today;
	}
}
