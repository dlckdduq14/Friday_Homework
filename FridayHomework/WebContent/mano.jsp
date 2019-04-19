<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String I_NO = request.getParameter("I_NO");
	String M_NO = "";
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open(); //  asc

		String sql = "select M_NO, M_Title, M_Contents from mano where I_NO = ? ";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, I_NO);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			M_NO = rs.getString("M_NO");
			String M_Title = rs.getString("M_Title");
			String M_Contents = rs.getString("M_Contents");
%>
<table border="1">
<tr>
	<th width="200" align="center"><%=M_Title%></th>
	<th><button type="button" onclick="Update()">수정</button></th>
	<th><button type="button" onclick="del()">닫기</button></th>
</tr>	
	<tr>
		<!-- 첫번째 줄 시작 -->
		<td colspan="3" height="200">
			<p><textarea><%=M_Contents%></textarea> </p>
		</td>
	</tr>
</table>
<%
	}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<script>
	function del() {
		var isOk = confirm("삭제 할래?");
		if(isOk) { // 삭제
			location = 'meno_delete.jsp?I_NO=<%=I_NO%>&M_NO=<%=M_NO%>';
		}
	}
</script>
<script>
	function Update() {
		var isOk = confirm("수정 할래?");
		if(isOk) { // 삭제
			location = 'meno_Udate.jsp?I_NO=<%=I_NO%>';
		}
	}
</script>













