<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                <c:forEach var="i" begin="1" end="${ count }">
                	<c:if test="${i == 1}">
                		<c:set var="index" value="${item_index1}"  />
                		<c:set var="count_item" value="${count_item1}"  />
                		<c:set var="item_sale_price" value="${item_sale_price1}"  />
                		<c:set var="total_price" value="${total_price1}"  />
                		<c:set var="item_name" value="${item_name1}"  />
                		<c:set var="item_img" value="${item_img1}"  />
                		<tr class="itemDB">
		                    <td>${ i }</td>
		                    <td>
		                       <!-- 상품 -->
		                       <a href="item_detail?idx=${ index }" class="itemSize_50"><span class="itemSize_50"><img src="${ item_img }"></span></a>
		                    <td class="item_name">
		                        <a href="item_detail?idx=${ index }">${ item_name }</a>
		                        <input type="hidden" value="1" id="item1">
		                    </td>
		                    </td>
		                    <td>${ count_item } 개</td>
		                    <td><fmt:formatNumber value="${ item_sale_price }" pattern="###,###,###" /> 원</td>
		                    <td><fmt:formatNumber value="${ total_price }" pattern="###,###,###" /> 원</td>
		                </tr>
					</c:if>
                	<c:if test="${i == 2}">
                		<c:set var="index" value="${item_index2}"  />
                		<c:set var="count_item" value="${count_item2}"  />
                		<c:set var="item_sale_price" value="${item_sale_price2}"  />
                		<c:set var="total_price" value="${total_price2}"  />
                		<c:set var="item_name" value="${item_name2}"  />
                		<c:set var="item_img" value="${item_img2}"  />
                		<tr class="itemDB">
		                    <td>${ i }</td>
		                    <td>
		                       <!-- 상품 -->
		                       <a href="item_detail?idx=${ index }" class="itemSize_50"><span class="itemSize_50"><img src="${ item_img }"></span></a>
		                    <td class="item_name">
		                        <a href="item_detail?idx=${ index }">${ item_name }</a>
		                        <input type="hidden" value="2" id="item2">
		                    </td>
		                    </td>
		                    <td>${ count_item } 개</td>
		                    <td><fmt:formatNumber value="${ item_sale_price }" pattern="###,###,###" /> 원</td>
		                    <td><fmt:formatNumber value="${ total_price }" pattern="###,###,###" /> 원</td>
		                </tr>
					</c:if>
					<c:if test="${i == 3}">
                		<c:set var="index" value="${item_index3}"  />
                		<c:set var="count_item" value="${count_item3}"  />
                		<c:set var="item_sale_price" value="${item_sale_price3}"  />
                		<c:set var="total_price" value="${total_price3}"  />
                		<c:set var="item_name" value="${item_name3}"  />
                		<c:set var="item_img" value="${item_img3}"  />
                		<tr class="itemDB">
		                    <td>${ i }</td>
		                    <td>
		                       <!-- 상품 -->
		                       <a href="item_detail?idx=${ index }" class="itemSize_50"><span class="itemSize_50"><img src="${ item_img }"></span></a>
		                    <td class="item_name">
		                        <a href="item_detail?idx=${ index }">${ item_name }</a>
		                        <input type="hidden" value="3" id="item3">
		                    </td>
		                    </td>
		                    <td>${ count_item } 개</td>
		                    <td><fmt:formatNumber value="${ item_sale_price }" pattern="###,###,###" /> 원</td>
		                    <td><fmt:formatNumber value="${ total_price }" pattern="###,###,###" /> 원</td>
		                </tr>
					</c:if>
					<c:if test="${i == 4}">
                		<c:set var="index" value="${item_index4}"  />
                		<c:set var="count_item" value="${count_item4}"  />
                		<c:set var="item_sale_price" value="${item_sale_price4}"  />
                		<c:set var="total_price" value="${total_price4}"  />
                		<c:set var="item_name" value="${item_name4}"  />
                		<c:set var="item_img" value="${item_img4}"  />
                		<tr class="itemDB">
		                    <td>${ i }</td>
		                    <td>
		                       <!-- 상품 -->
		                       <a href="item_detail?idx=${ index }" class="itemSize_50"><span class="itemSize_50"><img src="${ item_img }"></span></a>
		                    <td class="item_name">
		                        <a href="item_detail?idx=${ index }">${ item_name }</a>
		                        <input type="hidden" value="4" id="item4">
		                    </td>
		                    </td>
		                    <td>${ count_item } 개</td>
		                    <td><fmt:formatNumber value="${ item_sale_price }" pattern="###,###,###" /> 원</td>
		                    <td><fmt:formatNumber value="${ total_price }" pattern="###,###,###" /> 원</td>
		                </tr>
					</c:if>
					<c:if test="${i == 5}">
                		<c:set var="index" value="${item_index5}"  />
                		<c:set var="count_item" value="${count_item5}"  />
                		<c:set var="item_sale_price" value="${item_sale_price5}"  />
                		<c:set var="total_price" value="${total_price5}"  />
                		<c:set var="item_name" value="${item_name5}"  />
                		<c:set var="item_img" value="${item_img5}"  />
                		<tr class="itemDB">
		                    <td>${ i }</td>
		                    <td>
		                       <!-- 상품 -->
		                       <a href="item_detail?idx=${ index }" class="itemSize_50"><span class="itemSize_50"><img src="${ item_img }"></span></a>
		                    <td class="item_name">
		                        <a href="item_detail?idx=${ index }">${ item_name }</a>
		                        <input type="hidden" value="5" id="item5">
		                    </td>
		                    </td>
		                    <td>${ count_item } 개</td>
		                    <td><fmt:formatNumber value="${ item_sale_price }" pattern="###,###,###" /> 원</td>
		                    <td><fmt:formatNumber value="${ total_price }" pattern="###,###,###" /> 원</td>
		                </tr>
					</c:if>
                </c:forEach>
            </table>
        </div>
        <div id="write_orderseet">
            <div id="order_info_id">
  
                <h5>주문자 정보</h5>
                <table>
                    <tr>
                        <th>이름</th>
                        <td>${ user_name }<input type="hidden" value="${ user_name }" id="user_name"></td>
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
                        <td><span><fmt:formatNumber value="${ all_item_price }" pattern="###,###,###" /></span> 원</td>
                        <input type="hidden" value="${ all_item_price }" id="all_item_price">
                    </tr>
                    <tr class="order_use_point">
                        <th>포인트 사용</th>
                        <td>
                            <!-- 가지고 있는 포인트 값보다 이하의 값만 적을 수 있어야 함 -->
                            <!-- 적용 버튼을 누르면 해당 포인트 만큼 상품금액에서 빠짐 -->
                            <input type="text" id="userId_point" value="<fmt:formatNumber value='${ user_point }' pattern='###,###,###' />">
                            <input type="hidden" value="${ user_point }" id="user_point">
                            <button type="button" onclick="use_point();"> 적용</button>
                        </td>
                    </tr>
                    <tr>
                        <th>총 결제 금액</th>
                        <td><span id="result_total_price"><fmt:formatNumber value="${ all_item_price }" pattern="###,###,###" /></span> 원</td>
                    </tr>
                    <tr>
                        <th>일반 결제</th>
                        <td>
                            <label name="pay" for="pay"><input type="radio" name="pay" id="order_pay" value="신용카드">신용카드</label>
                            <label name="pay" for="pay"><input type="radio" name="pay" id="order_pay" value="실시간계좌이체">실시간계좌이체</label>
                            <label name="pay" for="pay"><input type="radio" name="pay" id="order_pay" value="무통장입금">무통장입금</label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="final_order">
            <button type="button" onclick="payment_ok();" class="final_order_button">주문하기</button>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>
	
	
	<script>
		function use_point(){
			var all_item_price = document.getElementById("all_item_price").value;
			var user_point = document.getElementById("user_point").value;
			var result_price = (all_item_price - user_point).toLocaleString();
			document.getElementById("result_total_price").innerHTML = result_price;
		}
		
		
		function payment_ok(){
    		var form = document.createElement("form");
    		form.setAttribute("method", "post");
    		form.setAttribute("action", "/payment_ok");
    		
    		var user_name = document.getElementById("user_name").value;
    		var item_idx1 = document.getElementById("item_idx").value;
    		var content1 = document.getElementById("content").value;
    		
    		var params = {user_id:user_id1, item_idx:item_idx1, content:content1}; 

		    for(var key in params) {
		        var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", key);
		        hiddenField.setAttribute("value", params[key]);
		        form.appendChild(hiddenField);
		    }   
    		document.body.appendChild(form);
			form.submit();
		}
	</script>