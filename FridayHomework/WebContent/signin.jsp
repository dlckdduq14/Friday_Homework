<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<form method="post" action="signin_proc.jsp">
	<table border="1">
		<tr>
			<td>ID : <input type="text" name="id"><br></td>
			<td><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td>PW : <input type="password" name="pw"></td>
			<td><input type="button" value="회원가입" onclick="location='signup.jsp'"></td>
			</tr>
	</table>
</form>