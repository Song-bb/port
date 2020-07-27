<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 관리자페이지 > 탈퇴회원 -->


	<c:import url="header_management.jsp"></c:import>

	
	<div id="member_manager_main_wrap">
        <div id="member_manager_main_title"><h3>탈퇴회원 리스트</h3></div>

        <div class="member_grade_text_bottom">
            <label class="member_grade_text_label">${ leave_member_count } 건의 검색 결과가 있습니다.</label>
        </div>
        <div class="member_search_list">
            <form action="" method="post">
                <table class="member_search_list_table">       
                    <tr class="member_search_list_tr">
                        <td class="member_search_list_td member_search_list_td2 leave_member_table_1">번호</td>
                        <td class="member_search_list_td member_search_list_td2 leave_member_table_2">아이디</td>
                        <td class="member_search_list_td member_search_list_td2 leave_member_table_3">탈퇴사유</td>
                        <td class="member_search_list_td member_search_list_td2 leave_member_table_4">탈퇴메세지</td>
                        <td class="member_search_list_td member_search_list_td2 leave_member_table_5">탈퇴일자</td>
                    </tr>
                    <c:forEach items="${ leave_member }" var="dto">
                    <c:set var = "string1" value = "${ dto.date_of_leave }"/>
                    <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
                    <tr class="member_search_list_tr">
                        <td class="member_search_list_td leave_member_table_1">${dto.idx}</td>
                        <td class="member_search_list_td leave_member_table_2">${dto.user_id}</td>
                        <td class="member_search_list_td leave_member_table_3">${dto.reason}</td>
                        <td class="member_search_list_td leave_member_table_4 leave_member_table_6">${dto.reason_content}</td>
                        <td class="member_search_list_td leave_member_table_5">${string2}</td>
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