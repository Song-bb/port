<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택회원 탈퇴</title>
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
            <h3>회원탈퇴</h3>
        </div>
        <div id="withdraw_member_memberForm">
            <table id="withdraw_member_memberTable">
                <c:forEach items="${ withdraw_member_select }" var="dto">
                <c:set var = "string1" value = "${ dto.join_date }"/>
                <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
                <tr>
                    <th>아이디</th>
                    <td>${ dto.user_id }</td>
                    <input type="hidden" id="user_id" value="${ dto.user_id }">
                    <input type="hidden" id="reason" value="운영자 임의탈퇴">
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
                    <th>적립금</th>
                    <td class="withdraw_member_memberTable_td">${ dto.user_id }</td>
                </tr>
                <tr>
                    <th>탈퇴사유</th>
                    <td><textarea id="delete_content" cols="50" rows="5"></textarea></td>
                </tr>
                </c:forEach>
            </table>
            <div id="withdraw_member_check">
                해당 회원을 탈퇴 시키시겠습니까?
            </div>
            <div id="withdraw_member_div">
                <button type="button" onclick="withdraw_member_ok()">확인</button>
            </div>
        </div>
    </div>
    
    <script>
	function withdraw_member_ok() { 
		var user_id = document.getElementsById('user_id').value;
		var reason = document.getElementsById('reason').value;
		var delete_content = document.getElementsById('delete_content').value;
		alert( user_id + reason + delete_content);
        var url = "/withdraw_member_ok?user_id=" + user_id + "&reason=" + reason + "&delete_content=" + delete_content;
        alert( url) ;
/* 		opener.document.location.href=url;
		window.close(); */
	}
    </script>
    
    
</body>
</html>