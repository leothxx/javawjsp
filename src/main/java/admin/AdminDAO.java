package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import member.MemberVO;

public class AdminDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;

	public void setLevelCheck(int idx, int level) {
		try {
			sql = "update member set level=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!" + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public int membelDel(int idx) {
		int ans = 0;
		try {
			sql = "delete from member where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			ans = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!" + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return ans;
	}
	
	
}