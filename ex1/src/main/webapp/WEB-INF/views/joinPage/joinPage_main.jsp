<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 회원가입페이지 -->


	<c:import url="../header.jsp"></c:import>
	
    <div id="join_wrap">
        <div id="join_header">
            <h1>회원가입하기</h1>
        </div>
        <div id="join_body">
        	<form action="/join_ok" method="post">
            <p>
                <div id="join_form">
                        <table id="join_form_table">
                        	<tr>
                               <th id="join_select_infomation">*는 필수입력사항</th>
                            </tr>
                            <tr>
                               <th>*아이디 </th>
                               <td>
                               		<div><input type="text" name="user_id" placeholder="아이디" required class="input_text" id="user_id_1"></div>
                               		<div id="result_check_id"></div>
                               </td>
                            </tr>
                            <tr>
                                <th>*비밀번호 </th>
                                <td><input type="password" name="user_pw" placeholder="비밀번호" required class="input_text" id="user_pw_1"></td>
                            </tr>
                            <tr>
                                <th>*비밀번호 확인</th>
                                <td>
                                	<div><input type="password" name="user_pw_ok" placeholder="비밀번호 확인" required class="input_text" id="user_pw_2"></div>
                                	<div id="result_check_pw"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>*이메일</th>
                                <td>
                                	<div><input type="email" name="email" placeholder="이메일" required class="input_text" id="user_email_1"></div>
                                	<div id="result_check_email"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>*이름 </th>
                                <td><input type="text" name="user_name" placeholder="이름" required class="input_text"></td>
                            </tr>
                            <tr>
                                <th>*휴대폰 </th>
                                <td>
                                	<div><input type="text" name="phone" placeholder="전화번호(숫자만 입력하세요)" required class="input_text" onkeydown="javascript:return inputOnlyNum(event);"></div>
                                	<div id="result_check_phone"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>*주소 </th>
                                <td class="join_address">
                                	<input type="text" class="input_text_2" id="sample6_postcode" placeholder="우편번호" name="postcode" required>
									<input type="button" id="address_button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" class="input_text" id="sample6_address" placeholder="주소" name="main_address" required><br>
									<input type="text" class="input_text_2" id="sample6_detailAddress" placeholder="상세주소" name ="detail_address">
									<input type="text" class="input_text_2" id="sample6_extraAddress" placeholder="상세주소" name="detail_address2">
                                </td>
                            </tr>
                            <tr>
                                <th>성별 </th>
                                <td>
                                    <label name="gender_select"><input type="radio" name="gender_select" value="male" class="join_radio">남자 </label>
                                    <label name="gender_select"><input type="radio" name="gender_select" value="female" class="join_radio">여자</label>
                                    <label name="gender_select"><input type="radio" name="gender_select" value="null" class="join_radio">선택 안함</label>
                                </td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td><input type="date" name="user_birth" max="9999.12.31" class="input_text"></td>
                            </tr>
                        </table>
                </div>
            </p>
            <div id="join_service_check">
                <h3>이용약관 동의</h3>
                <div id="join_service_box">
                    <input type="checkbox" name="service" class="service_box" value="1" required="required">서비스이용약관동의(필수) <label><a href="#">약관보기 ></a></label> <br>
                    <input type="checkbox" name="service" class="service_box" value="2"  required="required">개인정보처리방침동의(필수) <label><a href="#">약관보기 ></a></label> <br>
                    <input type="checkbox" name="service" class="service_box" value="3"  required="required">개인정보처리위탁동의(필수) <label><a href="#">약관보기 ></a></label> <br>
                    <input type="checkbox" name="service" class="service_box" value="4" >마케팅정보제공동의(선택) <label><a href="#">약관보기 ></a></label> <br>
                </div>
            </div>
            <div id="join_btn">
                <button type="submit" id="join_btn_1">회원 가입</button>
                <button type="reset" id="join_btn_2">취소</button>
            </div>
            </form>
        </div>
    </div>
    
    <c:import url="../footer.jsp"></c:import>
    
	
<script>
	var button_joinus = $("#join_btn_1");

	$("#user_id_1").blur(function(){
		var user_id = $("#user_id_1").val();
		$.ajax({
			url : '/duplication_check_id?user_id='+user_id,
			type : 'get',
			success : function(data) {
				if( data == 1){ // 중복이면
					$("#result_check_id").text("이미 사용중인 아이디 입니다.");
					$("#result_check_id").css("color", "red");
					$('#join_btn_1').attr('disabled',true);
				} else { // 중복이 아니면
					$("#result_check_id").text("사용 가능한 아이디 입니다.");
					$("#result_check_id").css("color", "green");
					$('#join_btn_1').attr('disabled',false);
				}
			}, error : function(){
				history.go(-1);
			}
		});
	});

	$("#user_pw_2").blur(function(){
		if( $("#user_pw_2").val() == $("#user_pw_1").val() ){
			$("#result_check_pw").text("비밀번호가 일치합니다.");
			$("#result_check_pw").css("color", "green");
			$('#join_btn_1').attr('disabled',false);
		} else {
			$("#result_check_pw").text("비밀번호가 일치하지 않습니다.");
			$("#result_check_pw").css("color", "red");
			$('#join_btn_1').attr('disabled',true);
		}
	});

	$("#user_email_1").blur(function(){
		var user_email = $("#user_email_1").val();
		$.ajax({
			url : '/duplication_check_email?user_email='+user_email,
			type : 'get',
			success : function(data) {
				if( data == 1){ // 중복이면
					$("#result_check_email").text("이미 사용중인 이메일 입니다.");
					$("#result_check_email").css("color", "red");
					$('#join_btn_1').attr('disabled',true);
				} else { // 중복이 아니면
					$("#result_check_email").text("사용 가능한 이메일 입니다.");
					$("#result_check_email").css("color", "green");
					$('#join_btn_1').attr('disabled',false);
				}
			}, error : function(){
				history.go(-1);
			}
		});
	});

	function inputOnlyNum(event){ 
		var acode = event.keyCode; 
		if(acode == 37 || acode == 39 || acode == 8 || acode == 127 || acode == 9 || (acode>47 && acode<58) || (acode>95 && acode<106)) { 
			return true; //숫자만가능
		} else { 
			return false; //숫자가 아닐때 작성이 안됨 
		} 
	}


</script>	