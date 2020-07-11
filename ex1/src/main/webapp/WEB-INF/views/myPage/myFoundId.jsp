<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 아이디 비밀번호 찾기 -->

<c:import url="../header.jsp"></c:import>

    <div id="idfound_wrap">
        <div class="idfound_leftnav">
            <div class="idfound_title">아이디 / 비밀번호 찾기</div>
            <div class="idfound_side_table_div">
                <table class="idfound_side_table">
                    <tr>
                        <td><div><a href="">주문내역</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td><div><a href="">장바구니</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td><div><a href="">상품후기</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td><div><a href="">적립금</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td><div><a href="">개인정보 수정</div><div>></div></a></td>
                    </tr>
                    <tr>
                        <td><div><a href="">아이디 / 비밀번호 찾기</div><div>></div></a></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="idfound_form">
            <h2>아이디 찾기</h2>
            <p>가입했을 때 작성했던 이름과 이메일을 입력해주세요.</p>
            <form action="" method="POST">
                <label>이름 </label><input type="text" name="name" placeholder="이름을 작성해주세요" required class="found_input_text"><br>
                <label>이메일 </label><input type="email" name="email" placeholder="이메일을 작성해주세요" required class="found_input_text"><br>
                <input type="submit" value="아이디 찾기" class="found_btn_1"><br>
            </form>
        </div>
        <div id="pwfound_form">
            <h2>비밀번호 찾기</h2>
            <p>아이디와 가입시 작성했던 이름, 이메일을 입력해주세요.</p>
            <form action="" method="POST">
                <label>이름 </label><input type="text" name="name" placeholder="이름을 작성해주세요" required class="found_input_text"><br>
                <label>아이디 </label><input type="email" name="email" placeholder="이메일을 작성해주세요" required class="found_input_text"><br>
                <label>이메일 </label><input type="text" name="user_id" placeholder="아이디를 작성해주세요" required class="found_input_text"><br>
                <input type="submit" value="비밀번호 찾기" class="found_btn_1"><br>
            </form>
        </div>
    </div>


<c:import url="../footer.jsp"></c:import>