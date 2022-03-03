package Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;

@WebServlet("/idCheck")
public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> idGroup = new ArrayList<String>();
		MemberDAO dao = new MemberDAO();
		
		idGroup = dao.idSelectAll();
		
		String id = request.getParameter("input_id");
		
		int idCount = 0;
		
		for (int i = 0; i < idGroup.size(); i++) {
			if(id.equals(idGroup.get(i))) {
				idCount++;
			}
			if ( id.length() < 3 ) {
				idCount++;
			}
		}
		
		response.setContentType("text/plain; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(idCount);
	}

}
