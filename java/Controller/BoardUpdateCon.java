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
import Model.MemberDTO;

@WebServlet("/BoardUpdateCon")
public class BoardUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int num = 0; // 관련 게시글 번호
		String nick = "로그인 후 저장된 닉네임"; 
		String newTitle = request.getParameter("newTitle"); // 수정된 제목
		String newContent = request.getParameter("newContent"); // 수정된 내용
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardUpdate(new BoardDTO(num, nick, newTitle, newContent, 0));
		
		if (cnt > 0) {
			// session.setAttribute("member", new MemberDTO(id, pw, nick, phone, birth, sex));
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 수정에 성공하였습니다.');");
			out.print("location.href='board.jsp';");
			out.print("</script>");
			// response.sendRedirect("board.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 수정에 실패하였습니다.');");
			out.print("location.href='board.jsp';");
			out.print("</script>");
		}
		
	}

}
