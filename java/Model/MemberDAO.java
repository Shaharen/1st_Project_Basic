package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class MemberDAO {
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
	
	// 회원 가입
	public int memberJoin(MemberDTO memberDTO) {

		connect();
		
		// id, pw, nick, phone, birth, sex 순으로 입력
		sql = "insert into MEMBER_TEST values(?,?,?,?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, memberDTO.getId());
			psmt.setString(2, memberDTO.getPw());
			psmt.setString(3, memberDTO.getNick());
			psmt.setString(4, memberDTO.getPhone());
			psmt.setString(5, memberDTO.getBirthday());
			psmt.setInt(6, memberDTO.getSex());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close();
		}
		
		return cnt;
	}
	// 로그인
	public MemberDTO memberLogin(String id, String pw) {
		
		connect();
		
		MemberDTO member = null;
		sql = "select * from MEMBER_TEST where ID = ? and PW = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);

			rs = psmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberDTO(id, pw, rs.getString("NICK"), rs.getString("PHONE"), rs.getString("BIRTHDAY"), rs.getInt("SEX"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}
	// 정보수정
	public int update(MemberDTO memberDTO) {
		
		connect();

		sql = "update member set pw=?, nick=?, phone=? where id=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(4, memberDTO.getId());
			psmt.setString(1, memberDTO.getPw());
			psmt.setString(2, memberDTO.getNick());
			psmt.setString(3, memberDTO.getPhone());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	// 중복확인을 위한 메소드
	public ArrayList<String> idSelectAll() {

		connect();

		ArrayList<String> list = new ArrayList<String>();

		sql = "select id from MEMBER_TEST";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("ID");
				list.add(id);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
}