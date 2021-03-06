<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 관리자페이지 > 회원관리 -->


	<c:import url="header_management.jsp"></c:import>
	
	    <div id="member_manager_main_wrap">
        <div id="member_manager_main_title"><h3>회원리스트</h3></div>
        <form method="post">
	        <div id="member_manager_selectBox_bottom">
	            <div class="member_manager_selectBox_serch_bottom">
	                <div class="member_manager_selectBox_serch_bottom_div">
	                    <table class="member_manager_selectBox_serch_bottom_div_table">
	                        <tr class="member_manager_selectBox_serch_bottom_div_tr">
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td1">가입일</td>
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td2"><input type="date" name="date_min">~<input type="date" name="date_max"></td>
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td3">구매 금액</td>
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td4"><input type="text" name="buying_min">원 ~ <input type="text" name="buying_max">원</td>
	                        </tr>
	                        <tr class="member_manager_selectBox_serch_bottom_div_tr">
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td1">회원 등급</td>
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td2">
	                                <select name="grade">
	                                	<option value="">선택하세요</option>
	                                    <option value="앵두">앵두</option>
	                                    <option value="자두">자두</option>
	                                    <option value="복숭아">복숭아</option>
	                                    <option value="과일매니저">과일매니저</option>
	                                </select>
	                            </td>
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td3">적립금</td>
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td4"><input type="text" name="point_min">원 ~ <input type="text" name="point_max">원</td>
	                        </tr>
	                        <tr class="member_manager_selectBox_serch_bottom_div_tr">
	                        	<input type="hidden" value="1" name="page">
	                            <td class="member_manager_selectBox_serch_bottom_div_td member_td5" colspan="4"><button type="submit" formaction="/search_detail_member">상세 검색</button></td>
	                        </tr>
	                    </table>
	                </div>
	            </div>
	        </div>
        </form>
        <div class="member_grade_text">
            <label class="member_grade_text_label"><i class="fas fa-caret-right"></i> 회원등급 : 1. 앵두 회원(${ member_count_1 } 명), 2. 자두 회원(${ member_count_2 } 명), 3. 복숭아 회원(${ member_count_3 } 명), 4. 과일매니저(${ member_count_4 } 명) 5. 회원수 총(${ member_total_count} 명)</label>
        </div>
        <div class="member_grade_text_bottom">
            <label class="member_grade_text_label">${ list_count } 건의 검색 결과가 있습니다.</label>
        </div>
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
                        <td class="member_search_list_td member_search_list_td3"><input type="radio" name="selected_checkbox" value="${dto.user_index}"></td>
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
                    <button type="button" onclick="withdraw_member_pop()" class="member_search_list_td5_btn">선택한 회원 탈퇴</button>
                    <button type="button" onclick="member_point_pop()" class="member_search_list_td5_btn">선택한 회원 적립금 지급</button>
                    <button type="button" onclick="member_grade_pop()" class="member_search_list_td5_btn">선택한 회원 등급 변경</button>
                </div>
            </form>
        </div>
        <div class="member_manager_select_page">
            <table class="member_manager_select_page_table">
                <tr>
               		<td class="member_manager_select_page_td"><a href="/member_nextPage?page=1"><<</a></td>
               		<c:set var="current_page" value="${current_page}" />
               		<c:if test = "${ current_page != 1 }">
               			<td class="member_manager_select_page_td"><a href="/member_nextPage?page=${current_page-1}"><</a></td>
               		</c:if>
					<c:forEach var="index" begin="1" end="${ max_page }">
						<td class="member_manager_select_page_td"><a href="/member_nextPage?page=${index}">${index}</a></td>
					</c:forEach>
					<c:set var="nextPage" value="${lastPage}" />
					<c:if test = "${ current_page != lastPage }">
						<td class="member_manager_select_page_td"><a href="/member_nextPage?page=${current_page+1}">></a></td>
					</c:if>
					<td class="member_manager_select_page_td"><a href="/member_nextPage?page=${lastPage}">>></a></td>
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
		
		function withdraw_member_pop() { 
			var data = document.getElementsByName('selected_checkbox');
			var data_value; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
			for(var i=0; i<data.length; i++) {
			    if(data[i].checked) {
			    	data_value = data[i].value;
			    }
			}
			if( data_value == undefined ){
				alert("탈퇴하실 회원을 선택해주세요.");
			} else {
				var url = "/withdraw_member_pop?member=" + data_value;
				window.open(url, "withdraw_member", "width=505, height=515, left=200, top=0"); 
			}
		}
		
		function member_point_pop() { 
			var data = document.getElementsByName('selected_checkbox');
			var data_value;
			for(var i=0; i<data.length; i++) {
			    if(data[i].checked) {
			    	data_value = data[i].value;
			    }
			}
			if( data_value == undefined ){
				alert("적립금 추가/삭감할 회원을 선택해주세요.");
			} else {
				var url = "/member_point_pop?index=" + data_value;
				window.open(url, "member_point_pop", "width=505, height=515, left=200, top=0"); 
			}
		}
		
		function member_grade_pop() { 
			var data = document.getElementsByName('selected_checkbox');
			var data_value;
			for(var i=0; i<data.length; i++) {
			    if(data[i].checked) {
			    	data_value = data[i].value;
			    }
			}
			if( data_value == undefined ){
				alert("등급 변경할 회원을 선택해주세요.");
			} else {
				var url = "/member_grade_pop?index=" + data_value;
				window.open(url, "member_point_pop", "width=505, height=515, left=200, top=0"); 
			}
		}
		
	</script>
	