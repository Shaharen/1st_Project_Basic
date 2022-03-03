package Model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorldCupDTO {
	// 총 10개만 넣어주쇼
	// 테이블 이름은 worldcup_test
	int s_num;	 // 번호(시퀀스) - 정렬된 것 PK
	String s_id; // 술 이름 - 안주 이름
	String s_img; // 이미지 링크 - 안주 이미지
	int s_cnt; // 그냥 카운터
}
