<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 > 공지사항</title>
</head>
<body>

	<c:import url="../header.jsp"></c:import>
	
	    <div class="page_wrap">
        <div class="servicePage_left">
            <div class="servicePage_title">고객센터</div>
            <div class="servicePage_side_table_div">
                <table class="servicePage_side_table">
                    <tr>
                        <td><a href="">공지사항<div>></div></a></td>
                    </tr>
                    <tr>
                        <td><a href="">자주하는 질문<div>></div></a></td>
                    </tr>
                    <tr>
                        <td><a href="">1:1 문의<div>></div></a></td>
                    </tr>
                </table>
            </div>
            <div class="servicePage_side_btn_div">
                <button type="button"><a href="">도움이 필요하신가요?<br>1:1 문의하기</a></button>
            </div>
        </div>
        <div class="servicePage_right">
            <div class="servicePage_title">공지사항 <span>과일장수의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></div>
            <div>
                <table>
                    <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>작성자</td>
                        <td>작성일</td>
                        <td>조회</td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td><<</td>
                        <td><</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                        <td>9</td>
                        <td>10</td>
                        <td>></td>
                        <td>>></td>
                    </tr>
                </table>
            </div>
            <div>
                <div>
                    검색어 
                    <label><input type="checkbox" name="search_filter" value="name">이름</label>
                    <label><input type="checkbox" name="search_filter" value="title">제목</label>
                    <label><input type="checkbox" name="search_filter" value="content">내용</label>
                </div>
                <div>
                    <form>
                        <input type="text">
                        <input type="submit">
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>
	
</body>
</html>