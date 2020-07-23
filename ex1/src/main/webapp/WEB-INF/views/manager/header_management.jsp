<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일장수::관리자페이지</title>

    <link rel="stylesheet" href="css/main_style.css">
    <link rel="stylesheet" href="css/manager_style.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>

	<!-- header --><!--  -->

	<div id="header">
		<div id="header_top_adv">
			<a href="" >
				<div>
					<!-- <img src="img/header_top_adv.JPG"> -->
					<img src="${ banner_img.address }">
				</div>
			</a>
		</div>
		<div id="header_body">
			<div id="header_body_1">
				<div><a href="/regularOrder_main"><img src="img/delevery1.JPG"></a></div>
				<div>
					<div class="sub_nav">
						<a href="/myPage_main"><%= session.getAttribute("user_name") %> 님</a> |
						<div class="sub_navBox sub_navBox2">
							<ul>
								<li><a href="/myPage_main">주문내역</a></li>
								<li><a href="/myRegularorder">정기배송</a></li>
								<li><a href="/myCart">장바구니</a></li>
								<li><a href="/myReview">상품 후기</a></li>
								<li><a href="/myPoint">적립금</a></li>
								<li><a href="/updateInform">개인정보수정</a></li>
							</ul>
						</div>
					</div>
						<a href="/logout">로그아웃</a> | 
						<div class="sub_nav"> 
							<a href="/servicePage_main">고객센터</a> |
							<div class="sub_navBox">
								<ul>
									<li><a href="/servicePage_main">공지사항</a></li>
									<li><a href="/fre_ask_questions">자주하는 질문</a></li>
									<li><a href="/personal_question">1:1 문의</a></li>
								</ul>
							</div>
						</div>
						<a href="/delevery_place">배송지역 검색</a>
					<div id="management_page_div">
						<a id="gear" href="/main">
							<span id="gear_label">이용자페이지</span>
							<i id="gear_icon" class="fas fa-home"></i>
						</a>
					</div>
				</div>
			</div>
			<div id="header_logo_div">
				<a href="/main"><img id="header_logo" src="img/logo.png"></a>
			</div>
		</div>
		
		<div id="header_nav_wrap">
			<div id="header_nav">
				<div>
					<a href="">회원관리</a>
					<a href="">상품관리</a>
					<a href="">게시판관리</a>
					<a href="">배너관리</a>
				</div>
				<div>
					<div id="search_box">
						<form id="search_form" action="" method="post">
							<input id="search" type="text">
							<button id="search_btn" type="submit"><i id="search_btn_i" class="fa fa-search"></i></button>
						</form>
						<a id="cart" href="/myCart"><img id="cart_icon" src="img/cart.png"></a>
					</div>
				</div>
			</div>
		</div><!-- /header_nav_wrap -->
	</div>