package com.myWebprj3.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myDao.Model.UserDao;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/IdChecker")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=utf-8");
		
		UserDao userDao = new UserDao();
		int checkCount = 0;
		try {
			checkCount = userDao.IdChecker(request.getParameter("userid"));
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		String canUse = "사용할 수 있는 아이디입니다.";
		String canNotUse = "사용할 수 없는 아이디입니다.";
		PrintWriter out = response.getWriter();
		if(checkCount == 0){
			out.println(canUse);
		}else{
			out.println(canNotUse);
		}
	}
}
