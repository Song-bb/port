<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 상품상세페이지 -->


	<c:import url="../header.jsp"></c:import>
	<c:forEach items="${ idx_show_detail }" var="dto">
	    <div id="item_detail_wrap">
	        	<div class="item_detail_titleLink">
		        	<ul>
		                <!-- 해상 상품 카테고리 페이지 이동 -->
		                <li><a href="#"> ${ dto.item_category }</a></li>
		                <li> > </li>
		                <!-- 해당 상품 이름 -->
		                <li><a href="#"> ${ dto.item_name }</a></li>
		            </ul>
		        </div>
	        <!-- 상세페이지 상단-주문 -->
	        	<div id="item_detail_content1_wrap">
	            	<div id="item_detail_content1">
	                <div class="item_detail_content1_left">
	                    <!-- .item_img => 상품리스트에 들어가는 이미지와 여기에 등록하는 이미지가 동일해야함 -->
	                    <div class="item_img" >
	                        <img src="${ dto.item_img }">
	                    </div>
	                    <div>
	                        <!-- 리뷰와 총점은 DB데이터로 측정 -->
	                        <p>리뷰수 <span style="font-size: 1.5em; font-weight:800;">${ itemReview_count }</span> </p>
	                        <p>사용자 총 평점 <span style="font-size: 1.5em; font-weight:800;">${ itemReview_score }</span> </p>

	                    </div>
	                </div>
	                <div class="item_detail_content1_right">
	                    <div class="item_detail_desc">
	                        <div>
	                            <p class="goods_name">${ dto.item_name }</p>
	                        </div>
	                        <div id="goods_prices">
	                            <p class="goods_dc">${ dto.item_discount_rate }%</p>
	                            <p>
	                                <!-- 원가 -->
	                                <span class="goods_orPrice"><fmt:formatNumber value="${ dto.item_real_price }" pattern="###,###,###" />원</span>&nbsp;&nbsp;
	                                <!-- 판매가격 -->
	                                <span class="goods_dcPrice"><fmt:formatNumber value="${ dto.item_sale_price }" pattern="###,###,###" /></span>원</span>
	                                <input type="hidden" id="item_sale_price" value="${ dto.item_sale_price }">
	                            </p>
	                        </div>
	                        <div id="goods_info">
	                            <table>
	                                <tr><td class="goods_info_title">판매단위 </td><td class="goods_info_text">${ dto.sale_unit } / ${ dto.item_weight }</td></tr>
	                                <tr><td class="goods_info_title">원산지 </td><td class="goods_info_text">${ dto.item_origin }</td> </tr>
	                                <tr><td class="goods_info_title">택배배송 </td><td class="goods_info_text">${ dto.delivery_sale }</td></tr>
	                                <tr><td class="goods_info_title">안내사항 </td><td class="goods_info_text">식품 특성상 중량차이가 있을 수 있습니다.식품 특성상 중량차이가 있을 수 있습니다.
	                                    식품 특성상 중량차이가 있을 수 있습니다</td>
	                                </tr>
	                            </table>
	                        </div>
	                        <!-- 상품수 증가  -->
	                        <div class="goods_count">

	                            	<p>신청 옵션</p>
	                                <select id="count_item" name="count_item" onchange="count_item();">
	                                	<option value="1">1개월</option>
	                                	<option value="3">3개월</option>
	                                	<option value="6">6개월</option>
	                                	<option value="12">12개월</option>
	                                </select>

	                        </div>
	                        <div class="total_goods_price">
	                            <p>총 상품 금액</p>
	                                  <!--  count -->
	                            <p>
	                                <span><span id="result_count">1</span> 개월</span>&nbsp;&nbsp;
	                            						<!-- dcPrice*count -->
	                                <span class="total_price" id="result_price"><fmt:formatNumber value="${ dto.item_sale_price }" pattern="###,###,###" /></span> 원
	                            </p>
	                        </div>
	                        <div class="goods_order">
	                            <button class="goCart orderbutton" type="button"><a href="/myCart">장바구니</a></button>
	                        	<button class="goOrder orderbutton" type="button" ><a href="/payment">구매하기</a></button>
	                        </div>                  
	                    </div>
	                </div>
	            
	                <div id="item_detail_reviewBox_top">
	                    <h3>상품리뷰(${ itemReview_count })</h3>
	                    <p class="reviewMore"><a href="#item_detail_content3">더보기</a></p>
	                    <!-- 상품 후기 db list로 가져올텐데 table? -->
	                    <table> <!-- 상품후기 최근글 4개만 보여주기 -->
	                        <c:forEach items="${ review_item }" var="dto2">
		                    <c:set var = "string1" value = "${ dto2.write_date }"/>
	                    	<c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
		                        <tr class="item_reviewBox">
		                            <td class="reviewStar">평점 : ${ dto2.review_score }</td>
		                            <td class="reviewWriter"><span>구매자 : ${ dto2.user_id } </span><br><span> 날짜 : ${ string2 }</span></td>
		                            <td class="reviewContent"><p class="textEllipsis">${ dto2.review_content }</p></td>
		                        </tr>
		                    </c:forEach>
	                    </table>
	                </div>
	            </div>
	        </div>
        <!-- 상세페이지 -->
        <div id="item_detail_content2">
		
            <div class="item_detail_nav">
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
	                        <td class="goods_info_text">${ dto.item_state }</td>
	                        <td class="goods_info_title">상품번호</td>
	                        <td class="goods_info_text">${ dto.item_number }</td>
	                    </tr>
	                    <tr>
	                        <td class="goods_info_title">제조사</td>
	                        <td class="goods_info_text">${ dto.item_farm }</td>
	                        <td class="goods_info_title">브랜드</td>
	                        <td class="goods_info_text">과일장수</td>
	                    </tr>
	                    <tr>
	                        <td class="goods_info_title">원산지</td>
	                        <td class="goods_info_text">${ dto.item_origin }</td>
	                        <td class="goods_info_title"></td>
	                        <td class="goods_info_text"></td>
	                    </tr>
	                    <tr>
	                        <td class="goods_info_title">무게</td>
	                        <td class="goods_info_text">${ dto.item_weight }</td>
	                        <td class="goods_info_title">생산시기</td>
	                        <td class="goods_info_text">${ dto.item_season }</td>
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
	                    <img src="${ dto.item_img }" alt="본문" width="800px">
	                    <div style="text-align:center">
	                    	${ dto.item_description }
	                    </div>
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
                        <td class="goods_info_text">${ dto.item_origin }</td>
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
	            <div class="item_detail_nav">
	                <ul>
	                    <li><a href="#item_detail_content2">상세정보</a></li>
	                    <li><a href="#item_detail_content3" class="on">리뷰</a></li>
	                    <li><a href="#item_detail_content4">Q&A</a></li>
	                    <li><a href="#item_detail_content5">반품/교환정보</a></li>
	                </ul>
	            </div>
	
	            <div class="item_detail_subTitle">
	                <h3>상품리뷰</h3>
	                <p>상품을 구매하신 분들이 작성하신 후기입니다. 리뷰 작성시 포인트가 지급됩니다.</p>
	            </div>
	            	<c:forEach items="${ review_item }" var="dto2">
	            	<c:set var = "string1" value = "${ dto2.write_date }"/>
	                <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
		                <table>
		                    <tr class="item_reviewBox2">
		                        <td class="reviewStar">평점 : ${ dto2.review_score }</td>
		                        <td class="reviewWriter"><span>구매자 : ${ dto2.user_id } </span><br><span> 날짜 : ${ string2 }</span></td>
		                        <td class="reviewContent">
		                        	<p>${ dto2.review_content }</p>
		                        </td>
		                    </tr>
		                </table>
		            </c:forEach>
	        </div>
	        <!-- 상품문의 /로그인후게시물작성 -->
	        <div id="item_detail_content4">
	            <div class="item_detail_nav">
	                <ul>
	                    <li><a href="#item_detail_content2">상세정보</a></li>
	                    <li><a href="#item_detail_content3">리뷰</a></li>
	                    <li><a href="#item_detail_content4" class="on">Q&A</a></li>
	                    <li><a href="#item_detail_content5">반품/교환정보</a></li>
	                </ul>
	            </div>
	
	            <div class="item_detail_subTitle">
	                <h3>상품문의</h3>
	                <p>구매하려는 상품에 대해 궁금하신 점이 있으신 경우 문의해주세요.</p>
	                <button class="QNAbutton">상품문의하기</button>
	            </div>
	            <table>
	                <tr>
	                    <th>답변상태</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>작성일</th>
	                </tr>
	                <tr class="QNA_show">
	                    <td>답변완료</td>
	                    <td>택배사는 어디인가요?</td>
	                    <td>abc****</td>
	                    <td>2020-08-15 <br> 12:00</td>
	                </tr>
	                <tr class="QNA_hide">
	                    <td></td>
	                    <td>
	                        <p>
	                            안녕하세요 고객님^^ 과일장수를 이용해주셔서 감사합니다.<br>
	                            과일장수는 대한통운사를 이용하고 있습니다.<br>
	                            신선하고 최고의 품질을 빠르고 안전하게 보내기 위해 최선을 다하는 과일장수가 되겠습니다. 감사합니다^^
	                        </p>
	                    </td>
	                    <td></td>
	                    <td></td>
	                </tr>
	                <tr class="QNA_show">
	                    <td>답변완료</td>
	                    <td>워싱턴 체리인데 원산지는 국산인가요?</td>
	                    <td>bbb****</td>
	                    <td>2020-08-15 <br> 07:23</td>
	                </tr>
	                <tr class="QNA_hide">
	                    <td></td>
	                    <td>
	                        <p>
	                            안녕하세요 고객님^^ 과일장수를 이용해주셔서 감사합니다.<br>
	                            해당 상품은 특정 지역명의 이름을 딴 상품임으로 원산지와는 상관없습니다.<br>
	                            하지만 그 무엇과도 비교할 수 없는 최고의 상품임을 과일장수가 약속드립니다<br>
	                            신선하고 최고의 품질을 빠르고 안전하게 보내기 위해 최선을 다하는 과일장수가 되겠습니다. 감사합니다^^
	                        </p>
	                    </td>
	                    <td></td>
	                    <td></td>
	                </tr>
	            </table>
	            
	        </div>
	        <!-- 교환반송안내 -->
	        <div id="item_detail_content5">
	            <div class="item_detail_nav">
	                <ul>
	                    <li><a href="#item_detail_content2">상세정보</a></li>
	                    <li><a href="#item_detail_content3">리뷰</a></li>
	                    <li><a href="#item_detail_content4">Q&A</a></li>
	                    <li><a href="#item_detail_content5" class="on">반품/교환정보</a></li>
	                </ul>
	            </div>
	
	            <div class="item_detail_subTitle">
	                <h3>교환/반송안내</h3>
	            </div>
	
	            <table>
	                <tr>
	                    <th>판매자 지정택배사</th>
	                    <td>CJ대한통운</td>
	                </tr>
	                <tr>
	                    <th>반품배송비</th>
	                    <td>편도 3,000원 (최초 배송비 무료인 경우  6,000원 부과)</td>
	                </tr>
	                <tr>
	                    <th>보내실곳</th>
	                    <td>과일장수</td>
	                </tr>
	                <tr>
	                    <th>반품/교환 사유에 따른<br> 요청 가능 기간</th>
	                    <td>표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내 </td>
	                </tr>
	                <tr>
	                    <th>반품/교환 불가능 사유</th>
	                    <td>
	                        1. 반품요청기간이 지난경우<br>
	                        2. 구매자의 책임있는 사유로 상품등 멸실 또는 훼손된 경우<br>
	                        3. 구매자의 책임있는 사유로 포장이 훼돈되어 상품가치가 현저히 상실된 경우<br>
	                        4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
	
	                    </td>
	                </tr>
	
	            </table>
	            
	        </div>
	    </div>
</c:forEach>	
	
	<c:import url="../footer.jsp"></c:import>
	
	
	<script>
	
		function count_item(){
		    var target = document.getElementById("count_item").value;
		    document.getElementById("result_count").innerHTML = target;
			var item_sale_price = document.getElementById("item_sale_price").value;
			var result_Price = target * item_sale_price;
			var result_Price_new = result_Price.toLocaleString();
			document.getElementById("result_price").innerHTML = result_Price_new;
		}
		
	</script>