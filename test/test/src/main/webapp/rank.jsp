<%@ include file = "db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rank</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style = "position:fixed; top: 70px; width:100%; height: 100%; left:0px;background: lightgray">
<h1 style = "text-align: center"><b>후보자등수</b></h1>
<form style = "display: flex; align-items:center; justify-content: center; text-align:center">
	<table border = "1">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>총투표건수</td>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
		
			try{
				String sql = "select m.m_no, m.m_name, count(v.m_no)  from TBL_MEMBER_202005 m, TBL_VOTE_202005 v where m.m_no = v.m_no and v.V_CONFIRM = 'Y' group by m.m_name, m.m_no, v.m_no order by count(v.M_NO) desc";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					%>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
						</tr>
					<%
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>