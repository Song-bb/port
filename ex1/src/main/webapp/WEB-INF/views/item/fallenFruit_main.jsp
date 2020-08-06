<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 낙과채널 -->


	<c:import url="../header.jsp"></c:import>
		
	    <div id="fallenpage_wrap">
        <div id="fallenpage_top">
            <h2>낙과 채널</h2>
            <p>등록된 제품 : ${ fallen_count }개</p>
        </div>
        <div id="fallenpage_top_nav"><a href="/fallenFruit_main_new">최신순 </a> | <a href="/fallenFruit_main_down">낮은 가격 순 </a> | <a href="/fallenFruit_main_high">높은 가격 순 </a></div>
        <div id="fallenpage_mid">
        
		<c:forEach items="${ fallen_listview }" var="dto">
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