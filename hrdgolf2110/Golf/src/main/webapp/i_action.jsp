<%@ include file = "db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
request.setCharacterEncoding("UTF-8");

String register_month = request.getParameter("register_month");
String c_no = request.getParameter("c_no");
String class_area = request.getParameter("class_area");
String tuition = request.getParameter("tuition");
String teacher_code = request.getParameter("teacher_code");

try {
	String sql = "INSERT INTO tbl_class_202201 VALUES(?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, register_month);
	pstmt.setString(2, c_no);
	pstmt.setString(3, class_area);
	pstmt.setString(4, tuition);
	pstmt.setString(5, teacher_code);
	
	pstmt.executeUpdate();
	
}
catch(Exception e) {
	e.printStackTrace();
}
%>

<jsp:forward page="index.jsp"></jsp:forward>