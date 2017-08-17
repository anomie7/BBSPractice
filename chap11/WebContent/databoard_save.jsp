<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="dbconn.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%	
	String filepath = request.getServletContext().getRealPath("upload");
	System.out.println(filepath);
	String encType = "UTF-8";
	int Maxsize = 5*1024*1024;
	ServletContext context = getServletContext();
	try{
	MultipartRequest multi = null;
	
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	multi = new MultipartRequest(request, filepath, Maxsize, encType, policy);
	String na = multi.getParameter("name");
	String em = multi.getParameter("email");
	String sub = multi.getParameter("subject");
	String cont = multi.getParameter("content");
	String pw = multi.getParameter("password");
	NowTime nt = new NowTime();
	String ymd  = nt.toString();
	
	int id = 1;
	int pos = 0;
	
	if(cont.length() == 1) cont = cont + " ";
	
	while( (pos = cont.indexOf(" \" ", pos)) != -1){
		String left = cont.substring(0, pos);
		String right = cont.substring(pos, cont.length());
		cont = left + "\\" +  right;
		pos += 2;
	} 
	
	final String selectMaxId = "select max(id) from databoard";
	final String fileNotInsertSQL = "insert into databoard(id, name, password, email, subject"
							 + ",content, inputdate, masterid) " 
							 + "values(?, ?, ?, ?, ?, ?, ?, ?)";
	final String fileInsertSQL = "insert into databoard(id, name, password, email, subject"
							 + ",content, inputdate, masterid, filename, filesize) " 
			 					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(selectMaxId);
		rs = pstmt.executeQuery();
		
		if(!(rs.next() )) id = 1;
		else {
			id = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
		}
		Enumeration files = multi.getFileNames();
		String filename = "";
		String name = null;
		File file = null;
		
		while(files.hasMoreElements()){
			name = (String)files.nextElement();
			System.out.println(name);
			filename = multi.getFilesystemName(name);
			file = multi.getFile(name);
			System.out.println(filename);
		}
		
		if(filename != null){
		String original = multi.getOriginalFileName(name);
		String type = multi.getContentType(name);
			
		pstmt = conn.prepareStatement(fileInsertSQL);
		pstmt.setInt(1, id);
		pstmt.setString(2, na);
		pstmt.setString(3, pw);
		pstmt.setString(4, em);
		pstmt.setString(5, sub);
		pstmt.setString(6, cont);
		pstmt.setString(7, ymd);
		pstmt.setInt(8, id);
		pstmt.setString(9, filename);
		pstmt.setLong(10, file.length());
		cnt = pstmt.executeUpdate();
		
		}else{
			pstmt = conn.prepareStatement(fileNotInsertSQL);
			pstmt.setInt(1, id);
			pstmt.setString(2, na);
			pstmt.setString(3, pw);
			pstmt.setString(4, em);
			pstmt.setString(5, sub);
			pstmt.setString(6, cont);
			pstmt.setString(7, ymd);
			pstmt.setInt(8, id);
			cnt = pstmt.executeUpdate();
		}
		if(cnt > 0){
			if(filename != null)
				System.out.println("데이터가 성공적으로 입력되었습니다.");
			else
				System.out.println("업로드된 파일은 없지만 글은 올렸습니다.");
		}else System.out.println("데이터가 입력되지 않았습니다.");
	}catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		JDBCUtil.close(rs, pstmt, conn);
	}
	}catch(IOException e){
		System.out.println(e.getMessage());
	}
%>