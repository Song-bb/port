<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 정기배송내역 -->


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
        <div>
            <div id="page_wrap">
                <div class="servicePage_left">
                    <div class="servicePage_title">마이과장</div>
                    <div class="servicePage_side_table_div">
                        <table class="servicePage_side_table">
                            <tr>
                                <td class="selected_page_td"><a href="/myPage_main"><div>주문 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href=""><div>정기배송 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myCart"><div>장바구니<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myReview"><div>상품후기<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myPoint"><div>적립금<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/check_password"><div>개인정보수정<span>></span></div></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="servicePage_side_btn_div">
                        <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
                    </div>
                </div>
			    <div id="delivery_search_wrap">
			        <div id="delivery_search_header">
			            <div>
			                <h2>정기배송 내역</h2>
			            </div>
			        </div>
			        <div id="delivery_search_body">
			            <div id="delivery_search_body_table_div">
			                <table id="delivery_search_body_table">
			                    <tr class="delivery_search_body_table_tr">
			                        <td class="delivery_search_body_table_td delivery_search_number">주문번호</td>
			                        <td class="delivery_search_body_table_td delivery_search_content">상품명</td>
			                        <td class="delivery_search_body_table_td delivery_search_price">상품금액</td>
			                        <td class="delivery_search_body_table_td delivery_search_month">배송주기</td>
			                        <td class="delivery_search_body_table_td delivery_search_start_end">시작날짜<br>/만료날짜</td>
			                        <td class="delivery_search_body_table_td delivery_search_select">구독 취소</td>
			                    </tr>
			                    <tr class="delivery_search_body_table_tr">
			                        <td class="delivery_search_body_table_td delivery_search_number">202007160001</td>
			                        <td class="delivery_search_body_table_td delivery_search_content">정기배송 패키지1</td>
			                        <td class="delivery_search_body_table_td delivery_search_price">45,000</td>
			                        <td class="delivery_search_body_table_td delivery_search_month">1주</td>
			                        <td class="delivery_search_body_table_td delivery_search_start_end">2020-07-16<br>/2020-08-13</td>
			                        <td class="delivery_search_body_table_td delivery_search_select"><button>취소</button></td>
			                    </tr>
			                    <tr class="delivery_search_body_table_tr">
			                        <td class="delivery_search_body_table_td delivery_search_number">202007160002</td>
			                        <td class="delivery_search_body_table_td delivery_search_content">정기배송 패키지2</td>
			                        <td class="delivery_search_body_table_td delivery_search_price">65,000</td>
			                        <td class="delivery_search_body_table_td delivery_search_month">2주</td>
			                        <td class="delivery_search_body_table_td delivery_search_start_end">2020-07-16<br>/2020-09-17</td>
			                        <td class="delivery_search_body_table_td delivery_search_select"><button>취소</button></td>
			                    </tr>
			                    <tr class="delivery_search_body_table_tr">
			                        <td class="delivery_search_body_table_td delivery_search_number">202007160003</td>
			                        <td class="delivery_search_body_table_td delivery_search_content">정기배송 패키지3</td>
			                        <td class="delivery_search_body_table_td delivery_search_price">95,000</td>
			                        <td class="delivery_search_body_table_td delivery_search_month">4주</td>
			                        <td class="delivery_search_body_table_td delivery_search_start_end">2020-07-16<br>/2020-11-19</td>
			                        <td class="delivery_search_body_table_td delivery_search_select"><button>취소</button></td>
			                    </tr>
			                </table>
			            </div>
			        </div>
			    </div><!-- delivery_search_wrap -->
            </div><!-- pageWrap -->
            <div id="servicePage_main_end"></div>
        </div><!-- pageWrap super -->
    </div><!-- page_wrap1 -->
	
	<c:import url="../footer.jsp"></c:import>