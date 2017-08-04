package com.myWebprj3.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myDao.Model.User;
import com.myDao.Model.UserDao;

/**
 * Servlet implementation class UpdateProcess
 */
@WebServlet("/Update")
public class UpdateProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		
		String password =  request.getParameter("newpassword");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		User user = new User((String) session.getAttribute("userid"), username, password, email, null, zipcode, address, phone);
		UserDao userDao = new UserDao();
		int rs = 0;
		try {
			rs = userDao.updateUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs == 0) {
			PrintWriter out = response.getWriter();
			out.println("<h1>업데이트에 실패하였습니다.</h1>");
			response.sendRedirect("/");
		}else {
			session.invalidate();
			response.sendRedirect("/");
		}
	}
}
