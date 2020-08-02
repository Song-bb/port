<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택회원 적립금 변경하기</title>
</head>
	<style>
		 #withdraw_member_wrap {
		     width: 480px;
		     height: 430px;
		 }
		 #withdraw_member_title {
		     margin-bottom: 10px;
		     padding-left: 5px;
		 }
		 #withdraw_member_memberForm {
		     width: 480px;
		     height: 350px;
		 }
		 #withdraw_member_memberTable {
		     width: 100%;
		     height: 100%;
		     border-top: 2px solid #459356;
		     border-bottom: 2px solid #459356;
		     border-collapse: collapse;
		 }
		 #withdraw_member_memberTable th {
		     width: 120px;
		     border-bottom: 1px solid rgba(179, 178, 178, 0.507);
		     background-color: #4593561a;
		     padding: 5px;
		     font-size: 13px;
		 }
		 #withdraw_member_memberTable td {
		     border-bottom: 1px solid rgba(179, 178, 178, 0.507);
		     padding: 5px 5px 5px 10px;
		     font-size: 13px;
		 }
		 .withdraw_member_memberTable_td {
		     border-bottom: none;;
		 }
		 #withdraw_member_check {
		     text-align: center;
		     margin-top: 20px;
		     font-size: 14px;
		 }
		 #withdraw_member_div {
		     text-align: center;
		     margin-top: 10px;
		
		 }
	</style>
<body>

	<div id="withdraw_member_wrap">
        <div id="withdraw_member_title">
            <h3>회원 적립금 수정</h3>
        </div>
        <div id="withdraw_member_memberForm">
            <table id="withdraw_member_memberTable">
                <c:forEach items="${ withdraw_member_select }" var="dto">
                <c:set var = "string1" value = "${ dto.join_date }"/>
                <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
                <tr>
                    <th>아이디</th>
                    <td>${ dto.user_id }</td>
                    <input type="hidden" id="user_index" value="${ dto.user_index }">
                </tr>
                <tr>
                    <th>이름</th>
                    <td>${ dto.user_name }</td>
                </tr>
                <tr>
                    <th>가입일</th>
                    <td>${ string2 }</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${ dto.user_email }</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>${ dto.user_phone }</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>${ dto.user_address }</td>
                </tr>
                <tr>
                    <th>회원등급</th>
                    <td>${ dto.user_grade }</td>
                </tr>
                <tr>
                    <th>구매금액</th>
                    <td>${ dto.buying_price }</td>
                </tr>
                <tr>
                    <th>현재 적립금</th>
                    <td>${ dto.user_point }</td>
                    <input type="hidden" id="current_point" value="${ dto.user_point }">
                </tr>
                <tr>
                    <th>추가/삭감할 적립금</th>
                    <td><input type="text" id="add_point" onblur="add_point()"></td>
                </tr>
                <tr>
                    <th>변경 후 적립금</th>
                    <td><div id="amend_point"></div></td>
                </tr>
                </c:forEach>
            </table>
            <div id="withdraw_member_check">
                해당 회원의 포인트를 추가/삭감하시겠습니까?
            </div>
            <div id="withdraw_member_div">
                <button type="button" onclick="member_point_ok()">확인</button>
            </div>
        </div>
    </div>
    
    <script>
    function add_point(){
		var before_user_point = document.getElementById('current_point').value;
		var after_user_point = document.getElementById('add_point').value;
		var new_point = parseInt(before_user_point) + parseInt(after_user_point);
		document.getElementById("amend_point").innerHTML = numberWithCommas(new_point);
    }
    
    function member_point_ok() {
		var user_index = document.getElementById('user_index').value;
		var point = removeComma(document.getElementById('amend_point').innerText);
        var url = "/member_point_ok?user_index=" + user_index + "&point=" + point;
 		alert( url );
        /*opener.document.location.href=url;
		window.close();*/
	}
    
    function removeComma(str) {
		n = parseInt(str.replace(/,/g,""));
		return n;
	}

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    </script>
    
    
</body>
</html>