package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	
	private FileDao() {}
	
	public static FileDao getInstance() {
		if(dao == null) {
			dao = new FileDao();
		}
		
		return dao;
	}
	
	public boolean insert(FileDto dto) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_data1 VALUES(board_data1_seq.NEXTVAL,?,?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
			
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
	
	public List<FileDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FileDto> list = new ArrayList<>();

		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();

			String sql = "SELECT num, writer, title, orgFileName, saveFileName, fileSize, TO_CHAR(regdate, 'yyyy\"년 \"mm\"월 \"dd\"일 \"HH24:MI:SS') RD "+
			"FROM board_data1 ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String orgFileName = rs.getString("orgFileName");
				String saveFileName = rs.getString("saveFileName");
				long fileSize = rs.getLong("fileSize");
				String regdate = rs.getString("RD");
				
				FileDto dto = new FileDto(num, writer, title, orgFileName, saveFileName, fileSize, regdate);
				
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
	
	public boolean delete(int num) {
		boolean isSuccess = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_data1 WHERE num=?";
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
	
	public FileDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FileDto dto = null;

		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();

			String sql = "SELECT writer, title, orgFileName, saveFileName, fileSize, TO_CHAR(regdate, 'yyyy\"년 \"mm\"월 \"dd\"일 \"HH24:MI:SS') RD "+
			"FROM board_data1 WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String orgFileName = rs.getString("orgFileName");
				String saveFileName = rs.getString("saveFileName");
				long fileSize = rs.getLong("fileSize");
				String regdate = rs.getString("RD");
				
				dto = new FileDto(num, writer, title, orgFileName, saveFileName, fileSize, regdate);
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
