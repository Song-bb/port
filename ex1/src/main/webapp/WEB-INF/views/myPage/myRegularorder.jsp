<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 정기배송내역 -->


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
                    <a href="/myPoint"><span class="myPage_main_profile2_1"><fmt:formatNumber value="${ user_point }" pattern="###,###,###" /></span><span class="myPage_main_profile2_1"> 원 </span>></a><br>
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
                                <td><a href="/myPage_main?page=1"><div>주문 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td class="selected_page_td"><a href="/myRegularorder"><div>정기배송 내역<span>></span></div></a></td>
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
			                    <c:forEach items="${ regular_order_list }" var="dto">
				                    <tr class="delivery_search_body_table_tr">
				                        <td class="delivery_search_body_table_td delivery_search_number">${ dto.order_number }</td>
				                        <td class="delivery_search_body_table_td delivery_search_content">${ dto.item_name }</td>
				                        <td class="delivery_search_body_table_td delivery_search_price"><fmt:formatNumber value="${ dto.item_price }" pattern="###,###,###" />원</td>
				                        <td class="delivery_search_body_table_td delivery_search_month">매월 ${ dto.week }일</td>
				                        <td class="delivery_search_body_table_td delivery_search_start_end">${ dto.start_date }<br>/${ dto.last_date }</td>
				                        <td class="delivery_search_body_table_td delivery_search_select"><button>취소</button></td>
				                    </tr>
			                    </c:forEach>
			                </table>
			            </div>
			        </div>
			    </div><!-- delivery_search_wrap -->
            </div><!-- pageWrap -->
            <div id="servicePage_main_end"></div>
        </div><!-- pageWrap super -->
    </div><!-- page_wrap1 -->
	
	<c:import url="../footer.jsp"></c:import>