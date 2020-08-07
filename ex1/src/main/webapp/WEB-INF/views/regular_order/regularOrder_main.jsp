<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 정기배송페이지 -->


	<c:import url="../header.jsp"></c:import>
	
    <div id="regularOrder_main">
        <div>
            <img src="img/regularOrder_img.jpg" alt="배송">
        </div>
        <form>
        	<!-- 정기배송 패키지 상품 상세페이지로 연동 -->
            <button><a href="regular_item_detail?idx=18">정기배송 신청하기</a></button>
        </form>
        <div id="Month_delivery_item">
            <h3>[ 이번달 정기배송 패키지 상품 ]</h3>
            <div>
                <!-- 아이템 DB -->
                <!-- 클래스 season_item -->
                <c:forEach items="${ regularItem }" var="dto">
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
        </div><!-- /Month_delivery_item -->
       	<div id="lastMonth_delivery">
       		<h3>[ 지난달 정기배송 패키지 상품 모음 ]</h3>
			<div class="swiper-container">
			    <div class="swiper-wrapper">
			    	<div class="swiper-slide"><a href="#"><img src="img/lastPack2.jpg"></a></div>
					<div class="swiper-slide"><a href="#"><img src="img/lastPack3.jpg"></a></div>
					<div class="swiper-slide"><a href="#"><img src="img/lastPack4.jpg"></a></div>
					<div class="swiper-slide"><a href="#"><img src="img/lastPack5.jpg"></a></div>
					<div class="swiper-slide"><a href="#"><img src="img/lastPack6.jpg"></a></div>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination swiper-pagination-white"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next swiper-button-white"></div>
			    <div class="swiper-button-prev swiper-button-white"></div>
			  </div>
       	</div><!-- /lastMonth_delivery -->
    </div><!-- /regularOrder_main -->
	
	<c:import url="../footer.jsp"></c:import>
	 
	 <!-- 슬라이드 스크립트 -->
	 <script>
	    var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 3,
	      spaceBetween: 30,
	      freeMode: true,
	      loop: true,
	      autoplay: {
	          delay: 2500,
	          disableOnInteraction: false,
	        },
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		      },
	    });
	  </script>