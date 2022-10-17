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
 	<script type="text/javascript" src ="index.js"></script>
	<jsp:include page="heade.jsp"></jsp:include>
	<section style ="position:fixed;width:100%;top:90px;height:100%; background-color: gray; left:0">
		<h2 style = "text-align:center">카페 메뉴 주문하기</h2>
		<form name = "frm" method="post" action="action.jsp" style = "display:flex; justify-content: center; align-items: center">
				<input type = "hidden" value="insert" name = "mode">
		
			<table border ="1">
			<%
			String orderno = "";
			try{
				Connection con = Util.getConnection();
				String sql = "select max(orderno) + 1 from order_tbl";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				orderno = rs.getString(1);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			%>
				<tr>
					<td style = "text-align: center">주문번호</td><td><input type = "text" name = "order_no" readonly value=<%=orderno %>></td>
				<tr>
				<%
				%>
				<tr>
					<td style = "text-align: center">고객번호</td><td><input type = "text" name = "cust_no"></td>
				</tr>
				<tr>
					<td style = "text-align: center">고객이름</td><td><input type = "text" name = "cust_name"></td>
				</tr>
				<tr>
					<td>메뉴번호</td><td>
					<input type = "radio" name = "menu_no" value = "10001">아메리카노
					<input type = "radio" name = "menu_no" value = "10002">카페 라뗴
					<input type = "radio" name = "menu_no" value = "10003">카페 모카
					<input type = "radio" name = "menu_no" value = "10004">돌체 라뗴
					<input type = "radio" name = "menu_no" value = "10005">콜드 브루
					</td>
				</tr>
				<tr>
					<td style = "text-align: center">수량</td><td><select name = "amount">
					<option value="1">1개{추가 주문 시 선택)</option>
					<option value="2">2개{추가 주문 시 선택)</option>
					<option value="3">3개{추가 주문 시 선택)</option>
					<option value="4">4개{추가 주문 시 선택)</option>
					<option value="5">5개{추가 주문 시 선택)</option>
					<option value="6">6개{추가 주문 시 선택)</option>
					<option value="7">7개{추가 주문 시 선택)</option>
					<option value="8">8개{추가 주문 시 선택)</option>
					<option value="9">9개{추가 주문 시 선택)</option>
					<option value="10">10개</option>	
					</select></td>
				</tr>
				<tr>
					<td style = "text-align: center">주문일자</td><td><input type = "text" name = "order_date" placeholder="예)20220105"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
						<input type = "submit" value="주문하기" onclick="return check()">
						<input type = "reset" value ="다시하기" onclick="return clear12()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>