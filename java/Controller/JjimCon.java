package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DrinkDTO;
import Model.MemberDTO;
import Model.RecommendDAO;

@WebServlet("/JjimCon")
public class JjimCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		RecommendDAO dao = new RecommendDAO();
		ArrayList<DrinkDTO> drink = new ArrayList<DrinkDTO>();
		
		String nick = member.getNick();
		drink = dao.jjim(nick); //Âò¸ñ·Ï
		
		request.setAttribute("jjim", drink);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jjim.jsp");
		dispatcher.forward(request, response);
		
	}

}
