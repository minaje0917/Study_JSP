<%@page import="java.text.DecimalFormat"%>
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
	<section style ="position:fixed;width:100%;top:90px;height:100%; background-color: gray; left:0">
		<h2 style = "text-align:center">GSM 카페에 오신 것을 환영합니다</h2>
		<form name = frm method="post" action="action.jsp" style = "display:flex; justify-content: center; align-items: center;text-align: center">
			<table border ="1" style ="border-collapse: collapse">
			<tr>
				<td colspan="9" style = "text-align:right; border-left: hidden;border-top: hidden;border-right: hidden;"><a href = "order.jsp">주문하기</a></td>
			</tr>
				<tr>
					<td>주문번호</td>
					<td>고객번호</td>
					<td>고객이름</td>
					<td>메뉴이름</td>
					<td>수량</td>
					<td>지불금액</td>
					<td>주문일자</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				<%
					request.setCharacterEncoding("utf-8");
					Connection con = null;
					PreparedStatement pstmt = null;
					try{
						con = Util.getConnection();
						String sql = "select * from order_tbl, menu_tbl where menu_tbl.menuno = order_tbl.menuno";
						pstmt = con.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){
						int result = rs.getInt(5) * rs.getInt(9);
						DecimalFormat dcf = new DecimalFormat("###,###");
						String str = dcf.format(result);
							
							%>
							<tr>
								<td><%=rs.getString(1) %></td>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(8) %></td>
								<td><%=rs.getString(5) %></td>
								<td><%=str%>원</td>
								<td><%=rs.getDate(6) %></td>
								<td><a href = "modify.jsp?order_no=<%=rs.getString(1)%>">주문 수정</a></td>
								<td><a href = "action.jsp?order_no=<%=rs.getString(1)%>&mode=delete">주문 삭제</a></td>
							</tr>
							<%
						}
						
					}catch(Exception e){
						e.printStackTrace();
					}
				
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>