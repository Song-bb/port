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
                	<input type="hidden" value="${ count }" id="count">
                	<c:if test="${i == 1}">
                		<c:set var="index" value="${item_index1}"  />
                		<c:set var="count_item" value="${count_item1}"  />
                		<c:set var="item_sale_price" value="${item_sale_price1}"  />
                		<c:set var="total_price" value="${total_price1}"  />
                		<c:set var="item_name" value="${item_name1}"  />
                		<c:set var="item_img" value="${item_img1}"  />
                		<input type="hidden" value="${item_index1}" id="item_index1">
                		<input type="hidden" value="${item_img1}" id="item_img1">
                		<input type="hidden" value="${item_name1}" id="item_name1">
                		<input type="hidden" value="${count_item1}" id="item_count1">
                		<input type="hidden" value="${item_sale_price1}" id="item_sellingPrice1">
                		<input type="hidden" value="${total_price1}" id="item_total_price1">
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
                		<input type="hidden" value="${item_index2}" id="item_index2">
                		<input type="hidden" value="${item_img2}" id="item_img2">
                		<input type="hidden" value="${item_name2}" id="item_name2">
                		<input type="hidden" value="${count_item2}" id="item_count2">
                		<input type="hidden" value="${item_sale_price2}" id="item_sellingPrice2">
                		<input type="hidden" value="${total_price2}" id="item_total_price2">
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
                		<input type="hidden" value="${item_index3}" id="item_index3">
                		<input type="hidden" value="${item_img3}" id="item_img3">
                		<input type="hidden" value="${item_name3}" id="item_name3">
                		<input type="hidden" value="${count_item3}" id="item_count3">
                		<input type="hidden" value="${item_sale_price3}" id="item_sellingPrice3">
                		<input type="hidden" value="${total_price3}" id="item_total_price3">
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
                		<input type="hidden" value="${item_index4}" id="item_index4">
                		<input type="hidden" value="${item_img4}" id="item_img4">
                		<input type="hidden" value="${item_name4}" id="item_name4">
                		<input type="hidden" value="${count_item4}" id="item_count4">
                		<input type="hidden" value="${item_sale_price4}" id="item_sellingPrice4">
                		<input type="hidden" value="${total_price4}" id="item_total_price4">
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
                		<input type="hidden" value="${item_index5}" id="item_index5">
                		<input type="hidden" value="${item_img5}" id="item_img5">
                		<input type="hidden" value="${item_name5}" id="item_name5">
                		<input type="hidden" value="${count_item5}" id="item_count5">
                		<input type="hidden" value="${item_sale_price5}" id="item_sellingPrice5">
                		<input type="hidden" value="${total_price5}" id="item_total_price5">
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
                        <td>
                        	${ user_name }
                        	<input type="hidden" value="${ user_name }" id="user_name">
                        	<input type="hidden" value="${ user_id }" id="user_id">
                        </td>
                    </tr>
                    <tr>
                        <th>*연락처</th>
                        <td class="input_tel">
                            <input type="text" id="userId_tel1" maxlength="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /> -
                            <input type="text" id="userId_tel2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /> -
                            <input type="text" id="userId_tel3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
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
                            <input type="text" id="orderId" />
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td class="order_info_address">
                            <input type="text" id="sample6_postcode" placeholder="우편번호"  />
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /><br>
							<input type="text" id="sample6_address" placeholder="주소" /><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" placeholder="상세주소">
                        </td>
                    </tr>
                    <tr>
                        <th>*연락처</th>
                        <td class="input_tel">
                            <input type="text" id="orderId_tel1" maxlength="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /> -
                            <input type="text" id="orderId_tel2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /> -
                            <input type="text" id="orderId_tel3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
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
                            잔여 포인트 : <span id="result_point"><fmt:formatNumber value="${ user_point }" pattern="###,###,###" /></span> 원
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
			var all_item_price = document.getElementById("all_item_price").value; /* 총 결제금액 */
			var user_point = document.getElementById("userId_point").value; /* 사용할 포인트 */
			var user_point2 = user_point.replace(",", "");
			var result_price = all_item_price - user_point2; /* 결제금액 - 사용할포인트 */
			document.getElementById("result_total_price").innerHTML = result_price.toLocaleString();
			var user_point_result = document.getElementById("user_point").value; /* 총 보유 포인트 */
			var result_point = user_point_result - user_point2; /* 보유포인트 - 사용할 포인트 */
			document.getElementById("result_point").innerHTML = result_point.toLocaleString();
		}
		
		
		function payment_ok(){
    		var form = document.createElement("form");
    		form.setAttribute("method", "post");
    		form.setAttribute("action", "/payment_ok");
    		
    		var user_id = document.getElementById("user_id").value;
    		var order_person_name = document.getElementById("user_name").value;
    		var order_person_phone = document.getElementById("userId_tel1").value + document.getElementById("userId_tel2").value + document.getElementById("userId_tel3").value;
    		var receiver_name = document.getElementById("orderId").value;
    		var receiver_postcode = document.getElementById("sample6_postcode").value;
    		var receiver_address = document.getElementById("sample6_address").value + " " + document.getElementById("sample6_detailAddress").value + " " + document.getElementById("sample6_extraAddress").value;
    		var receiver_phone = document.getElementById("orderId_tel1").value + document.getElementById("orderId_tel2").value + document.getElementById("orderId_tel3").value;
    		var memo = document.getElementById("orderId_request").value;
    		var total_price = document.getElementById("all_item_price").value;
    		var user_point_1 = document.getElementById("userId_point").value; /* 사용할 포인트 */
			var user_point = user_point_1.replace(",", "");
    		var result_total_price1 = document.getElementById("result_total_price").innerHTML;
    		var result_total_price = result_total_price1.replace(",", "");
    		var result_point1 = document.getElementById("result_point").innerHTML;
    		var result_point = result_point1.replace(",", "");
    		var payment = "";
			var check_count = document.getElementsByName("pay").length; 
			var unchecked = 0;
			for (var i=0; i<check_count; i++) {
   	            if (document.getElementsByName("pay")[i].checked == true) {
   	                payment = document.getElementsByName("pay")[i].value;
   	            } else {
   	            	unchecked++;
   	            }
   	        }
			
			if(order_person_phone == "" ){
    			alert("주문하시는 분의 연락처를 입력하세요");
    		} else if( receiver_name == "" ){
    			alert("받으시는 분의 성함을 입력하세요");
    		} else if( receiver_postcode == "" ){
    			alert("우편번호를 입력하세요");
    		} else if( receiver_address == "" ){
    			alert("상품을 받으실 주소를 입력하세요");
    		} else if( receiver_phone == "" ){
    			alert("받으시는 분의 연락처를 입력하세요");
    		} else if( unchecked == check_count ){
    			alert("결제 방법을 선택해주세요");
    		} else {
        		var params = {"user_id":user_id, "order_person_name":order_person_name, "order_person_phone":order_person_phone, "receiver_name":receiver_name, "receiver_postcode":receiver_postcode, "receiver_address":receiver_address, "receiver_phone":receiver_phone, "memo":memo, "total_price":total_price, "user_point":user_point, "result_total_price":result_total_price, "result_point":result_point, "payment":payment}; 

    		    for(var key in params) {
    		        var hiddenField = document.createElement("input");
    		        hiddenField.setAttribute("type", "hidden");
    		        hiddenField.setAttribute("name", key);
    		        hiddenField.setAttribute("value", params[key]);
    		        form.appendChild(hiddenField);
    		    }
    		    
    	        var check_count = document.getElementById("count").value;
    	        var hiddenField = document.createElement("input");
    	        hiddenField.setAttribute("type", "hidden");
    	        hiddenField.setAttribute("name", "count");
    	        hiddenField.setAttribute("value", check_count);
    	        form.appendChild(hiddenField);
    	        
    	        var json = {};
    	        
    	        for (var i=1; i<=check_count; i++) {

                	var item_index = "item_index" + i;
                	var item_img = "item_img" + i;
                	var item_name = "item_name" + i;
                	var item_count = "item_count" + i;
                	var item_sellingPrice = "item_sellingPrice" + i;
                	var item_total_price = "item_total_price" + i;
                	
                	json.i = {"item_index":document.getElementById(item_index).value, "item_img":document.getElementById(item_img).value, "item_name":document.getElementById(item_name).value, "item_count":document.getElementById(item_count).value, "item_sellingPrice":document.getElementById(item_sellingPrice).value, "item_total_price":document.getElementById(item_total_price).value};
                	
       		        for(var key in json.i) {
       		        	var name = key + i;
       			        var hiddenField = document.createElement("input");
       			        hiddenField.setAttribute("type", "hidden");
       			        hiddenField.setAttribute("name", name);
       			        hiddenField.setAttribute("value", json.i[key]);
       			        form.appendChild(hiddenField);
       			    }
    	        }
        		document.body.appendChild(form);
    			form.submit();
    		}

		}
	</script>