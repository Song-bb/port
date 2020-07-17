<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 회원탈퇴 -->

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
                        <a href="" class="myPage_main_profile1_gradle2_2">다음 달 예상등급 보기</a>
                    </div>
                </div>
                <div class="myPage_main_profile2">
                    적립금<br>
                    <br>
                    <a href="/myPoint"><span class="myPage_main_profile2_1"><%= session.getAttribute("user_point") %></span><span class="myPage_main_profile2_1"> 원 </span>></a><br>
                    <br>
                    <a href="/myPoint"><span class="myPage_main_profile2_2">소멸예정 : <span>0</span> 원</span></a>
                </div>
            </div>  
        </div>
        <div id="page_wrap">
        <div class="servicePage_left">
            <div class="servicePage_title">마이과장</div>
	           <div class="servicePage_side_table_div">
	               <table class="servicePage_side_table">
	                   <tr>
	                       <td><a href=""><div>주문 내역<span>></span></div></a></td>
	                   </tr>
	                   <tr>
	                       <td><a href=""><div>정기배송 내역<span>></span></div></a></td>
	                   </tr>
	                   <tr>
	                       <td><a href=""><div>장바구니<span>></span></div></a></td>
	                   </tr>
	                   <tr>
	                       <td><a href="/myReview"><div>상품후기<span>></span></div></a></td>
	                   </tr>
	                   <tr>
	                       <td><a href="/myPoint"><div>적립금<span>></span></div></a></td>
	                   </tr>
	                   <tr>
	                       <td class="selected_page_td"><a href="/updateInform"><div>개인정보수정<span>></span></div></a></td>
	                   </tr>
	               </table>
	           </div>
	           <div class="servicePage_side_btn_div">
	               <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
	           </div>
	       </div>
		    <div id="delete_user_wrap">
		        <div id="delete_user_header">
		            <h2>회원탈퇴</h2>
		        </div>
		        <div id="delete_user_body">
		            <div id="delete_user_body_1">
		                회원탈퇴안내
		            </div>
		            <div id="delete_user_body_2">
		                고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다.<br>
		                불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br>
		                <br>
		                ■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다<br>
		               1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에 따라 관리됩니다.<br>
		               2. 탈퇴 시 고긱냄께서 보유하셨던 적립금은 삭제됩니다.<br>
		               3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.
		            </div>
		        </div>
		        <div id="delete_user_foot">
		            <div id="delete_user_foot_header">
		                <h3>회원탈퇴하기</h3>
		            </div>
		            <div id="delete_user_foot_body">
		                <table id="delete_user_foot_body_table">
		                    <tr class="delete_user_foot_body_table_tr_1">
		                        <td class="delete_user_foot_body_table_td_1">비밀번호가 어떻게 되시나요?</td>
		                        <td class="delete_user_foot_body_table_td_2"><input type="text" name="user_pw" required></td>
		                    </tr>
		                    <tr class="delete_user_foot_body_table_tr">
		                        <td class="delete_user_foot_body_table_td_1">어떤 점이 불편하셨나요?</td>
		                        <td class="delete_user_foot_body_table_td_2">
		                            <input type="checkbox">고객서비스(상담,포장 등) 불만
		                            <input type="checkbox">배송불만
		                            <input type="checkbox">교환/환불/반품 불만 <br>
		                            <input type="checkbox">방문 빈도가 낮음
		                            <input type="checkbox">상품가격 불만
		                            <input type="checkbox">개인 정보유출 우려   <br>
		                            <input type="checkbox">쇼핑몰의 신뢰도 불만
		                            <input type="checkbox">쇼핑 기능 불만
		                        </td>
		                    </tr>
		                    <tr class="delete_user_foot_body_table_tr">
		                        <td class="delete_user_foot_body_table_td_1">고객님의 진심어린 충고<br>부탁드립니다.</td>
		                        <td class="delete_user_foot_body_table_td_2"><textarea name="delete_content" id="" cols="70" rows="5"></textarea>
		                        </td>
		                    </tr>
		                </table>
		                <div id="delete_user_foot_body_btn">
		                    <button id="delete_user_foot_body_btn_1"><a href="/myPage_main" style="color: #459356;">취소</a></button>
		                    <button>탈퇴</button>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
	<c:import url="../footer.jsp"></c:import>