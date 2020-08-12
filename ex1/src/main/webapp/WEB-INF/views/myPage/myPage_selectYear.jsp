<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 마이페이지 메인 -->

	<c:import url="../header.jsp"></c:import>
	
	    <div id="page_wrap1">
        <div class="myPage_main_profile">
            <div class="myPage_main_profile_1">
                <div class="myPage_main_profile1">
                    <div class="myPage_main_profile1_gradle">
                        <div class="myPage_main_profile1_gradle_icon">${ user_grade }</div>
                        <div class="myPage_main_profile1_gradle_text1">
                            <strong>${ user_name } </strong>님<br>
                            <br>
                            5% 적립 + 최초 1회 무료배송
                        </div>
                    </div>
                    <div class="myPage_main_profile1_gradle2">
                        <a href="" class="myPage_main_profile1_gradle2_1">전체등급 보기</a>
                    </div>
                </div>
                <div class="myPage_main_profile2">
                    적립금<br>
                    <br>
                    <a href="/myPoint"><span class="myPage_main_profile2_1"><fmt:formatNumber value="${ user_point }" pattern="###,###,###" /></span><span class="myPage_main_profile2_1"> 원 </span>></a><br>
                    <br>
                </div>
            </div>  
        </div>
        <div>
            <div id="page_wrap">
                <div class="servicePage_left">
                    <div class="servicePage_title">마이과장</div>
                    <div class="servicePage_side_table_div">
                        <table class="servicePage_side_table">
                            <tr>
                                <td class="selected_page_td"><a href="/myPage_main?page=1"><div>주문 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myRegularorder"><div>정기배송 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myCart"><div>장바구니<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myReview"><div>상품후기<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myPoint"><div>적립금<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/check_password"><div>개인정보수정<span>></span></div></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="servicePage_side_btn_div">
                        <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
                    </div>
                </div>
                <div class="servicePage_right">
                    <div class="servicePage_title servicePage_title_1">주문 내역 <span>지난 3년간의 주문 내역 조회가 가능합니다.</span></div>
                    <div class="select_categori2">
                        <form class="select_categori_form2" action="" method="post">
                            <select onChange="select_year_myPage()" id="select_orderList_myPage" class="select_categori_select2" name="select2" >
                                <option value="" selected="selected">전체기간</option>
                                <option value="2020" >2020년</option>
                                <option value="2019">2019년</option>
                                <option value="2018">2018년</option>
                            </select>
                        </form>
                    </div>
                    <div class="order_board">
                        <table class="order_board_table">
                            <tr class="order_board_table_tr">
                                <td class="order_board_table_td order_td1 order_td6">주문번호</td>
                                <td class="order_board_table_td order_td2 order_td6">상품정보</td>
                                <td class="order_board_table_td order_td3 order_td7">상품금액<br>(수량)</td>
                                <td class="order_board_table_td order_td4 order_td7">총금액</td>
                                <td class="order_board_table_td order_td5 order_td6">결제정보</td>
                            </tr>
                            <c:forEach items="${ paymentList }" var="dto">
                            <tr class="order_board_table_tr">
                                <td class="order_board_table_td order_td1 order_td6"><a href="/myOrder?orderNumber=${dto.order_number}">${ dto.order_number }</a></td>
                                <td class="order_board_table_td order_td2">
                                    <div class="order_td2_1">
                                        <a href="/myOrder?orderNumber=${dto.order_number}"><img id="order_td2_1_img" src="${ dto.item_img1 }"></a>
                                    </div>
                                    <div class="order_td2_2">
                                        <a href="/myOrder?orderNumber=${dto.order_number}">${ dto.item_name1 }</a>
                                    </div>
                                </td>
                                <td class="order_board_table_td order_td3 order_td7"><fmt:formatNumber value="${ dto.item_sellingPrice1 }" pattern="###,###,###" /> 원<br>(${ dto.item_count1 }개)</td>
                                <td class="order_board_table_td order_td4 order_td7"><fmt:formatNumber value="${ dto.item_total_price1 }" pattern="###,###,###" /> 원</td>
                                <td class="order_board_table_td order_td5">
                                    <div class="order_td5_2">
                                        <button class="order_td5_2_1" type="button" onclick="reviewPop(${dto.order_number});">리뷰쓰기</button>
                                        <button class="order_td5_2_1" type="button" onclick="location.href='/myOrder?orderNumber=${dto.order_number}'">주문상세</button>
                                    </div>
                                    <div class="order_td5_1">${ dto.payment }</div>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <%-- <div class="member_manager_select_page">
			            <table class="member_manager_select_page_table">
			                <tr>
			               		<td class="member_manager_select_page_td"><a href="/myPage_main?page=1"><<</a></td>
			               		<c:if test = "${ myOrder_page != 1 }">
			               			<td class="member_manager_select_page_td"><a href="/myPage_main?page=${myOrder_page-1}"><</a></td>
			               		</c:if>
								<c:forEach var="index" begin="${ startPage }" end="${ max_page }">
									<td class="member_manager_select_page_td"><a href="/myPage_main?page=${index}">${index}</a></td>
								</c:forEach>
								<c:if test = "${ myOrder_page != lastPage }">
									<td class="member_manager_select_page_td"><a href="/myPage_main?page=${myOrder_page+1}">></a></td>
								</c:if>
								<td class="member_manager_select_page_td"><a href="/myPage_main?page=${lastPage}">>></a></td>
			                </tr>
			            </table>
        			</div>  --%>
                </div><!-- servicePage_right -->
            </div><!-- pageWrap -->
            <div id="servicePage_main_end"></div>
        </div><!-- pageWrap super -->
    </div><!-- page_wrap1 -->
    
	
	<c:import url="../footer.jsp"></c:import>
	
	<script>
		function select_year_myPage(){
			var year = document.getElementById('select_orderList_myPage').value;
	        var url = "/myPage_main_selectYear?year=" + year + "&page=1";
	        document.location.href=url;
		}
		
		function reviewPop(order_number) { 
			var url = "/myReview_write?orderNumber=" + order_number;
			window.open(url, "a", "width=600, height=800, left=200, top=0"); 
		}
	</script>