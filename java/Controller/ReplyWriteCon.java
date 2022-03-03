package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDAO;
import Model.BoardDTO;
import Model.ReplyDAO;
import Model.ReplyDTO;

@WebServlet("/ReplyWriteCon")
public class ReplyWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int bo_num = 0; // 저장된 게시글 번호
		String nick = "로그인 후 저장된 닉네임";
		String content = request.getParameter("re_content");
		String redate = "";
		String updateDate = "";
		int re_index = 0;
		
		ReplyDAO dao = new ReplyDAO();
		int cnt = dao.replyWrite(new ReplyDTO(bo_num, nick, content, redate, updateDate, re_index));
		
		if (cnt > 0) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 등록을 완료했습니다!');");
			out.print("location.href='boardLook.jsp';");
			out.print("</script>");
			// response.sendRedirect("main.jsp");
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 등록에 실패하였습니다.');");
			out.print("location.href='boardLook.jsp';");
			out.print("</script>");
		}
		
	}

}
