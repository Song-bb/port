<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
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
                    <tr>
                        <td><a href='javascript:void(0);' onclick="sendValue();" id="${ dto.order_number }">${ dto.order_number }</a></td>
                        <td><a href="/personal_question_write?order_number=${ dto.order_number }">${ dto.date }</a></td>
                        <td><a href="/personal_question_write?order_number=${ dto.order_number }">${ dto.item_text }</a></td>
                        <td><a href="/personal_question_write?order_number=${ dto.order_number }">${ dto.count }</a></td>
                        <td><a href="/personal_question_write?order_number=${ dto.order_number }">${ dto.price_actual } 원</a></td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
	
</body>
</html>