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
	
    <div id="page_wrap">
        <div class="servicePage_left">
            <div class="servicePage_title">고객센터</div>
            <div class="servicePage_side_table_div">
                <table class="servicePage_side_table">
                    <tr>
                        <td><div><a href="">공지사항</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td><div><a href="">자주하는 질문</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td><div><a href="">1:1 문의</div><div>></div></a></td>
                    </tr>
                </table>
            </div>
            <div class="servicePage_side_btn_div">
                <button type="button"><a href="">도움이 필요하신가요?<br>1:1 문의하기</a></button>
            </div>
        </div>
        <div class="servicePage_right">
            <div class="servicePage_title">공지사항 <span>과일장수의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></div>
            <div class="office_board">
                <table class="office_board_table">
                    <tr class="office_board_table_tr">
                        <td class="office_board_table_td office_td1">번호</td>
                        <td class="office_board_table_td office_td2">제목</td>
                        <td class="office_board_table_td office_td3">작성자</td>
                        <td class="office_board_table_td office_td4">작성일</td>
                        <td class="office_board_table_td office_td5">조회</td>
                    </tr>
                    <tr class="office_board_table_tr">
                        <td class="office_board_table_td office_td1">공지</td>
                        <td class="office_board_table_td office_td2"><a href="">title1</a></td>
                        <td class="office_board_table_td office_td3">장희망</td>
                        <td class="office_board_table_td office_td4">2020-07-10</td>
                        <td class="office_board_table_td office_td5">22</td>
                    </tr>
                    <tr class="office_board_table_tr">
                        <td class="office_board_table_td office_td1">공지</td>
                        <td class="office_board_table_td office_td2"><a href="">title2</a></td>
                        <td class="office_board_table_td office_td3">장탱구</td>
                        <td class="office_board_table_td office_td4">2020-07-10</td>
                        <td class="office_board_table_td office_td5">23</td>
                    </tr>
                </table>
            </div>
            <div class="select_page_div">
                <table class="select_page_table">
                    <tr class="select_page_table_tr">
                        <td class="select_page_table_td"><a href=""><<</a></td>
                        <td class="select_page_table_td"><a href=""><</a></td>
                        <td class="select_page_table_td"><a href="">1</a></td>
                        <td class="select_page_table_td"><a href="">2</a></td>
                        <td class="select_page_table_td"><a href="">3</a></td>
                        <td class="select_page_table_td"><a href="">4</a></td>
                        <td class="select_page_table_td"><a href="">5</a></td>
                        <td class="select_page_table_td"><a href="">6</a></td>
                        <td class="select_page_table_td"><a href="">7</a></td>
                        <td class="select_page_table_td"><a href="">8</a></td>
                        <td class="select_page_table_td"><a href="">9</a></td>
                        <td class="select_page_table_td"><a href="">10</a></td>
                        <td class="select_page_table_td"><a href="">></a></td>
                        <td class="select_page_table_td"><a href="">>></a></td>
                    </tr>
                </table>
            </div>
            <div class="order_search_div">
                <div class="order_search_filter">
                    <label class="order_search_filter_label order_search_filter_label1">검색어</label> 
                    <label class="order_search_filter_label"><input type="checkbox" name="search_filter" value="name">이름</label>
                    <label class="order_search_filter_label"><input type="checkbox" name="search_filter" value="title">제목</label>
                    <label class="order_search_filter_label"><input type="checkbox" name="search_filter" value="content">내용</label>
                </div>
                <div class="order_search_filter2">
                    <div>
                        <form class="order_search_form">
                            <input class="order_search_form_text" type="text">
                            <button class="order_search_form_btn" type="submit"><i id="search_btn_i" class="fa fa-search order_search_form_btn_i"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>
	
</body>
</html>