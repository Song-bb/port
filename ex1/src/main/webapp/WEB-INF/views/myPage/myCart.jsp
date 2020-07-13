<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 장바구니 -->


	<c:import url="../header.jsp"></c:import>
	
	
      <div id="mycart_wrap">
       <div id="mycart_header">
           <h2>장바구니</h2>
       </div>
       <div id="mycart_header_2">
           <p>구매 리스트</p>
       </div>
        <div id="cart_table_div">
            <table class="cart_table">
                <tr id="cart_table_head">
                    <td class="cart_head_select">선택</td>
                    <td class="cart_head_number">번호</td>
                    <td class="cart_head_info">상품 정보</td>
                    <td class="cart_head_count">수량</td>
                    <td class="cart_head_price">판매 가격</td>
                    <td class="cart_head_point">포인트</td>
                </tr>
                <tr class="cart_table_item">
                    <td class="cart_select"><input type="checkbox" name="cart_item_select" /></td>
                    <td class="cart_number">1</td>
                    <td class="cart_info">
                        <div class="cart_info_img"><a href=""><img src="http://placehold.it/150x220"></a></div>
                        <div class="cart_info_name">상품 이름</div>
                        <div class="cart_info_price">상품 가격</div>
                    </td>
                    <td class="cart_count">1개</td>
                    <td class="cart_price">10,000원</td>
                    <td class="cart_point">10원</td>
                </tr>
                <tr class="cart_table_item">
                    <td class="cart_select"><input type="checkbox" name="cart_item_select" /></td>
                    <td class="cart_number">1</td>
                    <td class="cart_info">
                        <div class="cart_info_img"><a href=""><img src="http://placehold.it/150x220"></a></div>
                        <div class="cart_info_name">상품 이름</div>
                        <div class="cart_info_price">상품 가격</div>
                    </td>
                    <td class="cart_count">1개</td>
                    <td class="cart_price">10,000원</td>
                    <td class="cart_point">10원</td>
                </tr>
                <tr class="cart_table_select">
                    <td><input type="checkbox" id="checkall" /><p id="checkbox_text">전체선택</p></td>
                </tr>
            </table>
        </div>
        <div id="cart_table_under"></div>
        <div id="cart_foot">
            <div id="cart_foot_info">총 상품 금액</div><div id="cart_foot_price"><h2>0,0000원</h2></div>
        </div>
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