<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 정기배송페이지 -->


	<c:import url="../header.jsp"></c:import>
	
    <div id="regularOrder_main">
        <div>
            <img src="img/regularOrder_img.jpg" alt="배송">
        </div>
        <form>
            <button type="submit" formaction="/regularOrder_sub"> 정기배송<br> 신청하기</button>
        </form>
        <div id="Month_delivery_item">
            <h3>이번달 정기배송 패키지 상품</h3>
            <div>
                <!-- 아이템 DB -->
                <!-- 클래스 season_item -->
                <table class="item_table">
	                <tr>
	                    <td>
		                    <!-- 클래스 season_item -->
	                        <div class="season_item">
	                            <div class="item_img">
	                                <a href="/item_detail"><img src="http://placehold.it/250x320"></a>	
	                            </div>
	                            <div class="item_desc">
	                                <p><a href="/item_detail">[워싱턴] 한입체리</a></p>
	                                <p>5,000 원</p>
	                            </div>
	                        </div>
	                    </td>
	                    <td>
	                        <div class="season_item">
	                            <div class="item_img">
	                                <a href="/item_detail"><img src="http://placehold.it/250x320"></a>	
	                            </div>
	                            <div class="item_desc">
	                                <p><a href="/item_detail">[워싱턴] 한입체리</a></p>
	                                <p>5,000 원</p>
	                            </div>
	                        </div>
	                    </td>
	                    <td>
	                        <div class="season_item">
	                            <div class="item_img">
	                                <a href="/item_detail"><img src="http://placehold.it/250x320"></a>	
	                            </div>
	                            <div class="item_desc">
	                                <p><a href="/item_detail">[워싱턴] 한입체리</a></p>
	                                <p>5,000 원</p>
	                            </div>
	                        </div>
	                    </td>
	                </tr>
	            </table>
            </div>
        </div><!-- /Month_delivery_item -->
    </div><!-- /regularOrder_main -->
	
	<c:import url="../footer.jsp"></c:import>