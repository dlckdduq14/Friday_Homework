<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form method="post" action="creatememo_proc.jsp">
<table border="1">
	
	<tr><td>title:</td><td><input type="text" name="title"></td></tr>
	
  <tr><td><label for="content">Content:</label></td>
  <td><textarea rows= "10"  style="width:1200px" name="content"></textarea>
  <input type="submit" value="저장"></td></tr>
</table>
</form>
