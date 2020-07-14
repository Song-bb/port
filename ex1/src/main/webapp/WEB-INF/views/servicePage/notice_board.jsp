<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!-- 공지사항 글 -->

	<c:import url="../header.jsp"></c:import>
	
    <div id="office_board_content">
        <div class="office_board_content_header">
            <a href="/main">홈</a> > 고객행복센터 > <span>공지사항</span>
        </div>
        <div class="servicePage_title">
            공지사항 <span>과일장수의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
        </div>
        <div class="office_board_table_div">
            <table class="office_board_table2">
                <tr class="office_board_table2_tr">
                    <th class="office_board_table2_th">제목</th>
                    <td class="office_board_table2_td" colspan="3">${ dto_notice_board.notice_title }</td>
                </tr>
                <tr class="office_board_table2_tr">
                    <th class="office_board_table2_th">작성자</th>
                    <td class="office_board_table2_td" colspan="3">${ dto_notice_board.notice_writer }</td>
                </tr>
                <tr class="office_board_table2_tr">
                    <th class="office_board_table2_th">작성일</th>
                    <td class="office_board_table2_td2">${ dto_notice_board.notice_date }</td>
                    <th class="office_board_table2_th">조회수</th>
                    <td class="office_board_table2_td3">${ dto_notice_board.notice_hit }</td>
                </tr>
                <tr class="office_board_table2_tr">
                    <td class="office_board_table2_td4" colspan="4">
                        ${ dto_notice_board.notice_content }
                    </td>
                </tr>
                <tr class="office_board_table2_tr">
                    <td class="office_board_table2_td5" colspan="4">
                        <button class="office_board_table2_btn" onclick="location.href='/servicePage_main'" type="button">목록</button>
                    </td>
                </tr>
                <tr class="office_board_table2_tr">
                    <td class="office_board_table2_td6">^ 이전글</td>
                    <td class="office_board_table2_td8" colspan="3"><a href="notice_board?notice_index=${ dto_notice_board_before.notice_index }">${ dto_notice_board_before.notice_title }</a></td>
                </tr>
                <tr class="office_board_table2_tr">
                    <td class="office_board_table2_td7">v 다음글</td>
                    <td class="office_board_table2_td9" colspan="3"><a href="notice_board?notice_index=${ dto_notice_board_after.notice_index }">${ dto_notice_board_after.notice_title }</a></td>
                </tr>
            </table>
        </div>
    </div>	

	
	<c:import url="../footer.jsp"></c:import>