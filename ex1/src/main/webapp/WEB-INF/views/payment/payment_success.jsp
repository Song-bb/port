<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 주문 완료 페이지 -->

	<c:import url="../header.jsp"></c:import>
	
	<div id="paymentok_wrap">
        <div id="finish_order_title">
            <p>주문이 완료되었습니다</p>
            <p>주문 내역은 [마이페이지 > 주문내역]에서 다시 확인할 수 있습니다.</p>
        </div>
        <!-- order_items > payment와 동일 -->
        <div class="order_items">
            <h5>주문번호 : <span style="font-size: large;">${ order_number }</span></h5>
            <table>
                <tr>
                    <th>번호</th>
                    <th></th>
                    <th>상품정보</th>
                    <th>수량</th>
                    <th>주문금액</th>
                    <th>총금액</th>
                </tr>
                <c:forEach items="${ list }" var="dto">
                <c:if test="${dto.item_idx1 ne 'null'}">
                <tr class="itemDB">
                    <td>1</td>
                    <td>
                       <!-- 상품 -->
                       <a href="item_detail?idx=${ dto.item_idx1 }" class="itemSize_50"><span class="itemSize_50"><img src="${ dto.item_img1 }"></span></a>
                    <td class="item_name">
                        <a href="item_detail?idx=${ dto.item_idx1 }" >${ dto.item_name1 }</a>
                    </td>
                    </td>
                    <td>${ dto.item_count1 } 개</td>
                    <td><fmt:formatNumber value="${ dto.item_sellingPrice1 }" pattern="###,###,###" /> 원</td>
                    <td><fmt:formatNumber value="${ dto.item_total_price1 }" pattern="###,###,###" /> 원</td>
                </tr>
                </c:if>
                <c:if test="${dto.item_idx2 ne 'null'}">
                <tr class="itemDB">
                    <td>2</td>
                    <td>
                       <!-- 상품 -->
                       <a href="item_detail?idx=${ dto.item_idx2 }" class="itemSize_50"><span class="itemSize_50"><img src="${ dto.item_img2 }"></span></a>
                    <td class="item_name">
                        <a href="item_detail?idx=${ dto.item_idx2 }" >${ dto.item_name2 }</a>
                    </td>
                    </td>
                    <td>${ dto.item_count2 } 개</td>
                    <td><fmt:formatNumber value="${ dto.item_sellingPrice2 }" pattern="###,###,###" /> 원</td>
                    <td><fmt:formatNumber value="${ dto.item_total_price2 }" pattern="###,###,###" /> 원</td>
                </tr>
                </c:if>
                <c:if test="${dto.item_idx3 ne 'null'}">
                <tr class="itemDB">
                    <td>3</td>
                    <td>
                       <!-- 상품 -->
                       <a href="item_detail?idx=${ dto.item_idx3 }" class="itemSize_50"><span class="itemSize_50"><img src="${ dto.item_img3 }"></span></a>
                    <td class="item_name">
                        <a href="item_detail?idx=${ dto.item_idx3 }" >${ dto.item_name3 }</a>
                    </td>
                    </td>
                    <td>${ dto.item_count3 } 개</td>
                    <td><fmt:formatNumber value="${ dto.item_sellingPrice3 }" pattern="###,###,###" /> 원</td>
                    <td><fmt:formatNumber value="${ dto.item_total_price3 }" pattern="###,###,###" /> 원</td>
                </tr>
                </c:if>
                <c:if test="${dto.item_idx4 ne 'null'}">
                <tr class="itemDB">
                    <td>4</td>
                    <td>
                       <!-- 상품 -->
                       <a href="item_detail?idx=${ dto.item_idx4 }" class="itemSize_50"><span class="itemSize_50"><img src="${ dto.item_img4 }"></span></a>
                    <td class="item_name">
                        <a href="item_detail?idx=${ dto.item_idx4 }" >${ dto.item_name4 }</a>
                    </td>
                    </td>
                    <td>${ dto.item_count4 } 개</td>
                    <td><fmt:formatNumber value="${ dto.item_sellingPrice4 }" pattern="###,###,###" /> 원</td>
                    <td><fmt:formatNumber value="${ dto.item_total_price4 }" pattern="###,###,###" /> 원</td>
                </tr>
                </c:if>
                <c:if test="${dto.item_idx5 ne 'null'}">
                <tr class="itemDB">
                    <td>5</td>
                    <td>
                       <!-- 상품 -->
                       <a href="item_detail?idx=${ dto.item_idx5 }" class="itemSize_50"><span class="itemSize_50"><img src="${ dto.item_img5 }"></span></a>
                    <td class="item_name">
                        <a href="item_detail?idx=${ dto.item_idx5 }" >${ dto.item_name5 }</a>
                    </td>
                    </td>
                    <td>${ dto.item_count5 } 개</td>
                    <td><fmt:formatNumber value="${ dto.item_sellingPrice5 }" pattern="###,###,###" /> 원</td>
                    <td><fmt:formatNumber value="${ dto.item_total_price5 }" pattern="###,###,###" /> 원</td>
                </tr>
                </c:if>
                </c:forEach>
            </table>
        </div>
        <div id="final_orderseet">
            <form action="#">
            <div id="final_order_info_id">
                <h5>주문자 정보</h5>
                <table>
                    <tr>
                        <th>이름</th>
                        <td>${ order_person_name }</td>
                    </tr>
                    <tr>
                        <th>*연락처</th>
                        <td>${ order_person_phone }</td>
                    </tr>
                </table>
            </div>
            <div id="final_order_info_where">
                <h5>배송 정보</h5>
                <table>
                    <tr>
                        <th>이름(회사)</th>
                        <td>${ receiver_name }</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${ receiver_postcode } ${ receiver_address }</td>
                    </tr>
                    <tr>
                        <th>*연락처</th>
                        <td>${ receiver_phone }</td>
                    </tr>
                    <tr id="order_request">
                        <th>요청사항</th>
                        <td>${ memo }</td>
                    </tr>
                </table>
            </div>
            <div id="final_order_info_pay">
                <h5>결제정보</h5>
                <table>
                    <tr>
                        <th>총 주문 금액</th>
                        <td><span><fmt:formatNumber value="${ total_price }" pattern="###,###,###" /></span> 원</td>
                    </tr>
                    <tr class="order_use_point">
                        <th>사용한 포인트</th>
                        <td><fmt:formatNumber value="${ used_point }" pattern="###,###,###" /> 원</td>
                    </tr>
                    <tr>
                        <th>총 결제 금액</th>
                        <td><span><fmt:formatNumber value="${ result_total_price }" pattern="###,###,###" /></span> 원</td>
                    </tr>
                    <tr>
                        <th>결제정보</th>
                        <td>${ payment }</td>
                    </tr>
                </table>
            </div>
        </form>
        </div>
        <div id="paymentok_button">
            <button type="button" onclick="location.href='/myPage_main?page=1';">주문내역 확인</button>
            <button type="button" onclick="location.href='/main';">메인으로 돌아가기</button>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>>