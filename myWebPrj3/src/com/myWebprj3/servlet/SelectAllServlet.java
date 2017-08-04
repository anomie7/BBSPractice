package com.myWebprj3.servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myDao.Model.User;
import com.myDao.Model.UserDao;

/**
 * Servlet implementation class SelectAllServlet
 */
@WebServlet("/SelectAll")
public class SelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDao userDao = new UserDao();
		Collection<User> list =  userDao.selectAllUser();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("selectAll.jsp");
						  request.setAttribute("list", list);
		dispatcher.forward(request, response);
	}

}
