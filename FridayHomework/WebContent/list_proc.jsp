<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String I_Title = request.getParameter("I_Title");
// 	String ID = request.getParameter("I_NO");
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		
		String sql3 = "insert into `index` (I_NO, I_Title, id) values (null, ?, ?)";
		PreparedStatement stmt3 = con.prepareStatement(sql3);
		stmt3.setString(1, I_Title);
 		stmt3.setString(2, "ai");
		stmt3.executeUpdate();
		
		response.sendRedirect("main.jsp");
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>



