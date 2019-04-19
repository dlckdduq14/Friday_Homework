<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%

	String I_NO = request.getParameter("I_NO");
	String M_NO = "";
	String M_Title = "";
	String M_Contents = "";
	   List<String> titleList = new ArrayList<>();
	   List<String> ContentsList = new ArrayList<>();
	   int cntIdx = 0;
	   try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open(); //  asc
	      String sql2 = "SELECT COUNT(M_NO) as INDEXNO FROM meno WHERE M_NO IN (SELECT  M_NO  FROM meno GROUP BY M_NO)";
	      PreparedStatement stmt2 = con.prepareStatement(sql2);
	      ResultSet rs2 = stmt2.executeQuery();
	      if(rs2.next()) {
	         cntIdx = rs2.getInt("INDEXNO");
	      }
	      
		String sql = "select M_NO, M_Title, M_Contents from meno where I_NO ='1' ";
		
		PreparedStatement stmt = con.prepareStatement(sql);
// 		stmt.setString(1, I_NO);
		ResultSet rs = stmt.executeQuery();
		 while(rs.next()) {
	         titleList.add(rs.getString("M_Title"));
	         ContentsList.add(rs.getString("M_Contents"));
		 }
		 
	   } catch (ClassNotFoundException e) {
		      e.printStackTrace();
		   } catch (SQLException e) {
		      e.printStackTrace();
		   }   

%>

<%   	   
		 for(int num = 0; num < cntIdx; num++){
%>
<table border="1">
<tr>
	<th width="200" align="center"><%=titleList.get(num)%></th>
	<th><button type="button" onclick="Update()">수정</button></th>
	<th><button type="button" onclick="del()">닫기</button></th>
</tr>	
	<tr>
		<!-- 첫번째 줄 시작 -->
		<td colspan="3" height="200">
			<p><textarea style="margin: 0px; width: 295px; height: 186px;" ><%=ContentsList.get(num)%></textarea> </p>
		</td>
	</tr>
</table>
<%
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













