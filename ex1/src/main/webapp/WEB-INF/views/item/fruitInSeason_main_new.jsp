<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 제철과일 -->


	<c:import url="../header.jsp"></c:import>
	
	<div id="seasonpage_wrap">
	    <div id="seasonpage_top">
	        <h2>제철 과일</h2>
	        <p>등록된 제품 : ${ season_count }개</p>
	    </div>
	    <div id="seasonpage_top_nav"><a href="/fruitInSeason_main_new">최신순 </a> | <a href="/fruitInSeason_main_down">낮은 가격 순 </a> | <a href="/fruitInSeason_main_high">높은 가격 순 </a></div>
	    <div id="seasonpage_mid">

        <c:forEach items="${ season_listview_new }" var="dto">
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