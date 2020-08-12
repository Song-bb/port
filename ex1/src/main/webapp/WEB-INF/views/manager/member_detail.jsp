<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 관리자페이지 > 회원 상세보기 -->


	<c:import url="header_management.jsp"></c:import>
	
	    <div id="member_manager_main_wrap">
        <div id="member_manager_main_title"><h3>회원 상세보기</h3></div>

        <div class="member_search_list">
            <form action="" method="post">
                <table class="member_search_list_table">       
                    <tr class="member_search_list_tr">
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td3">선택</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">번호</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">가입일</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">이름</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">아이디</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">회원 등급</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">생일</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">구매금액</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">적립금</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">메일</td>
                        <td class="member_search_list_td member_search_list_td2 member_search_list_td4">핸드폰번호</td>
                    </tr>
                    <c:forEach items="${ member_list }" var="dto">
                    <c:set var = "string1" value = "${ dto.join_date }"/>
                    <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
                    <tr class="member_search_list_tr">
                        <td class="member_search_list_td member_search_list_td3"><input type="checkbox" value="${dto.user_index}"></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}">${dto.user_index}</a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}">${string2}</a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}">${dto.user_name}</a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}">${dto.user_id}</a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}">${dto.user_grade}</a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}">${dto.user_birth}</a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}"><fmt:formatNumber value="${dto.buying_price}" pattern="###,###,###" /></a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}"><fmt:formatNumber value="${dto.user_point}" pattern="###,###,###" /></a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}">${dto.user_email}</a></td>
                        <td class="member_search_list_td member_search_list_td4"><a href="/member_detail?user_index=${dto.user_index}">${dto.user_phone}</a></td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="member_search_list_td5">
                    <button type="button" onclick="">선택한 회원 탈퇴</button>
                    <button type="button" onclick="">선택한 회원 적립금 지급</button>
                    <button type="button" onclick="">선택한 회원 등급 변경</button>
                </div>
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
	
	<script>
		function search_close() {
			var con = document.getElementById("member_manager_selectBox_bottom");
			var col = document.getElementById("member_manager_selectBox_serch_select_div_bottom_a");
			if( con.style.display == "none") {
				col.innerHTML = "상세검색 닫기";
				con.style.display = "block";
			} else {
				col.innerHTML = "상세검색 열기";
				con.style.display = "none";
			}
		}
	</script>
	