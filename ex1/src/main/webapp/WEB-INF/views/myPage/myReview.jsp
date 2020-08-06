<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 상품후기 -->

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
                    <a href=""><span class="myPage_main_profile2_1"><fmt:formatNumber value="${ user_point }" pattern="###,###,###" /></span><span class="myPage_main_profile2_1"> 원 </span>></a><br>
                    <br>
                </div>
            </div>  
        </div>
        <div>
            <div id="page_wrap">
                <div class="mypage_review_left">
                    <div class="mypage_review_title"><h3>마이과장</h3></div>
                    <div class="mypage_review_side_table_div">
                        <table class="mypage_review_side_table">
                            <tr>
                                <td><a href="/myPage_main?page=1"><div>주문 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myPage_main"><div>정기배송 내역<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/myCart"><div>장바구니<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td class="selected_page_td"><a href="/myReview"><div>상품후기<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="myPoint"><div>적립금<span>></span></div></a></td>
                            </tr>
                            <tr>
                                <td><a href="/check_password"><div>개인정보수정<span>></span></div></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="mypage_review_side_btn_div">
                        <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
                    </div>
                </div>
                <div class="mypage_review_right">
                    <div class="mypage_review_title">
                    	<h2>상품 후기</h2>
                    </div>
                    <table id="mypage_review_table">
                          <tr class="review_table_tr">
                              <td class="review_table_td_1">번호</td>
                              <td class="review_table_td_1">내용</td>
                              <td class="review_table_td_1">작성일</td>
                          </tr>
                        <c:forEach items="${ myReview }" var="dto">
                          <c:set var = "string1" value = "${ dto.write_date }"/>
                          <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
	                          <tr class="review_table_tr review_table_tr_click show">
	                              <td class="review_table_td_2">${ dto.user_index }</td>
	                              <td class="review_table_td_2 review_table_td_title">${ dto.review_content }</td>
	                              <td class="review_table_td_2">${ string2 }</td>
	                          </tr>
	                          <tr id="review_table_tr_hidden" class="hide">
	                              <td></td>
	                              <td id="review_table_td_hidden">
	                                      <p>상품명 : ${ dto.item_name }<br>
	                                      주문번호 : ${ dto.order_number }<br>
	                                      등록평점 : ${ dto.review_score }</p>
	                                      <br>
	                                      <br>
	                                      ${ dto.review_content }
	                              </td>
	                              <td></td>
	                          </tr>
					 </c:forEach>
                     </table>
                </div>
                </div>
            </div>
        </div>
	
	<!-- 
		<script>
	        $(document).ready(function(){
	            $('.show').click(function(){
	                $(this).next('.hide').toggle();
	            });
	        });
    	</script>
	 -->
	
	<c:import url="../footer.jsp"></c:import>