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

@WebServlet("/BoardWriteCon")
public class BoardWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String nick = "�α��� �� ����� �г���";
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardWrite(new BoardDTO(0, nick, title, content, 0));

		if (cnt > 0) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�� ����� �Ϸ��߽��ϴ�!');");
			out.print("location.href='board.jsp';");
			out.print("</script>");
			// response.sendRedirect("main.jsp");
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�� ��Ͽ� �����Ͽ����ϴ�.');");
			out.print("location.href='board.jsp';");
			out.print("</script>");
		}

	}

}
