<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 자주하는질문 -->

	<c:import url="../header.jsp"></c:import>
	
	    <div id="page_wrap">
        <div class="servicePage_left">
            <div class="servicePage_title">고객센터</div>
            <div class="servicePage_side_table_div">
                <table class="servicePage_side_table">
                    <tr>
                        <td><div><a href="/servicePage_main">공지사항</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td class="selected_page_td"><div><a href="/fre_ask_questions">자주하는 질문</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td><div><a href="/personal_question">1:1 문의</div><div>></div></a></td>
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
                <form class="select_categori_form" action="" method="post">
                    <select class="select_categori_select" name="select1" >
                        <option value="1" selected="selected">선택</option>
                        <option value="2" >회원문의</option>
                        <option value="3">주문/결제</option>
                        <option value="4">취소/교환/반품</option>
                        <option value="5">배송문의</option>
                        <option value="6">적립금</option>
                        <option value="7">서비스이용 및 기타</option>
                    </select>
                </form>
            </div>
            <div class="office_board">
                <table class="office_board_table">
                    <tr class="office_board_table_tr">
                        <td class="fre_ask_table_td1 fre_ask_table_td">번호</td>
                        <td class="fre_ask_table_td2 fre_ask_table_td">카테고리</td>
                        <td class="fre_ask_table_td3 fre_ask_table_td">제목</td>
                    </tr>
                    <tr class="office_board_table_tr">
                        <td class="fre_ask_table_td1 fre_ask_table_data fre_ask_table_td">공지</td>
                        <td class="fre_ask_table_td2 fre_ask_table_data fre_ask_table_td">회원문의</td>
                        <td class="fre_ask_table_td3 fre_ask_table_data fre_ask_table_td"><a href="">title1</a></td>
                    </tr>
                    <tr class="office_board_table_tr">
                        <td class="fre_ask_table_td1 fre_ask_table_data fre_ask_table_td">공지</td>
                        <td class="fre_ask_table_td2 fre_ask_table_data fre_ask_table_td">주문/결제</td>
                        <td class="fre_ask_table_td3 fre_ask_table_data fre_ask_table_td"><a href="">title2</a></td>
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
            <div class="order_search_div">
                <div class="fre_ask_search">
                    <div>
                        <form class="fre_ask_search_form">
                            <input class="fre_ask_search_text" type="text">
                            <button class="fre_ask_search_btn" type="submit"><i id="fre_ask_search_btn_i" class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="fre_ask_end"></div>
	
	<c:import url="../footer.jsp"></c:import>