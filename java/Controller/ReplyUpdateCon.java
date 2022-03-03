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
		
		int bo_num = 0; // ����� �Խñ� ��ȣ
		String nick = "�α��� �� ����� �г���";
		String newContent = request.getParameter("newReply"); // ������ ����
		String redate = ""; // �ۼ� ��¥ �ʱ�ȭ
		String updateDate = ""; // ���� ��¥ ( ���� ������...? )
		int re_index = 0; // ����� ��� ��ȣ
		
		ReplyDAO dao = new ReplyDAO();
		int cnt = dao.replyUpdate(new ReplyDTO(bo_num, nick, newContent, redate, updateDate, re_index));
		
		if (cnt > 0) {
			// session.setAttribute("member", new MemberDTO(id, pw, nick, phone, birth, sex));
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('��� ������ �����Ͽ����ϴ�.');");
			out.print("location.href='board.jsp';");
			out.print("</script>");
			// response.sendRedirect("board.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('��� ������ �����Ͽ����ϴ�.');");
			out.print("location.href='board.jsp';");
			out.print("</script>");
		}
		
	}

}
