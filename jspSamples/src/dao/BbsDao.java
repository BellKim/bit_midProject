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
import oracle.net.nt.ConnectDescription;

public class BbsDao {

	private static BbsDao dao = new BbsDao();

	private BbsDao() {
		
	}
	
	public static BbsDao getInstance() {
		return dao;
	}
	
	public boolean writeBbs(BbsDto bbs) {
	      String sql = "INSERT INTO BBS(SEQ, ID, "
	      		+ " REF, STEP, DEPTH, "	//댓글용 1,2,3
	      		+ " TITLE, CONTENT, WDATE, "
	      		+ " DEL, READCOUNT) "
	            + " VALUES(SEQ_BBS.NEXTVAL, ?, "
	            + " ( SELECT NVL(MAX(REF),0) + 1 FROM BBS ),"	//REF 
	            // 맨처음에 REF이 NULL이면 NULL을 0으로 바꿔주고 1을 더해서 1이 나온다. 그러면 다시 REF가 1이 로 MAX값이 바뀌고 그 다음값은 2 ...2->3.. 증가 
	            + " 0, 0, ?, ?, SYSDATE, 0, 0) ";

	      Connection conn = null;
	      PreparedStatement psmt = null;
	      int count = 0;

	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/6 writeBbs success");
	         psmt = conn.prepareStatement(sql);
	         System.out.println("2/6 writeBbs success");
	         psmt.setString(1, bbs.getId());
	         psmt.setString(2, bbs.getTitle());
	         psmt.setString(3, bbs.getContent());

	         count = psmt.executeUpdate();
	         System.out.println(bbs.toString());
	      } catch (SQLException e) {
	    	  System.out.println("writeBbs fail");
	         e.printStackTrace();  
	      }
	      finally {
	         DBClose.close(psmt, conn, null);
	      }

	      return count > 0 ? true : false;

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
				int i=1;
				BbsDto dto = new BbsDto(rs.getInt(i++),//seq, 
										rs.getString(i++),//id, 
										rs.getInt(i++),//ref, 
										rs.getInt(i++),//step, 
										rs.getInt(i++),//depth, 
										rs.getString(i++),//title, 
										rs.getString(i++),//content, 
										rs.getString(i++),//wdate, 
										rs.getInt(i++),//del, 
										rs.getInt(i++)//readcount
										);
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
	
	public BbsDto getBbsOne(int seq) {
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DEL, READCOUNT "
				+ " FROM BBS "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		BbsDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsOne Success");
			psmt = conn.prepareStatement(sql);
			System.out.println("1/6 getBbsOne Success");
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int i=1;
				dto = new BbsDto(rs.getInt(i++),//seq, 
								 rs.getString(i++),// id, 
								 rs.getInt(i++),// ref, 
								 rs.getInt(i++),// step, 
								 rs.getInt(i++),// depth, 
								 rs.getString(i++),// title, 
								 rs.getString(i++),// content, 
								 rs.getString(i++),// wdate, 
								 rs.getInt(i++),// del, 
								 rs.getInt(i++));//  readcount);
			}
		} catch (SQLException e) {
			System.out.println("getBbsOne fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}
	
	public void readCountUp(int seq) {
		String sql = " UPDATE BBS "
				+ " SET READCOUNT = READCOUNT+1 "
				+ " WHERE SEQ=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
	
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 readCountUp success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 readCountUp success");
			
			psmt.setInt(1, seq);
			psmt.executeUpdate();
			System.out.println("3/6 readCountUp success");
			
		} catch (SQLException e) {
			System.out.println("readCountUp fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
	
	}
	
	public boolean updateBbs (int seq, String title, String content) {
		String sql = " UPDATE BBS "
				+ " SET TITLE=? , CONTENT=? "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count=0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 updateBbs success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 updateBbs success");
			
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, seq);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 updateBbs success");
		} catch (SQLException e) {
			System.out.println("updateBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
	
	//답글 
	// 파라미터 : 부모글의 seq, 답글의 object
	public boolean answer(int seq, BbsDto bbs) {
		//update (답글이 달리면 옆으로 밀어주는거 즉 답글이 달릴 자리를 만들어주는거)
		String sql1 = " UPDATE BBS "
					 + " SET STEP=STEP+1 "
					 + " WHERE REF = (SELECT REF FROM BBS WHERE SEQ=? ) "
					 + " AND STEP > (SELECT STEP FROM BBS WHERE SEQ=? ) ";
		
		//insert (답글을 insert)
		String sql2 = " INSERT INTO BBS "
					+ " (SEQ, ID, REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE, DEL, READCOUNT) "
					+ " VALUES (SEQ_BBS.NEXTVAL, ?, "
					+ " (SELECT REF FROM BBS WHERE SEQ=? ), "	// 부모글 번호(그룹번호)
					+ " (SELECT STEP FROM BBS WHERE SEQ=? )+1, " //그 다음칸에 답글이 달릴 위치
					+ " (SELECT DEPTH FROM BBS WHERE SEQ=? )+1," //옆으로 밀리게 (공백을 만들어주는) 
					+ " ?, ?, SYSDATE, 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count=0;
		
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); //두개의 쿼리문이 돌기때문에 자동 commit을 꺼줌 언제 오류가 생길지 모르니까
			System.out.println("1/6 answer success");
			
			//update
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("2/6 answer success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 answer success");

			//쿼리문을 두개 돌리기때문에 psmt 초기화
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
			conn.commit(); //update 와 insert가 끝나면
			
		} catch (SQLException e) {
			System.out.println("answer fail");
			try {
				conn.rollback();
			} catch (SQLException e1) {	e1.printStackTrace(); }
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) { e.printStackTrace(); }
			DBClose.close(psmt, conn, null);
			System.out.println("6/6 answer success");
		}
		
		return count>0?true:false;
	}
	
}
