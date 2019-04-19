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
			<td width="150"><%=id %>님 환영합니다.</td>
			<!-- 메모 보여주는 곳 -->
			<td colspan="3" rowspan="2">
				<%
					String I_NO = request.getParameter("I_NO");
					String M_NO = "";
					try {
						DBManager db = DBManager.getInstance();
						Connection con = db.open(); //  asc

						String sql = "select M_NO, M_Title, M_Contents from meno where I_NO = ? ";

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
							<p>
								<textarea><%=M_Contents%></textarea>
							</p>
						</td>
					</tr>
				</table> <%
 	}
 	} catch (ClassNotFoundException e) {
 		e.printStackTrace();
 	} catch (SQLException e) {
 		e.printStackTrace();
 	}
 %> <script>
	function del() {
		var isOk = confirm("삭제 할래?");
		if(isOk) { // 삭제
			location = 'meno_delete.jsp?I_NO=<%=I_NO%>&M_NO=<%=M_NO%>';
		}
	}
</script> <script>
	function Update() {
		var isOk = confirm("수정 할래?");
		if(isOk) { // 삭제
			location = 'meno_Udate.jsp?I_NO=<%=I_NO%>
	';
		}
	}
</script>
			</td>
		</tr>
		<tr height="50%">
			<td>총계</td>
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

