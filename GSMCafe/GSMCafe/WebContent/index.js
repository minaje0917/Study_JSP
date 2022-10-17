function check(){
	if(document.frm.cust_no.value.length == 0){
		alert("고객번호가 입력되지 않았습니다.");
		frm.cust_no.focus();
		return false;
	}
	if(document.frm.cust_name.value.length == 0){
		alert("고객이름이 입력되지 않았습니다.");
		frm.cust_name.focus();
		return false;
	}
	if(document.frm.menu_no.value.length == 0){
		alert("메뉴 번호가 선택되지 않았습니다.");
		return false;
	}
	if(document.frm.order_date.value.length == 0){
		alert("고객번호가 입력되지 않았습니다.");
		frm.order_date.focus();
		return false;
	}
	succss()
	return true;
}	
function succss(){
	alert("------주문 완료------")
}

function clear12(){
	alert("-----처음부터 다시 시작-----")
	return true;
}

function move(){
	window.location = 'orderlist.jsp'
	return true;
}

function modify(){
	alert("-----수정 완료-----");
	window.location = 'orderlist.jsp';
	return true;
}