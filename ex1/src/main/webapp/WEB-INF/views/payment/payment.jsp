<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 주문/결제 정보 입력 페이지 -->

	<c:import url="../header.jsp"></c:import>
	
	<div id="payment_wrap">
        <div class="order_items">
            <h5>상품주문</h5>
            <table>
                <tr>
                    <th>번호</th>
                    <th></th>
                    <th>상품정보</th>
                    <th>수량</th>
                    <th>주문금액</th>
                    <th>총 금액</th>
                </tr>
                <c:forEach var="map" items="${str_i_map}">
                <tr class="itemDB">
                    <td>${ str_i }</td>
                    <td>
                       <!-- 상품 -->
                       <a href="item_detail?idx=${ map.item_index }" class="itemSize_50"><span class="itemSize_50"><img src="${ map.item_img }"></span></a>
                    <td class="item_name">
                        <a href="item_detail?idx=${ map.item_index }">${ map.item_name }</a>
                    </td>
                    </td>
                    <td>${ map.count_item } 개</td>
                    <td>${ map.item_sale_price } 원</td>
                    <td>${ map.total_price } 원</td>
                </tr>
                <!--  -->
                </c:forEach>
            </table>
        </div>
        <div id="write_orderseet">
            <form action="#">
            <div id="order_info_id">
  
                <h5>주문자 정보</h5>
                <table>
                    <tr>
                        <th>이름</th>
                        <td>{회원이름}</td>
                    </tr>
                    <tr>
                        <th>*연락처</th>
                        <td class="input_tel">
                            <input type="text" id="userId_tel" maxlength="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> -
                            <input type="text" id="userId_tel" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> -
                            <input type="text" id="userId_tel" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="order_info_where">
                <h5>배송 정보</h5>
                <table>
                    <tr>
                        <th>이름(회사)</th>
                        <td>
                            <input type="text" name="" id="orderId">
                            <span>0/25자</span>
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td class="order_info_address">
                            <input type="text" id="sample6_postcode" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample6_address" placeholder="주소"><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목">
                        </td>
                    </tr>
                    <tr>
                        <th>*연락처</th>
                        <td class="input_tel">
                            <input type="text" id="orderId_tel" maxlength="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> -
                            <input type="text" id="orderId_tel" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> -
                            <input type="text" id="orderId_tel" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                        </td>
                    </tr>
                    <tr id="order_request">
                        <th>요청사항</th>
                        <td>
                            <textarea id="orderId_request" rows="3" cols="30" ></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="order_info_pay">
                <h5>결제 금액 확인 및 결제 방법 선택</h5>
                <table>
                    <tr>
                        <th>총 주문 금액</th>
                        <td><span>{상품금액표기}</span> 원</td>
                    </tr>
                    <tr class="order_use_point">
                        <th>포인트 사용</th>
                        <td>
                            <!-- 가지고 있는 포인트 값보다 이하의 값만 적을 수 있어야 함 -->
                            <!-- 적용 버튼을 누르면 해당 포인트 만큼 상품금액에서 빠짐 -->
                            <input type="text" id="userId_point">
                            <button type="button"> 적용</button>
                        </td>
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
                        <th>일반 결제</th>
                        <td>
                            <label name="pay"><input type="radio" name="pay" id="order_pay" value="card">카드결제</label>
                            <label name="pay"><input type="radio" name="pay" id="order_pay" value="bank1">계좌이체</label>
                            <label name="pay"><input type="radio" name="pay" id="order_pay" value="bank2">가상계좌</label>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        </div>
        <div id="final_order">
            <button type="submit" class="final_order_button">주문하기</button>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>