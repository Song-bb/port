<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 이벤트페이지 -->

	<c:import url="../header.jsp"></c:import>
	
	<div id="event_wrap">
        <h3>이벤트</h3>
        <ul>
        	<c:forEach items="${dtoE_listView}" var="dto_listV">
	            <li class="event_content" style="background-image: url('${dto_listV.event_banner2}')">
	                <!-- 클릭 후 이벤트 게시판으로 이동 -->
	                
	                <a href="/event_sub?event_index=${ dto_listV.event_index }">
	                    <!-- 관리자 페이지에서 이벤트 등록할때 이벤트 이미지, 이미지설명alt, 제목, 내용(html등록가능), 
	                    	조회수, 날짜, 최신등록순 정렬, 작성자 / DB연동  -->	
	                </a>
	            </li>
            </c:forEach>
        </ul>
    </div>

	<c:import url="../footer.jsp"></c:import>