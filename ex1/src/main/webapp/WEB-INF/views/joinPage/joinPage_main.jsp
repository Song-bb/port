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
                               <td><input type="text" name="user_id" placeholder="아이디" required class="input_text"><a href="/duplication_check_id"><button type="button" id="id_button">중복 확인</button></a></td>
                            </tr>
                            <tr>
                                <th>*비밀번호 </th>
                                <td><input type="password" name="user_pw" placeholder="비밀번호" required class="input_text"></td>
                            </tr>
                            <tr>
                                <th>*비밀번호 확인</th>
                                <td><input type="password" name="user_pw_ok" placeholder="비밀번호 확인" required class="input_text"></td>
                            </tr>
                            <tr>
                                <th>*이메일</th>
                                <td><input type="email" name="email" placeholder="이메일" required class="input_text"><button type="submit" id="email_button">중복 확인</button></td>
                            </tr>
                            <tr>
                                <th>*이름 </th>
                                <td><input type="text" name="user_name" placeholder="이름" required class="input_text"></td>
                            </tr>
                            <tr>
                                <th>*휴대폰 </th>
                                <td><input type="text" name="phone" placeholder="전화번호(숫자만 입력하세요)" required class="input_text"></td>
                            </tr>
                            <tr>
                                <th>*주소 </th>
                                <td class="join_address">
                                	<input type="text" class="input_text_2" id="sample6_postcode" placeholder="우편번호" name="postcode">
									<input type="button" id="address_button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" class="input_text" id="sample6_address" placeholder="주소" name="main_address"><br>
									<input type="text" class="input_text_2" id="sample6_detailAddress" placeholder="상세주소" name ="detail_address">
									<input type="text" class="input_text_2" id="sample6_extraAddress" placeholder="참고항목" name="detail_address2">
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
	function duplication_check_Pop() {
		window.open(
				"duplication_check_id", "a", 
				"width=600, height=800, left=200, top=0"
			); 
	}

</script>
	
	
	