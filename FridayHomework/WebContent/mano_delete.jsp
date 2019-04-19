<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String I_NO = request.getParameter("I_NO");
	String M_NO = request.getParameter("M_NO");
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		String sql = "delete from meno where I_NO=? and M_NO=?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, I_NO);
		stmt.setString(2, M_NO);
		
		int result = stmt.executeUpdate(); // 성공이면 1 이상, 실패면 0
		if(result > 0) {
			//        http://localhost/JspBoard/list.jsp
			response.sendRedirect("mano.jsp");
		} else {
			out.println("삭제 실패");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>



