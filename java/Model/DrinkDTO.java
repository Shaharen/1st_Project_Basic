package Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DrinkDTO {
	int sort;		 // 대분류
	String dr_id;	// 상품명
	String dr_flavor; // 향
	String dr_taste;  // 맛
	String dr_abv;	  // 도수
	String dr_des;// 설명
	String dr_img;// 이미지 추가해야함
	int num;
}
