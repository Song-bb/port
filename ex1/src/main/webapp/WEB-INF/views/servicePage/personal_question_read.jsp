<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 1:1 문의 글읽기 -->

	<c:import url="../header.jsp"></c:import>

    <div id="page_wrap">
        <div class="servicePage_left">
            <div class="servicePage_title">고객센터</div>
            <div class="servicePage_side_table_div">
                <table class="servicePage_side_table">
                    <tr>
                        <td><a href="/servicePage_main"><div>공지사항<span>></span></div></a></td>
                    </tr>
                    <tr>
                        <td><a href="/fre_ask_questions"><div>자주하는 질문<span>></span></div></a></td>
                    </tr>
                    <tr>
                        <td class="selected_page_td"><a href="/personal_question"><div>1:1 문의<span>></span></div></a></td>
                    </tr>
                </table>
            </div>
            <div class="servicePage_side_btn_div">
                <button type="button"><a href="/personal_question">도움이 필요하신가요?<br>1:1 문의하기</a></button>
            </div>
        </div>
        <div class="servicePage_right">
            <div class="servicePage_title">1:1 문의</div>
                <div class="personal_que_write_div">
                    <table class="personal_que_write_table">
                    	<c:forEach items="${ personal_question_read }" var="dto">
	                        <tr>
	                            <th class="personal_que_write_th1">제목</th>
	                            <td class="personal_que_write_td1">${ dto.title }</td>
	                        </tr>
	                        <tr>
	                            <th class="personal_que_write_th1">주문번호</th>
	                            <td class="personal_que_write_td1">${ dto.order_nb }</td>
	                        </tr>
	                        <tr>
	                            <th class="personal_que_write_th1">이메일</th>
	                            <td class="personal_que_write_td1">${ dto.email }</td>
	                        </tr>
	                        <tr>
	                            <th class="personal_que_write_th1">문자메시지</th>
	                            <td class="personal_que_write_td1">${ dto.phone }</td>
	                        </tr>
	                        <tr>
	                            <th class="personal_que_write_th1">내용</th>
	                            <td class="personal_que_write_td1">${ dto.content }</td>
	                        </tr>
	                        <tr>
	                            <th class="personal_que_write_th1">이미지</th>
	                            <td class="personal_que_write_td1">
	                            	<input type="hidden" id="file1" value="${ dto.file1 }">
	                                <input type="hidden" id="file2" value="${ dto.file2 }">
	                                <input type="hidden" id="file3" value="${ dto.file3 }">
	                                <input type="hidden" id="file4" value="${ dto.file4 }">
	                                <input type="hidden" id="file5" value="${ dto.file5 }">
	                                <div id="file1_result"></div>
	                                <div id="file2_result"></div>
	                                <div id="file3_result"></div>
	                                <div id="file4_result"></div>
	                                <div id="file5_result"></div>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<input type="hidden" id="reply_result" value="${ dto.reply }">
	                            <th class="personal_que_write_th1">답변</th>
	                            <td class="personal_que_write_td1" id="result_question"></td>
	                        </tr>
	                	</c:forEach>
                    </table>
                </div>
                <div class="personal_que_write_btn_div2">
                    <button class="personal_que_write_btn2" type="button" onclick="location.href='/personal_question' ">글목록</button>
                </div>
        </div>
        <div id="servicePage_main_end"></div>
    </div>
    
    <c:import url="../footer.jsp"></c:import>
    
    <script>
   		window.onload = function() { 
   			var file1 = document.getElementById("file1").value;
   			var file2 = document.getElementById("file2").value;
   			var file3 = document.getElementById("file3").value;
   			var file4 = document.getElementById("file4").value;
   			var file5 = document.getElementById("file5").value;
   			if( !(file1 === "null") ){
   				document.getElementById("file1_result").innerHTML = "<img src='" + file1 + "' style='width: 150px;'>";
   			}
   			if( !(file2 === "null") ){
   				document.getElementById("file2_result").innerHTML = "<img src='" + file2 + "' style='width: 150px;'>";
   			}
   			if( !(file3 === "null") ){
   				document.getElementById("file3_result").innerHTML = "<img src='" + file3 + "' style='width: 150px;'>";
   			}
   			if( !(file4 === "null") ){
   				document.getElementById("file4_result").innerHTML = "<img src='" + file4 + "' style='width: 150px;'>";
   			}
   			if( !(file5 === "null") ){
   				document.getElementById("file5_result").innerHTML = "<img src='" + file5 + "' style='width: 150px;'>";
   			}
   			
   			var reply_question = document.getElementById("reply_result").value;
   			if( reply_question === "null" ){
   				document.getElementById("result_question").innerHTML = "답변 대기중입니다.";
   			} else {
   				document.getElementById("result_question").innerHTML = reply_question;
   			}
   			
   		}

    </script>