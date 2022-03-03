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


import Model.DrinkDAO;
import Model.DrinkDTO;
import Model.MemberDTO;
import Model.RecommendDAO;

@WebServlet("/SearchCon")
public class SearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String[] abv = request.getParameterValues("abv");
		
		DrinkDAO dao = new DrinkDAO();
		RecommendDAO dao2 = new RecommendDAO();
		ArrayList<DrinkDTO> drink = new ArrayList<DrinkDTO>();
		
		String nick = member.getNick();
		drink = dao.drinkSelectAll(abv); // 술 검색
		int cnt = dao2.recommend(drink, nick);// 검색결과 추천 테이블에 저장
		
		if (cnt > 0) {
			System.out.println("등록완료");
		}
		request.setAttribute("searchResult", drink);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("searchResult.jsp");
		dispatcher.forward(request, response);
	}

}
