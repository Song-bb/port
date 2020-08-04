<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 비밀번호 재확인 -->

	<c:import url="../header.jsp"></c:import>
	
	
	<div id="page_wrap1">
	    <div class="myPage_main_profile">
	        <div class="myPage_main_profile_1">
	            <div class="myPage_main_profile1">
	                <div class="myPage_main_profile1_gradle">
	                    <div class="myPage_main_profile1_gradle_icon"><%= session.getAttribute("user_grade") %></div>
	                    <div class="myPage_main_profile1_gradle_text1">
	                        <strong><%= session.getAttribute("user_name") %> </strong>님<br>
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
	                <a href="/myPoint">
	                	<% String user_id = session.getAttribute("user_point").toString(); %>
	                	<span class="myPage_main_profile2_1"><%= session.getAttribute("user_point") %></span>
	                    <span class="myPage_main_profile2_1"> 원 </span>></a><br>
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
	                            <td class="selected_page_td"><a href="/updateInform">
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
	                    <h2>비밀번호 재확인</h2>
	                </div>
	                <form action="check_password_ok" method="post">
	                    <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id") %>">
	                    <div id="update_form">
	                        <table id="update_form_table">
	                            <tr>
	                                <td colspan="2">비밀번호를 다시 입력해주세요.</td>
	                            </tr>
	                            <tr>
	                                <th>비밀번호 </th>
	                                <td><input type="password" name="user_pw" placeholder="비밀번호" class="input_text"></td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div id="update_btn">
	                        <button type="submit" id="update_btn_1">확인</button>
	                        <button type="reset" id="update_btn_2">취소</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
		
	<c:import url="../footer.jsp"></c:import>
	
<script>
$(document).ready(function(){
     alert("비밀번호를 다시 확인해주세요.");
});
</script>