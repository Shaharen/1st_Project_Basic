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
		// ���� ������ �Խñ��� ������ �����ϰ� �Խñ��� ����� �����Ѵ�  <=== �̰� ����????????
		// �� �������� �������� �޽��� �����Ұ��� ���� ����°� ����� -- ������ ���� �ʿ�?
		request.setCharacterEncoding("UTF-8");
		
		String nick = "�α��� �� ����� �г���";
		String title = request.getParameter("title"); // ������ ���� �ش� �Խñ� ����
		// String content = request.getParameter("content"); // ������ ���� �Խñ� ����
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardDelete(nick, title);
		
		if (cnt > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�޽��� ���� ����..!');");
			out.print("location.href = 'board.jsp';");
			out.print("</script>");
			// response.sendRedirect("board.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�޽��� ���� ����..!');");
			out.print("location.href = 'board.jsp';");
			out.print("</script>");
		}
	}

}
