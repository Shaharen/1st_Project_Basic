package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String[] birthData = request.getParameterValues("birth");
		String birth = birthData[0] + "-" + birthData[1] + "-" + birthData[2];
		int sex = Integer.parseInt(request.getParameter("sex"));
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.memberJoin(new MemberDTO(id,pw,nick,phone,birth,sex));
		
		if (cnt>0 ) {
			// 회원가입 완료! 메인페이지로 이동합니다 출력 후 이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입 성공!');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		} else {
			// 회원가입 실패!
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입 실패');");
			// 메인페이지로 이동합니다
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}
		
		
	}

}