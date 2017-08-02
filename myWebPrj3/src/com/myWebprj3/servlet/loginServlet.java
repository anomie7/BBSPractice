package com.myWebprj3.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myDao.Model.UserDao;
import com.myException.PasswordMissMatchException;
import com.myException.UserNotFindException;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		
		try{
			UserDao userDao = new UserDao();
			userDao.findByUserId(userid, password);
			session.setAttribute("member_id", userid);
			out.println("로그인 성공");
		}catch(PasswordMissMatchException e) {
			out.println("비밀번호");
		}catch(UserNotFindException e){
			out.println("로그인 실패");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
