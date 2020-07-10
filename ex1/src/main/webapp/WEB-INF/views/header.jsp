<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<link rel="stylesheet" href="css/MyStyle.css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	
</head>
<body id="header_wrap">
	<a href="">
	<div id="header_top_adv">
		<div>
			<img src="img/header_top_adv.JPG">
		</div>
	</div>
	</a>
	<div id="header_body">
		<div id="header_body_1">
			<div><a href=""><img src="img/delevery1.JPG"></a></div>
			<div>
				<a href="/joinPage_main">회원가입</a> | 
				<a href="/loginPage_main">로그인</a> | 
				<a href="/servicePage_main">고객센터</a> | 
				<a href="/delevery_place">배송지역 검색</a>
			</div>
		</div>
		<div id="header_logo_div">
			<a href="/main"><img id="header_logo" src="img/logo.png"></a>
		</div>
	</div>
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

</body>
</html>