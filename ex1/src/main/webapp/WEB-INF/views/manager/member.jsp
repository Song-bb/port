<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                    <a href="" class="member_manager_selectBox_serch_select_div_bottom_a">상세검색 닫기<i class="fas fa-caret-up"></i></a>
                </div>
            </div>
        </div>
        <div class="member_manager_selectBox_bottom">
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

    </div>
    
    
	<c:import url="../footer.jsp"></c:import>