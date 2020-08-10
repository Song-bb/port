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
                    </td>
                    <td> <div class="cart_info_name"><a href="item_detail?idx=${ cart.item_idx }">${ cart.item_name }</a></div></td>
                    <td><div class="cart_info_saleprice"></div><fmt:formatNumber value="${ cart.item_sale_price }" pattern="###,###,###" /><br>원</td>
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
	            	<p id="checkbox_text">전체선택</p>
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
		        for (var i=0; i<check_count; i++) {
		            if (document.getElementsByName("cart_item_select")[i].checked == true) {
		                total_price += parseInt(document.getElementsByName("cart_item_select")[i].value);
		                total_price_result = total_price.toLocaleString();
		                document.getElementById("result_totlaPrice").innerHTML = total_price_result;
		            }
		        }
				var user_id1 = document.getElementById("user_id").value;
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
				window.close();
			}
			}
		
		</script>
		