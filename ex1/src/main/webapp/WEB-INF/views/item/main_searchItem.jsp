<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 메인 상품검색 -->


	<c:import url="../header.jsp"></c:import>
	
	<div id="searchItem_wrap">
        <div id="searchItem_top">
            <h2>검색 결과</h2>
            <p>등록된 제품 : ${ main_searchItem_count } 개</p>
        </div>
        <div id="searchItem_top_nav"><a href="">최신순 </a> | <a href="">낮은 가격 순 </a> | <a href="">높은 가격 순 </a></div>
        <div id="importedpage_mid">
        
        <c:forEach items="${ main_searchItem }" var="dto">
		    <table class="item_table">
		        <tr>
		            <td>
		                <div class="item_groupBox">
		                    <div class="item_img_250320">
		                        <div class="item_img" style="background-image: url('${ dto.item_img }')">
		                            <a href="item_detail?idx=${ dto.idx }"></a>
		                        </div>
		                    </div>
		                    <div class="item_desc">
		                        <p><a href="item_detail?idx=${ dto.idx }">${ dto.item_name }</a></p>
		                        <p><span><fmt:formatNumber value="${ dto.item_sale_price }" pattern="###,###,###" /></span><span>원</span></p>
								<p><span><fmt:formatNumber value="${ dto.item_real_price }" pattern="###,###,###" /></span><span>원</span></p>
		                    </div>
		                </div>
		            </td>
		        </tr>
		    </table>
		</c:forEach>
        
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>