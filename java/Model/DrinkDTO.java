package Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DrinkDTO {
	int sort;		 // ��з�
	String dr_id;	// ��ǰ��
	String dr_flavor; // ��
	String dr_taste;  // ��
	String dr_abv;	  // ����
	String dr_des;// ����
	String dr_img;// �̹��� �߰��ؾ���
	int num;
}
