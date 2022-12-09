package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ScheduleDAO {
//싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ScheduleVO vo = null;

	// 해당 회원의 선택된 날짜의 스케줄 모든 정보 가져오기
	public ArrayList<ScheduleVO> getScMenu(String mid, String ymd, int sw) {
		ArrayList<ScheduleVO> vos = new ArrayList<>();
		try {
			if(sw == 0) { //초기화면에서의 호출 [년 월만 넘어온다]
				//sql = "SELECT *,count(*) as partCnt FROM schedule WHERE mid = ? AND date_format(sDate, '%Y-%m') = ? GROUP BY part ORDER BY sDate DESC";
				sql = "select * from schedule where mid=? and date_format(sDate,'%Y-%m')=? order by sDate,part";
			}
			else { // 초기화면이 아닌 곳에서의 호출 [년 월 일이 넘어온다]
				//sql = "SELECT * FROM schedule WHERE mid = ? AND date_format(sDate, '%Y-%m-%D') = ?";
				sql = "select * from schedule where mid=? and date_format(sDate, '%Y-%m-%d')=?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ymd);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new ScheduleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setsDate(rs.getString("sDate"));
				vo.setPart(rs.getString("part"));
				vo.setContent(rs.getString("content"));
				
				vo.setYmd(ymd);
				//vo.setPartCnt(rs.getInt("partCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!"+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 스케줄 등록하기!
	public String setScheduleInputOk(ScheduleVO vo) {
		String res = "0";
		try {
			sql = "INSERT INTO schedule VALUES (default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getsDate());
			pstmt.setString(3, vo.getPart());
			pstmt.setString(4, vo.getContent());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!"+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 스케줄 수정하기
	public String setScheduleUpdateOk(ScheduleVO vo) {
		String res = "0";
		try {
			sql = "UPDATE schedule SET part=?, content=? WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getIdx());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!"+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 스케줄 삭제하기
	public String setScheduleDeleteOk(int idx) {
		String res = "0";
		try {
			sql = "DELETE FROM schedule WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!"+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
}
