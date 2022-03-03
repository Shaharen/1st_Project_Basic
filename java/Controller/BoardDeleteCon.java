package Controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BoardDAO;




@WebServlet("/BoardDelete")
public class BoardDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// HttpSession session = request.getSession();
		// BoardDTO member = (BoardDTO)session.getAttribute("member");
		// 세선 저장을 게시글을 누르면 실행하고 게시글을 벗어나면 제거한다  <=== 이게 가능????????
		// 이 페이지로 오기전에 메시지 삭제할건지 여부 물어보는거 만들기 -- 페이지 따로 필요?
		request.setCharacterEncoding("UTF-8");
		
		String nick = "로그인 후 저장된 닉네임";
		String title = request.getParameter("title"); // 삭제를 누른 해당 게시글 제목
		// String content = request.getParameter("content"); // 삭제를 누른 게시글 내용
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardDelete(nick, title);
		
		if (cnt > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('메시지 삭제 성공..!');");
			out.print("location.href = 'board.jsp';");
			out.print("</script>");
			// response.sendRedirect("board.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('메시지 삭제 실패..!');");
			out.print("location.href = 'board.jsp';");
			out.print("</script>");
		}
	}

}
