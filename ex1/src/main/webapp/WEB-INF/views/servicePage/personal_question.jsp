<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 1:1 문의 -->

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
                        <td><a href="/fre_ask_questions"><div>자주하는 질문<span>></span></div></a></td>
                    </tr>
                    <tr>
                        <td class="selected_page_td"><a href="/personal_question"><div>1:1 문의<span>></span></div></a></td>
                    </tr>
                </table>
            </div>
            <div class="servicePage_side_btn_div">
                <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
            </div>
        </div>
        <div class="servicePage_right">
            <div class="servicePage_title">1:1 문의</div>
            <div class="office_board">
                <table class="office_board_table">
                    <tr class="office_board_table_tr">
                        <td class="fre_ask_table_td2 personal_td1">번호</td>
                        <td class="fre_ask_table_td2 personal_td2">카테고리</td>
                        <td class="fre_ask_table_td2 personal_td3 personal_th3">제목</td>
                        <td class="fre_ask_table_td2 personal_td4">작성자</td>
                        <td class="fre_ask_table_td2 personal_td5">작성일</td>
                    </tr>
                    <tr class="office_board_table_tr">
                        <td class="fre_ask_table_td2 personal_td1">2</td>
                        <td class="fre_ask_table_td2 personal_td2">주문/결제</a></td>
                        <td class="fre_ask_table_td2 personal_td3"><a href="">title2</a></td>
                        <td class="fre_ask_table_td2 personal_td4">장탱구</td>
                        <td class="fre_ask_table_td2 personal_td5">2020-07-12</td>
                    </tr>
                    <tr class="office_board_table_tr">
                        <td class="fre_ask_table_td2 personal_td1">1</td>
                        <td class="fre_ask_table_td2 personal_td2">배송문의</a></td>
                        <td class="fre_ask_table_td2 personal_td3"><a href="">title1</a></td>
                        <td class="fre_ask_table_td2 personal_td4">장희망</td>
                        <td class="fre_ask_table_td2 personal_td5">2020-07-12</td>
                    </tr>
                </table>
            </div>
            <div class="select_page_div">
                <table class="select_page_table">
                    <tr class="select_page_table_tr">
                        <td class="select_page_table_td"><a href="">&laquo;</a></td>
                        <td class="select_page_table_td"><a href="">&lt;</a></td>
                        <td class="select_page_table_td"><a href="">1</a></td>
                        <td class="select_page_table_td"><a href="">2</a></td>
                        <td class="select_page_table_td"><a href="">3</a></td>
                        <td class="select_page_table_td"><a href="">4</a></td>
                        <td class="select_page_table_td"><a href="">5</a></td>
                        <td class="select_page_table_td"><a href="">&gt;</a></td>
                        <td class="select_page_table_td"><a href="">&raquo;</a></td>
                    </tr>
                </table>
            </div>
            <div class="personal_que_write_btn_div">
                <button class="personal_que_write_btn" onclick="location.href='/personal_question_write'" type="button">글쓰기</button>
            </div>
        </div>
    </div>
    <div id="servicePage_main_end"></div>	
	
	<c:import url="../footer.jsp"></c:import>