<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 주문상세내역 -->

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
            <div class="mypage_detail_left ">
                <div class="mypage_detail_title">
                    <h3>마이과장</h3>
                </div>
                <div class="mypage_detail_side_table_div">
                    <table class="mypage_detail_side_table">
                        <tr>
                            <td class="selected_page_td"><a href="/myPage_main?page=1">
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
                            <td><a href="/check_password">
                                    <div>개인정보수정<span>></span></div>
                                </a></td>
                        </tr>
                    </table>
                </div>
                <div class="mypage_detail_side_btn_div">
                    <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
                </div>
            </div>

            <div class="mypage_detail_right">
                <c:forEach items="${ my_order }" var="dto">
                <c:set var = "string1" value = "${ dto.date }"/>
                <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
                    <div class="mypage_detail_title mypage_detail_title_1">
                        <h2>주문 / 배송 상세 정보</h2>
                    </div>
                    <div id="mypage_detail_info_div">
                        <div id="mypage_detail_info1">
                            <span>주문 일자 ${ string2 } | 주문번호 ${ dto.order_number }</span>
                            <div id="mypage_detail_info2">
                                <button><a href='javascript:void(0);' onclick="cashReceipt_pop(${ dto.order_number });">영수증 발급 내역</a></button>
                            </div>
                        </div>

                    </div>
                    <div class="detail_order_board">
                        <table class="detail_order_board_table">
                            <tr class="detail_order_board_table_tr">
                                <td class="detail_order_board_table_td detail_order_td1 detail_order_td6">주문번호</td>
                                <td class="detail_order_board_table_td detail_order_td2 detail_order_td6">상품정보</td>
                                <td class="detail_order_board_table_td detail_order_td3 detail_order_td7">구매 금액<br>(수량)
                                </td>
                                <td class="detail_order_board_table_td detail_order_td4 detail_order_td7">구매 일자</td>
                            </tr>
                            <c:if test="${dto.item_idx1 ne 'null'}">
	                            <tr class="detail_order_board_table_tr">
	                                <td class="detail_order_board_table_td detail_order_td1 detail_order_td6">${ dto.order_number }</td>
	                                <td class="detail_order_board_table_td detail_order_td2">
	                                    <div class="detail_order_td2_1">
	                                        <a href="item_detail?idx=${ dto.item_idx1 }"><img img id="order_td2_1_img" src="${ dto.item_img1 }"></a>
	                                    </div>
	                                    <div class="detail_order_td2_2">
	                                        <a href="item_detail?idx=${ dto.item_idx1 }">${ dto.item_name1 }</a>
	                                    </div>
	                                </td>
	                                <td class="detail_order_board_table_td detail_detail_order_td3 detail_order_td7"><fmt:formatNumber value="${ dto.item_sellingPrice1 }" pattern="###,###,###" /> 원<br>(${ dto.item_count1 }개)</td>
	                                <td class="detail_detail_order_board_table_td detail_detail_order_td4 detail_order_td7 detail_order_board_table_td">${ dto.date }</td>
	                            </tr>
                            </c:if>
                            <c:if test="${dto.item_idx2 ne 'null'}">
	                            <tr class="detail_order_board_table_tr">
	                                <td class="detail_order_board_table_td detail_order_td1 detail_order_td6">${ dto.order_number }</td>
	                                <td class="detail_order_board_table_td detail_order_td2">
	                                    <div class="detail_order_td2_1">
	                                        <a href="item_detail?idx=${ dto.item_idx2 }"><img img id="order_td2_1_img" src="${ dto.item_img2 }"></a>
	                                    </div>
	                                    <div class="detail_order_td2_2">
	                                        <a href="item_detail?idx=${ dto.item_idx2 }">${ dto.item_name2 }</a>
	                                    </div>
	                                </td>
	                                <td class="detail_order_board_table_td detail_detail_order_td3 detail_order_td7"><fmt:formatNumber value="${ dto.item_sellingPrice2 }" pattern="###,###,###" /> 원<br>(${ dto.item_count2 }개)</td>
	                                <td class="detail_detail_order_board_table_td detail_detail_order_td4 detail_order_td7 detail_order_board_table_td">${ dto.date }</td>
	                            </tr>
                            </c:if>
                            <c:if test="${dto.item_idx3 ne 'null'}">
	                            <tr class="detail_order_board_table_tr">
	                                <td class="detail_order_board_table_td detail_order_td1 detail_order_td6">${ dto.order_number }</td>
	                                <td class="detail_order_board_table_td detail_order_td2">
	                                    <div class="detail_order_td2_1">
	                                        <a href="item_detail?idx=${ dto.item_idx3 }"><img img id="order_td2_1_img" src="${ dto.item_img3 }"></a>
	                                    </div>
	                                    <div class="detail_order_td2_2">
	                                        <a href="item_detail?idx=${ dto.item_idx3 }">${ dto.item_name3 }</a>
	                                    </div>
	                                </td>
	                                <td class="detail_order_board_table_td detail_detail_order_td3 detail_order_td7"><fmt:formatNumber value="${ dto.item_sellingPrice3 }" pattern="###,###,###" /> 원<br>(${ dto.item_count3 }개)</td>
	                                <td class="detail_detail_order_board_table_td detail_detail_order_td4 detail_order_td7 detail_order_board_table_td">${ dto.date }</td>
	                            </tr>
                            </c:if>
                            <c:if test="${dto.item_idx4 ne 'null'}">
	                            <tr class="detail_order_board_table_tr">
	                                <td class="detail_order_board_table_td detail_order_td1 detail_order_td6">${ dto.order_number }</td>
	                                <td class="detail_order_board_table_td detail_order_td2">
	                                    <div class="detail_order_td2_1">
	                                        <a href="item_detail?idx=${ dto.item_idx4 }"><img img id="order_td2_1_img" src="${ dto.item_img4 }"></a>
	                                    </div>
	                                    <div class="detail_order_td2_2">
	                                        <a href="item_detail?idx=${ dto.item_idx4 }">${ dto.item_name4 }</a>
	                                    </div>
	                                </td>
	                                <td class="detail_order_board_table_td detail_detail_order_td3 detail_order_td7"><fmt:formatNumber value="${ dto.item_sellingPrice4 }" pattern="###,###,###" /> 원<br>(${ dto.item_count4 }개)</td>
	                                <td class="detail_detail_order_board_table_td detail_detail_order_td4 detail_order_td7 detail_order_board_table_td">${ dto.date }</td>
	                            </tr>
                            </c:if>
                            <c:if test="${dto.item_idx5 ne 'null'}">
	                            <tr class="detail_order_board_table_tr">
	                                <td class="detail_order_board_table_td detail_order_td1 detail_order_td6">${ dto.order_number }</td>
	                                <td class="detail_order_board_table_td detail_order_td2">
	                                    <div class="detail_order_td2_1">
	                                        <a href="item_detail?idx=${ dto.item_idx5 }"><img img id="order_td2_1_img" src="${ dto.item_img5 }"></a>
	                                    </div>
	                                    <div class="detail_order_td2_2">
	                                        <a href="item_detail?idx=${ dto.item_idx5 }">${ dto.item_name5 }</a>
	                                    </div>
	                                </td>
	                                <td class="detail_order_board_table_td detail_detail_order_td3 detail_order_td7"><fmt:formatNumber value="${ dto.item_sellingPrice5 }" pattern="###,###,###" /> 원<br>(${ dto.item_count5 }개)</td>
	                                <td class="detail_detail_order_board_table_td detail_detail_order_td4 detail_order_td7 detail_order_board_table_td">${ dto.date }</td>
	                            </tr>
                            </c:if>                                                                                                               
                        </table>
                    </div>
                    <div id="mypage_detail_order_info">
                        <div id="mypage_detail_order_info_header">
                            <h3>결제 정보</h3>
                            <div id="mypage_detail_order_info_header_btn">
                                <button><a href='javascript:void(0);' onclick="cashReceipt_pop(${ dto.order_number });">현금영수증 정보 확인</a></button>
                            </div>
                        </div>
                        <div id="mypage_detail_order_info_body">
                            <table id="mypage_detail_order_info_table">
                                <tr class="order_info_table_tr">
                                    <td class="order_info_table_td order_info_table_td_title">결제수단</td>
                                    <td class="order_info_table_td order_info_table_td_title">${ dto.payment }</td>
                                </tr>
                                <tr class="order_info_table_tr">
                                    <td class="order_info_table_td_1">총 상품 가격</td>
                                    <td class="order_info_table_td_2"><fmt:formatNumber value="${ dto.total_price }" pattern="###,###,###" /> 원</td>
                                </tr>
                                <tr class="order_info_table_tr">
                                    <td class="order_info_table_td_1">할인 후 금액</td>
                                    <td class="order_info_table_td_2"><fmt:formatNumber value="${ dto.result_total_price }" pattern="###,###,###" /> 원</td>
                                </tr>
                                <tr class="order_info_table_tr order_info_table_tr_result">
                                    <td class="order_info_table_td_1"><strong>총 결제 금액</strong></td>
                                    <td class="order_info_table_td_2"><strong><fmt:formatNumber value="${ dto.result_total_price }" pattern="###,###,###" /> 원</strong></td>
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
                                    <td class="box_info_table_td_2">${ dto.receiver_name }</td>
                                </tr>
                                <tr class="box_info_table_tr box_info_table_tr_last">
                                    <td class="box_info_table_td_1">연락처</td>
                                    <td class="box_info_table_td_2">${ dto.receiver_phone }</td>
                                </tr>
                                <tr class="box_info_table_tr">
                                    <td class="box_info_table_td_1">주소</td>
                                    <td class="box_info_table_td_2">${ dto.receiver_address }</td>
                                </tr>
                                <tr class="box_info_table_tr box_info_table_tr_result">
                                    <td class="box_info_table_td_1">배송 요청 사항</td>
                                    <td class="box_info_table_td_2">${ dto.memo }</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </c:forEach>
                <div id="mypage_detail_box_info_foot">
                    <a href="/myPage_main?page=1"><button>주문목록 돌아가기</button></a>
                </div>
            </div>
        </div>
        <div id="mypage_detail_main_end"></div>
    </div>
</div>

	<c:import url="../footer.jsp"></c:import>
	
	
	<script>
		function cashReceipt_pop(orderNumber) {
			var url = "/cashReceipt?orderNumber=" + orderNumber;
			window.open(url, "cashReceipt", "width=520, height=640, left=200, top=0"); 
		}
	
	</script>