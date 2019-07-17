<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/aos.css">
<link rel="stylesheet" href="resources/css/style.css">
<!-- MetisMenu CSS -->
<link href="resources/css/metisMenu.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

<title>레시피그램</title>

<style>
body {
	font-family: 'Jua', sans-serif;
}

.text-center input#recipe_search {
	margin-top: 6%;
	margin-bottom: 23%;
	min-width: 500px;
	min-height: 85px;
	width: auto;
	height: auto;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: #FFD7BE;
	opacity: 0.5;
	border: none;
	margin-left: -50px;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.5rem;
	letter-spacing: 5px;
	padding-left: 10%;
}

/* 클릭 시 파란테두리 없애기  */
.text-center input#recipe_search:focus, .text-center .icon #search_icon:focus,
	button#login, button#signup {
	outline: none;
}

/* placeholder */
.text-center .placeholder {
	padding-left: 20%;
	font-size: 1.5rem;
	color: #65737e;
}

/* z-index : 숫자가 적으면 뒤로 배치 크면 앞으로 배치 */
.text-center .icon {
	position: absolute;
	top: 0%;
	width: 70px;
	height: 90px;
	margin-left: 370px;
	margin-top: 9%;
	z-index: 1;
}

.text-center .icon #search_icon {
	height: 45px;
	width: 45px;
	opacity: 0.6;
}

input:focus::-webkit-input-placeholder {
	color: transparent;
}

input:focus::-moz-placeholder {
	color: transparent;
}

input:focus:-ms-input-placeholder {
	color: transparent;
}

input:focus::-ms-input-placeholder {
	color: transparent;
}

.new_like {
	position: static;
	float: right;
	margin-top: -18%;
}

.btn-default {
	background: white;
	border: solid 1px #FFC69F;
	color: #FFC69F;
}

.foodImg {
	width: 100%;
	height: 370px;
}

.mainview {
	margin-bottom: 5%;
}

.reply {
	border: solid 1px;
	border-radius: 30px;
	background: white;
	padding: 4px;
}

@media ( max-width :400px) {
	.reply {
		width: 100%;
	}
}

.replycont {
	border: none;
	border-radius: 35px;
	width: 80%;
	outline: none;
	padding-left: 13px;
	margin-right: 20px;
}

.replybtn {
	border: none;
	border-radius: 30px;
	background: white;
	outline: none;
	float: right;
	color: #FFD7BE;
}

.info {
	ovreflow: hidden;
}

.info .info_data.hiddenCom {
	white-space: nowrap;
	word-wrap: normal;
	width: 89%;
	overflow: hidden;
	text-overflow: ellipsis;
	float: left;
}

.btn-moreInfo {
	/* display: none; */
	/* white-space: nowrap; */
	float: right;
}

@media screen and (min-width: 400px) {
	.info .info_data.hiddenCom {
		width: 70%;
	}
}

.carousel-inner>.carousel-item>img {
	width: 100%;
	min-height: 300px;
	max-height: 400px;
}

@media ( max-width :400px) {
	.favorite {
		margin-top: 5%;
	}
}
</style>

</head>
<body>

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/aos.js"></script>

	<script src="resources/js/main.js"></script>

	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

 -->
