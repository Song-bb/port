<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 이벤트 관리 -->


	<c:import url="header_management.jsp"></c:import>
	
	<div id="manager_eventList">
	<h3>이벤트관리</h3>
	    <table>
	        <tr>
	            <th>번호</th>
	            <th>제목</th>
	            <th>날짜</th>
	            <th>조회수</th>
	            <th>글수정</th>
	            <th>글삭제</th>
	        </tr>
	        <c:forEach items="${ dtoE_mainList }" var="dtoE_Mlist" >
		        <tr>
		            <td>${dtoE_Mlist.event_index}</td> <!-- 번호 -->
		            <td class="event_title"><a href="event_sub?event_index=${dtoE_Mlist.event_index}">${dtoE_Mlist.event_title}</a></td><!-- 번호인덱스에 따른 제목 -->
		            <td><a href="event_sub?event_index=${dtoE_Mlist.event_index}">${dtoE_Mlist.event_date}</a></td><!-- 번호인덱스에 따른 날짜 -->
		            <td>${dtoE_Mlist.event_hit}</td> <!-- 번 -->
		            <td class="event_change_btn"><a href="event_update?event_index=${dtoE_Mlist.event_index}">수정</a></td><!-- 번호인덱스에 따른 수정 -->
		            <td class="event_delete_btn"><a href="event_delete?event_index=${dtoE_Mlist.event_index}">삭제</a></td><!-- 번호인덱스에 따른 삭제 -->
		        </tr>
	        </c:forEach>
	    </table>
	    <form action="/event_write">
	    	<button class="event_writeForm_button" type="submit">글작성</button>
	    </form>
    </div>
	
	<c:import url="../footer.jsp"></c:import>