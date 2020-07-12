<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!-- 공지사항 글 -->

	<c:import url="../header.jsp"></c:import>
	
    <div id="office_board_content">
        <div class="office_board_content_header">
            <a href="/main">홈</a> > 고객행복센터 > <span>공지사항</span>
        </div>
        <div class="servicePage_title">
            공지사항 <span>과일장수의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
        </div>
        <div class="office_board_table_div">
            <table class="office_board_table2">
                <tr class="office_board_table2_tr">
                    <th class="office_board_table2_th">제목</th>
                    <td class="office_board_table2_td" colspan="3">[과일장수]title1</td>
                </tr>
                <tr class="office_board_table2_tr">
                    <th class="office_board_table2_th">작성자</th>
                    <td class="office_board_table2_td" colspan="3">FruitManager</td>
                </tr>
                <tr class="office_board_table2_tr">
                    <th class="office_board_table2_th">작성일</th>
                    <td class="office_board_table2_td2">2020-07-10</td>
                    <th class="office_board_table2_th">조회수</th>
                    <td class="office_board_table2_td3">8</td>
                </tr>
                <tr class="office_board_table2_tr">
                    <td class="office_board_table2_td4" colspan="4">
                        고객님 안녕하세요,<bf></bf>
                        ~~<br>
                        내용~~~<br>
                        <br>
                        항상 좋은 품질, 합리적인 가격으로 만족드릴 수 있도록 항상 최선을 다하겠습니다. <br>
                        <br>
                        감사합니다.<br>
                        <br>
                        과일장수 드림<br>
                    </td>
                </tr>
                <tr class="office_board_table2_tr">
                    <td class="office_board_table2_td5" colspan="4">
                        <button class="office_board_table2_btn" onclick="location.href='/servicePage_main'" type="button">목록</button>
                    </td>
                </tr>
                <tr class="office_board_table2_tr">
                    <td class="office_board_table2_td6">^ 이전글</td>
                    <td class="office_board_table2_td8" colspan="3"><a href="">[과일장수]title2</a></td>
                </tr>
                <tr class="office_board_table2_tr">
                    <td class="office_board_table2_td7">v 다음글</td>
                    <td class="office_board_table2_td9" colspan="3"><a href="">[과일장수]title0</a></td>
                </tr>
            </table>
        </div>
    </div>	

	
	<c:import url="../footer.jsp"></c:import>