package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReplyDAO {
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
	// 댓글 작성
	public int replyWrite(ReplyDTO replyDTO) {

		connect();
		
		// sql 임시작성이므로 나중에 변경해야함!!!
		// bo_num, nick, content, redate, updateDate, re_index
		// 시퀀스 이름 seq_reNo 로 가정
		sql = "insert into (   ) values(?, ?, ?, sysdate, ?, seq_reNo)";

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, replyDTO.getBo_num());
			psmt.setString(2, replyDTO.getNick());
			psmt.setString(3, replyDTO.getRe_comment());
			psmt.setString(4, "0");

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close();
		}
		
		return cnt;
	}
	// 댓글 삭제
	public int replyDelete(int bo_num, String nick, int re_index) {

		connect();

		sql = "delete from (   ) where nick = ? and bo_num = ? and re_index = ?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, nick);
			psmt.setInt(2, bo_num);
			psmt.setInt(3, re_index);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	// 댓글 수정
	public int replyUpdate(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return 0;
	}
}
