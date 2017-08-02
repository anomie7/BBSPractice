package com.myBBS.Controrler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.myBBS.Model.userDao;


@WebServlet("/bbs/login")
public class loginServlet extends HttpServlet {
	public static final long serialVersionUID = 1L;
       
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		//모델
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		final String SQL = "select * from member where userid = ? and password = ?";
		
		String name = null, email = null;
		boolean bLogin = false;
		try{
			conn = userDao.getConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				name = rs.getString("username");
				email = rs.getString("email");
				bLogin = true;
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		//bLogin 대신 DAO에서 리턴값, 아래는 Controler 단
		if(bLogin){
			session.setAttribute("member_id", userid);
			session.setAttribute("member_name", name);
			response.sendRedirect("index.jsp");
		}else{ 
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('아이디와 비밀번호를 확인하세요.\");')");	
			out.println("history.back()</script>");	
		}
	
	}
}
