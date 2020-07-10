<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 이벤트페이지 -->

	<c:import url="../header.jsp"></c:import>
	
	<div id="event_wrap">
        <h3>이벤트</h3>
        <ul>
            <li class="event_content">
                <!-- 클릭 후 이벤트 게시판으로 이동 -->
                <a href="/event_sub"> 
                    <!-- 관리자 페이지에서 이벤트 등록할때 이벤트 이미지, 이미지설명alt, 제목, 내용(html등록가능), 
                    	조회수, 날짜, 최신등록순 정렬, 작성자 / DB연동  -->
                 <img src="img/event_banner_1.jpg" alt="이벤트">
                </a>
            </li>
            <li class="event_content">
                <a href="/event_sub">
                   <img src="img/event_banner_2.jpg" alt="이벤트">
                </a>
            </li>
            <li class="event_content">
                <a href="/event_sub">
                   <img src="img/event_banner_3.jpg" alt="이벤트">
                </a>
            </li>
            <li class="event_content">
                <a href="/event_sub">
                   <img src="img/event_banner_4.jpg" alt="이벤트">
                </a>
            </li>
            <li class="event_content">
                <a href="/event_sub">
                   <img src="img/event_banner_5.jpg" alt="이벤트">
                </a>
            </li>
        </ul>
    </div>

	<c:import url="../footer.jsp"></c:import>