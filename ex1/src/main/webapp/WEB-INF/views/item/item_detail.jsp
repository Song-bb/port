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
                            <table>
                                <tr><td class="goods_info_title">판매단위 </td><td class="goods_info_text">1팩 / 500g</td></tr>
                                <tr><td class="goods_info_title">원산지 </td><td class="goods_info_text">국산</td> </tr>
                                <tr><td class="goods_info_title">택배배송 </td><td class="goods_info_text">무료배송</td></tr>
                                <tr><td class="goods_info_title">안내사항 </td><td class="goods_info_text">식품 특성상 중량차이가 있을 수 있습니다.식품 특성상 중량차이가 있을 수 있습니다.
                                    식품 특성상 중량차이가 있을 수 있습니다</td>
                                </tr>
                            </table>
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
                                  <!--  count -->
                            <p>
                                <span>총 수량 1개</span>&nbsp;&nbsp;
                            						<!-- dcPrice*count -->
                                <span class="total_price">00,000</span>원
                            </p>
                        </div>
                        <div class="goods_order">
                            <button class="goCart orderbutton" type="submit">장바구니</button>
                        	<button class="goOrder orderbutton" type="submit">구매하기</button>
                        </div>                  
                    </div>
                </div>
                <div id="item_detail_reviewBox_top">
                    <h3>상품리뷰(5)</h3>
                    <p class="reviewMore"><a href="#item_detail_review">더보기</a></p>
                    <!-- 상품 후기 db list로 가져올텐데 table? -->
                    <table>
                        <tr class="item_reviewBox">
                            <td class="reviewStar">평점</td>
                            <td class="reviewWriter"><span>Writer</span><span>Date</span></td>
                            <td class="reviewContent"><p class="textEllipsis">맛있게 잘먹겠습니다~ 맛있는과일 많이파세요~ 맛있는과일이왔어요배송도빨라요~~~</p></td>
                        </tr>
                        
                        <tr class="item_reviewBox">
                            <td class="reviewStar">평점</td>
                            <td class="reviewWriter"><span>Writer</span><span>Date</span></td>
                            <td class="reviewContent"><p class="textEllipsis">맛있게 잘먹겠습니다~ 맛있는과일 많이파세요~ 맛있는과일이왔어요배송도빨라요~~~</p></td>
                        </tr>
                        <tr class="item_reviewBox">
                            <td class="reviewStar">평점</td>
                            <td class="reviewWriter"><span>Writer</span><span>Date</span></td>
                            <td class="reviewContent"><p class="textEllipsis">맛있게 잘먹겠습니다~ 맛있는과일 많이파세요~ 맛있는과일이왔어요배송도빨라요~~~</p></td>
                        </tr>
                        <tr class="item_reviewBox">
                            <td class="reviewStar">평점</td>
                            <td class="reviewWriter"><span>Writer</span><span>Date</span></td>
                            <td class="reviewContent"><p class="textEllipsis">맛있게 잘먹겠습니다~ 맛있는과일 많이파세요~ 맛있는과일이왔어요배송도빨라요~~~</p></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <!-- 상세페이지 -->
        <div id="item_detail_content2">

            <div id="item_detail_nav">
                <ul>
                    <li><a href="#item_detail_content2" class="on">상세정보</a></li>
                    <li><a href="#item_detail_content3">리뷰</a></li>
                    <li><a href="#item_detail_content4">Q&A</a></li>
                    <li><a href="#item_detail_content5">반품/교환정보</a></li>
                </ul>

            </div>


             <!-- 상품 정보 -->
            <div id="goods_info_detail">
                <h4>상품정보</h4>
                <table>
                    <tr>
                        <td class="goods_info_title">상품상태</td>
                        <td class="goods_info_text">신상품</td>
                        <td class="goods_info_title">상품번호</td>
                        <td class="goods_info_text">00000000</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">제조사</td>
                        <td class="goods_info_text">영천복숭아</td>
                        <td class="goods_info_title">브랜드</td>
                        <td class="goods_info_text">과일장수</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">원산지</td>
                        <td class="goods_info_text">국산</td>
                        <td class="goods_info_title"></td>
                        <td class="goods_info_text"></td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">무게</td>
                        <td class="goods_info_text">500g</td>
                        <td class="goods_info_title">생산시기</td>
                        <td class="goods_info_text">여름</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">품종</td>
                        <td class="goods_info_text">상세페이지참고</td>
                        <td class="goods_info_title"></td>
                        <td class="goods_info_text"></td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">영수증발급</td>
                        <td class="goods_info_text">신용카드전표,현금영수증발급</td>
                        <td class="goods_info_title">A/S 안내</td>
                        <td class="goods_info_text">010-1234-4567</td>
                    </tr>
                </table>
            </div>
            <!-- 상품페이지 -->
            <div id="item_detail_page">
                <p>
                    <img src="img/itemPage.jpg" alt="본문">
                </p>
            </div>
            <!-- 상품고지 -->
            <div id="goods_info_detail">
                <h4>상품정보 제공고시</h4>
                <table>
                    <tr>
                        <td class="goods_info_title">포장단위별 용량(중량),<br> 수량, 크기</td>
                        <td class="goods_info_text">상품상세참조</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">제조연월일, 유통기한</td>
                        <td class="goods_info_text">상품상세참조</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">원산지</td>
                        <!-- 원산지 DB연동 -->
                        <td class="goods_info_text">국산</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">생산자</td>
                        <td class="goods_info_text">상품상세참조</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">관련법산 표시사항</td>
                        <td class="goods_info_text">상품상세참조</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">상품구성</td>
                        <td class="goods_info_text">상품상세참조</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">보관방법 또는 취급방법</td>
                        <td class="goods_info_text">상품상세참조</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">소비자 상담관련 전화번호</td>
                        <td class="goods_info_text">상품상세참조</td>
                    </tr>
                </table>
            </div>
            <!-- 거래조건에 관한 정보 -->
            <div id="goods_info_detail">
                <h4>거래조건에 관한 정보</h4>
                <table>
                    <tr>
                        <td class="goods_info_title">재화등 배송방법에 관한 정보</td>
                        <td class="goods_info_text">택배</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">주문 이후 예상되는 배송기간</td>
                        <td class="goods_info_text">대금 지급일로부터 3일 이내에 발송</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">제품하자·오배송 등에 따른 청약철회 등의 경우 청약철회 등을 할 수 있는 기간 및 통신판매업자가 부담하는 반품비용 등에 관한 정보</td>
                        <td class="goods_info_text">전자상거래등에서의소비자보호에관한법률 등에 의한 제품의 하자 또는 오배송 등으로 인한 청약철회의 경우에는 상품 수령 후 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회를 할 수 있으며, 반품 비용은 통신판매업자가 부담합니다.</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">제품하자가 아닌 소비자의 단순변심, 착오구매에 따른 청약철회 시 소비자가 부담하는 반품비용 등에 관한 정보</td>
                        <td class="goods_info_text">편도 3000원 (최초 배송비 무료인 경우 6000원 부과)</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">재화등의 교환·반품·보증 조건 및 품질보증기준</td>
                        <td class="goods_info_text">소비자분쟁해결기준(공정거래위원회 고시) 및 관계법령에 따릅니다.</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">재화등의 A/S 관련 전화번호</td>
                        <td class="goods_info_text">상품상세참조</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">대금을 환불받기 위한 방법과 환불이 지연될 경우 지연에 따른 배상금을 지급받을 수 있다는 사실 및 배상금 지급의 구체적 조건 및 절차</td>
                        <td class="goods_info_text">주문취소 및 대금의 환불은 네이버 페이 마이페이지에서 신청할 수 있으며, 전자상거래 등에서의 소비자보호에 관한 법률에 따라 소비자의 청약철회 후 판매자가 재화 등을 반환 받은 날로부터 3영업일 이내에 지급받은 대금의 환급을 정당한 사유 없이 지연하는 때에는 소비자는 지연기간에 대해서 연 20%의 지연배상금을 판매자에게 청구할 수 있습니다.</td>
                    </tr>
                    <tr>
                        <td class="goods_info_title">거래에 관한 약관의 내용 또는 확인할 수 있는 방법</td>
                        <td class="goods_info_text">상품상세 페이지 및 페이지 하단의 이용약관 링크를 통해 확인할 수 있습니다.</td>
                    </tr>

                </table>
            </div>

        <!-- ====================== 리뷰 ========================-->
        <div id="item_detail_content3">
            <div id="item_detail_nav">
                <ul>
                    <li><a href="#item_detail_content2">상세정보</a></li>
                    <li><a href="#item_detail_content3" class="on">리뷰</a></li>
                    <li><a href="#item_detail_content4">Q&A</a></li>
                    <li><a href="#item_detail_content5">반품/교환정보</a></li>
                </ul>
            </div>

            <div id="item_detail_review">
                <h3>상품리뷰</h3>
                <p>상품을 구매하신 분들이 작성하신 후기입니다. 리뷰 작성시 포인트가 지급됩니다.</p>
                <table>
                    <tr class="item_reviewBox2">
                        <td class="reviewStar">평점</td>
                        <td class="reviewWriter"><span>Writer</span><span>Date</span></td>
                        <td class="reviewContent">
                        	<p>
                        	잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            </p>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr class="item_reviewBox2">
                        <td class="reviewStar">평점</td>
                        <td class="reviewWriter"><span>Writer</span><span>Date</span></td>
                        <td class="reviewContent">
                        	<p>
                        	잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            </p>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr class="item_reviewBox2">
                        <td class="reviewStar">평점</td>
                        <td class="reviewWriter"><span>Writer</span><span>Date</span></td>
                        <td class="reviewContent">
                        	<p>
                        	잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다잘먹겠습니다
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
            
        </div>
        <!-- 상품문의 /로그인후게시물작성 -->
        <div id="item_detail_content4">
            <div id="item_detail_nav">
                <ul>
                    <li><a href="#item_detail_content2">상세정보</a></li>
                    <li><a href="#item_detail_content3">리뷰</a></li>
                    <li><a href="#item_detail_content4" class="on">Q&A</a></li>
                    <li><a href="#item_detail_content5">반품/교환정보</a></li>
                </ul>
            </div>
            
        </div>
        <!-- 교환반송안내 -->
        <div id="item_detail_content5">
            <div id="item_detail_nav">
                <ul>
                    <li><a href="#item_detail_content2">상세정보</a></li>
                    <li><a href="#item_detail_content3">리뷰</a></li>
                    <li><a href="#item_detail_content4">Q&A</a></li>
                    <li><a href="#item_detail_content5" class="on">반품/교환정보</a></li>
                </ul>
            </div>
            
        </div>
    </div>
	
	
	<c:import url="../footer.jsp"></c:import>