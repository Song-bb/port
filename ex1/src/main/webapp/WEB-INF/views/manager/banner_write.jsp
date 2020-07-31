<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 배너이미지 등록 -->

	<c:import url="header_management.jsp"></c:import>
	
	<div id="banner_write_wrap">
        <h3>배너등록</h3>
        <div class="banner_write">
        	<form action="/banner_writeOk" method="post" enctype="multipart/form-data">
	            <table>
	                <tr>
	                    <td>
	                        <input type="text" placeholder="제목" class="banner_title" name="banner_title">
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <span>이미지 등록 </span>
	                        <input type="file" name="upload_banner_img">
	                        <span>*메인 롤링배너 최소 1050px*350px 사이즈 권장</span>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                    	<span>링크 URL</span>
	                        <input type="text" class="banner_href" name="banner_href" value="http://">
	                    </td>
	                </tr>
	                <tr>
	                	<td class="submit_button"><input type="submit" value="등록하기"></td>
	                </tr>
	            </table>
	        </form>
		</div>
    </div><!-- /banner_img_wrap -->

	<c:import url="../footer.jsp"></c:import>