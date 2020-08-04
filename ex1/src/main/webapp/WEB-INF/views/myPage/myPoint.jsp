<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 적립금 -->

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
                    <a href="/myPoint"><span class="myPage_main_profile2_1"><%= session.getAttribute("user_point") %></span><span class="myPage_main_profile2_1"> 원 </span>></a><br>
                    <br>
                </div>
            </div>  
        </div>
        <div id="page_wrap">
                <div class="servicePage_left">
                    <div class="servicePage_title">마이과장</div>
                    <div class="servicePage_side_table_div">
                        <table class="servicePage_side_table">
                            <tr>
                                <td><a href="/myPage_main"><div>주문 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myRegularorder"><div>정기배송 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myCart"><div>장바구니<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myReview"><div>상품후기<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td class="selected_page_td"><a href="/myPoint"><div>적립금<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/updateInform"><div>개인정보수정<span>></span></div></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="servicePage_side_btn_div">
                        <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
                    </div>
                </div>
                 <div id="point_wrap">
			        <div id="point_header">
			            <h2>적립금</h2>
			            <p>보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</p>
			        </div>
			        <div id="point_body">
			            <div id="point_result">
			                <div id="point_1">현재 적립금 : 1,000원</div>
			                <div id="point_2">소멸 예정 적립금 : 1,000원</div>
			            </div>
			            <div id="point_table_div">
			                <table id="point_table">
			                    <tr class="point_table_tr">
			                        <td class="point_table_td">날짜</td>
			                        <td class="point_table_td">내용</td>
			                        <td class="point_table_td">유효기간</td>
			                        <td class="point_table_td">금액</td>
			                    </tr>
			                    <tr class="point_table_tr">
			                        <td class="point_table_td">2020-07-03</td>
			                        <td class="point_table_td point_table_td_content">
			                            상품명 : 알찬사과 200g 외<br>
			                            주문번호 : 202007020001<br>
			                            주문금액 : 13,900 원 * 등급혜택 3% 적립
			                        </td>
			                        <td class="point_table_td">2021-07-03</td>
			                        <td class="point_table_td">417 원</td>
			                    </tr>
			                </table>
			            </div>
			        </div>
			    </div>  
           </div> <!-- page_wrap -->
      </div>
	
	
	
	
	
	<c:import url="../footer.jsp"></c:import>