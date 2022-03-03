package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDAO;
import Model.ReplyDAO;

@WebServlet("/ReplyDeleteCon")
public class ReplyDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// HttpSession session = request.getSession();
		// BoardDTO member = (BoardDTO)session.getAttribute("member");
		// ���� ������ �Խñ��� ������ �����ϰ� �Խñ��� ����� �����Ѵ�  <=== �̰� ����????????
		// �� �������� �������� �޽��� �����Ұ��� ���� ����°� ����� -- ������ ���� �ʿ�?
		request.setCharacterEncoding("UTF-8");
		
		int bo_num = 0; // �Խñ� ��ȣ 
		String nick = "�α��� �� ����� �г���";
		int re_index = 0;// ��� ��ȣ
		
		ReplyDAO dao = new ReplyDAO();
		int cnt = dao.replyDelete(bo_num, nick, re_index);
		
		if (cnt > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('��� ���� ����..!');");
			out.print("location.href = 'boardLook.jsp';");
			out.print("</script>");
			// response.sendRedirect("board.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('��� ���� ����..!');");
			out.print("location.href = 'boardLook.jsp';");
			out.print("</script>");
		}
	}

}
