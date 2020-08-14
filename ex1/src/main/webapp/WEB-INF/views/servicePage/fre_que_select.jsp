<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 자주하는질문 > 카테고리 선택 -->

	<c:import url="../header.jsp"></c:import>
	
	    <div id="page_wrap">
        <div class="servicePage_left">
            <div class="servicePage_title">고객센터</div>
            <div class="servicePage_side_table_div">
                <table class="servicePage_side_table">
                    <tr>
                        <td><a href="/servicePage_main"><div>공지사항<span>></span></div></a></td>
                    </tr>
                    <tr>
                        <td class="selected_page_td"><a href="/fre_ask_questions"><div>자주하는 질문<span>></span></div></a></td>
                    </tr>
                    <tr>
                        <td><a href="/personal_question"><div>1:1 문의<span>></span></div></a></td>
                    </tr>
                </table>
            </div>
            <div class="servicePage_side_btn_div">
                <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
            </div>
        </div>
        <div class="servicePage_right">
            <div class="servicePage_title">자주하는 질문 <span>고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span></div>
            <div class="select_categori">
                <div class="select_categori_form">
                    <select class="select_categori_select" name="select1" onchange="location.href=this.value" >
                        <option selected="selected" value="fre_ask_questions">선택</option>
                        <option value="fre_que_select?select=member" >회원문의</option>
                        <option value="fre_que_select?select=order">주문/결제</option>
                        <option value="fre_que_select?select=cancel">취소/교환/반품</option>
                        <option value="fre_que_select?select=delivery">배송문의</option>
                        <option value="fre_que_select?select=point">적립금</option>
                        <option value="fre_que_select?select=service">서비스이용 및 기타</option>
                    </select>
                </div>
            </div>
            <div class="office_board">
                <table class="office_board_table">
                    <tr class="office_board_table_tr">
                        <td class="fre_ask_table_td1 fre_ask_table_td">번호</td>
                        <td class="fre_ask_table_td2 fre_ask_table_td">카테고리</td>
                        <td class="fre_ask_table_td3 fre_ask_table_td fre_ask_table_td4">제목</td>
                    </tr>
                    <c:forEach items="${ dto_fre_ask_select }" var="dto1">
	                    <tr class="office_board_table_tr show">
	                        <td class="fre_ask_table_td1 fre_ask_table_data fre_ask_table_td">${ dto1.idx }</td>
	                        <td class="fre_ask_table_td2 fre_ask_table_data fre_ask_table_td">${ dto1.categori_text }</td>
	                        <td class="fre_ask_table_td3 fre_ask_table_data fre_ask_table_td"><a>${ dto1.title }</a></td>
	                    </tr>
	                    <tr class="office_board_table_tr hide" >
	                        <td class="fre_ask_table_data fre_ask_table_td5" colspan="3"><img src="img/answer.png"> ${ dto1.content }</td>
	                    </tr>
	                </c:forEach>
                </table>
            </div>

            <div class="order_search_div">
                <div class="fre_ask_search">
                    <div>
                        <form class="fre_ask_search_form" action="fre_ask_search">
                            <input class="fre_ask_search_text" type="text" name="search_text">
                            <button class="fre_ask_search_btn" type="submit"><i id="fre_ask_search_btn_i" class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="fre_ask_end"></div>
	
	<c:import url="../footer.jsp"></c:import>