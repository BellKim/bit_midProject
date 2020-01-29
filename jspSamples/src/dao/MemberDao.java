package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;


public class MemberDao{

	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnection(); 
	}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public boolean addMember(MemberDto dto) {
		String sql = " INSERT INTO MEMBER "
				+ " (ID, PWD, NAME, EMAIL, AUTH ) "
				+ " VALUES ( ?, ?, ?, ?, 3) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addMember success");	//DB connection
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addMember success");	//sql실행
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addMember success");	//업데이트 성공
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("addMember fail");	// 실패
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
	public boolean getId(String id) {
		//ID중복체크
		
		String sql = " SELECT ID FROM MEMBER "
					+ " WHERE ID=? ";
		
		//String sql = " SELECT COUNT(*) FROM MEMBER WHERE ID=? "; //있으면 1 없으면 0으로 리턴
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql: "+sql);
		boolean findId = false;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getId success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getId success");
			
			psmt.setString(1, id.trim());
			System.out.println("3/6 getId success");
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				//ID가 존재하면 true
				findId = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getId fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		
		return findId;
	}
	
	public MemberDto getLogId(MemberDto dto) {
		String sql = " SELECT ID, NAME, EMAIL, AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=? AND PWD=? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		MemberDto mem = null;
		System.out.println("sql: "+sql);
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getLogId success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getLogId success");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getLogId success");
			if(rs.next()) {
				int i = 1;
				String id = rs.getString(i++);
				String name = rs.getString(i++);
				String email = rs.getString(i++);
				int auth = rs.getInt(i++);
				mem = new MemberDto(id, null, name, email, auth);
			}
			System.out.println("4/6 getLogId success");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getLogId fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return mem;
	}
	
}
