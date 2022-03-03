package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DrinkDAO;
import Model.DrinkDTO;

@WebServlet("/drinkInfoCon")
public class drinkInfoCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//안씀
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sort = Integer.parseInt(request.getParameter("sort"));
		
		ArrayList<DrinkDTO> drinkAll = new ArrayList<DrinkDTO>();
		DrinkDAO dao2 = new DrinkDAO(); // 술 전체 정보
		drinkAll = dao2.infoAll(sort);
		
		System.out.println(drinkAll);

		request.setAttribute("drinkAll", drinkAll);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("drinkInfo.jsp");
		dispatcher.forward(request, response);
	}

}
