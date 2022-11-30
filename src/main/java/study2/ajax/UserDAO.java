package study2.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class UserDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	UserVO vo = null;

	public ArrayList<UserVO> getUserList() {
		ArrayList<UserVO> vos = new ArrayList<>();
		try {
			sql = "select * from user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new UserVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setAddress(rs.getString("address"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL에러 발생!"+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 유저 개별 조회 검색
	public UserVO getUserSearch(String mid) {
		try {
			sql = "select * from user where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new UserVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(mid);
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL에러 발생!"+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 유저 삭제
	public String setUserDel(String mid) {
		String res = "0"; //숫자로 헤더로 값을 넘기면 가끔 400번 타입 에러가 발생할 때가 있다. 그러기에 String타입으로 넘긴다.
		try {
			sql = "delete from user where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL에러 발생!"+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
}