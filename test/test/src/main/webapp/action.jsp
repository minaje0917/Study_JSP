<%@ include file = "db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String jumin = request.getParameter("jumin");
	String name = request.getParameter("name");
	String num = request.getParameter("num");
	String time = request.getParameter("time");
	String place = request.getParameter("place");
	String check = request.getParameter("check");
	
	try{
		String sql = "INSERT INTO TBL_VOTE_202005 VALUES(?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, jumin);
		pstmt.setString(2, name);
		pstmt.setString(3, num);
		pstmt.setString(4, time);
		pstmt.setString(5, place);
		pstmt.setString(6, check);
		
		pstmt.executeUpdate();
	}
	
	catch(Exception e){
		e.printStackTrace();
	}
%>

<jsp:forward page="index.jsp"></jsp:forward>