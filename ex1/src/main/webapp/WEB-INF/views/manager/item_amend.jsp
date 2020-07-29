<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자페이지 > 상품수정 -->


	<c:import url="header_management.jsp"></c:import>
	
	    <div id="item_update_wrap">
        <div id="item_update_header">
            <h2>상품 수정하기</h2>
        </div>
        <div id="item_update_body">
        <c:forEach items="${ idx_show_detail }" var="dto">
            <form action="/item_amend_ok" method="POST"  enctype="multipart/form-data">
                <input type="hidden" name="idx" value="${ dto.idx }" >
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
                <div id="item_update_btn">
                       <input type="submit" value="수정하기">
                       <input type="reset" value="취소하기">
                </div>
            </form>
            </c:forEach>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>