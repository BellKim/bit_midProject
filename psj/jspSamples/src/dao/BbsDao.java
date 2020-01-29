package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BbsDao {
	
	private static BbsDao dao = new BbsDao();
	
	public BbsDao() {
		
	}
	
	public static BbsDao getInstance() {
		return dao;
	}
	
	public boolean writeBbs(BbsDto bbs) {
		String sql = " INSERT INTO BBS "
				+ " (SEQ, ID, REF, STEP, DEPTH,"		// 댓글용
				+ " TITLE, CONTENT, WDATE, DEL, READCOUNT) "
				+ " VALUES (SEQ_BBS.NEXTVAL, ?, (SELECT NVL(MAX(REF), 0) + 1 FROM BBS), " // REF = NULL → 1, REF = 1 → 2
				+ " 0, 0, ?, ?, SYSDATE, 0, 0) ";
		

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addBbs success");
	
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addBbs success");
			
			psmt.setString(1, bbs.getId());
			psmt.setString(2, bbs.getTitle());
			psmt.setString(3, bbs.getContent());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addBbs success");
			
		} catch (SQLException e) {
			System.out.println("addBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0? true:false;
				
	}
	
	public List<BbsDto> getBbsList(){
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DEL, READCOUNT "
				+ " FROM BBS "
				+ " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList success");
			
			while(rs.next()) {
				int i =1;
				BbsDto dto = new BbsDto(rs.getInt(i++),
										rs.getString(i++), 
										rs.getInt(i++), 
										rs.getInt(i++), 
										rs.getInt(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getInt(i++), 
										rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/6 getBbsList success");
			
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	public void readcount(int seq) {
		String sql = " UPDATE BBS "
				+ " SET READCOUNT = READCOUNT + 1 "
				+ " WHERE SEQ = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 readcount success");
	
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 readcount success");
			
			psmt.setInt(1, seq);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 readcount success");
			
		} catch (SQLException e) {
			System.out.println("readcount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
	}
	
	public BbsDto getBbs(int seq) {
		readcount(seq);
		
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DEL, READCOUNT "
				+ " FROM BBS "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BbsDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 selectBbsDto success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 selectBbsDto success");
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 selectBbsDto success");
			
			if(rs.next()) {
				int i =1;
				dto = new BbsDto(rs.getInt(i++),
								rs.getString(i++), 
								rs.getInt(i++), 
								rs.getInt(i++), 
								rs.getInt(i++), 
								rs.getString(i++), 
								rs.getString(i++), 
								rs.getString(i++), 
								rs.getInt(i++), 
								rs.getInt(i++));

			}
			System.out.println("4/6 selectBbsDto success");
			
		} catch (SQLException e) {
			System.out.println("selectBbsDto fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}
	
	public boolean bbsUpdate(BbsDto bbs) {
		String sql = " UPDATE BBS "
				+ " SET CONTENT = ?, TITLE = ? "
				+ " WHERE SEQ = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 bbsUpdate success");
	
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 bbsUpdate success");
			
			psmt.setString(1, bbs.getContent());
			psmt.setString(2, bbs.getTitle());
			psmt.setInt(3, bbs.getSeq());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 bbsUpdate success");
			
		} catch (SQLException e) {
			System.out.println("bbsUpdate fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
	
	public boolean bbsDelete(int seq) {
		String sql = " UPDATE BBS "
				+ " SET DEL = 1 "
				+ " WHERE SEQ = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 bbsDelete success");
	
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 bbsDelete success");
			
			psmt.setInt(1, seq);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 bbsDelete success");
			
		} catch (SQLException e) {
			System.out.println("bbsDelete fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
						//부모 글의 번호, 답글의 object
	public boolean answer(int seq, BbsDto bbs) {
		//step 늘려줘야함 update
		String sql1 = " UPDATE BBS "
				+ " SET STEP = STEP+1 "
				+ " WHERE REF = (SELECT REF FROM BBS WHERE SEQ = ?)"
				+ "			AND STEP > (SELECT STEP FROM BBS WHERE SEQ = ?)";
		
		//insert
		String sql2 = " INSERT INTO BBS "
				+ " (SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT ) "
				+ " VALUES(SEQ_BBS.NEXTVAL, ?, "
				+ " (SELECT REF FROM BBS WHERE SEQ =?), "
				+ " (SELECT STEP FROM BBS WHERE SEQ =?) +1,"
				+ " (SELECT DEPTH FROM BBS WHERE SEQ = ?) +1, "
				+ " ?, ?, SYSDATE, 0, 0 )";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); //어디서 에러날지 모르니까 꺼둬야함
			System.out.println("1/6 answer success");
			
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("2/6 answer success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 answer success");
			
			//psmt 초기화
			psmt.clearParameters();
			
			//insert
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, bbs.getId());
			psmt.setInt(2, seq);
			psmt.setInt(3, seq);
			psmt.setInt(4, seq);
			psmt.setString(5, bbs.getTitle());
			psmt.setString(6, bbs.getContent());
			System.out.println("4/6 answer success");
			
			count = psmt.executeUpdate();
			System.out.println("5/6 answer success");
			conn.commit();
			
		} catch (SQLException e) {
			System.out.println("answer fail");
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBClose.close(psmt, conn, null);
			System.out.println("6/6 answer success");
		}
		return count>0?true:false;
	}
}
