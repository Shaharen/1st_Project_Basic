package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DrinkDAO {
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
	// 도수로 전체 검색
	public ArrayList<DrinkDTO> drinkSelectAll(String[] abv) {
		
		connect();

		ArrayList<DrinkDTO> list = new ArrayList<DrinkDTO>();
		
		try {
			for (int i = 0; i < abv.length; i++) {
				sql = "select * from TEST3 where SORT = ? and DR_ABV = ?";
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, 10);
				psmt.setString(2, abv[i]);
				rs = psmt.executeQuery();

				while (rs.next()) {
					String dr_id = rs.getString("DR_ID");
					String dr_flavor = rs.getString("DR_FLAVOR");
					String dr_taste = rs.getString("DR_TASTE");
					String dr_abv = rs.getString("DR_ABV");
					String dr_img = rs.getString("DR_IMG");
					int num = rs.getInt("NUM");
					
					DrinkDTO drink = new DrinkDTO(10, dr_id, dr_flavor, dr_taste, dr_abv, null, dr_img, num);
					list.add(drink);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	// 술 전체 출력
	public ArrayList<DrinkDTO> infoAll(int sort) {
		
		connect();

		ArrayList<DrinkDTO> list = new ArrayList<DrinkDTO>();
		sql = "select * from TEST3 where SORT = ?";
		
		try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, sort);
				rs = psmt.executeQuery();

				while (rs.next()) {
					String dr_id = rs.getString("DR_ID");
					String dr_flavor = rs.getString("DR_FLAVOR");
					String dr_taste = rs.getString("DR_TASTE");
					String dr_abv = rs.getString("DR_ABV");
					String dr_des = rs.getString("DR_DES");
					String dr_img = rs.getString("DR_IMG");
					int num = rs.getInt("NUM");
					
					DrinkDTO drink = new DrinkDTO(sort, dr_id, dr_flavor, dr_taste, dr_abv, dr_des, dr_img, num);
					list.add(drink);
				}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}

	public ArrayList<DrinkDTO> random(int[] numArray) {

		connect();

		ArrayList<DrinkDTO> list = new ArrayList<DrinkDTO>();

		try {
			for (int  i = 0 ; i < numArray.length; i++) {
				
				sql = "select * from TEST3 where num = ?";
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, numArray[i]);
				rs = psmt.executeQuery();

				while (rs.next()) {
					int sort = rs.getInt("SORT");
					String dr_id = rs.getString("DR_ID");
					String dr_flavor = rs.getString("DR_FLAVOR");
					String dr_taste = rs.getString("DR_TASTE");
					String dr_abv = rs.getString("DR_ABV");
					String dr_des = rs.getString("DR_DES");
					String dr_img = rs.getString("DR_IMG");
					
					DrinkDTO drink = new DrinkDTO(sort, dr_id, dr_flavor, dr_taste, dr_abv, dr_des, dr_img, numArray[i]);
					list.add(drink);
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