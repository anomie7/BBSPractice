package com.myWebprj3.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myDao.Model.User;
import com.myDao.Model.UserDao;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/Insert")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String password =  request.getParameter("password");
		String username = request.getParameter("username");
		String securitynum = request.getParameter("securitynum");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		User user = new User(userid, username, password, email, securitynum, zipcode, address, phone);
		
		UserDao userDao = new UserDao();
		userDao.insertUser(user);
		response.sendRedirect("/");
	}
}
