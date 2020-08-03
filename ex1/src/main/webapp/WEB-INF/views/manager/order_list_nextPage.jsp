<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 주문관리 -->


	<c:import url="header_management.jsp"></c:import>
	
    <div class="order_list_wrap">
        <div class="order_list_title">
            <h3>주문 내역</h3> 
        </div>
        <div class="order_list_categori">
            <select onChange="select_year()" id="select_orderList" class="select_categori_orderList" name="select_orderList" >
                <option value="" selected="selected">전체기간</option>
                <option value="2020" >2020년</option>
                <option value="2019">2019년</option>
                <option value="2018">2018년</option>
            </select>
        </div>
        <div class="orderList">
            <table class="orderList_table">
                <tr class="orderList_table_tr">
                    <td class="orderList_table_td orderList_table_td1">주문번호</td>
                    <td class="orderList_table_td orderList_table_td2">상품정보</td>
                    <td class="orderList_table_td orderList_table_td3">상품금액<br>(수량)</td>
                    <td class="orderList_table_td orderList_table_td4">배송비</td>
                    <td class="orderList_table_td orderList_table_td5">진행상태</td>
                </tr>
                <c:forEach items="${ order_list }" var="dto">
	                <tr class="orderList_table_tr">
	                    <td class="orderList_table_td orderList_table_td1"><a href="">${ dto.order_number }</a></td>
	                    <td class="orderList_table_td orderList_table_td2">
	                        <div class="orderList_table_td_1">
	                            <a href=""><img id="orderList_table_img" src="${ dto.item_img }"></a>
	                        </div>
	                        <div class="orderList_table_td_2">
	                        	<a href="">${ dto.item_text }</a>
	                        </div>
	                    </td>
	                    <td class="orderList_table_td orderList_table_td3_1">${ dto.price_item } 원<br>(${ dto.count } 개)</td>
	                    <td class="orderList_table_td orderList_table_td3_1">${ dto.price_delevery } 원</td>
	                    <td class="orderList_table_td orderList_table_td5">${ dto.statement }</td>
	                </tr>
                </c:forEach>
            </table>
        </div>

        <div class="order_list_select_page">
            <table class="order_list_select_page_table">
                <tr>
               		<td class="order_list_select_page_td"><a href="/order_list_nextPage?page=1"><<</a></td>
               		<c:if test = "${ orderList_page != 1 }">
               			<td class="order_list_select_page_td"><a href="/order_list_nextPage?page=${orderList_page-1}"><</a></td>
               		</c:if>
					<c:forEach var="index" begin="${ startPage }" end="${ max_page }">
						<td class="order_list_select_page_td"><a href="/order_list_nextPage?page=${index}">${index}</a></td>
					</c:forEach>
					<c:if test = "${ orderList_page != lastPage }">
						<td class="order_list_select_page_td"><a href="/order_list_nextPage?page=${orderList_page+1}">></a></td>
					</c:if>
					<td class="order_list_select_page_td"><a href="/order_list_nextPage?page=${lastPage}">>></a></td>
                </tr>
            </table>
        </div>  

    </div>
	
	<c:import url="../footer.jsp"></c:import>
	
	<script>
	function select_year(){
		var year = document.getElementById('select_orderList').value;
        var url = "/order_list_selectYear?year=" + year + "&page=1";
        document.location.href=url;
	}
	</script>