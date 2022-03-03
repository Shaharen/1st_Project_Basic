package Model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorldCupDTO {
	// �� 10���� �־��ּ�
	// ���̺� �̸��� worldcup_test
	int s_num;	 // ��ȣ(������) - ���ĵ� �� PK
	String s_id; // �� �̸� - ���� �̸�
	String s_img; // �̹��� ��ũ - ���� �̹���
	int s_cnt; // �׳� ī����
}
