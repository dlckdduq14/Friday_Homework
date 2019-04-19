<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form method="get" action="list_proc.jsp">
<table border="1">
  <tr>
    <td height="50" width="200"><textarea name="I_Title"></textarea>
    <input type="button" value="저장"></td>
  </tr>
</table>
</form>

<%
	String ID_B = (String)session.getAttribute("id");
	String I_NO_B = request.getParameter("I_Title");
	String Title_B = "";
	List<String> noList_B = new ArrayList<>();
	List<String> titleList_B = new ArrayList<>();
	
	int cntIdx_B = 0;
	
	try { 
		DBManager db_B = DBManager.getInstance();
		Connection con_B = db_B.open();
	
		String sql_B = "SELECT COUNT(I_NO) AS INDEXNO FROM `index` WHERE I_NO ";
		sql_B += "IN (SELECT DISTINCT I_NO  FROM `index` GROUP BY I_NO)";
		PreparedStatement stmt_B = con_B.prepareStatement(sql_B);
		ResultSet rs_B = stmt_B.executeQuery();
		if(rs_B.next()) {
			cntIdx_B = rs_B.getInt("INDEXNO");
		}
		
		String sql_B2 = "SELECT I_NO , I_Title FROM `index` where ID='ai'";
		PreparedStatement stmt_B2 = con_B.prepareStatement(sql_B2);
		ResultSet rs_B2 = stmt_B2.executeQuery();
		while(rs_B2.next()) {
			I_NO_B = rs_B2.getString("I_NO");
			Title_B = rs_B2.getString("I_Title");
			noList_B.add(I_NO_B);
			titleList_B.add(Title_B);
		}
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	



	for(int num = 0; num < cntIdx_B; num++){
%>		 
	<table border="1">
               <tr>
                  <td height="100" width="200">
                     <input type="button" value="<%=titleList_B.get(num)%>" onclick="#"
                     style="width : 200 ; height : 100">   	 
                  </td>
               </tr>
            </table>
<% 
	}
%>
