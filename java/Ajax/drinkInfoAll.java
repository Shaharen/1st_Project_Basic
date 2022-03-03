package Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import Model.DrinkDAO;
import Model.DrinkDTO;

@WebServlet("/drinkInfoAll")
public class drinkInfoAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sort = Integer.parseInt(request.getParameter("sort"));
		
		ArrayList<DrinkDTO> drinkAll = new ArrayList<DrinkDTO>();
		DrinkDAO dao = new DrinkDAO(); // 술 전체 정보
		drinkAll = dao.infoAll(sort);
		System.out.println(drinkAll);
		
		Gson gson = new Gson();
		JsonArray jarray = new JsonArray();
		
		for (int i = 0; i < drinkAll.size(); i++) {
			jarray.add(gson.toJson(drinkAll.get(i)));
		}
		response.setContentType("text/plain; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(jarray);
		
	}

}
