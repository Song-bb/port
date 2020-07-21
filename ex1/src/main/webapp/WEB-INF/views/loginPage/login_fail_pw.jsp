<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 로그인페이지 -->


	<c:import url="../header.jsp"></c:import>
    <div id="login_wrap">
        <div id="login_form">
            <h2>로그인</h2>
            <form action="/login_ok" method="POST">
                <input type="text" name="user_id" placeholder="아이디를 입력해주세요" required class="login_input"><br>
                <input type="password" name="user_pw" placeholder="비밀번호를 입력해주세요" required class="login_input"><br>
                <button type="submit" id="login_btn_1">로그인</button>
            </form>
            <div id="login_btn">
                <button type="button" id="login_btn_2" onclick="location.href='/joinPage_main'">회원가입</button>  
            </div>
            <div id="login_id_pw_found">
                <label><a href="/foundId">아이디 | 비밀번호 찾기</a></label>   
            </div>
        </div>
    </div>

	<c:import url="../footer.jsp"></c:import>

<script>
$(document).ready(function(){
     alert("비밀번호를 확인해주세요.");
});
</script>