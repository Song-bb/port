<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
		 #withdraw_member_wrap {
		     width: 480px;
		     height: 430px;
		     padding: 20px;
		 }
		 #withdraw_member_title {
		     margin-bottom: 10px;
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
            <form action="" method="post">
                <table id="withdraw_member_memberTable">
                    <tr>
                        <th>아이디</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>회원등급</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>구매금액</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>적립금</th>
                        <td class="withdraw_member_memberTable_td"></td>
                    </tr>
                </table>
                <div id="withdraw_member_check">
                    해당 회원을 탈퇴 시키시겠습니까?
                </div>
                <div id="withdraw_member_div">
                    <button type="submit">확인</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
		$(document).ready(function(){
		     alert("탈퇴하실 회원을 선택해주세요.");
		});
	</script>

</body>
</html>