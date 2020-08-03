<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 마이페이지 메인 -->

	<c:import url="../header.jsp"></c:import>
	
	    <div id="page_wrap1">
        <div class="myPage_main_profile">
            <div class="myPage_main_profile_1">
                <div class="myPage_main_profile1">
                    <div class="myPage_main_profile1_gradle">
                        <div class="myPage_main_profile1_gradle_icon"><%= session.getAttribute("user_grade") %></div>
                        <div class="myPage_main_profile1_gradle_text1">
                            <strong><%= session.getAttribute("user_name") %> </strong>님<br>
                            <br>
                            5% 적립 + 최초 1회 무료배송
                        </div>
                    </div>
                    <div class="myPage_main_profile1_gradle2">
                        <a href="" class="myPage_main_profile1_gradle2_1">전체등급 보기</a>
                        <a href="" class="myPage_main_profile1_gradle2_2">다음 달 예상등급 보기</a>
                    </div>
                </div>
                <div class="myPage_main_profile2">
                    적립금<br>
                    <br>
                    <a href="/myPoint"><span class="myPage_main_profile2_1"><%= session.getAttribute("user_point") %></span><span class="myPage_main_profile2_1"> 원 </span>></a><br>
                    <br>
                    <a href="/myPoint"><span class="myPage_main_profile2_2">소멸예정 : <span>0</span> 원</span></a>
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
                                <td class="selected_page_td"><a href="/myPage_main"><div>주문 내역<span>></span></div></a></td>
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
                                <td class="order_board_table_td order_td4 order_td7">배송비</td>
                                <td class="order_board_table_td order_td5 order_td6">진행상태</td>
                            </tr>
                            <c:forEach items="${ my_order }" var="dto">
                            <tr class="order_board_table_tr">
                                <td class="order_board_table_td order_td1 order_td6"><a href="/myOrder">${ dto.order_number }</a></td>
                                <td class="order_board_table_td order_td2">
                                    <div class="order_td2_1">
                                        <a href="/myOrder"><img id="order_td2_1_img" src="${ dto.item_img }"></a>
                                    </div>
                                    <div class="order_td2_2">
                                        <a href="/myOrder">${ dto.item_text }</a>
                                    </div>
                                </td>
                                <td class="order_board_table_td order_td3 order_td7">${ dto.price_actual } 원<br>(${ dto.count }개)</td>
                                <td class="order_board_table_td order_td4 order_td7">${ dto.price_delevery } 원</td>
                                <td class="order_board_table_td order_td5">
                                    <div class="order_td5_2">
                                    												<!-- 팝업이벤트파일 : my_JS.js  -->				
                                            <button class="order_td5_2_1" type="button" onclick="reviewPop();">리뷰쓰기</button>
                                            <button class="order_td5_2_1" type="button" onclick="location.href=''">주문내역</button>
                                    </div>
                                    <div class="order_td5_1">${ dto.statement }</div>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div><!-- servicePage_right -->
            </div><!-- pageWrap -->
            <div id="servicePage_main_end"></div>
        </div><!-- pageWrap super -->
    </div><!-- page_wrap1 -->
    
	
	<c:import url="../footer.jsp"></c:import>
	
	<script>
		function select_year_myPage(){
			alert( "1");
			var year = document.getElementById('select_orderList_myPage').value;
	        var url = "/myPage_main_selectYear?year=" + year + "&page=1";
	        alert( url );
	        /*document.location.href=url;*/
		}
	</script>