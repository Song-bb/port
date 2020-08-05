<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 공지사항 수정 -->


	<c:import url="header_management.jsp"></c:import>
	
    <div id="noticeboard_wrap">
        <div id="noticeboard_head">
            <h2>공지사항 수정하기</h2>
        </div>
        <form action="/notice_board_update_ok" method="POST">
       		<div id="noticeboard_body">
	            <table>
	                <c:forEach items="${ noticeboard_list }" var="dto">
		                <tr class="noticeboard_table_tr">
		                    <td class="noticeboard_table_update_td">
								제목 <input type="text" name="notice_title" value="${ dto.notice_title }"/>
							</td>
		                    <td class="noticeboard_table_update_td">
		                    	내용 <textarea>${ dto.notice_content }</textarea>
		                    </td>
		                </tr>
	                </c:forEach>
	            </table>
	        </div>
	        <div id="noticeboard_foot">
	            <button type="submit">수정하기</button>
	        </div>
        </form>
    </div>
	
    <c:import url="../footer.jsp"></c:import>