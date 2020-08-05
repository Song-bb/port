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
   	<link rel="stylesheet" href="css/item_list_main_style.css">
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
    <link rel="stylesheet" href="css/payment_style.css">
    <link rel="stylesheet" href="css/payment_ok_style.css">
    <link rel="stylesheet" href="css/myRegularorder_style.css">
    
    <!-- 파비콘 -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
    
    <!-- swiper(슬라이드) -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<!-- 체크박스 전체선택 -->
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<!-- 상품후기 접었다 펴기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 카카오주소폼 -->
	<!-- 라이브서버로 구동할 것 -->
    <!-- JQuery CDN 링크 -->
    <script 
        src="https://code.jquery.com/jquery-3.5.1.js" 
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
        crossorigin="anonymous">
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>

	<!-- header -->

	<div id="header">
		<div id="header_top_adv">
			<a href="/regularOrder_main" >
				<div>
					<!-- <img src="img/header_top_adv.JPG"> -->
					<img src="img/header_top_adv.JPG">
				</div>
			</a>
		</div>
		<div id="header_body">
			<div id="header_body_1">
				<div><a href="/regularOrder_main"><img src="img/delevery1.JPG"></a></div>
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
									<li><a href="/check_password">1:1 문의</a></li>
								</ul>
							</div>
					</div>
						<a href="/regularOrder_main">배송지역 검색</a>
					<% } else { %>
						<div class="sub_nav">
							<a href="/myPage_main?page=1">${ user_name } 님</a> |
								<div class="sub_navBox sub_navBox2">
									<ul>
										<li><a href="/myPage_main?page=1">주문내역</a></li>
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
						<% if( session.getAttribute("user_grade").equals("과일매니저") ){ %>
							<div id="management_page_div">
								<a id="gear" href="/management">
									<span id="gear_label">관리자페이지</span>
									<i id="gear_icon" class="fas fa-cog"></i>
								</a>
							</div>
						<% } %>
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
						<form id="search_form" action="/main_searchItem" method="post">
							<input id="search" type="text" name="search">
							<button id="search_btn" type="submit"><i id="search_btn_i" class="fa fa-search"></i></button>
						</form>
						<a id="cart" href="/myCart"><img id="cart_icon" src="img/cart.png"></a>
					</div>
				</div>
			</div>
		</div><!-- /header_nav_wrap -->
	</div>