<jsp:include page="../headNfoot/header.jsp" />

	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-12 col-lg-7 text-center search">

				<form id="searchText" method="post">
					<span class="icon"> <input TYPE="IMAGE" id="search_icon"
						src="img/main/search.png" value="Submit">
					</span> <input id="recipe_search" name="recipe_search"
						placeholder="레시피그램을 찾아보아요">
				</form>

				<div class="row"
					style="float: right; margin-top:-10%; margin-right: -20%;">
					<div class="col-xs-5 text-left">
						<div class="previous">
							<button type="button" class="btn btn-default btn-lg" style="border:none;">
								<span class="">최신순</span>
							</button>
						</div>
					</div>

					<div class="col-xs-5 text-right">
						<div class="next">
							<button type="button" class="btn btn-default btn-lg"style="border:none;">
								<span class="">좋아요순</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="subsite-section bg-light" style="padding-bottom: 2%;">
		<div class="container mainview">
			<span id="nickname" class="font-size-17" style="color: #65737e;">닉네임</span><br>
			<div class="row col-md-12 col-sm-12 col-xs-12">
				<!-- carousel -->
				<div id="demo" class="col-md-6 carousel" data-ride="carousel"
					data-interval="false">

					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img src="img/recipegram/images3.jpg" alt="">
						</div>
						<div class="carousel-item">
							<img src="img/recipegram/30000617971_500.jpg">
						</div>
						<div class="carousel-item">
							<img src="img/recipegram/images.jpg">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev"
						role="button"> <span class="carousel-control-prev-icon"
						aria-hidden="true"></span>
					</a> <a class="carousel-control-next" href="#demo" role="button"
						data-slide="next"> <span class="carousel-control-next-icon"
						aria-hidden="true"></span>
					</a>
				</div>

				<div class="col-md-6" style="padding-left: 1.5%; padding-top: 2%;">
					<div class="col-md-10 col-sm-12 col-xs-12">
						<!-- <input type="text" value="" readonly
							style="width: 100%;"> -->
						<div class="info" style="">
							<p class="info_data" class="font-size-17" style="color: black; ">
								맛있는 감자튀김 완성!!! <font style="color:#002F5E">#감자튀김#성공적#JMT</font> 으아아아아....놀고싶다 격하게 놀고싶다놀래놀래놀래
								놀자~~~~~~~~~!!! 힝힝힝힝힝힝힝~~~에헤라디야아아아아아아아아아 알라딘도 보고 싶고 스파이더맨도 보고싶고
								라이온킹도 보고싶고
								블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라
								블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라
								블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</p>
							<span class="btn-moreInfo" class="font-size-17" style="color: #d2d2d2; ">더보기</span>
						</div>
					</div>
					<div class="col-md-10 favorite" style="margin-top: 15%;">
						<img src="img/recipegram/favorite.png" style="width: 1.8rem;"
							onclick="ChangeImage()" name="favorite">&nbsp; <img
							src="img/recipegram/add.png" style="width: 1.8rem;">
					</div>

					<div class="row col-md-12">
						<br>
						<div class="info_data2">
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피2</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">아아아아아아아아아아아
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<!-- <div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피3</span>&nbsp;
								<span class="info_re font-size-17" style="color: black; ">히히히히히히히히히히히히
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피4</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">갸갸갸갸갹갸갸갸갸갸갸갸갸
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피5</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">로로로로로로로로로로로로로로
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피6</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">우와와와와오아
									엄청 맛있어 보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피7</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">메메메메메메메메메메메멤
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div> -->
						</div>
					</div>
					<div class="col-md-10">
						<span id="load" class="font-size-17" style="width: 100%;">댓글 더보기</span><br>
						<fieldset class="reply">
							<input class="replycont" type="text" value="">
							<input class="replybtn"  type="button" value="게시">
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<div class="subsite-section bg-light" style="padding-bottom: 2%;">
		<div class="container mainview">
			<span id="nickname" class="font-size-17" style="color: #65737e;">닉네임</span><br>
			<div class="row col-md-12 col-sm-12 col-xs-12">
				<!-- carousel -->
				<div id="demo" class="col-md-6 carousel" data-ride="carousel"
					data-interval="false">

					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img src="img/recipegram/images3.jpg" alt="">
						</div>
						<div class="carousel-item">
							<img src="img/recipegram/30000617971_500.jpg">
						</div>
						<div class="carousel-item">
							<img src="img/recipegram/images.jpg">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev"
						role="button"> <span class="carousel-control-prev-icon"
						aria-hidden="true"></span>
					</a> <a class="carousel-control-next" href="#demo" role="button"
						data-slide="next"> <span class="carousel-control-next-icon"
						aria-hidden="true"></span>
					</a>
				</div>

				<div class="col-md-6" style="padding-left: 1.5%; padding-top: 2%;">
					<div class="col-md-10 col-sm-12 col-xs-12">
						<!-- <input type="text" value="" readonly
							style="width: 100%;"> -->
						<div class="info" style="">
							<p class="info_data" class="font-size-17" style="color: black; ">
								맛있는 감자튀김 완성!!! <font style="color:#002F5E">#감자튀김#성공적#JMT</font> 으아아아아....놀고싶다 격하게 놀고싶다놀래놀래놀래
								놀자~~~~~~~~~!!! 힝힝힝힝힝힝힝~~~에헤라디야아아아아아아아아아 알라딘도 보고 싶고 스파이더맨도 보고싶고
								라이온킹도 보고싶고
								블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라
								블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라
								블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</p>
							<span class="btn-moreInfo" class="font-size-17" style="color: #d2d2d2; ">더보기</span>
						</div>
					</div>
					<div class="col-md-10 favorite" style="margin-top: 15%;">
						<img src="img/recipegram/favorite.png" style="width: 1.8rem;"
							onclick="ChangeImage()" name="favorite">&nbsp; <img
							src="img/recipegram/add.png" style="width: 1.8rem;">
					</div>

					<div class="row col-md-12">
						<br>
						<div class="info_data2">
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피2</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">아아아아아아아아아아아
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<!-- <div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피3</span>&nbsp;
								<span class="info_re font-size-17" style="color: black; ">히히히히히히히히히히히히
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피4</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">갸갸갸갸갹갸갸갸갸갸갸갸갸
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피5</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">로로로로로로로로로로로로로로
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피6</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">우와와와와오아
									엄청 맛있어 보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div>
							<div class="col-md-12 rrr">
								<span class="font-size-17" style="color: #65737e;">레시피7</span>&nbsp;
								<span class="info_re font-size-17" style="color: black;">메메메메메메메메메메메멤
									보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
							</div> -->
						</div>
					</div>
					<div class="col-md-10">
						<span id="load" class="font-size-17" style="width: 100%;">댓글 더보기</span><br>
						<fieldset class="reply">
							<input class="replycont" type="text" value="">
							<input class="replybtn"  type="button" value="게시">
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>
	



	<jsp:include page="../headNfoot/footer.jsp" />

	

 

	<script type="text/javascript">
		var state = 0;
		var su = 0;
		function ChangeImage() {
			if (state == 0) {
				document.favorite.src = "img/recipegram/favorite.png"
				su++;
				state = 1;
			} else {
				document.favorite.src = "img/recipegram/hearts.png"
				su--;
				state = 0;
			}
		}
	</script>

	<script>
		jQuery(function($) {
			var colorbox = $('.info .info_data');
			colorbox.each(function() {
				$(this).outerHeight();
				if ($(this).outerHeight() > 21) {
					$(this).addClass('hiddenCom');
					var btnMoreCmt = $(this).siblings('.btn-moreInfo');
					btnMoreCmt.show();
					btnMoreCmt.on("click", function() {
						$('.info_data').removeClass('hiddenCom');
						$('.info_data').show();
						$(this).remove();
					});
				}
			});
		});
	</script>

</body>
</html>