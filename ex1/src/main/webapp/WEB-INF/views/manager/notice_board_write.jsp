<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 공지사항 작성 -->


	<c:import url="header_management.jsp"></c:import>
	
    <div id="noticeboard_wrap">
       <div id="noticeboard_head">
            <h2>공지사항 작성하기</h2>
        </div>
        <form action="/notice_board_write_ok" method="POST">
       		<div id="noticeboard_body">
	            <table>
	                <tr class="noticeboard_table_tr">
	                    <td class="noticeboard_table_update_td">
							제목 <input type="text" name="notice_title"/>
						</td>
	                    <td class="noticeboard_table_update_td">
	                    	내용 <textarea></textarea>
	                    </td>
	                </tr>
	            </table>
	        </div>
	        <div id="noticeboard_foot">
	            <button type="submit">글쓰기</button>
	        </div>
        </form>
    </div>
	
    <c:import url="../footer.jsp"></c:import>