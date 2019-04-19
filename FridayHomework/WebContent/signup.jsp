<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>




<form method="post" action="signup_proc.jsp">
<table border="1">
	<tr><td>ID : <input type="text" name="id" onblur="move()"><br></td></tr>
	<tr><td>PW : <input type="password" name="pw"><br></td></tr>
	<tr><td>EMail : <input type="text" name="email"><br></td></tr>
	<tr><td><input type="submit" value="회원가입"></td></tr></table>
</form>
<div id="result"></div>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function move() {
		$.ajax( { 
// 			url: 'https://www.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyAguR7EAV3Opynrl0VyW38dls-4YbRyKMs&q=원피스',
			url: 'idcheck.jsp',
			type: 'get',
			data: { "id" : $('input[name=id]').val() },
			success: function(result) {
				$("#result").html(result);
// 				console.log(result);
			}
		} );
	}
</script>

