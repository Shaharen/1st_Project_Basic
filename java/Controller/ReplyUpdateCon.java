package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ReplyDAO;
import Model.ReplyDTO;

@WebServlet("/ReplyUpdateCon")
public class ReplyUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int bo_num = 0; // 저장된 게시글 번호
		String nick = "로그인 후 저장된 닉네임";
		String newContent = request.getParameter("newReply"); // 수정된 내용
		String redate = ""; // 작성 날짜 초기화
		String updateDate = ""; // 수정 날짜 ( 굳이 나눠야...? )
		int re_index = 0; // 저장된 댓글 번호
		
		ReplyDAO dao = new ReplyDAO();
		int cnt = dao.replyUpdate(new ReplyDTO(bo_num, nick, newContent, redate, updateDate, re_index));
		
		if (cnt > 0) {
			// session.setAttribute("member", new MemberDTO(id, pw, nick, phone, birth, sex));
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 수정에 성공하였습니다.');");
			out.print("location.href='board.jsp';");
			out.print("</script>");
			// response.sendRedirect("board.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 수정에 실패하였습니다.');");
			out.print("location.href='board.jsp';");
			out.print("</script>");
		}
		
	}

}
