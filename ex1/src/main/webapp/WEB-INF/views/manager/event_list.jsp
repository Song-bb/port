<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 이벤트 관리 -->


	<c:import url="header_management.jsp"></c:import>
	
	<div id="manager_eventList">
        <form>
            <table>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글 수정</th>
                    <th>글 삭제</th>
                </tr>
                <c:forEach items="${ list }" var="dto" >
                <tr>
                    <td>${dto.event_index}</td>
                    <td><a href="view?id=${dto.event_index}">${dto.event_title}</a></td>
                    <td><a href="delete?id=${dto.event_index}">삭제버튼</a></td>
                </tr>
                </c:forEach>
            </table>
            <button class="event_writeForm_button"><a href="event_writeForm">글작성</a></button>
        </form>
    </div>
	
	<c:import url="../footer.jsp"></c:import>