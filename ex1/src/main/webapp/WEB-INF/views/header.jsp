<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일장수::신선한과일을집에서!</title>

    <link rel="stylesheet" href="css/main_style.css">
    <link rel="stylesheet" href="css/about_style.css">
    <link rel="stylesheet" href="css/agreement_style.css">
    <link rel="stylesheet" href="css/event_main_style.css">
    <link rel="stylesheet" href="css/fallenFruit_main_style.css">
    <link rel="stylesheet" href="css/fruitInSeason_main_style.css">
    <link rel="stylesheet" href="css/importedFruit_main_style.css">
    <link rel="stylesheet" href="css/joinPage_main_style.css">
    <link rel="stylesheet" href="css/loginPage_main_style.css">
    <link rel="stylesheet" href="css/myCart_style.css">
    <link rel="stylesheet" href="css/policyInform_style.css">
    <link rel="stylesheet" href="css/regularOrder_main_style.css">
    <link rel="stylesheet" href="css/servicePage_main_style.css">
    <link rel="stylesheet" href="css/notice_board_style.css">
    <link rel="stylesheet" href="css/myFoundId_style.css">
    <link rel="stylesheet" href="css/myPage_main_style.css">
    <link rel="stylesheet" href="css/myOrder_style.css">
    <link rel="stylesheet" href="css/item_detail_style.css">
    <link rel="stylesheet" href="css/myReview_style.css">
    <link rel="stylesheet" href="css/updateInform_style.css">
    <link rel="stylesheet" href="css/myPoint_style.css">
    <link rel="stylesheet" href="css/withdraw_member_style.css">
    
    <!-- swiper(슬라이드) -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<!-- 체크박스 전체선택 -->
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<!-- 상품후기 접었다 펴기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>

	<!-- header -->

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
				<div><a href=""><img src="img/delevery1.JPG"></a></div>
				<div>

					<% if( session.getAttribute("user_id") == null ){ %>
						<a href="/joinPage_main">회원가입</a> | 
						<a href="/loginPage_main">로그인</a> |
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
					<% } else { %>
					<div class="sub_nav">
						<a href="/myPage_main"><%= session.getAttribute("user_name") %> 님</a> |
							<div class="sub_navBox sub_navBox2">
								<ul>
									<li><a href="/myPage_main">주문내역</a></li>
									<li><a href="#">정기배송</a></li>
									<li><a href="/myCart">장바구니</a></li>
									<li><a href="/myReview">상품 후기</a></li>
									<li><a href="#">적립금</a></li>
									<li><a href="#">개인정보수정</a></li>
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
					<% } %>
				</div>
			</div>
			<div id="header_logo_div">
				<a href="/main"><img id="header_logo" src="img/logo.png"></a>
			</div>
		</div>
		
		<div id="header_nav_wrap">
			<div id="header_nav">
				<div>
					<a href="/regularOrder_main">정기배송</a>
					<a href="/fruitInSeason_main">제철과일</a>
					<a href="/importedFruit_main">수입과일</a>
					<a href="/fallenFruit_main">낙과채널</a>
					<a href="/event_main">이벤트</a>
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