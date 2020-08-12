<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일장수 영수증</title>
</head>

    <style>
        #cashReceipt_wrap {
            width: 480px;
            margin: 0 auto;
            height: 600px;
            padding: 10px 15px;
        }
        #cashReceipt_title {
            border-bottom: 2px solid #459356;
        }
        #cashReceipt_body {
            margin-top: 10px;
        }
        #cashReceipt_table {
            border-collapse: collapse;
            width: 470px;
        }
        .cashReceipt_th {
            border: 1px solid rgba(179, 178, 178, 0.507);
            width: 100px;
            height: 40px;
            font-size: 14px;
            text-align: center;
        }
        .cashReceipt_td {
            border: 1px solid rgba(179, 178, 178, 0.507);
            width: 360px;
            height: 40px;
            font-size: 15px;
            padding-left: 10px;
        }
        .cashReceipt_th2 {
            font-size: 13px;
            color: rgb(179, 178, 178);
            border: 1px solid rgba(179, 178, 178, 0.507);
        }
        #cashReceipt_table_logo {
            height: 120px;
            margin: 10px;
        }
        #cashReceipt_logo {
            float: left;
            width: 150px;
            text-align: center;
            height: 90px;
        }
        #cashReceipt_logo img {
            width: 120px;
        }
        #cashReceipt_description {
            float: left;
            vertical-align: middle;
            height: 90px;
            padding-top: 3px;
        }
        #cashReceipt_btn {
            margin-top: 15px;
            text-align: center;
        }
        #cashReceipt_close_btn {
            width: 150px;
            height: 40px;
            background-color: #459356;
            color: #fff;
            border: none;
            font-weight: 600;
        }
        #cashReceipt_close_btn:hover {
            width: 150px;
            height: 40px;
            background-color: #fff;
            color: #459356;
            border: 1px solid #459356;
            font-weight: 600;
        }
    </style>
    
<body>
	
	<div id="cashReceipt_wrap">
        <div id="cashReceipt_title">
            <h3>구매영수증</h3>
        </div>
        <div id="cashReceipt_body">
        	<c:forEach items="${ my_order }" var="dto">
        	<c:set var = "string1" value = "${ dto.date }"/>
            <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
	            <table id="cashReceipt_table">
	                <tr>
	                    <td class="cashReceipt_th">주문번호</td>
	                    <td class="cashReceipt_td"><b>${ dto.order_number }</b></td>
	                </tr>
	                <tr>
	                    <td class="cashReceipt_th">거래일시</td>
	                    <td class="cashReceipt_td">${ string2 }</td>
	                </tr>
	                <tr>
	                    <td class="cashReceipt_th">상품명</td>
	                    <td class="cashReceipt_td">${ dto.item_name1 }</td>
	                </tr>
	                <tr>
	                    <td class="cashReceipt_th">합계</td>
	                    <td class="cashReceipt_td"><b><fmt:formatNumber value="${ dto.result_total_price }" pattern="###,###,###" /></b> 원</td>
	                </tr>
	                <tr>
	                    <td class="cashReceipt_th">회사명</td>
	                    <td class="cashReceipt_td">과일장수</td>
	                </tr>
	                <tr>
	                    <td class="cashReceipt_th">구매인</td>
	                    <td class="cashReceipt_td">${ user_id }</td>
	                </tr>
	                <tr>
	                    <td class="cashReceipt_th2" colspan="2">
	                        <p>구매 영수증은 세금계산서 등 세무상 증빙서류로 활용할 수 없으며, 거래내역 및 거래 금액을 확인하는 용도로만 사용 가능합니다.</p>
	                        <div id="cashReceipt_table_logo">
	                            <div id="cashReceipt_logo"><img src="img/logo.png"></div>
	                            <div id="cashReceipt_description">
	                                서울시 노원구 ooooo oo (대표 장 송 신)<br>
	                                <br>
	                                사업자 등록번호: ooo - oo - ooooo<br>
	                                <br>
	                                문의전화 : 070-0000-0000 / 팩스 : 000-0000-0000
	                            </div>
	                        </div>
	                    </td>
	                </tr>
	            </table>
	        </c:forEach>
            <div id="cashReceipt_btn">
                <button type="button" onclick="window.close();" id="cashReceipt_close_btn">확인</button>
            </div>
        </div>
    </div>
    
</body>
</html>