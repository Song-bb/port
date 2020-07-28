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
            <form action="/item_update_ok" method="POST" enctype="multipart/form-data">
                <table>
                    <tr class="item_update_tr">
                        <td class="item_update_td">카테고리</td>
                        <td class="item_update_td">
                            <select name="item_category" id="category">
                            	<option value="">선택하세요</option>
                                <option value="season">제철과일</option>
                                <option value="imported">수입과일</option>
                                <option value="fallen">낙과채널</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">상품 이름</td>
                        <td class="item_update_td">
                            <input type="text" name="item_name" placeholder="상품 이름"/>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">실제 가격</td>
                        <td class="item_update_td">
                            <input type="text" name="item_real_price" placeholder="실 가격"/>
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">세일 가격</td>
                        <td class="item_update_td">
                            <input type="text" name="item_sale_price" placeholder="세일 가격" />
                        </td>
                    </tr>
                    <tr class="item_update_tr">
                        <td class="item_update_td">세일 퍼센트</td>
                        <td class="item_update_td">
                            <input type="text" name="item_sale_discount" placeholder="세일 퍼센트" />
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
                            <textarea name="item_description" placeholder="상품 상세정보"></textarea>
                        </td>
                    </tr>
                </table>
                <div id="item_update_btn">
                       <input type="submit" value="등록하기">
                       <input type="reset" value="취소하기">
                </div>
            </form>
        </div>
    </div>
	<c:import url="../footer.jsp"></c:import>
	
<script>
$(document).ready(function(){
     alert("상품등록을 실패하였습니다.");
});
</script>	