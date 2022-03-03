package Model;

import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

public class WorldCupDAO {
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
	
	// 월드컵 후보 추출 메소드
	public ArrayList<WorldCupDTO> worldCup(ArrayList<Integer> num) {
		
		ArrayList<WorldCupDTO> list = new ArrayList<WorldCupDTO>();
		try {
			connect();
			
			for ( int i = 0; i < num.size(); i ++) {
				sql = "select * from SIDEMENU where S_NUM = ?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, num.get(i));
				rs = psmt.executeQuery();
			
				while (rs.next()) {
					int number = rs.getInt("S_NUM");
					String name = rs.getString("S_ID");
					String link = rs.getString("S_IMG");
					int cnt = rs.getInt("S_CNT");
					
					WorldCupDTO Member = new WorldCupDTO(number, name, link, cnt);
					list.add(Member);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

}
