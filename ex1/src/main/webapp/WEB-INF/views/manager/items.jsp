<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 상품관리 -->


	<c:import url="header_management.jsp"></c:import>
	
    <div id="managerlist_wrap">
        <div id="managerlist_header">
            <h2>전체 상품 보기</h2>
        </div>
        <div id="managerlist_body">
            <div id="managerlist_search">
                <form action="" method="POST">
                    카테고리 선택 
                    <select name="item_category" id="category">
                        <option value="모든상품">모든상품보기</option>
                        <option value="제철과일">제철과일</option>
                        <option value="수입과일">수입과일</option>
                        <option value="낙과채널">낙과채널</option>
                    </select>
                </form>
            </div>
            <table>
                <tr class="managerlist_tr">
                    <td class="managerlist_td_check">선택</td>
                    <td class="managerlist_td_index">인덱스</td>
                    <td class="managerlist_td_category">카테고리</td>
                    <td class="managerlist_td_img">상품이미지</td>
                    <td class="managerlist_td_name">상품이름</td>
                    <td class="managerlist_td_price">상품가격</td>
                </tr>
                <tr class="managerlist_tr">
                    <td class="managerlist_td_check"><input type="checkbox"></td>
                    <td class="managerlist_td_index">1</td>
                    <td class="managerlist_td_category">제철과일</td>
                    <td class="managerlist_td_img"><img src="http://placehold.it/125x160"></td>
                    <td class="managerlist_td_name"><a href="">수박</a></td>
                    <td class="managerlist_td_price">10000</td>
                </tr>
            </table>
            <div class="managerlist_table_div">
                <button>선택한 상품 삭제</button>
            </div>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>