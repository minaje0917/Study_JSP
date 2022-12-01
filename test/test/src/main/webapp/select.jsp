<%@include file = "db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style = "position:fixed; top: 70px; width:100%; height: 100%; left:0px;background: lightgray">
<h1 style = "text-align: center"><b>후보조회</b></h1>
<form style = "display: flex; align-items:center; justify-content: center; text-align:center">
	<table border = "1">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>소속정당</td>
			<td>학력</td>
			<td>주민번호</td>
			<td>지역구</td>
			<td>대표전화</td>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			try {
				String sql = "SELECT M_NO, M_NAME, P_NAME, P_SCHOOL, M_JUMIN, M_CITY, P_TEL1,P_TEL2,P_TEL3 FROM TBL_MEMBER_202005 TM, TBL_PARTY_202005 TP WHERE TM.P_CODE = TP.P_CODE";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					int grade = rs.getInt(4);
					String final_grade;
					if (grade == 1){
						final_grade = "고졸";
					} else if (grade == 2) {
						final_grade = "학사";
					}
					else if (grade == 3) {
						final_grade = "박사";
					}
					else if (grade == 4) {
						final_grade = "석사";
					}
					else {
						final_grade = "오류";
					}
					
					String num = rs.getString(5);
					String number = num.substring(0,6) + "-" + num.substring(6,13);
					
					%>
					<tr>
						<td> <%=rs.getString(1) %> </td>
						<td> <%=rs.getString(2) %> </td>
						<td> <%=rs.getString(3) %> </td>
						<td> <%=final_grade %> </td>
						<td> <%=number %> </td>
						<td> <%=rs.getString(6) %> </td>
						<td> <%=rs.getString(7)%>-<%=rs.getString(8)%>-<%=rs.getString(9)%> </td>
					</tr>
					<% 
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>