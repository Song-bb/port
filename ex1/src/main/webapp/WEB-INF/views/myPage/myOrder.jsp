<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 주문상세내역 -->

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
                    <a href=""><span class="myPage_main_profile2_1"><%= session.getAttribute("user_point") %></span><span class="myPage_main_profile2_1"> 원 </span>></a><br>
                    <br>
                    <a href=""><span class="myPage_main_profile2_2">소멸예정 : <span>0</span> 원</span></a>
                </div>
            </div>  
        </div>
        <div>
            <div id="page_wrap">
                <div class="mypage_detail_left">
                    <div class="mypage_detail_title"><h3>마이과장</h3></div>
                    <div class="mypage_detail_side_table_div">
                        <table class="mypage_detail_side_table">
                            <tr>
                                <td class="selected_page_td"><a href=""><div>주문 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href=""><div>정기배송 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myCart"><div>장바구니<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href=""><div>상품후기<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href=""><div>적립금<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href=""><div>개인정보수정<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href=""><div>아이디/비밀번호 찾기<span>></span></div></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="mypage_detail_side_btn_div">
                        <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
                    </div>
                </div>
                <div class="mypage_detail_right">
                    <div class="mypage_detail_title mypage_detail_title_1"><h2>주문 / 배송 상세 정보</h2></div>
                        <div id="mypage_detail_info_div">
                            <div id="mypage_detail_info1">
                                <span>주문 일자 2020.07.13 | 주문번호 202007020001</span>
                                <div id="mypage_detail_info2">
                                    <button><a href="">주문 내역 삭제</a></button>
                                    <button><a href="">영수증 발급 내역</a></button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="detail_order_board">
                        <table class="detail_order_board_table">
                            <tr class="detail_order_board_table_tr">
                                <td class="detail_order_board_table_td detail_order_td1 detail_order_td6">주문번호</td>
                                <td class="detail_order_board_table_td detail_order_td2 detail_order_td6">상품정보</td>
                                <td class="detail_order_board_table_td detail_order_td3 detail_order_td7">구매 금액<br>(수량)</td>
                                <td class="detail_order_board_table_td detail_order_td4 detail_order_td7">구매 일자</td>
                            </tr>
                            <tr class="detail_order_board_table_tr">
                                <td class="detail_order_board_table_td detail_order_td1 detail_order_td6">2020070200001</td>
                                <td class="detail_order_board_table_td detail_order_td2">
                                    <div class="detail_order_td2_1">
                                        <a href=""><img src="http://placehold.it/120x150"></a>
                                    </div>
                                    <div class="detail_order_td2_2">
                                        <a href="">알찬사과 200g 외</a>
                                    </div>
                                </td>
                                <td class="detail_order_board_table_td detail_detail_order_td3 detail_order_td7">13,900 원<br>(1개)</td>
                                <td class="detail_detail_order_board_table_td detail_detail_order_td4 detail_order_td7">2,500 원</td>
                            </tr>
                        </table>
                    </div>
                    <div id="mypage_detail_order_info">
                        <div id="mypage_detail_order_info_header">
                            <h3>결제 정보</h3>
                            <div id="mypage_detail_order_info_header_btn">
                                <button><a href="">현금영수증 정보 확인</a></button>
                            </div>
                        </div>
                        <div id="mypage_detail_order_info_body">
                            <table id="mypage_detail_order_info_table">
                                <tr class="order_info_table_tr">
                                    <td class="order_info_table_td order_info_table_td_title">결제수단</td>
                                    <td class="order_info_table_td order_info_table_td_title"></td>
                                </tr>
                                <tr class="order_info_table_tr">
                                    <td class="order_info_table_td_1">은행명</td>
                                    <td class="order_info_table_td_2">우리은행</td>
                                </tr>
                                <tr class="order_info_table_tr">
                                    <td class="order_info_table_td_1">총 상품 가격</td>
                                    <td class="order_info_table_td_2">13,900원</td>
                                </tr>
                                <tr class="order_info_table_tr">
                                    <td class="order_info_table_td_1">할인 금액</td>
                                    <td class="order_info_table_td_2">0원</td>
                                </tr>
                                <tr class="order_info_table_tr order_info_table_tr_last">
                                    <td class="order_info_table_td_1">배송비</td>
                                    <td class="order_info_table_td_2">0원</td>
                                </tr>
                                <tr class="order_info_table_tr">
                                    <td class="order_info_table_td_1"></td>
                                    <td class="order_info_table_td_2">13,900원</td>
                                </tr>
                                <tr class="order_info_table_tr order_info_table_tr_result">
                                    <td class="order_info_table_td_1"><strong>총 결제 금액</strong></td>
                                    <td class="order_info_table_td_2"><strong>13,900원</strong></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="mypage_detail_box_info">
                        <div id="mypage_detail_box_info_header">
                            <h3>받는 사람 정보</h3>
                        </div>
                        <div id="mypage_detail_box_info_body">
                            <table id="mypage_detail_box_info_table">
                                <tr class="box_info_table_tr">
                                    <td class="box_info_table_td_1">받는 사람</td>
                                    <td class="box_info_table_td_2">장탱구</td>
                                </tr>
                                <tr class="box_info_table_tr box_info_table_tr_last">
                                    <td class="box_info_table_td_1">연락처</td>
                                    <td class="box_info_table_td_2">010-111-2222</td>
                                </tr>
                                <tr class="box_info_table_tr">
                                    <td class="box_info_table_td_1">주소</td>
                                    <td class="box_info_table_td_2">00000 경기도 의정부시 ㅇㅇ로 ㅇㅇㅇ 111동 1222호( oo동, oo아파트)</td>
                                </tr>
                                <tr class="box_info_table_tr box_info_table_tr_result">
                                    <td class="box_info_table_td_1">배송 요청 사항</td>
                                    <td class="box_info_table_td_2">직접 받고 부재 시 문 앞</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mypage_detail_main_end"></div>
        </div>
    </div>
	
	
	
	
	<c:import url="../footer.jsp"></c:import>