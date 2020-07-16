<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <form>
            <table class="review_write_itemlist">
                <tr>
                    <th>주문번호</th>
                    <th>상품정보</th>
                    <th>구매금액</th>
                    <th>구매일자</th>
                </tr>
                <tr>
                    <td>00000000</td>
                    <td onclick="" style="cursor:pointer" class="write_itemInfo">
                        <p><img src="http://placehold.it/500x500" alt="#"></p>
                        <span>사과 200g 외</span>
                    </td>
                    <td>13,900 원</td>
                    <td>2020-07-02</td>
                </tr>
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
                <button type="submit">등록</button>
                <button type="submit">취소</button>
            </div>
        </form>
    </div>
</body>
</html>