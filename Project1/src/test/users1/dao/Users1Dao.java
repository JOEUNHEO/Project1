package test.users1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users1.dto.Users1Dto;
import test.util.DbcpBean;

public class Users1Dao {
	private static Users1Dao dao;
	
	private Users1Dao() {}
	
	public static Users1Dao getInstance() {
		if(dao == null) {
			dao = new Users1Dao();
		}
		
		return dao;
	}
	
	public boolean insert(Users1Dto dto) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO users1(id, pwd, email, regdate) VALUES(?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());

			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return isSuccess;
	}
	
	public Users1Dto getData(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Users1Dto dto = new Users1Dto();

		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();

			String sql = "SELECT email, TO_CHAR(regdate,'yyyy\"년 \"mm\"월 \"dd\"일 \"HH24:MI:SS') RD FROM users1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String email = rs.getString("email");
				String regdate = rs.getString("RD");
				
				dto.setId(id);
				dto.setEmail(email);
				dto.setRegdate(regdate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				// Connection 객체 반납하기
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		
		return dto;
	}
	
	public boolean delete(String id) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM users1 WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return isSuccess;
	}
	
	public boolean update(Users1Dto dto) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE users1 SET pwd=?, email=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());
			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return isSuccess;
	}
	
	public boolean isValid(Users1Dto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isValid = false;
		
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();

			String sql = "SELECT * FROM users1 WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isValid = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				// Connection 객체 반납하기
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		
		return isValid;
	}
	
	public boolean checkId(String id) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT * FROM users1 WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return isSuccess;
	}
}
