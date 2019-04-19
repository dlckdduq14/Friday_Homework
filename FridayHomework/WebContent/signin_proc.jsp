<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<!-- <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!-- <script src="./js/jquery.cookie.js"></script> -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		String sql = "select id from user where id=? and pw=?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, id);
		stmt.setString(2, pw);
		ResultSet rs = stmt.executeQuery();
		boolean isOk = false;
		if (rs.next()) {
			isOk = true;
		}
		if (isOk) {
			out.println("로그인 되었습니다. 메인화면으로 가기를 눌러주세요.");
			session.setAttribute("id", id);
%>
<form method="post" action="main.jsp">
<input type="submit" value="메인화면으로 가기">
</form>
<!-- <script> -->
<!-- $.cookie("key","value"); -->
<!-- $.cookie("key2","value2",{expires:1}); -->
<!-- </script> -->
<%
	} else {
			out.println("다시 로그인해주세요.");

		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>



