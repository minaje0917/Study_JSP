<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="heade.jsp"></jsp:include>
	<section style ="position:fixed; width:100%; top:90px;height:100%; background-color: gray; left:0">
	<h2 style ="text-align: center">카페 메뉴</h2>
	<form style="display : flex; text-align:center; align-items: center; justify-content: center">
		<table border="1">
			<tr>
				<td>메뉴번호</td>
				<td>메뉴이름</td>
				<td>가격</td>
				<td>칼로리</td>
			</tr>	
			<%
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = Util.getConnection();
				String sql = "select * from menu_tbl";
				pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					%>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %>원</td>
							<td><%=rs.getString(4) %></td>
						</tr>
					<% 
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			%>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>