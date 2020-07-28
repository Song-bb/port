<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 상품등록 -->


	<c:import url="header_management.jsp"></c:import>
	
    <div id="item_update_wrap">
        <div id="item_update_header">
            <h2>상품 등록하기</h2>
        </div>
        <div id="item_update_body">
            <table>
                <tr class="item_update_tr">
                    <td class="item_update_td">카테고리</td>
                    <td class="item_update_td">
                        <select name="item_category" id="category" value="${ dto.item_category }">
                        	<option value="">선택하세요</option>
                            <option value="제철과일">제철과일</option>
                            <option value="수입과일">수입과일</option>
                            <option value="낙과채널">낙과채널</option>
                        </select>
                    </td>
                </tr>
                <tr class="item_update_tr">
                    <td class="item_update_td">상품 이름</td>
                    <td class="item_update_td">
                        <input type="text" name="item_name" value="${ dto.item_name }"/>
                    </td>
                </tr>
                <tr class="item_update_tr">
                    <td class="item_update_td">실제 가격</td>
                    <td class="item_update_td">
                        <input type="text" name="item_real_price" value="${ dto.item_real_price }"/>
                    </td>
                </tr>
                <tr class="item_update_tr">
                    <td class="item_update_td">세일 가격</td>
                    <td class="item_update_td">
                        <input type="text" name="item_sale_price" value="${ dto.item_sale_price }"/>
                    </td>
                </tr>
                <tr class="item_update_tr">
                    <td class="item_update_td">세일 퍼센트</td>
                    <td class="item_update_td">
                        <input type="text" name="item_sale_discount" value="${ dto.item_discount_rate }"/>
                    </td>
                </tr>
                <tr class="item_update_tr">
                    <td class="item_update_td">이미지 등록</td>
                    <td class="item_update_td">
                        <input type="file" name="item_img"  value="${ dto.item_img }"/>
                    </td>
                </tr>
                <tr class="item_update_tr">
                    <td class="item_update_td">상품상세정보</td>
                    <td class="item_update_td">
                        <textarea name="item_description">${ dto.description }</textarea>
                    </td>
                </tr>
            </table>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>
	
<script>
$(document).ready(function(){
     alert("상품등록이 완료되었습니다.");
});
</script>