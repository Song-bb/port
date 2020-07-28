<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 관리자페이지 > 이벤트 수정페이지 -->


	<c:import url="header_management.jsp"></c:import>
	
		<div id="event_write_wrap">
	        <h3>이벤트 수정</h3>
	        <form action="/event_updateOk" method="post">
				<c:forEach items="${ dtoE_update }" var="dtoE_update">
			            <table>
			           		<input type="hidden" name="event_index" value="${dtoE_update.event_index}" >
			                    <tr>
			                        <td>
			                            <input type="text" placeholder="제목" class="event_title" name="event_title" value="${dtoE_update.event_title}">
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                        	<input  type="text" class="event_content" name="event_content" value="${dtoE_update.event_content}"></input>
			                        	<textarea type="text" class="event_content" name="event_content" value="${dtoE_update.event_content}"></textarea>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <span>이미지 등록 </span>
			                            <input type="file" name="event_banner">
			                            <span>*메인 이벤트 썸네일 최소 340px*340px 사이즈 권장</span>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <span>이미지 등록</span>
			                             <input type="file" >
			                            <span>*이벤트 리스트 썸네일 최소 1050px*200px 사이즈 권장</p>
			                        </td>
			                    </tr>
			                    <tr>
			                    <td class="submit_button"><input type="submit" value="수정하기"></td>
			                    </tr>
			            </table>
				</c:forEach>
	        </form>
	    </div>

	<c:import url="../footer.jsp"></c:import>