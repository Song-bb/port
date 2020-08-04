<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰작성</title>
    <link rel="stylesheet" href="css/myReview_write_style.css">
</head>
<body>
    <div id="review_write_wrap">
        <div class="review_write_title">
            <h3>상품리뷰 등록</h3>
        </div>
        <table class="review_write_itemlist">
            <tr>
                <th>주문번호</th>
                <th>상품정보</th>
                <th>구매금액</th>
                <th>구매일자</th>
            </tr>
            <c:forEach items="${ myOrder_review }" var="dto">
            <c:set var = "string1" value = "${ dto.date }"/>
            <c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
            <tr>
                <td>${ dto.order_number }</td>
                <td class="write_itemInfo">
                    <p><img src="${ dto.item_img }"></p>
                    <span>${ dto.item_text }</span>
                </td>
                <td><fmt:formatNumber value="${ dto.price_actual }" pattern="###,###,###" /> 원</td>
                <td>${ string2 }</td>
            </tr>
            	<input type="hidden" value="${ dto.order_number }" id="order_number">
            	<input type="hidden" value="${ dto.item_img }" id="item_img">
            	<input type="hidden" value="${ dto.item_text }" id="item_name">
            	<input type="hidden" value="${ dto.item_number }" id="item_number">
            	<input type="hidden" value="${ dto.price_actual }" id="Buy_price">
            	<input type="hidden" value="${ dto.date }" id="date">
            	<input type="hidden" value="${ dto.user_id }" id="user_id">
            </c:forEach>
        </table>
        <div class="review_write_content">
            <p>상품평을 등록해주세요</p>
            <textarea name="review_write_content" id="review_write_content" rows="10" cols="60"></textarea>
        </div>
        <div class="review_write_star">
            <p>상품 점수를 등록해주세요</p>
            <label id="idStrar"><input type="radio" name="star" id="idStrar" value="5">&nbsp;5점</label>
            <label id="idStrar"><input type="radio" name="star" id="idStrar" value="4">&nbsp;4점</label>
            <label id="idStrar"><input type="radio" name="star" id="idStrar" value="3">&nbsp;3점</label>
            <label id="idStrar"><input type="radio" name="star" id="idStrar" value="2">&nbsp;2점</label>
            <label id="idStrar"><input type="radio" name="star" id="idStrar" value="1">&nbsp;1점</label>
        </div>
        <div class="review_write_button">
            <button type="button" onclick="review_write_ok()">등록</button>
            <button type="button" onClick="window.close()">취소</button>
        </div>
    </div>
    
    
    <script>
    	function review_write_ok(){
    		var item_number1 = document.getElementById('item_number').value;
    		var item_img1 = document.getElementById('item_img').value;
    		var item_name1 = document.getElementById('item_name').value;
    		var order_number1 = document.getElementById('order_number').value;
    		var Buy_price1 = document.getElementById('Buy_price').value;
    		var Buy_date1 = document.getElementById('date').value;
    		var review_content1 = document.getElementById('review_write_content').value;
    		var user_id1 = document.getElementById('user_id').value;
    		var data = document.getElementsByName('star');
			var score; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
			for(var i=0; i<data.length; i++) {
			    if(data[i].checked) {
			    	score = data[i].value;
			    }
			}
			if( score == undefined ){
				alert("별점을 체크해주세요.");
			} else {
	    		$.ajax({
	    		    url:'/myReview_write_ok' // 요청 할 주소
	    		    //async:true,// false 일 경우 동기 요청으로 변경
	    		    type:'POST' // GET, PUT
	    		    data: {
	    		    	"item_number":item_number1,
	    		    	"item_img":item_img1,
	    		    	"item_name":item_name1,
	    		    	"order_number":order_number1,
	    		    	"Buy_price":Buy_price1,
	    		    	"Buy_date":Buy_date1,
	    		    	"review_content":review_content1,
	    		    	"review_score":score,
	    		    	"user_id":user_id1
	    		    },// 전송할 데이터
	    		    //dataType:'json', // xml, json, script, html
	    		    //beforeSend:function(jqXHR) {},// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
	    		    success:function(jqXHR) {
	    		    	alert("리뷰 등록이 완료 되었습니다.");
	    		    	opener.document.location.href=url;
	    		    	window.close();
	    		    },// 요청 완료 시
	    		    error:function(jqXHR) {
	    		    	alert("다시 시도해주세요");
	    		    },// 요청 실패.
	    		    complete:function(jqXHR) {
	    		    	
	    		    }// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
	    		});
			}
    	}
    	
    </script>
</body>
</html>