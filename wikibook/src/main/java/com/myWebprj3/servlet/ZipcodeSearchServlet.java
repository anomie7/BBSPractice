package com.myWebprj3.servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myDao.Model.Zipcode;
import com.myDao.Model.ZipcodeDao;

/**
 * Servlet implementation class ZipcodeSearchServlet
 */
@WebServlet("/ZipcodeSearch")
public class ZipcodeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipcodeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
		ZipcodeDao zipcodeDao = new ZipcodeDao();
		Collection<Zipcode> list = zipcodeDao.selectZipcode(request.getParameter("addr"));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("zipcode_search.jsp");
									   request.setAttribute("list", list);
		dispatcher.forward(request, response);
	}

}
