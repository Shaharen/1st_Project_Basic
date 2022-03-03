package Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
	int bo_num;
	String nick;
	String bo_title;
	String bo_content;
	int bo_like;
}
