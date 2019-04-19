<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id = (String) session.getAttribute("id");
%>
<body>
	<table border="1" width="1400" height="600" align="center">
		<tr height="150">
			<td width="150"><%=id%>님 환영합니다.</td>
			<!-- 메모 보여주는 곳 -->
			<td colspan="3" rowspan="2">
				<%
					String I_NO = request.getParameter("I_NO");
					String M_NO = "";
					String M_Title = "";
					String M_Contents = "";
					List<String> titleList = new ArrayList<>();
					List<String> ContentsList = new ArrayList<>();
					List<Integer> NOList = new ArrayList<>();
					int cntIdx = 0;
					try {
						DBManager db = DBManager.getInstance();
						Connection con = db.open(); //  asc
						String sql2 = "SELECT COUNT(M_NO) as INDEXNO FROM meno WHERE M_NO IN (SELECT  M_NO  FROM meno GROUP BY M_NO)";
						PreparedStatement stmt2 = con.prepareStatement(sql2);
						ResultSet rs2 = stmt2.executeQuery();
						if (rs2.next()) {
							cntIdx = rs2.getInt("INDEXNO");
						}

						String sql = "select M_NO, M_Title, M_Contents from meno where I_NO ='1' ";

						PreparedStatement stmt = con.prepareStatement(sql);
						// 		stmt.setString(1, I_NO);
						ResultSet rs = stmt.executeQuery();
						while (rs.next()) {
							NOList.add(rs.getInt("M_NO"));
							titleList.add(rs.getString("M_Title"));
							ContentsList.add(rs.getString("M_Contents"));
						}

					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				%> <%
 	for (int num = 0; num < cntIdx; num++) {
 %>
				<table border="1">
					<tr>
						<th width="200" align="center"><%=titleList.get(num)%></th>
						<th><button type="button"
								onclick="Update(<%=NOList.get(num)%>)">수정</button></th>
						<th><button type="button" onclick="del(<%=NOList.get(num)%>)">닫기</button></th>
					</tr>
					<tr>
						<!-- 첫번째 줄 시작 -->
						<td colspan="3" height="200">
							<p>
								<textarea style="margin: 0px; width: 295px; height: 186px;"><%=ContentsList.get(num)%></textarea>
							</p>
						</td>
					</tr>
				</table> <%
 	}
 %> <script>
	function del(num) {
		var isOk = confirm("삭제 할래?");
		if(isOk) { // 삭제
			location = 'mano_delete.jsp?I_NO=<%=I_NO%>&M_NO='+ num ;
		}
	}
</script> <script>
	function Update(num) {
		var isOk = confirm("수정 할래?");
		if(isOk) { // 삭제
			location = 'mano_Udate.jsp?I_NO=<%=I_NO%>';
		}
	}
</script>
			</td>
		</tr>
		<!-- 인덱스 보여주는 곳 -->
		<tr height="50%">
			<td>
		<form method="post" action="list_proc.jsp">
<table border="1">
  <tr>
    <td height="50" width="200"><textarea name="I_Title"></textarea>
    <input type="submit" value="저장"></td>
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
	
			</td>
		</tr>

		<!-- 입력하는곳  -->
		<tr height="30%">
			<td colspan="3">
		<tr>
			<td>title:</td>
			<td colspan="3"><input type="text" name="title"></td>
		</tr>
		<tr>
			<td><label for="content">Content:</label></td>
			<td><textarea rows="10" style="width: 1200px" name="content"></textarea></td>

			<td><input type="submit" value="저장" style="height: 150;"></td>


		</tr>
		</td>
		</tr>
	</table>
</body>

