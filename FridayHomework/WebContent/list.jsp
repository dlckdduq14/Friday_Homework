<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ID = request.getParameter("ID");
	String I_NO = "";
	String Title = "";
	List<String> noList = new ArrayList<>();
	List<String> titleList = new ArrayList<>();
	
	int cntIdx = 0;
	
	try { 
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		String sql = "SELECT COUNT(I_NO) AS INDEXNO FROM `index` WHERE I_NO ";
		sql += "IN (SELECT DISTINCT I_NO  FROM `index` GROUP BY I_NO)";
		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			cntIdx = rs.getInt("INDEXNO");
		}
		
		String sql2 = "SELECT I_NO , I_Title FROM `index` where ID='ai'";
		PreparedStatement stmt2 = con.prepareStatement(sql2);
		ResultSet rs2 = stmt2.executeQuery();
		while(rs2.next()) {
			I_NO = rs2.getString("I_NO");
			Title = rs2.getString("I_Title");
			noList.add(I_NO);
			titleList.add(Title);
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
                  <!-- 첫번째 줄 시작 -->
                  <td height="100" width="200">
                     <input type="button" value="<%=titleList.get(num)%>" onclick="#"
                     style="width : 200 ; height : 100">   	 
                  </td>
               </tr>
            </table> 
            
<%-- href="main.jsp?id=<%=I_NO%>" --%>
 		    
<%
	}
%>
