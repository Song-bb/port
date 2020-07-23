<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 관리자페이지 > 회원관리 -->


	<c:import url="header_management.jsp"></c:import>
	
	    <div id="member_manager_main_wrap">
        <div id="member_manager_main_title"><h3>회원리스트</h3></div>
        <div class="member_manager_selectBox">
            <div class="member_manager_selectBox_serch">
                <div class="member_manager_selectBox_serch_select_div">
                    <form action="" method="post">
                        <select class="member_manager_selectBox_serch_select">
                            <option value="user_name">이름</option>
                            <option value="user_id">아이디</option>
                            <option value="user_phone">휴대폰번호</option>
                            <option value="user_birth">생일</option>
                        </select>
                        <input type="text" placeholder="내용을 입력해 주세요." class="member_manager_selectBox_serch_search">
                        <button type="submit" class="member_manager_selectBox_serch_btn">검색</button>
                    </form>
                </div>
                <div class="member_manager_selectBox_serch_select_div_bottom">
                    <a href='javascript:search_close();' id="member_manager_selectBox_serch_select_div_bottom_a">상세검색 닫기</a>
                </div>
            </div>
        </div>
        <div id="member_manager_selectBox_bottom">
            <div class="member_manager_selectBox_serch_bottom">
                <div class="member_manager_selectBox_serch_bottom_div">
                    <table class="member_manager_selectBox_serch_bottom_div_table">
                        <tr class="member_manager_selectBox_serch_bottom_div_tr">
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td1">가입일</td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td2"><input type="date">~<input type="date"></td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td3">구매 금액</td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td4"><input type="text">원 ~ <input type="text">원</td>
                        </tr>
                        <tr class="member_manager_selectBox_serch_bottom_div_tr">
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td1">회원 등급</td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td2">
                                <select>
                                    <option value="">앵두</option>
                                    <option value="">자두</option>
                                    <option value="">복숭아</option>
                                    <option value="">manager</option>
                                </select>
                            </td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td3">적립금</td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td4"><input type="text">원 ~ <input type="text">원</td>
                        </tr>
                        <tr class="member_manager_selectBox_serch_bottom_div_tr">
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td1">메일 수신</td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td2"><input type="radio">수신 <input type="radio">거부</td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td3">문자메시지 수신</td>
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td4"><input type="radio">수신 <input type="radio">거부</td>
                        </tr>
                        <tr class="member_manager_selectBox_serch_bottom_div_tr">
                            <td class="member_manager_selectBox_serch_bottom_div_td member_td5" colspan="4"><button>상세 검색</button></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="member_grade_text">
            <label class="member_grade_text_label"><i class="fas fa-caret-right"></i> 회원등급 : 1. 앵두 회원({}명), 2. 자두 회원({}명), 3. 복숭아 회원({}명), 4. 과일매니저({})명</label>
        </div>
        <div class="member_grade_text_bottom">
            <label class="member_grade_text_label">000 건의 검색 결과가 있습니다.</label>
        </div>
        <div class="member_search_list">
            <form action="">
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
                        <td class="member_search_list_td member_search_list_td4">${dto.user_index}</td>
                        <td class="member_search_list_td member_search_list_td4">${string2}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_name}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_id}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_grade}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_birth}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.buying_price}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_point}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_email}</td>
                        <td class="member_search_list_td member_search_list_td4">${dto.user_phone}</td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="member_search_list_td5">
                    <button type="submit">선택한 회원 탈퇴</button>
                    <button type="submit">선택한 회원 적립금 지급</button>
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
				col.innerHTML = "상세검색 열기";
				con.style.display = "block";
			} else {
				col.innerHTML = "상세검색 닫기";
				con.style.display = "none";
			}
		}
	</script>
	