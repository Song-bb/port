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
            <p>
                <div id="join_form">
                    <form action="join_ok.jsp">
                        <table id="join_form_table">
                        	<tr>
                               <th id="join_select_infomation">*는 필수입력사항</th>
                            </tr>
                            <tr>
                               <th>*아이디 </th>
                               <td><input type="text" name="user_id" placeholder="아이디" required class="input_text"><button type="submit" id="id_button">중복 확인</button></td>
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
                                <td><input type="text" name="phone" placeholder="전화번호" required class="input_text"></td>
                            </tr>
                            <tr>
                                <th>*주소 </th>
                                <td><input type="text" name="address" placeholder="주소" required class="input_text"></td>
                            </tr>
                            <tr>
                                <th>성별 </th>
                                <td>
                                    <input type="radio" name="gender_select" value="male" class="join_radio">남자
                                    <input type="radio" name="gender_select" value="female" class="join_radio">여자
                                    <input type="radio" name="gender_select" value="nothing" class="join_radio">선택 안함
                                </td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td><input type="date" max="9999.12.31" class="input_text"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </p>
            <div id="join_service_check">
                <h3>이용약관 동의</h3>
                <div id="join_service_box">
                    <input type="checkbox" name="service" class="service_box">서비스이용약관동의(필수) <label><a href="">약관보기 ></a></label> <br>
                    <input type="checkbox" name="service" class="service_box">개인정보처리방침동의(필수) <label><a href="">약관보기 ></a></label> <br>
                    <input type="checkbox" name="service" class="service_box">개인정보처리위탁동의(필수) <label><a href="">약관보기 ></a></label> <br>
                    <input type="checkbox" name="service" class="service_box">마케팅정보제공동의(선택) <label><a href="">약관보기 ></a></label> <br>
                </div>
            </div>
            <div id="join_btn">
                <button type="submit" id="join_btn_1">회원 가입</button>
                <button type="reset" id="join_btn_2">취소</button>
            </div>
        </div>
    </div>
    
    <c:import url="../footer.jsp"></c:import>
    
</body>
</html>
	
	
	
	
	