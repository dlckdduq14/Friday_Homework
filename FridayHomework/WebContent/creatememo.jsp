<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form method="post" action="creatememo_proc.jsp">
<table border="1">
	
	<tr><td align="center">title</td><td><input type="text" name="title"></td></tr>
	
  <tr><td align="center"><label for="content">content</label></td>
  <td><textarea rows= "10"  style="width:1200px" name="content"></textarea>
  <input type="submit" value="저장"></td></tr>
</table>
</form>
