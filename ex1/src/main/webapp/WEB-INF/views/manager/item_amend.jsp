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
                            <select name="item_category" id="category">
                            	<option value="">선택하세요</option>
                                <option value="제철과일">제철과일</option>
                                <option value="수입과일">수입과일</option>
                                <option value="낙과채널">낙과채널</option>
                                <option value="정기배송">정기배송</option>
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
                        <td class="item_update_td">생산 시기</td>
                        <td class="item_update_td">
                            <select name="item_season" id="item_season">
                            	<option value="">선택하세요</option>
                                <option value="봄">봄</option>
                                <option value="여름">여름</option>
                                <option value="가을">가을</option>
                                <option value="겨울">겨울</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">상품 상태</td>
                        <td class="item_update_td">
                            <select name="item_state" id="item_state">
                            	<option value="">선택하세요</option>
                                <option value="신상품">신상품</option>
                                <option value="보관상품">보관상품</option>
                                <option value="낙과상품">낙과상품</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">원산지</td>
                        <td class="item_update_td">
                            <input type="text" name="item_origin" value="${ dto.item_origin }"/>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">제조사</td>
                        <td class="item_update_td">
                            <input type="text" name="item_farm" value="${ dto.item_farm }"/>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">판매 단위</td>
                        <td class="item_update_td">
                            <input type="text" name="sale_unit" value="${ dto.sale_unit }"/>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">제품 무게</td>
                        <td class="item_update_td">
                            <input type="text" name="item_weight" value="${ dto.item_weight }"/>
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
                            <input type="text" name="item_sale_price" value="${ dto.item_sale_price }" />
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
                            <input type="file" name="item_img" />
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">상품상세정보</td>
                        <td class="item_update_td">
                            <textarea name="item_description" value="${ dto.item_description }"></textarea>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">택배 배송</td>
                        <td class="item_update_td">
                            <select name="item_state" id="item_state">
                            	<option value="">선택하세요</option>
                                <option value="무료배송">무료배송</option>
                                <option value="배송비 3000원">배송비 3000원</option>
                            </select>
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