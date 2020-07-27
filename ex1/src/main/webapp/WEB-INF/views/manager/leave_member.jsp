<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 관리자페이지 > 탈퇴회원 -->


	<c:import url="header_management.jsp"></c:import>

	
	<div id="member_manager_main_wrap">
        <div id="member_manager_main_title"><h3>탈퇴회원 리스트</h3></div>
        <form method="post">
	        <div class="member_manager_selectBox">
	            <div class="member_manager_selectBox_serch">
	                <div class="member_manager_selectBox_serch_select_div">
                        <select class="member_manager_selectBox_serch_select" name="leave_member_categori">
                            <option value="">선택하세요</option>
                            <option value="categori">탈퇴사유</option>
                            <option value="date_of_leave">탈퇴한날</option>
                        </select>
                        <input type="text" placeholder="내용을 입력해 주세요." class="member_manager_selectBox_serch_search" name="search_text">
                        <button type="submit" formaction="/leave_member_search" class="member_manager_selectBox_serch_btn">검색</button>
	                </div>
	            </div>
	        </div>
        </form>
        <div class="member_grade_text_bottom">
            <label class="member_grade_text_label">0 건의 검색 결과가 있습니다.</label>
        </div>
        <div class="member_search_list">
            <form action="" method="post">
                <table class="member_search_list_table">       
                    <tr class="member_search_list_tr">
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td3">번호</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">아이디</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">탈퇴사유</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">탈퇴메세지</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">탈퇴일자</td>
                    </tr>
                    <c:forEach items="${ member_list }" var="dto">
                    <c:set var = "string1" value = "${ dto.join_date }"/>
                    <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
                    <tr class="member_search_list_tr">
                        <td class="member_search_list_td member_search_list_td4">${string2}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_name}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_id}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_grade}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_birth}</td>
                    </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
        <div class="member_manager_select_page">
            <table class="member_manager_select_page_table">
                <tr>
                    <td class="member_manager_select_page_td"><a href=""><<</a></td>
                    <td class="member_manager_select_page_td"><a href=""><</a></td>
                    <td class="member_manager_select_page_td"><a href="">1</a></td>
                    <td class="member_manager_select_page_td"><a href="">2</a></td>
                    <td class="member_manager_select_page_td"><a href="">3</a></td>
                    <td class="member_manager_select_page_td"><a href="">4</a></td>
                    <td class="member_manager_select_page_td"><a href="">5</a></td>
                    <td class="member_manager_select_page_td"><a href="">></a></td>
                    <td class="member_manager_select_page_td"><a href="">>></a></td>
                </tr>
            </table>
        </div>  

    </div>
	
	<c:import url="../footer.jsp"></c:import>