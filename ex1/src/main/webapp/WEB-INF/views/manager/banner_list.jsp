<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 배너관리 -->

	<c:import url="header_management.jsp"></c:import>
	
	<div id="banner_img_wrap">
        <h3>배너관리</h3>
        <div class="main_banner">
	        <h4>Main Banner</h4>
	            <table>
	                <tr>
	                    <th></th>
	                    <th>미리보기</th>
	                    <th>링크</th>
	                    <th>수정</th>
	                    <th>삭제</th>
	                </tr>
	                
	                <c:forEach items="${dtoB_listView}" var="dtoB_listV">
	                <tr>
	                    <td class="width60"><input type="checkbox" name="" value=""></td>
	                    <td>
	                        <div class="banner_thumb">
	                            <img src="${ dtoB_listV.banner_img }" alt="${ dtoB_listV.banner_title }">
	                        </div>
	                    </td>
	                    <td><a href="${ dtoB_listV.banner_href }">${ dtoB_listV.banner_href }</a></td>
	                    <td class="update_banner width60"><a href="banner_update?banner_index=${ dtoB_listV.banner_index }">수정</a></td>
	                    <td class="delete_banner width60"><a href="banner_delete?banner_index=${ dtoB_listV.banner_index }">삭제</a></td>
	                </tr>
	                </c:forEach>
	                
	            </table>
	        <form action="/banner_write">
		    	<button class="banner_writeForm_button" type="submit">배너등록</button>
		    </form>
	    </div>
    </div><!-- /banner_img_wrap -->

	<c:import url="../footer.jsp"></c:import>