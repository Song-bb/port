<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- main -->

	<c:import url="header.jsp"></c:import>
	
	<div id="banner_middle">
	<!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
		<c:forEach items="${ dtoB_mainBanner }" var="mainBanner">
	      <div class="swiper-slide" style="background-image: url('${ mainBanner.banner_img }')"><a href="${ mainBanner.banner_href }"></a></div>
		</c:forEach>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination swiper-pagination-white"></div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-next swiper-button-white"></div>
	    <div class="swiper-button-prev swiper-button-white"></div>
	  </div>

	</div>
	<div class="main_bg">
		<div class="main_1">
			<div class="main_1_1">
				<div>과수원에서 <span>방금</span> 들어온 과일들</div>
			</div>
			<table class="main_1_item">	
				<tr>
				<c:forEach items="${ dtoB_mainItem0_ListAll }" var="mainItem0" begin="0" end="3">
					<td class="main_item">
						<div class="item_img_250320">
							<div class="item_img" style="background-image: url('${ mainItem0.item_img }')">
								<a href="item_detail?idx=${ mainItem0.idx }">
							</div>
						</div>
						<div class="item_desc">
							<p><a href="/item_detail">${ mainItem0.item_name }</a></p>
							<p><span><fmt:formatNumber value="${ mainItem0.item_sale_price }" pattern="###,###,###" /></span><span>원</span></p>
							<p><span><fmt:formatNumber value="${ mainItem0.item_real_price }" pattern="###,###,###" /></span><span>원</span></p>
						</div>
					</td>
				</c:forEach>
				</tr>
			</table>
		</div>
	</div>
	<div class="main_bg bg_gray">
		<div class="main_2">
			<div class="main_2_1">
				<div><a href="/event_main">이벤트 소식 ></a></div>
			</div>
			<table class="main_2_event">
				<tr>
				<c:forEach items="${ dtoB_mainEvent }" var="mainEvent" begin="0" end="2">
					<td class="main_event">
						<div class="event_img" style="background-image: url('${mainEvent.event_banner1}')">
							<a href="/event_sub?event_index=${ mainEvent.event_index }"></a>	
						</div>
						<div class="event_desc">
							<p><a href="/event_sub?event_index=${ mainEvent.event_index }">${mainEvent.event_title}</a></p>
							<!-- <p><a href="/event_sub?event_index=${ mainEvent.event_index }">달콤 시원한 여름의 맛!</a></p> -->
						</div>
					</td>
				</c:forEach>
				</tr>
			</table>
		</div>
	</div>
	<div class="main_bg">
		<div class="main_1">
			<div class="main_1_1">
				<div><a href="/fallenFruit_main">낙과채널 ></a></div>
			</div>
			<table class="main_1_item">
				<tr>
				<c:forEach items="${ dtoB_mainItem1_Fallen }" var="mainItem1" begin="0" end="3">
					<td class="main_item">
						<div class="item_img_250320">
							<div class="item_img" style="background-image: url('${ mainItem1.item_img }')">
								<a href="item_detail?idx=${ mainItem1.idx }">
							</div>
						</div>
						<div class="item_desc">
							<p><a href="/item_detail">${ mainItem1.item_name }</a></p>
							<p><span><fmt:formatNumber value="${ mainItem1.item_sale_price }" pattern="###,###,###" /></span><span>원</span></p>
							<p><span><fmt:formatNumber value="${ mainItem1.item_real_price }" pattern="###,###,###" /></span><span>원</span></p>
						</div>
					</td>
				</c:forEach>
				</tr>
			</table>
		</div>
	</div>
	<div class="main_bg bg_gray">
		<div class="main_1">
			<div class="main_1_1">
				<div><a href="/fruitInSeason_main"><span>BEST</span> 제철 과일 ></a></div>
			</div>
			<table class="main_1_item">
				<tr>
				<c:forEach items="${ dtoB_mainItem2_season }" var="mainItem2" begin="0" end="3">
					<td class="main_item">
						<div class="item_img_250320">
							<div class="item_img" style="background-image: url('${ mainItem2.item_img }')">
								<a href="item_detail?idx=${ mainItem2.idx }">
							</div>
						</div>
						<div class="item_desc">
							<p><a href="/item_detail">${ mainItem2.item_name }</a></p>
							<p><span><fmt:formatNumber value="${ mainItem2.item_sale_price }" pattern="###,###,###" /></span><span>원</span></p>
							<p><span><fmt:formatNumber value="${ mainItem2.item_real_price }" pattern="###,###,###" /></span><span>원</span></p>
						</div>
					</td>
				</c:forEach>
				</tr>
			</table>
		</div>
	</div>
	<div class="main_bg">
		<div class="main_1">
			<div class="main_1_1">
				<div><a href="/importedFruit_main">글로벌 수입과일 ></a></div>
			</div>
			<table class="main_1_item">
				<tr>
				<c:forEach items="${ dtoB_mainItem3_Imported }" var="mainItem3" begin="0" end="3">
					<td class="main_item">
						<div class="item_img_250320">
							<div class="item_img" style="background-image: url('${ mainItem3.item_img }')">
								<a href="item_detail?idx=${ mainItem3.idx }">
							</div>
						</div>
						<div class="item_desc">
							<p><a href="/item_detail">${ mainItem3.item_name }</a></p>
							<p><span><fmt:formatNumber value="${ mainItem3.item_sale_price }" pattern="###,###,###" /></span><span>원</span></p>
							<p><span><fmt:formatNumber value="${ mainItem3.item_real_price }" pattern="###,###,###" /></span><span>원</span></p>
						</div>
					</td>
				</c:forEach>
				</tr>
			</table>
		</div>
	</div>
	<div id="main_bottom_banner">
		<a href="regularOrder_main"><img src="img/delevery_banner.jpg"></a>
	</div>
	
	<c:import url="footer.jsp"></c:import>
	
	<!-- Initialize Swiper ------->
	 
	  <script>
	    var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 1,
	      spaceBetween: 30,
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
	
