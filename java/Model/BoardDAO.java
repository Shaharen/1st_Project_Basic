package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql; 

	// DB 연결
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_f_4_0115";
			String password = "smhrd4";

			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB 연결 종료
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 게시판에 글 등록
	public int boardWrite(BoardDTO boardDTO) {

		connect();
		
		// sql 임시작성이므로 나중에 변경해야함!!!
		// bo_num, nick, bo_title, bo_content, bo_like 순으로 입력
		// 시퀀스 이름 seq_boardNo 로 가정
		sql = "insert into (   ) values(seq_boardNo.nextval, ?, ?, ?, ?)";

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, boardDTO.getNick());
			psmt.setString(2, boardDTO.getBo_title());
			psmt.setString(3, boardDTO.getBo_content());
			psmt.setInt(4, boardDTO.getBo_like());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close();
		}
		return cnt;
	}
	// 게시글 삭제
	public int boardDelete(String nick, String title) {

		connect();

		sql = "delete from (   ) where nick = ? and bo_title = ?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, nick);
			psmt.setString(2, title);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	// 게시글 수정
	public int boardUpdate(BoardDTO BoardDTO) {
		
		connect();

		sql = "update (    ) set bo_title = ?, bo_content = ? where nick = ? and bo_num = ?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, BoardDTO.getBo_title());
			psmt.setString(2, BoardDTO.getBo_content());
			psmt.setString(3, BoardDTO.getNick());
			psmt.setInt(4, BoardDTO.getBo_num());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
}