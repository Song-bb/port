<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<c:import url="../header.jsp"></c:import>
	
	<div id="event_sub">
        <h3>이벤트</h3>
        <form>
	        <div id="event_board">
	            <div>${ dto.event_title }</div>
	            <div>
	                <span>기간 ${ dto.event_date }</span>
	                <span>조회수 : ${dto.event_hit }</span>
	            </div>
	            <div>
	             ${ dto.evnet_content }
	            </div>
	            <button class="button" type="submit" formaction="/event_main">목록</button>
	        </div>
        </form>
    </div>
	
	<c:import url="../footer.jsp"></c:import>