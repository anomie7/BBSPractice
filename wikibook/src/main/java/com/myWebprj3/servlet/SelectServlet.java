package com.myWebprj3.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myDao.Model.User;
import com.myDao.Model.UserDao;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/Select")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectServlet() { }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 했는지 검사
		//user 리턴 받아서 view로 forward
		response.setContentType("text/html charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userid") == null) {
			response.sendRedirect("/");
		}
		
		UserDao userDao = new UserDao();
		User user = null;
		try {
			user = userDao.getUser((String) session.getAttribute("userid"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("select.jsp");
									   request.setAttribute("user", user);
		dispatcher.forward(request, response);							   
	}
}
