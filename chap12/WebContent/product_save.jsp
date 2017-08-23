<%@page import="java.util.Enumeration"%>
<%@page import="com.chap10.util.JDBCUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.chap10.domain.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String filepath = request.getServletContext().getRealPath("upload");
	System.out.println(filepath);
	String saveFolder = "upload";
	String encType = "utf-8";
	int Maxsize = 5*1024*1024;
	
	ServletContext context = getServletContext();
	MultipartRequest multi = null;
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	multi = new MultipartRequest(request, filepath, Maxsize, encType, policy);
	
	ProductVO vo = new ProductVO(0, multi.getParameter("category"), multi.getParameter("wname"), multi.getParameter("pname"),
								 multi.getParameter("sname"), Integer.parseInt(multi.getParameter("price")), Integer.parseInt(multi.getParameter("dprice")),
								 "", Integer.parseInt(multi.getParameter("stock")), multi.getParameter("description"), "", "");
	
	System.out.println(vo.getCategory());
	long id = 0;
	int pos = 0;
	String des = vo.getDescription();
	while((pos=des.indexOf("\'", pos)) != -1){
		String left = des.substring(0, pos);
		String right = des.substring(pos, des.length());
		des = left+ "\'" + right;
	}
	vo.setDescription(des);
	
	Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String ymd = myformat.format(yymmdd);
	vo.setInputdate(ymd);
	
	String select = "select max(id) from product where category = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(select);
		pstmt.setString(1, vo.getCategory());
		rs = pstmt.executeQuery();
		rs.next();
		id = rs.getLong(1);
		
		rs.close();
		pstmt.close();
		
		if(id == 0){
			id = Long.parseLong(vo.getCategory() + "00001");
		}else{
			id = id + 1;
		}
		vo.setId(id);
		
		Enumeration files = multi.getFileNames();
		String fname1 = (String) files.nextElement();
		String filename1 = multi.getFilesystemName(fname1);
		String fname2 = (String) files.nextElement();
		String filename2 = multi.getFilesystemName(fname2);
		
		if(filename2 == null){
			filename2 = filename1;
		}
		
		vo.setSmall(filename2);
		vo.setLarge(filename1);
		String insert = "insert into product(id, category, wname, pname, sname, price, downprice, inputdate, stock, small, large, description)"
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(insert);
		pstmt.setLong(1, vo.getId());
		pstmt.setString(2, vo.getCategory());
		pstmt.setString(3, vo.getWname());
		pstmt.setString(4, vo.getPname());
		pstmt.setString(5, vo.getSname());
		pstmt.setInt(6, vo.getPrice());
		pstmt.setInt(7, vo.getDownprice());
		pstmt.setString(8, vo.getInputdate());
		pstmt.setInt(9, vo.getStock());
		pstmt.setString(10, vo.getSmall());
		pstmt.setString(11, vo.getLarge());
		pstmt.setString(12, vo.getDescription());
		cnt = pstmt.executeUpdate();
		
		if(cnt > 0){
			System.out.println("상품을 등록했습니다.");
		}else{
			System.out.println("상품이 등록되지 않았습니다.");
		}
		
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		System.out.println(e.getMessage());
	}
%>
<a href="product_list.jsp">상품 목록으로</a>
<a href="product_write.html">상품 올리는 곳으로</a>