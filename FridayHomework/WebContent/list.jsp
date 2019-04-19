<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=914" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=913" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=912" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=911" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=910" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=909" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=908" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=907" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=906" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

		<div class="card" style="width:400px">
			<div class="card-body">
 		    <h4 class="card-title">title</h4>
 		    <a href="view.jsp?id=905" class="btn btn-primary">
 		    	버튼
 		    </a>
 		  </div>
 		</div>

<%
	String pageStr = request.getParameter("page");

	int pageNum = 0;
	try{
		pageNum = Integer.parseInt(pageStr);	
	}catch(Exception e){
		pageNum = 1;
	}
		
	// 시작번호 끝번호 아아내기
	int startRow = 0;
	int endRow = 0;
	endRow = pageNum * 10;
	startRow = endRow - 9;
	int total = 0;
	
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		String sql = "select count(*) from index order by id desc";
		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			total = rs.getInt("count(*)");
		}
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	

%>
