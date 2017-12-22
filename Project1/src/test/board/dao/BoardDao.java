package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.util.DbcpBean;

public class BoardDao {
	private static BoardDao dao;
	
	private BoardDao() {}
	
	public static BoardDao getInstance() {
		if(dao == null) {
			dao = new BoardDao();
		}
		return dao;
	}
	
	public boolean insert(BoardDto dto) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_guest1(num, writer, title, content, regdate) VALUES(board_guest1_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

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
	
	public List<BoardDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDto> list = new ArrayList<>();

		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();

			String sql = "SELECT num, writer, title, content, TO_CHAR(regdate,'yyyy\"년 \"mm\"월 \"dd\"일 \"HH24:MI:SS') RD "+
			"FROM board_guest1 ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String regdate = rs.getString("RD");
				BoardDto dto = new BoardDto(num, writer, title, content, regdate);
				
				list.add(dto);
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
		//글 목록을 리턴해준다.
		return list;
	}
	
	public boolean update(BoardDto dto) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_guest1 SET writer=?, title=?, content=? WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
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
	
	public boolean delete(int num) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_guest1 WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	public BoardDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDto dto = null;

		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();

			String sql = "SELECT num, writer, title, content, TO_CHAR(regdate,'yyyy\"년 \"mm\"월 \"dd\"일 \"HH24:MI:SS') RD "+
			"FROM board_guest1 WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String regdate = rs.getString("RD");
				
				dto = new BoardDto(num, writer, title, content, regdate);
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
}
