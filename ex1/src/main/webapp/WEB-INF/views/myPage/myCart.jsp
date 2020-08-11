<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 장바구니 -->


	<c:import url="../header.jsp"></c:import>

      <div id="mycart_wrap">
       <div id="mycart_header">
           <h2>장바구니</h2>
       </div>
       
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
                    <td class="cart_select"><input type="checkbox" name="cart_item_select" onclick="check_item_cart();" value="${ cart.item_order_price }"/></td>
                    <td class="cart_info">
                        <div class="cart_info_img" style="background-image:url('${ cart.item_img }')" >
	                    <a href="item_detail?idx=${ cart.item_idx }"></a></div>
	                    <input type="hidden" value="${ cart.item_idx }" id="item_index_i" name="item_index_i">
	                    <input type="hidden" value="${ cart.user_id }" id="user_id" name="user_id">
                    </td>
                    <td> 
                    	<div class="cart_info_name"><a href="item_detail?idx=${ cart.item_idx }">${ cart.item_name }</a></div>
                    	<input type="hidden" value="${ cart.item_name }" name="item_name_i">
                    	<input type="hidden" value="${ cart.item_img }" name="item_img_i">
                    </td>
                    <td>
                    	<div class="cart_info_saleprice"></div>
                    	<fmt:formatNumber value="${ cart.item_sale_price }" pattern="###,###,###" /><br>원
                    	<input type="hidden" value="${ cart.item_sale_price }" id="item_sale_price" name="item_sale_price">
                    </td>
                    <td class="cart_count">
                    	 <div class="goods_count">
                          <button type="button" class="btnDown" onclick="countDown( ${ cart.cart_idx }, ${ cart.item_order_amount } );">-</button>
                              <input type="text" value="${ cart.item_order_amount }" onblur="change_price();" id="count_item" name="item_order_amount">
                          <button type="button" class="btnUp" onclick="countUp( ${ cart.cart_idx }, ${ cart.item_order_amount } );">+</button>
	                            
	                      </div>
                    </td>
                    <td class="cart_price"><fmt:formatNumber value="${ cart.item_order_price }" pattern="###,###,###" /><br>원</td>
                    <td> <a href="MyCart_delete?cart_idx=${cart.cart_idx}"> X </a> </td>
                </tr>
             </c:forEach>
            </table>
            <div class="checkBoxAll">
            	<div class="selectAll">
	            	<input type="checkbox" id="checkall" />
	            	<p id="checkbox_text"><label for="checkall">전체선택</label></p>
	            </div>
            </div>
        </div>
        <div id="cart_foot">
        	<div class="cart_footer_top">
	            <p id="cart_foot_info">총 상품 금액</p>
	            <p id="cart_foot_price"><span id="result_totlaPrice"><fmt:formatNumber value="${ cart_finalPrice }" pattern="###,###,###" /></span> 원</p>
	        </div>
           <button id=cart_btn_2 type="button" onclick="payment();">결제하기</button>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>
	<script>
	    $(document).ready(function(){
	        //최상단 체크박스 클릭
	        $("#checkall").click(function(){
	            //클릭되었으면
	            if($("#checkall").prop("checked")){
	                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	                $("input[name=cart_item_select]").prop("checked",true);
	                check_item_cart();
	                //클릭이 안되있으면
	            }else{
	                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	                $("input[name=cart_item_select]").prop("checked",false);
	                $("#result_totlaPrice").html("0");
	            }
	        })
	    });
	    </script>

		<script>
		   	function countUp( cart_idx, item_order_amount ){
		   		var count_item = item_order_amount;
				count_item++;
				location.href='/cart_amount_update?count_item=' + count_item + '&cart_idx=' + cart_idx;
			};
			
			function countDown( cart_idx, item_order_amount ){
				var count_item = item_order_amount;
				if( count_item > 1 ){
					count_item--;
					location.href='/cart_amount_update?count_item=' + count_item + '&cart_idx=' + cart_idx;
				}
			}    
		</script>
		
		<script>
		    function check_item_cart() {
		        var check_count = document.getElementsByName("cart_item_select").length;
		 		var total_price = 0;
		        for (var i=0; i<check_count; i++) {
		            if (document.getElementsByName("cart_item_select")[i].checked == true) {
		                total_price += parseInt(document.getElementsByName("cart_item_select")[i].value);
		                total_price_result = total_price.toLocaleString();
		                document.getElementById("result_totlaPrice").innerHTML = total_price_result;
		            }
		        }
		    }

		</script>
		
		<script>
			function payment(){
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "/payment");

		        var check_count = document.getElementsByName("cart_item_select").length;
		        var count = 0;
		        var checked_count = 0;
		        var json = {};
		        
		        for (var i=0; i<check_count; i++) {
		            if (document.getElementsByName("cart_item_select")[i].checked == true) {
		            	
		            	checked_count++;
		            	json.checked_count = {item_index_i:document.getElementsByName("item_index_i")[i].value, user_id:document.getElementsByName("user_id")[i].value, count_item:document.getElementsByName("item_order_amount")[i].value, item_sale_price:document.getElementsByName("item_sale_price")[i].value, item_name:document.getElementsByName("item_name_i")[i].value, item_img:document.getElementsByName("item_img_i")[i].value}
		            	
	    		        for(var key in json.checked_count) {
	    		        	var name = key + checked_count;
	    			        var hiddenField = document.createElement("input");
	    			        hiddenField.setAttribute("type", "hidden");
	    			        hiddenField.setAttribute("name", name);
	    			        hiddenField.setAttribute("value", json.checked_count[key]);
	    			        form.appendChild(hiddenField);
	    			    }
	    		        
		            } else if( document.getElementsByName("cart_item_select")[i].checked == false ){
		            	count++;
		            }
		        }
		        
            	if( check_count == count ){
            		alert("선택된 상품이 없습니다.");
            	} else if( checked_count > 5 ){
            		alert("구매 가능한 아이템은 최대 5개까지 입니다.")
            	} else {
   					var hiddenField = document.createElement("input");
    		        hiddenField.setAttribute("type", "hidden");
    		        hiddenField.setAttribute("name", "count");
    		        hiddenField.setAttribute("value", checked_count);
    		        form.appendChild(hiddenField); 
            		
    				document.body.appendChild(form);
    				form.submit();
            	}
			}
			
		
		</script>
		