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

@WebServlet("/UpdateCon")
public class UpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO member=(MemberDTO)session.getAttribute("member");

		request.setCharacterEncoding("UTF-8");
		
		// id는 저장된 세션에서 받고, 나머지는 update.jsp에서 받아온다.
		String id = member.getId();
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String birth = member.getBirthday();
		int sex = member.getSex();
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(new MemberDTO(id, pw, nick, phone, birth, sex));

		if (cnt > 0) {
			session.setAttribute("member", new MemberDTO(id, pw, nick, phone, birth, sex));
			response.sendRedirect("main.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('정보 변경 실패');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}

	}

}