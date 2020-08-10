<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 아이디 비밀번호 찾기 -->

<c:import url="../header.jsp"></c:import>

    <div id="idfound_wrap">
    	
        <div id="pwfound_form">
            <h2>비밀번호 변경</h2>
            <p>새로운 비밀번호를 입력해주세요.</p>
            <form action="update_pw_ok" method="POST">
            
            	<c:forEach items="${ found_id_list }" var="dto">
		    		<input type="hidden" value="${ dto.user_id }" name="user_id" />
		    	</c:forEach>
            	
                <label>비밀번호 </label><input type="password" name="user_pw" placeholder="비밀번호" required class="found_input_text"><br>
                <label>비밀번호 확인 </label><input type="password" name="user_pw_ok" placeholder="비밀번호 확인" required class="found_input_text"><br>
                <input type="submit" value="비밀번호 수정" class="found_btn_1"><br>
            </form>
        </div>
    </div>


<c:import url="../footer.jsp"></c:import>