<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 아이디 비밀번호 찾기 -->

<c:import url="../header.jsp"></c:import>

    <div id="idfound_wrap">
        <div id="idfound_form">
            <h2>아이디 찾기</h2>
            <c:forEach items="${ found_id_list }" var="dto">
            	회원님의 아이디는 ${ dto.user_id } 입니다.
            </c:forEach>
            <button onclick="location.href='/loginPage_main'" class="found_btn_1">로그인 하기</button><br>
            <button onclick="location.href='/foundId'" class="found_btn_1">비밀번호 찾기</button><br>
        </div>
    </div>


<c:import url="../footer.jsp"></c:import>