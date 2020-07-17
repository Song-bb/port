<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 주문 완료 페이지 -->

	<c:import url="../header.jsp"></c:import>
	
	<div id="paymentok_wrap">
        <div id="finish_order_title">
            <p>주문이 완료되었습니다</p>
            <p>주문 내역은 [마이페이지 > 주문내역]에서 다시 확인할 수 있습니다.</p>
        </div>
        <!-- order_items > payment와 동일 -->
        <div class="order_items">
            <h5>주문번호 : <span style="font-size: large;">20070100001</span></h5>
            <table>
                <tr>
                    <th>번호</th>
                    <th></th>
                    <th>상품정보</th>
                    <th>수량</th>
                    <th>주문금액</th>
                    <th>포인트</th>
                </tr>
                <tr class="itemDB">
                    <td><a href="#">1</a></td>
                    <td>
                       <!-- 상품 -->
                       <a href="#" class="itemSize_50"><span class="itemSize_50"><img src="http://placehold.it/50x50"></span></a>
                    <td class="item_name">
                        <a href="#">[워싱턴] 한입체리 500g</a>
                    </td>
                    </td>
                    <td>1개</td>
                    <td>10,000원</td>
                    <td>10원</td>
                </tr>
                <tr class="itemDB">
                    <td><a href="#">2</a></td>
                    <td>
                       <!-- 상품 -->
                       <a href="#" class="itemSize_50"><span class="itemSize_50"><img src="http://placehold.it/50x50"></span></a>
                    <td class="item_name">
                        <a href="#">[워싱턴] 한입체리 500g</a>
                    </td>
                    </td>
                    <td>1개</td>
                    <td>10,000원</td>
                    <td>10원</td>
                </tr>
            </table>
        </div>
        <div id="final_orderseet">
            <form action="#">
            <div id="final_order_info_id">
  
                <h5>주문자 정보</h5>
                <table>
                    <tr>
                        <th>이름</th>
                        <td>{userId}</td>
                    </tr>
                    <tr>
                        <th>*연락처</th>
                        <td>{userId_tel}</td>
                    </tr>
                </table>
            </div>
            <div id="final_order_info_where">
                <h5>배송 정보</h5>
                <table>
                    <tr>
                        <th>이름(회사)</th>
                        <td>{orderId}</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>{}</td>
                    </tr>
                    <tr>
                        <th>*연락처</th>
                        <td>{orderId_tel}</td>
                    </tr>
                    <tr id="order_request">
                        <th>요청사항</th>
                        <td>{orderId_request}</td>
                    </tr>
                </table>
            </div>
            <div id="final_order_info_pay">
                <h5>결제정보</h5>
                <table>
                    <tr>
                        <th>총 주문 금액</th>
                        <td><span>{상품금액표기}</span> 원</td>
                    </tr>
                    <tr class="order_use_point">
                        <th>사용한 포인트</th>
                        <td>{userId_point}</td>
                    </tr>
                    <tr>
                        <th>배송비</th>
                        <td><span>{배송비}</span> 원(택배발송)</td>
                    </tr>
                    <tr>
                        <th>총 결제 금액</th>
                        <td><span>{총결제금액 표기}</span> 원</td>
                    </tr>
                    <tr>
                        <th>결제정보</th>
                        <td>신용카드</td>
                    </tr>
                </table>
            </div>
        </form>
        </div>
        <div id="paymentok_button">
            <button type="button" onclick="">주문내역 확인</button>
            <button type="button" onclick="">메인으로 돌아가기</button>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>>