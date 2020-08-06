<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 고객센터 > 공지사항 -->

	<c:import url="../header.jsp"></c:import>
	
    <div id="page_wrap">
        <div class="servicePage_left">
            <div class="servicePage_title">고객센터</div>
            <div class="servicePage_side_table_div">
                <table class="servicePage_side_table">
                    <tr>
                        <td class="selected_page_td"><a href="/servicePage_main"><div>공지사항<span>></span></div></a></td>
                    </tr>
                    <tr>
                        <td><a href="/fre_ask_questions"><div>자주하는 질문<span>></span></div></a></td>
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
            <div class="servicePage_title">공지사항 <span>과일장수의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></div>
            <div class="office_board">
                <table class="office_board_table">
                    <tr class="office_board_table_tr">
                        <td class="office_board_table_td office_td1">번호</td>
                        <td class="office_board_table_td office_td2">제목</td>
                        <td class="office_board_table_td office_td3">작성자</td>
                        <td class="office_board_table_td office_td4">작성일</td>
                        <td class="office_board_table_td office_td5">조회</td>
                    </tr>
                    <c:forEach items="${ notice_board_list }" var="dto">
                    <tr class="office_board_table_tr">
                        <td class="office_board_table_td office_td1">${ dto.notice_index }</td>
                        <td class="office_board_table_td office_td2"><a href="notice_board?notice_index=${ dto.notice_index }">${ dto.notice_title }</a></td>
                        <td class="office_board_table_td office_td3">${ dto.notice_writer }</td>
                        <td class="office_board_table_td office_td4">${ dto.notice_date }</td>
                        <td class="office_board_table_td office_td5">${ dto.notice_hit }</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="order_search_div">
            	<form action="/notice_board_search" method="post">
	                <div class="order_search_filter">
	                    <label class="order_search_filter_label order_search_filter_label1">검색어</label> 
	                    <label class="order_search_filter_label"><input type="radio" name="search_filter" value="notice_index">번호</label>
	                    <label class="order_search_filter_label"><input type="radio" name="search_filter" value="notice_title">제목</label>
	                    <label class="order_search_filter_label"><input type="radio" name="search_filter" value="notice_content">내용</label>
	                </div>
                	<div class="order_search_filter2">
	                    <div>
	                    	<div class="order_search_form">
		                    	<input class="order_search_form_text" type="text" name="search_text">
			                    <button class="order_search_form_btn" type="submit"><i id="search_btn_i" class="fa fa-search order_search_form_btn_i"></i></button>
	                    	</div>
	                    </div>
                	</div>
                </form>
            </div>
        </div>
    </div>
    <div id="servicePage_main_end"></div>
	
	<c:import url="../footer.jsp"></c:import>
