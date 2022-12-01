<%@ include file = "db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style = "position:fixed; top: 70px; width:100%; height: 100%; left:0px;background: lightgray">
<h1 style = "text-align: center"><b>투표검수조회</b></h1>
<form style = "display: flex; align-items:center; justify-content: center; text-align:center">
	<table border = "1">
		<tr>
			<td>성명</td>
			<td>생년월일</td>
			<td>나이</td>
			<td>성별</td>
			<td>후보번호</td>
			<td>투표번호</td>
			<td>유권자확인</td>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			try {
				String sql = "SELECT V_NAME, V_JUMIN, M_NO, V_TIME, V_CONFIRM FROM TBL_VOTE_202005 WHERE V_AREA = '제1투표장'";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					String check = rs.getString(5);
					String final_check;
					
					switch(check) {
						case "N":
							final_check = "미확인";
							break;
						case "Y":
							final_check = "확인";
							break;
						default: 
							final_check = "오류";
							break;
					}
					
					%>
					<tr>
						<td> <%=rs.getString(1) %> </td>
						<td>19<%=rs.getString(2).substring(0,2)+"년"+rs.getString(2).substring(2,4)+"월"+rs.getString(2).substring(4,6)+"일생"%></td>
						<td>만 <%=2020-Integer.parseInt("19"+rs.getString(2).substring(0,2)) %>세</td>
						<td><%if((rs.getString(2).substring(6,7)).equals("1"))out.println("남자");else if((rs.getString(2).substring(6,7)).equals("2"))out.println("여자");%></td>
						<td> <%=rs.getString(3) %> </td>
						<td><%=rs.getString(4).substring(0,2)+":"+rs.getString(4).substring(2,4) %></td>
						<td> <%=final_check %> </td>
					</tr>
					<% 
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>