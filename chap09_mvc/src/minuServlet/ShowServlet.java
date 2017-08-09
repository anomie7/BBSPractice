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

import org.slf4j.LoggerFactory;

import chap09_model.GuestBoard;
import chap09_model.GuestBoardDAO;

/**
 * Servlet implementation class ShowServlet
 */
@WebServlet("/Show")
public class ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ShowServlet.class);
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		GuestBoardDAO gbd = new GuestBoardDAO();
		List<GuestBoard>  list = gbd.showGuestBoard();
		
		logger.debug(request.getParameter("start"));
		
		if(list == null) {
			PrintWriter out = response.getWriter();
			out.println("<h1>게시물을 조회할 수 없습니다.<h2>");
		}
		
		int startrow;
		if(request.getParameter("start") == null || Integer.parseInt(request.getParameter("start")) == 0 ) {
			startrow = 0;
		}else {
			startrow = Integer.parseInt(request.getParameter("start"));
		}
		
		logger.debug(startrow + "");
		
		int showrow = 2;
		int endrow = startrow + showrow;
		
		
		list = list.subList(startrow, endrow);
		
		for(GuestBoard g : list) {
			logger.debug(g.getName() + " " + g.getEmail());
		}
		
		RequestDispatcher dispatcher =  request.getRequestDispatcher("dbgb_show.jsp");
										request.setAttribute("list", list);
										request.setAttribute("start", startrow);
		dispatcher.forward(request, response);
	}
}
