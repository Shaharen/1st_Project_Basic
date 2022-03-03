package Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Cnt")
public class Cnt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int leftCnt = Integer.parseInt(request.getParameter("leftCnt"));
		
		leftCnt++;
		response.setContentType("text/plain; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(leftCnt);
	}

}
