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
                <c:forEach items="${ all_listview }" var="dto">
	                <tr class="managerlist_tr">
	                    <td class="managerlist_td_check"><input type="checkbox"></td>
	                    <td class="managerlist_td_index">${ dto.idx }</td>
	                    <td class="managerlist_td_category">${ dto.item_category }</td>
	                    <td class="managerlist_td_img"><img src="${ dto.item_img }" height="160px" width="125px"></td>
	                    <td class="managerlist_td_name"><a href="item_amend?idx=${ dto.idx }">${ dto.item_name }</a></td>
	                    <td class="managerlist_td_price">${ dto.item_real_price }</td>
	                </tr>
                </c:forEach>
            </table>
            <div class="managerlist_table_div">
                <button>선택한 상품 삭제</button>
            </div>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>