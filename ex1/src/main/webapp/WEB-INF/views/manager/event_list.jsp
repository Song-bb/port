<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 이벤트 관리 -->


	<c:import url="header_management.jsp"></c:import>
	
	<div id="manager_eventList">
		    <table>
		        <tr>
		            <th>번호</th>
		            <th>제목</th>
		            <th>날짜</th>
		            <th>글 수정</th>
		            <th>글 삭제</th>
		        </tr>
		        <c:forEach items="${ dtoE_mainList }" var="dtoE_Mlist" >
			        <tr>
			            <td>${dtoE_Mlist.event_index}</td> <!-- 번호 -->
			            <td><a href="event_sub?event_index=${dtoE_Mlist.event_index}">${dtoE_Mlist.event_title}</a></td><!-- 번호인덱스에 따른 제목 -->
			            <td><a href="event_sub?event_index=${dtoE_Mlist.event_index}">${dtoE_Mlist.event_date}</a></td><!-- 번호인덱스에 따른 날짜 -->
			            <td><a href="event_update?event_index=${dtoE_Mlist.event_index}">수정버튼</a></td><!-- 번호인덱스에 따른 수정 -->
			            <td><a href="event_delete?event_index=${dtoE_Mlist.event_index}">삭제버튼</a></td><!-- 번호인덱스에 따른 삭제 -->
			        </tr>
		        </c:forEach>
		    </table>
	    <button class="event_writeForm_button"><a href="/event_write"> 글작성</a></button>
    </div>
	
	<c:import url="../footer.jsp"></c:import>