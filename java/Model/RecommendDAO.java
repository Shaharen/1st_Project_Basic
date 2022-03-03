package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecommendDAO {
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
	// 검색 목록 추천테이블에 저장
	public int recommend(ArrayList<DrinkDTO> drink, String nick) {

		connect();

		try {
			for ( int i = 0; i < drink.size(); i++) {
				sql = "insert into JJIMLIST_TEST values(testlist_listorder_seq.nextval, ?,?,?, ?,?,?, ?,0,?)";
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, nick);
				psmt.setInt(2, drink.get(i).getSort());
				psmt.setString(3, drink.get(i).getDr_id());
				psmt.setString(4, drink.get(i).getDr_flavor());
				psmt.setString(5, drink.get(i).getDr_taste());
				psmt.setString(6, drink.get(i).getDr_abv());
				psmt.setString(7, drink.get(i).getDr_img());
				psmt.setInt(8, drink.get(i).getNum());

				cnt = psmt.executeUpdate();
				
			}

		} catch (SQLException e) {
			// 1. SQL문장이 잘못 작성되었을 경우
			// 2. psmt객체로 잘못된 인덱스값을 작성했을 경우
			// 3. 테이블이 없는 경우
			e.printStackTrace();
		} finally { // 무조건 실행
			close();
		}
		return cnt;
	}
	// 찜목록 카운터 상승
	public int cntPlus(int count, int num, String nick) {

		connect();

		sql = "update JJIMLIST_TEST set COUNT = ? where num = ? and nick = ?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, count);
			psmt.setInt(2, num);
			psmt.setString(3, nick);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	// 카운터 감소
	public int cntMinus(int count, int num, String nick) {

		connect();

		sql = "update JJIMLIST_TEST set COUNT = ? where num = ? and nick = ?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, count);
			psmt.setInt(2, num);
			psmt.setString(3, nick);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	// 찜목록 보여주기
	public ArrayList<DrinkDTO> jjim(String nick) {
		
		connect();

		ArrayList<DrinkDTO> list = new ArrayList<DrinkDTO>();
		
		sql = "select * from JJIMLIST_TEST where nick = ? and COUNT = ?";
		try {
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, nick);
				psmt.setInt(2, 1);
				
				rs = psmt.executeQuery();

				while (rs.next()) {
					int sort = rs.getInt("SORT");
					String dr_id = rs.getString("DR_ID");
					String dr_flavor = rs.getString("DR_FALVOR"); // 오타잡기
					String dr_taste = rs.getString("DR_TASTE");
					String dr_abv = rs.getString("DR_ABV");
					String dr_img = rs.getString("DR_IMG");
					int num = rs.getInt("NUM");
					
					DrinkDTO drink = new DrinkDTO(sort, dr_id, dr_flavor, dr_taste, dr_abv, null, dr_img, num);
					list.add(drink);
				}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
