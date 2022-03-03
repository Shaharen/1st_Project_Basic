package Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDTO;
import Model.RecommendDAO;

@WebServlet("/Jjim")
public class Jjim extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RecommendDAO dao = new RecommendDAO();
		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String bSubmit = request.getParameter("bSubmit");
		int num = Integer.parseInt(request.getParameter("num"));
		int count = 0;
		String nick = member.getNick();
		
		System.out.println(bSubmit);
		System.out.println(num);
		
		if (bSubmit.equals("true")) {
			System.out.println("Âò¸ñ·Ï µî·Ï");
			count = 1;
			int cnt = dao.cntPlus(count, num, nick);
		} else {
			System.out.println("Âò¸ñ·Ï Á¦°Å");
			count = 0;
			int cnt = dao.cntMinus(count, num, nick);
		}
		
		
		PrintWriter out = response.getWriter();
		out.print(count);
		
	}

}
