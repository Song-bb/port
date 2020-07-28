<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 이벤트 등록페이지 -->


	<c:import url="header_management.jsp"></c:import>
	
		<div id="event_write_wrap">
	        <h3>이벤트 등록</h3>
	        <form action="/event_writeOk" method="post">
	            <table>
	                    <tr>
	                        <td>
	                            <input type="text" placeholder="제목" class="event_title" name="event_title">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        	<textarea type="text" class="event_content" name="event_content"></textarea>
	                           <!-- <input type="text" name="event_content" size="100"> -->
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <span>이미지 등록 </span>
	                            <input type="file" >
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
	                    <td class="submit_button"><input type="submit" value="등록하기"></td>
	                    </tr>
	            </table>
	        </form>
	    </div>

	<c:import url="../footer.jsp"></c:import>