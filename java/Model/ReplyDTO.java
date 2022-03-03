package Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyDTO {
	
	int bo_num;
	String nick;
	String re_comment;
	String redate;
	String updateDate;
	int re_index;
}
