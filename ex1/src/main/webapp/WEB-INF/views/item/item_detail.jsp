<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상품상세페이지 -->


	<c:import url="../header.jsp"></c:import>
	
	<div id="item_detail_wrap">
        <div class="item_detail_titleLink">
            <ul>
                    <!-- 해상 상품 카테고리 페이지 이동 -->
                <li><a href="#"> 제철과일</a></li>
                <li> > </li>
                    <!-- 해당 상품 이름 -->
                <li><a href="#"> 상품이름</a></li>
            </ul>
        </div>
        <!-- 상세페이지 상단-주문 -->
        <div id="item_detail_content1_wrap">
            <div id="item_detail_content1">
                <div class="item_detail_content1_left">
                    <!-- .item_img => 상품리스트에 들어가는 이미지와 여기에 등록하는 이미지가 동일해야함 -->
                    <div class="item_img">
                        <img src="http://placehold.it/500x640">
                    </div>
                    <div>
                        <!-- 리뷰와 총점은 DB데이터로 측정 -->
                        <p>리뷰수 <span style="font-size: 1.5em; font-weight:800;">500</span> </p>
                        <p>사용자 총 평점 <span style="font-size: 1.5em; font-weight:800;">4.8/5.0</span> </p>
                    </div>
                </div>

                <div class="item_detail_content1_right">
                    <div class="item_detail_desc">
                        <div>
                            <p class="goods_name">[워싱턴] 한입체리 500g</p>
                        </div>
                        <div id="goods_prices">
                            <p class="goods_dc">10%</p>
                            <p>
                                <!-- 원가 -->
                                <span class="goods_orPrice">00,000원</span>&nbsp;&nbsp;
                                <!-- 판매가격 -->
                                <span class="goods_dcPrice">00,000</span>원</span> 
                            </p>
                        </div>
                        <div id="goods_info">
                            <p><span class="goods_info_title">판매단위 </span><span class="goods_info_text">1팩</span></p>
                            <p><span class="goods_info_title">원산지 </span><span class="goods_info_text">국산</span> </p>
                            <p><span class="goods_info_title">택배배송 </span><span class="goods_info_text">무료배송</span></p>
                            <p><span class="goods_info_title">유통기간 </span><span class="goods_info_text">농산물로 별도의 유통기간은 없으나 가급적 빠르게 드시기 바랍니다.</span></p>
                            <p><span class="goods_info_title">안내사항 </span><span class="goods_info_text">식품 특성상 중량차이가 있을 수 있습니다.식품 특성상 중량차이가 있을 수 있습니다.</span></p>
                        </div>
                        <div class="goods_count">    
                            <fome>
                                <button type="button" class="btnDown">-</button>
                                    <input type="text" value=1>
                                <button type="button" class="btnUp">+</button>
                            </fome>
                        </div>
                        <div class="total_goods_price">
                            <p>총 상품 금액</p>
                                     <!--  count                             dcPrice*count -->
                            <p><span>총 수량 1개</span><span class="total_price">00,000원</span></p>
                        </div>
                        <div class="goods_order">
                            <button class="goOrder" type="submit">구매하기</button>
                            <button class="goCart" tyle="submit">장바구니</button>
                        </div>                  
                    </div>
                </div>
                <div id="item_detail_reviewBox_top">
                    <h3>상품리뷰(5)</h3>
                    <p class="reviewMore"><a href="#item_detail_review">더보기</a></p>
                    <!-- 상품 후기 db list로 가져올텐데 table? -->
                    <div>
                        <div class="item_reviewBox">
                            <p class="reviewStar">평점</p>
                            <p class="reviewWriter"><span>Writer</span><span>Date</span></p>
                            <p class="reviewContent">잘먹겠습니다</p>
                        </div>
                        <div class="item_reviewBox">
                            <p class="reviewStar">평점</p>
                            <p class="reviewWriter"><span>Writer</span><span>Date</span></p>
                            <p class="reviewContent">잘먹겠습니다</p>
                        </div>
                        <div class="item_reviewBox">
                            <p class="reviewStar">평점</p>
                            <p class="reviewWriter"><span>Writer</span><span>Date</span></p>
                            <p class="reviewContent">잘먹겠습니다</p>
                        </div>
                        <div class="item_reviewBox">
                            <p class="reviewStar">평점</p>
                            <p class="reviewWriter"><span>Writer</span><span>Date</span></p>
                            <p class="reviewContent">잘먹겠습니다</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 상세페이지 -->
        <div id="item_detail_content2">
            
        </div>
        <!-- 리뷰 -->
        <div id="item_detail_content3">
            <div id="item_detail_review">

            </div>
            
        </div>
        <!-- 상푸문의 -->
        <div id="item_detail_content4">
            
        </div>
        <!-- 배송안내 -->
        <div id="item_detail_content5">
            
        </div>
        <!-- 교환반송안내 -->
        <div id="item_detail_content6">
            
        </div>
    </div>
	
	
	<c:import url="../footer.jsp"></c:import>