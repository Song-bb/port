<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="css/myPage-select_order.css">

</head>
<body>

    <div id="select_order_num_wrap">
        <div id="select_order_num_div">
            <div id="select_order_num_head">
                <img src="img/problem.png"> 문의하실 주문번호를 선택하세요.
            </div>
            <div id="select_order_num_head_right">
                <a href='javascript:window.close();'><div><img src="img/close.png"></div><div>close</div></a>
            </div>
            <div id="clear_div"></div>
            <div id="select_order_num_body">
                <table id="select_order_num_table">
                    <tr>
                        <th>주문번호</th>
                        <th>주문일자</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>주문금액</th>
                    </tr>
                    <c:forEach items="${ order_number }" var="dto">
                    <c:set var = "string1" value = "${ dto.date }"/>
                    <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
                    <tr>
                        <td><a href='javascript:close_select_pop();'>${ dto.order_number }</a></td>
                        <td><a href='javascript:close_select_pop();'>${ string2 }</a></td>
                        <td><a href='javascript:close_select_pop();'>${ dto.item_name1 }</a></td>
                        <td><a href='javascript:close_select_pop();'>${ dto.item_count1 }</a></td>
                        <td><a href='javascript:close_select_pop();'>${ dto.result_total_price } 원</a></td>
                        <input type="hidden" id="order_number" value="${ dto.order_number }">
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
	
</body>
</html>

<script>
	function close_select_pop() {
		data = document.getElementById("order_number").value;
		opener.location.href = "/personal_question_write?order_number="+data;
		window.close();
	}
</script>