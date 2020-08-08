<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 장바구니 -->


	<c:import url="../header.jsp"></c:import>

      <div id="mycart_wrap">
       <div id="mycart_header">
           <h2>장바구니</h2>
       </div>
       <form action="/payment" method="post">
        <div id="cart_table_div">
            <table class="cart_table">
                <tr id="cart_table_head">
                	<td>체크</td>
                    <td></td>
                    <td class="cart_head_info">상품명</td>
                    <td class="cart_head_saleprice">가격</td>
                    <td class="cart_head_count">수량</td>
                   	<td class="cart_head_price">결제금액</td>
                   	<td>삭제</td>
                </tr>
                <c:forEach items="${ cart_list }" var="cart">
                <tr class="cart_table_item">
                    <td class="cart_select"><input type="checkbox" name="cart_item_select" /></td>
                    <td class="cart_info">
                        <div class="cart_info_img" style="background-image:url('${ cart.item_img }')" >
	                    <a href="item_detail?idx=${ cart.item_idx }"></a></div>
                    </td>
                    <td> <div class="cart_info_name"><a href="item_detail?idx=${ cart.item_idx }">${ cart.item_name }</a></div></td>
                    <td><div class="cart_info_saleprice"></div><fmt:formatNumber value="${ cart.item_sale_price }" pattern="###,###,###" /><br>원</td>
                    <td class="cart_count">${ cart.item_order_amount }<br>개</td>
                    <td class="cart_price"><fmt:formatNumber value="${ cart.item_order_price }" pattern="###,###,###" />원</td>
                    <td> <a href="MyCart_delete?cart_idx=${cart.cart_idx}"> × </a> </td>
                </tr>
             </c:forEach>
            </table>
            <div class="checkBoxAll">
            	<div class="selectAll">
	            	<input type="checkbox" id="checkall" />
	            	<p id="checkbox_text">전체선택</p>
	            </div>
	            <button id=cart_btn_1>선택 삭제</button>
            </div>
        </div>
        <div id="cart_foot">
        	<div class="cart_footer_top">
	            <p id="cart_foot_info">총 상품 금액</p>
	            <p id="cart_foot_price"><span><fmt:formatNumber value="${ cart_finalPrice}" pattern="###,###,###" /></span>원</p>
	        </div>
           <button id=cart_btn_2 type="submit">결제하기</button>
        </div>
        </form>
    </div>

	<script>
	    $(document).ready(function(){
	        //최상단 체크박스 클릭
	        $("#checkall").click(function(){
	            //클릭되었으면
	            if($("#checkall").prop("checked")){
	                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	                $("input[name=cart_item_select]").prop("checked",true);
	                //클릭이 안되있으면
	            }else{
	                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	                $("input[name=cart_item_select]").prop("checked",false);
	            }
	        })
	    })
	</script>
	
	<c:import url="../footer.jsp"></c:import>