<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 개인정보수정 -->

	<c:import url="../header.jsp"></c:import>
		
	<div id="page_wrap1">
	    <div class="myPage_main_profile">
	        <div class="myPage_main_profile_1">
	            <div class="myPage_main_profile1">
	                <div class="myPage_main_profile1_gradle">
	                    <div class="myPage_main_profile1_gradle_icon">${ user_grade }</div>
	                    <div class="myPage_main_profile1_gradle_text1">
	                        <strong>${ user_name } </strong>님<br>
	                        <br>
	                        5% 적립 + 최초 1회 무료배송
	                    </div>
	                </div>
	                <div class="myPage_main_profile1_gradle2">
	                    <a href="" class="myPage_main_profile1_gradle2_1">전체등급 보기</a>
	                </div>
	            </div>
	            <div class="myPage_main_profile2">
	                적립금<br>
	                <br>
	                <a href="/myPoint"><span
	                        class="myPage_main_profile2_1"><fmt:formatNumber value="${ user_point }" pattern="###,###,###" /></span><span
	                        class="myPage_main_profile2_1"> 원 </span>></a><br>
	                <br>
	            </div>
	        </div>
	    </div>
	    <div>
	        <div id="page_wrap">
	            <div class="servicePage_left">
	                <div class="servicePage_title">마이과장</div>
	                <div class="servicePage_side_table_div">
	                    <table class="servicePage_side_table">
	                        <tr>
	                            <td><a href="/myPage_main?page=1">
	                                    <div>주문 내역<span>></span></div>
	                                </a></td>
	                        </tr>
	                        <tr>
	                            <td><a href="/myRegularorder">
	                                    <div>정기배송 내역<span>></span></div>
	                                </a></td>
	                        </tr>
	                        <tr>
	                            <td><a href="/myCart">
	                                    <div>장바구니<span>></span></div>
	                                </a></td>
	                        </tr>
	                        <tr>
	                            <td><a href="/myReview">
	                                    <div>상품후기<span>></span></div>
	                                </a></td>
	                        </tr>
	                        <tr>
	                            <td><a href="/myPoint">
	                                    <div>적립금<span>></span></div>
	                                </a></td>
	                        </tr>
	                        <tr>
	                            <td class="selected_page_td"><a href="/check_password">
	                                    <div>개인정보수정<span>></span></div>
	                                </a></td>
	                        </tr>
	                    </table>
	                </div>
	                <div class="servicePage_side_btn_div">
	                    <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
	                </div>
	            </div>
	
	            <div id="update_wrap">
	                <div id="update_title">
	                    <h2>회원정보 수정하기</h2>
	                </div>
	                
	                <form action="/update_ok" method="post">
	                    <div id="update_form">
	                    	<c:forEach items="${ member_detail }" var="dto">
		                        <table id="update_form_table">
		                            <tr>
		                            	<th>아이디 </th>
		                                <td><input type="text" value="${ dto.user_id }" name="user_id" class="input_text" readonly />
		                                </td>
		                            </tr>
		                            <tr>
		                                <th>새 비밀번호 </th>
		                                <td><input type="password" name="user_pw" placeholder="비밀번호" class="input_text"></td>
		                            </tr>
		                            <tr>
		                                <th>비밀번호 확인</th>
		                                <td><input type="password" name="user_pw_ok" placeholder="비밀번호 확인" class="input_text"></td>
		                            </tr>
		                            <tr>
		                                <th>이메일</th>
		                                <td><input type="email" name="user_email" placeholder="${ dto.user_email }" class="input_text"></td>
		                            </tr>
		                            <tr>
		                                <th>이름 </th>
		                                <td><input type="text" name="user_name" placeholder="${ dto.user_name }" class="input_text"></td>
		                            </tr>
		                            <tr>
		                                <th>휴대폰 </th>
		                                <td><input type="text" name="phone" placeholder="${ dto.user_phone }" class="input_text">
		                            </tr>
		                            <tr>
		                                <th>주소 </th>
		                                <td class="join_address">
	                                	<input type="text" class="input_text_2" name="postcode" id="sample6_postcode" placeholder="우편번호">
										<input type="button" id="address_button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" class="input_text" name="address1" id="sample6_address" placeholder="주소"><br>
										<input type="text" class="input_text_2" name="address2" id="sample6_detailAddress" placeholder="상세주소">
										<input type="text" class="input_text_2" name="address3" id="sample6_extraAddress" placeholder="참고항목">
	                                </td>
		                            </tr>
		                            <tr>
		                                <th>성별 </th>
		                                <td>
		                                   	<label name="genter_select"><input type="radio" name="gender_select" value="male" class="update_radio">남자</label>
	                                    	<label name="genter_select"><input type="radio" name="gender_select" value="female" class="update_radio">여자</label>
	                                    	<label name="genter_select"><input type="radio" name="gender_select" value="nothing" class="update_radio">선택 안함</label>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th>생년월일</th>
		                                <td><input type="date" name="user_birth" class="input_text"></td>
		                            </tr>
		                        </table>
							</c:forEach>
	                    </div>
	                    <div id="update_btn">
	                        <button type="submit" id="update_btn_1">수정</button>
	                        <a href="/myPage_main?page=1"><button type="button" id="update_btn_2">취소</button></a>
	                        <a href="/withdraw_member"><button type="button" id="update_btn_1">회원 탈퇴</button></a>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
		
	
	<c:import url="../footer.jsp"></c:import>

<script>
	$(document).ready(function(){
	     alert("회원정보가 변경되었습니다.");
	});
</script>