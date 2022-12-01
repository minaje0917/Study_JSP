<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vote</title>
</head>
<body>
<script type="text/javascript" src = "check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section style = "position:fixed; top: 70px; width:100%; height: 100%; left:0px;background: lightgray">
<h1 style = "text-align: center"><b>투표하기</b></h1>
<form action = "action.jsp" name = "frm" style = "display : flex; align-items: center; justify-content: center">
	<table border = "1">
		<tr>
			<td style = "text-align:center">주민번호</td>
			<td><input type = "text" name = "jumin"> 예 : 8906153154726 </td>
		</tr>
		
		<tr>
			<td style = "text-align:center">성명</td>
			<td><input type = "text" name = "name"></td>
		</tr>
		
		<tr>
			<td style = "text-align:center">후보번호</td>
			<td>
				<select name = "num">
					<option value = ""> 후보번호 </option>
					<option value = "김후보"> [1] 김후보 </option>
					<option value = "이후보"> [2] 이후보 </option>
					<option value = "박후보"> [3] 박후보 </option>
					<option value = "조후보"> [4] 조후보 </option>
					<option value = "최후보"> [5] 최후보 </option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td style = "text-align:center">투표시간</td>
			<td><input type = "text" name = "time"></td>
		</tr>
		
		<tr>
			<td style = "text-align:center">투표장소</td>
			<td><input type = "text" name = "place"></td>
		</tr>
		
		<tr>
			<td style = "text-align:center">유권자확인</td>
			<td>
				<input type = "radio" name = "check" value = "확인">확인
				<input type = "radio" name = "check" value = "미확인">미확인
			</td>
		</tr>
		<tr style = "text-align:center">
			<td colspan = "2">
				<input type = "button" value = "투표하기" onclick = "vote()"> &nbsp;
				<input type = "button" value = "다시하기" onclick = "res()">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>