package Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import Model.DrinkDAO;
import Model.DrinkDTO;
import Model.DrinkInfoDAO;
import Model.DrinkInfoDTO;

@WebServlet("/drinkInfo")
public class drinkInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sort = Integer.parseInt(request.getParameter("sort"));
		System.out.println(sort);
		
		DrinkInfoDAO dao = new DrinkInfoDAO(); // 술 정보쪽
		String[] list = dao.infoMsg(sort);
		
		
		Gson gson = new Gson();
		JsonArray jarray = new JsonArray();
		
		for (int i = 0; i < list.length; i++) {
			jarray.add(gson.toJson(list[i]));
		}
		response.setContentType("text/plain; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(jarray);
		
	}

}
