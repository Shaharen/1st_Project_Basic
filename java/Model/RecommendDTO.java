package Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecommendDTO {
	int list_order;
	String nick;
	int sort;
	String dr_id;
	String dr_flavor;
	String dr_taste;
	String dr_abv;
	String dr_img;
	int count;
	int num;
}
