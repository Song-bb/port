<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 공지사항관리 -->


	<c:import url="header_management.jsp"></c:import>
	
    <div id="noticeboard_wrap">
        <div id="noticeboard_head">
            <h2>공지사항 목록</h2>
        </div>
        <div id="noticeboard_body">
            <table>
                <tr class="noticeboard_table_tr">
                    <th class="noticeboard_table_th notice_index">인덱스</th>
                    <th class="noticeboard_table_th notice_title">제목</th>
                    <th class="noticeboard_table_th notice_date">날짜</th>
                    <th class="noticeboard_table_th notice_user">작성자</th>
                </tr>
                <c:forEach items="${ noticeboard_list }" var="dto">
	                <tr class="noticeboard_table_tr">
	                    <td class="noticeboard_table_td">${ dto.notice_index }</td>
	                    <td class="noticeboard_table_td"><a href="notice_board_update?notice_index=${ dto.notice_index }">${ dto.notice_title }</a></td>
	                    <td class="noticeboard_table_td">${ dto.notice_date }</td>
	                    <td class="noticeboard_table_td">${ dto.notice_writer }</td>
	                </tr>
                </c:forEach>
            </table>
        </div>
        <div id="noticeboard_foot">
            <button><a href="notice_board_write">글 쓰기</a></button>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>