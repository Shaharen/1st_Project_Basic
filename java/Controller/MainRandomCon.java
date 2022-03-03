package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DrinkDAO;
import Model.DrinkDTO;

@WebServlet("/MainRandomCon")
public class MainRandomCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// ¾È¾¸
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Random rd = new Random();
		DrinkDAO dao = new DrinkDAO();
		ArrayList<DrinkDTO> randomGroup = new ArrayList<DrinkDTO>();
		
		int[] numArray = {};
		
		for (int i = 0 ; i < 10; i++) {
			numArray[i] = rd.nextInt(1600)+1;
		}
		randomGroup = dao.random(numArray);
		
		request.setAttribute("randomGroup", randomGroup);
		  
		RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
		dispatcher.forward(request, response);
		 
	}

}
