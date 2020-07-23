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
	            <th>글 수정</th>
	            <th>글 삭제</th>
	        </tr>
	        <c:forEach items="${ list }" var="dto" >
		        <tr>
		            <td>${dto.event_index}</td> <!-- 번호 -->
		            <td><a href="view?id=${dto.event_index}">${dto.event_title}</a></td><!-- 번호인덱스에 따른 제목 -->
		            <td><a href="delete?id=${dto.event_index}">수정버튼</a></td><!-- 번호인덱스에 따른 삭제 -->
		            <td><a href="delete?id=${dto.event_index}">삭제버튼</a></td><!-- 번호인덱스에 따른 삭제 -->
		        </tr>
	        </c:forEach>
	    </table>
	    <button class="event_writeForm_button"><a href="/manager_eventWrite"> 글작성</a></button>
    </div>
	
	<c:import url="../footer.jsp"></c:import>