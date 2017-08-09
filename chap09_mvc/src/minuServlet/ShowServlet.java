package minuServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap09_model.GuestBoard;
import chap09_model.GuestBoardDAO;

/**
 * Servlet implementation class ShowServlet
 */
@WebServlet("/Show")
public class ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		GuestBoardDAO gbd = new GuestBoardDAO();
		List<GuestBoard>  list = gbd.showGuestBoard();
		
		if(list == null) {
			PrintWriter out = response.getWriter();
			out.println("<h1>게시물을 조회할 수 없습니다.<h2>");
		}
		RequestDispatcher dispatcher =  request.getRequestDispatcher("dbgb_show.jsp");
										request.setAttribute("list", list);
		dispatcher.forward(request, response);
	}
}
