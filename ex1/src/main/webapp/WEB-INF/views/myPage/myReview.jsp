<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상품후기 -->

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
                    <a href=""><span class="myPage_main_profile2_1"><%= session.getAttribute("user_point") %></span><span class="myPage_main_profile2_1"> 원 </span>></a><br>
                    <br>
                    <a href=""><span class="myPage_main_profile2_2">소멸예정 : <span>0</span> 원</span></a>
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
                                <td><a href="/myPage_main"><div>주문 내역<span>></span></div></a></td>
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
                                <td><a href="updateInform"><div>개인정보수정<span>></span></div></a></td>
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
                              <td class="review_table_td_1">제목</td>
                              <td class="review_table_td_1">조회</td>
                              <td class="review_table_td_1">작성일</td>
                          </tr>
                          <tr class="review_table_tr review_table_tr_click show">
                              <td class="review_table_td_2">1</td>
                              <td class="review_table_td_2 review_table_td_title">마음에 들어요~</td>
                              <td class="review_table_td_2">22</td>
                              <td class="review_table_td_2">2020-07-02</td>
                          </tr>
                          <tr id="review_table_tr_hidden" class="hide">
                              <td></td>
                              <td id="review_table_td_hidden">
                                      <p>상품명 : 알찬사과 200g외<br>
                                      주문번호 : 202007020001<br>
                                      등록평점 : 4.5</p>
                                      <br>
                                      <br>
                                      과일이 아주 신선해요~ 다음에 또 주문할게요~
                              </td>
                              <td></td>
                              <td></td>
                          </tr>
                          <tr class="review_table_tr review_table_tr_click show">
                              <td class="review_table_td_2">2</td>
                              <td class="review_table_td_2 review_table_td_title">최고에요~</td>
                              <td class="review_table_td_2">12</td>
                              <td class="review_table_td_2">2020-07-04</td>
                          </tr>
                           <tr id="review_table_tr_hidden" class="hide">
                              <td></td>
                              <td id="review_table_td_hidden">
                                      <p>상품명 : 알찬사과 200g외<br>
                                      주문번호 : 202007020001<br>
                                      등록평점 : 4.5</p>
                                      <br>
                                      <br>
                                      과일이 아주 신선해요~ 다음에 또 주문할게요~
                              </td>
                              <td></td>
                              <td></td>
                          </tr>
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