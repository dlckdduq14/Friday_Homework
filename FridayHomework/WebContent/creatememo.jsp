<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form method="post" action="creatememo_proc.jsp">
<div class="form-group">
<table border="1">
	
	<tr><td>title:</td><td><input type="text" name="title"></td></tr>
	
  <tr><td><label for="content">Content:</label></td>
  <td><textarea class="form-control" rows="5" name="content"></textarea></td>
	<td><input type="submit" value="저장"></td></tr>
</table>
</div>
</form>
