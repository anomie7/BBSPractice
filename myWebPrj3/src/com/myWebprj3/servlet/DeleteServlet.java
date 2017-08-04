package com.myWebprj3.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myDao.Model.UserDao;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/Delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8"); 
		
		UserDao userDao = new UserDao();
		int rs = userDao.deleteUser((String) session.getAttribute("userid"));
		
		if(rs == 0) {
			PrintWriter out = response.getWriter();
			out.println("<h1>삭제에 실패하였습니다.</h1>");
			response.sendRedirect("/");
		}else {
			session.invalidate();
			response.sendRedirect("/");
		}
	}
}
