<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 메인 상품검색 -->


	<c:import url="../header.jsp"></c:import>
	
	<div id="searchItem_wrap">
        <div id="searchItem_top">
            <h2>검색 결과</h2>
            <p>등록된 제품 :  개</p>
        </div>
        <div id="searchItem_top_nav"><a href="">최신순 </a> | <a href="">낮은 가격 순 </a> | <a href="">높은 가격 순 </a></div>
        <div id="importedpage_mid">
        
		${ main_searchItem }
            <table class="item_table1">
                <tr>
                    <td>
                        <div class="item_groupBox1">
                            <div class="item_img_2503201">
                                <div class="item_img1" style="background-image: url('/fruit.jpg')">
                                    <a href=""></a>
                                </div>
                            </div>
                            <div class="item_desc1">
                                <p><a href=""></a></p>
                                <p><span><fmt:formatNumber value="" pattern="###,###,###" /></span><span>원</span></p>
                                <p><span><fmt:formatNumber value="" pattern="###,###,###" /></span><span>원</span></p>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>

        
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>