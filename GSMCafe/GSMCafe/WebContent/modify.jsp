<%@page import="com.sun.tools.classfile.Opcode.Set"%>
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
		<h2 style = "text-align:center">주문 수정하기</h2>
		<form name = "frm" method="post" action="action.jsp" style = "display:flex; justify-content: center; align-items: center">
				<input type = "hidden" value="modify" name = "mode">
		
			<table border ="1">
			<%
			request.setCharacterEncoding("utf-8");
			String orderno = request.getParameter("order_no");
			String custno = "";
			String custname = "";
			String menuno =  "";
			String amount = "";
			String orderdate = "";
			try{
				Connection con = Util.getConnection();
				String sql = "select * from order_tbl where orderno = ?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, orderno);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				custno = rs.getString(2);
				custname = rs.getString(3);
				menuno =  rs.getString(4);
				amount = rs.getString(5);
				orderdate = rs.getDate(6).toString();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			%>
				<tr>
					<td style = "text-align: center">주문번호</td><td><input type = "text" name = "order_no" readonly value=<%=orderno %>></td>
				<tr>
				
				<tr>
					<td style = "text-align: center">고객번호</td><td><input type = "text" name = "cust_no" value =<%=custno %>></td>
				</tr>
				<tr>
					<td style = "text-align: center">고객이름</td><td><input type = "text" name = "cust_name" value = <%=custname %>></td>
				</tr>
				<tr>
					<td>메뉴번호</td><td>
					<input type = "radio" name = "menu_no" value = "10001" <%if(menuno.equals("10001")) %>checked<%; %>>아메리카노
					<input type = "radio" name = "menu_no" value = "10002"<%if(menuno.equals("10002")) %>checked<%; %>>카페 라뗴
					<input type = "radio" name = "menu_no" value = "10003"<%if(menuno.equals("10003")) %>checked<%; %>>카페 모카
					<input type = "radio" name = "menu_no" value = "10004"<%if(menuno.equals("10004")) %>checked<%; %>>돌체 라뗴
					<input type = "radio" name = "menu_no" value = "10005"<%if(menuno.equals("10005")) %>checked<%; %>>콜드 브루
					</td>
				</tr>
				<tr>
					<td style = "text-align: center">수량</td><td><select name = "amount">
					<option value="1"<%if(amount.equals("1")) %>selected<%; %>>1개{추가 주문 시 선택)</option>
					<option value="2"<%if(amount.equals("2")) %>selected<%; %>>2개{추가 주문 시 선택)</option>
					<option value="3"<%if(amount.equals("3")) %>selected<%; %>>3개{추가 주문 시 선택)</option>
					<option value="4"<%if(amount.equals("4")) %>selected<%; %>>4개{추가 주문 시 선택)</option>
					<option value="5"<%if(amount.equals("5")) %>selected<%; %>>5개{추가 주문 시 선택)</option>
					<option value="6"<%if(amount.equals("6")) %>selected<%; %>>6개{추가 주문 시 선택)</option>
					<option value="7"<%if(amount.equals("7")) %>selected<%; %>>7개{추가 주문 시 선택)</option>
					<option value="8"<%if(amount.equals("8")) %>selected<%; %>>8개{추가 주문 시 선택)</option>
					<option value="9"<%if(amount.equals("9")) %>selected<%; %>>9개{추가 주문 시 선택)</option>
					<option value="10"<%if(amount.equals("10")) %>selected<%; %>>10개</option>	
					</select></td>
				</tr>
				<tr>
					<td style = "text-align: center">주문일자</td><td><input type = "text" name = "order_date" value = <%=orderdate %>></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
						<input type = "submit" value="수정하기" onclick = "return modify()">
						<input type = "button" value ="취소" onclick="return move()">
					</td>
				</tr>
				
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>