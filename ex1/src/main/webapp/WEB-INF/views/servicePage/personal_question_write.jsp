<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 1:1 문의 글쓰기 -->

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
            <form action="" method="post" enctype="multipart/form-data">
                <div class="personal_que_write_div">
                    <table class="personal_que_write_table">
                        <tr>
                            <th class="personal_que_write_th1">제목</th>
                            <td class="personal_que_write_td1">
                                <div>
                                    <select class="select_categori_select select_categori_select2" name="select2" >
                                        <option value="1" selected="selected">선택해주세요.</option>
                                        <option value="2" >배송지연/불만</option>
                                        <option value="3">반품문의</option>
                                        <option value="4">환불문의</option>
                                        <option value="5">주문결제문의</option>
                                        <option value="6">회원정보문의</option>
                                        <option value="7">취소문의</option>
                                        <option value="8">교환문의</option>
                                        <option value="9">상품정보문의</option>
                                        <option value="0">기타문의</option>
                                    </select>
                                </div>
                                <div>
                                    <input id="personal_que_write_input_title" type="text">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="personal_que_write_th1">주문번호</th>
                            <td class="personal_que_write_td1">
                                <input id="personal_que_write_input_ord_nb" type="text" name="order_number">
                                <button type="button" onclick="location.href=''" id="personal_que_search_ord_nb">주문조회</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="personal_que_write_th1">이메일</th>
                            <td class="personal_que_write_td1">
                                <input id="personal_que_write_input_email" type="text" placeholder="useremail-db사용">
                                <input type="checkbox" value="checkbox1">답변 수신을 이메일로 받겠습니다.
                            </td>
                        </tr>
                        <tr>
                            <th class="personal_que_write_th1">문자메시지</th>
                            <td class="personal_que_write_td1">
                                <input id="personal_que_write_input_ord_nb" type="text" placeholder="userphone-db사용">
                                <input type="checkbox" value="checkbox2">답변 수신을 문자메시지로 받겠습니다.
                            </td>
                        </tr>
                        <tr>
                            <th class="personal_que_write_th1">내용</th>
                            <td class="personal_que_write_td1">
                                <label>
                                    <strong>1:1 문의 작성 전 확인해주세요!</strong><br>
                                    <br>
                                    <strong>반품/환불</strong><br>
                                    - 제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.<br>
                                    <br>
                                    <strong>주문취소</strong><br>
                                    -배송 단계별로 주문취소 방법이 상이합니다.<br>
                                    [입금확인] 단계 : [과일장수>주문내역 상세페이지]에서 직접 취소 가능<br>
                                    [입금확인] 이후 단계: 고객행복센터로 문의<br>
                                    <br>
                                    - 생산이 시작된 [상품준비중] 이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.<br>
                                    - 비회원은 모바일 App 또는 모바일 웹사이트에서 [과일장수>비회원 주문 조회 페이지] 에서 취소가 가능합니다.<br>
                                    - 일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.<br>
                                    - 주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.<br>
                                    <br>
                                    <strong>배송</strong><br>
                                    - 주문 완료 후 배송방법(샛별/택배)은 변경이 불가능합니다.<br>
                                    - 배송일 및 배송시간 지정은 불가능합니다. (예약배송 포함)<br>
                                    <span id="jangsu-text">※ 전화번호, 이메일, 주소, 계좌번호 등의 상세 계인정보가 문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.</span><br>
                                    <br>
                                </label>
                                <input id="personal_que_write_input_content" type="text" name="question_content">
                            </td>
                        </tr>
                        <tr>
                            <th class="personal_que_write_th1">이미지</th>
                            <td class="personal_que_write_td1">
                                <div class="personal_que_file_upload">
                                    1<input id="personal_que_file_upload" type="file" name="upload_file1">
                                    <button type="button" onclick="location.href=''">+</button>
                                    <button type="button" onclick="location.href=''">업로드추가</button>
                                </div>
                                <div class="personal_que_file_upload">
                                    2<input id="personal_que_file_upload" type="file" name="upload_file2">
                                    <button type="button" onclick="location.href=''">-</button>
                                    <button type="button" onclick="location.href=''">업로드삭제</button>
                                </div>
                                <div class="personal_que_file_upload_bottom">
                                    <label>
                                        - 파일은 최대 5개까지 업로드가 지원됩니다.
                                    </label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="personal_que_write_btn_div2">
                    <button class="personal_que_write_btn2" type="submit">저장</button>
                </div>
            </form>
        </div>
        <div id="servicePage_main_end"></div>
    </div>
	
	<c:import url="../footer.jsp"></c:import>