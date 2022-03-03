package Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	private String id;
	private String pw;
	private String nick;
	private String phone;
	private String birthday;
	private int sex;
	
}
