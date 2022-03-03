package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO member = dao.memberLogin(id, pw);
		System.out.println(id);
		System.out.println(pw);
		System.out.println(member);

		// �α��� �� ���� ������ �Ѱ���� �������������� �г������� ��°���
		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("main.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�α��� ����');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}

	}
}