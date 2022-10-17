<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		String mode = request.getParameter("mode");
		String order_no = request.getParameter("order_no");
		String cust_no = request.getParameter("cust_no");
		String cust_name = request.getParameter("cust_name");
		String menu_no = request.getParameter("menu_no");
		String amount = request.getParameter("amount");
		String date = request.getParameter("order_date");
		try{
			con = Util.getConnection();
			String sql = "";
			switch(mode){
			case "insert" :
				sql = "insert into order_tbl values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, order_no);
				pstmt.setString(2,cust_no);
				pstmt.setString(3, cust_name);
				pstmt.setString(4, menu_no);
				pstmt.setString(5, amount);
				pstmt.setString(6, date);
				
				pstmt.executeUpdate();
				%>
					<jsp:forward page="order.jsp"></jsp:forward>>
				<%
				break;
			case "modify":
				sql = "UPDATE order_tbl SET custno = ?, custname = ?, menuno = ?, amount = ?, orderdate = ? WHERE orderno = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,cust_no);
				pstmt.setString(2,cust_name);
				pstmt.setString(3,menu_no);
				pstmt.setString(4,amount);
				pstmt.setString(5,date);
				pstmt.setString(6, order_no);
				
				pstmt.executeUpdate();
				%>
					<jsp:forward page="orderlist.jsp"></jsp:forward>>
				<%
				break;
			case "delete":
				sql = "delete from order_tbl where orderno = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,order_no);
				pstmt.executeUpdate();
				
				%>
					<jsp:forward page="orderlist.jsp"></jsp:forward>
				<% 
				break;
			}				
		}catch(Exception e){
			e.printStackTrace();
		}
	
	%>
</body>
</html>