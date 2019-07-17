<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>물물교환 채팅방</title>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/aos.css">
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
	

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>

<style>
.searchContainer {
/* 	background-color: #FFD7BE;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px; */
	margin-top : 3%;
	margin-bottom : 5%;
}

/* -webkit-border-radius: 5px;
  			-moz-border-radius: 5px;
  			두개는 테두리를 둥글게  */
  			
 /* 검색바 설정 */
.dbSearchBar {
	min-height: 50px;
	width: 100%;
	height: auto;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: #FFD7BE;
	opacity: 0.5;
	border: none;
	margin-left: -4%;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.5rem;
	letter-spacing: 5px;
	padding-left: 8%;
	padding-right : 8%;
}
/* 상, 하단 검색바 세부설정 */
input#localSearch{
	margin-top:4%;
	margin-bottom:2%;
}
input#titleSearch{
	margin-bottom:4%;

}

/* 클릭 시 파란테두리 없애기  */
.text-center input.dbSearchBar:focus, .text-center .dbIcon #dbSearch_icon:focus,
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
.text-center .dbIcon {
	position: absolute;
	margin-left: 30%;
	top: 35%;
	z-index: 1;
}

.text-center .dbIcon #dbSearch_icon {
	height: 45px;
	width: 45px;
	opacity: 0.6;
}

.video-team-member-1 {
	margin-bottom: 20%;
	padding-bottom: 7%;
	border: solid 1px #D8D8D8;
}

.rowBlock {
	padding-top: 2%;
	padding-right: 2%;
	padding-left: 2%;
	margin-bottom: 5%;
	border: solid 1px #D8D8D8;
	margin-bottom: 5%;
	padding-right: 2%;
}

.rowBlock {
	position: relative;
	overflow: hidden;
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
/* 글쓰기 모달 관련! */
.chatWriteModal{
	display: none;
	position: fixed;
	z-index: 2000; /* Sit on top */
	left: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
.chatWrite-modal-content{
	background-color: #fefefe;
	margin: 1% auto; /* 15% from the top and centered */
	padding: 1%;
	border: 1px solid #888;
	width: 700px;/* Could be more or less, depending on screen size */
	height:520px;
}

/* 글쓰기모달 끝 */

/* 채팅 모달 관련! */
/* The Modal (background) */
.chatModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 2000; /* Sit on top */
	left: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.chat-modal-content{
	background-color: #fefefe;
	margin: 1% auto; /* 15% from the top and centered */
	padding: 1%;
	border: 1px solid #888;
	width: 75%; /* Could be more or less, depending on screen size */
	height:720px;
}

.modal-body{
	padding-left:5%;
	padding-right:0;
	padding-bottom:5%;
	overflow-y:scroll;
	max-height:100%;
}

.modal-body::-webkit-scrollbar { 
    display: none; 
}


.typingbox{
	height:50px;
	width:100%;
	font-size:1rem;
	-webkit-border-radius: 5px;
  	-moz-border-radius: 5px;
  	border-color:#FFD7BE;
}

/* 채팅방 내부 UI */
.modal-body-wrapper{
	max-height:100%;
}
.me textarea{
	margin-left:13%;
}
.other textarea{
	background-color:#FFD7BE !important;
}
label{
	margin-bottom:0;
}
.form-group{
	margin-bottom:0;
}
.form-control{
	line-height:1.2;
}

.form-group textarea::-webkit-scrollbar { 
    display: none; 
}
.typingbox::-webkit-scrollbar {
	display: none;
}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/*로그인 상태 유지*/
.checkbox {
	clear: both;
	overflow: hidden;
}

.checkbox label {
	width: 100%;
	border-radius: 3px;
	border: 1px solid #D1D3D4;
	font-weight: normal;
}

.checkbox input[type="checkbox"]:empty {
	display: none;
}

.checkbox input[type="checkbox"]:empty ~ label {
	position: relative;
	line-height: 2.5em;
	text-indent: 3.25em;
	margin-top: 2em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.checkbox input[type="checkbox"]:empty ~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

.checkbox input[type="checkbox"]:hover:not (:checked ) ~ label {
	color: #888;
}

.checkbox input[type="checkbox"]:hover:not (:checked ) ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

.checkbox input[type="checkbox"]:checked ~ label {
	color: #777;
}

.checkbox input[type="checkbox"]:checked ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #333;
	background-color: #ccc;
}

.checkbox input[type="checkbox"]:focus ~ label:before {
	box-shadow: 0 0 0 3px #999;
}

.checkbox input[type="checkbox"]:checked ~ label:before {
	color: #fff;
	background-color: #FFC69F;
}

/* 반응형 */
@media(max-width:500px){
	/* 상단 물물교환/공동구매 배열 변환 */
	.rwd_top h1{
		font-size:1.5rem;
	}
	.rwd_top > .col-md-4{
		width:40%;
	}
	/* 검색바 중앙배치 */
	.dbSearchBar{
		margin-right:18%;
		width:80%;
	}
	.chat-modal-content{
		width:90%;
		height:80%;
		margin-top:10%;
	}
	
	/* 채팅방 내부 UI */
	.form-control{
		font-size:0.5rem;
	}
	.modal-body-wrapper{
		max-height:90%;
	}
	.topRow{
		margin-top:-13%;
	}
	.midRow{
		height:290px !important;
	}
	.midRow > .col-md-3 h4, hr{
		display:none;
	}
	.botRow{
		height:85px;
	}
	.lists{
		font-size:5px;
	}
	.norwd{
		display:none !important;
	}
	.rwd{
		display:block !important;
	}
	.typingboxWrapper{
		margin-left:0 !important;
	}
	.submitBtnWrapper{
		text-align:center;
	}
	.submitBtn{
		width:100% !important;
	}
	.form-group label {
		font-size:0.5rem !important;
	}
	
	/* 채팅방개설 UI*/
	.chatWrite-modal-content{
	background-color: #fefefe;
	margin: 1% auto; /* 15% from the top and centered */
	padding: 1%;
	border: 1px solid #888;
	width: 100%; /* Could be more or less, depending on screen size */
	height:70%;
	}
	.chatWrite-body{
		font-size:1rem !important;		
	}
	.chatWrite-body input{
		width:100% !important;
	}
	.chatWrite-body #searchIcon {
	height: 30px !important;
	width: 30px !important;
	}
	.writeBtn{
		margin-top:5%;
		height:50px important;
		margin-left:0 !important;
		width:100% !important;
	}
	

}
@media(max-height:560px){
	.chat-modal-content{
		height:100%;
	}
	.chatWrite-modal-content{
		height:100%;
	}
}
</style>

</head>

<jsp:include page="change_chat.jsp"/>
<jsp:include page="change_chat_write.jsp"/>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
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
  <!-- Metis Menu Plugin JavaScript -->
	<script src="resources/js/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/js/sb-admin-2.js"></script>
<jsp:include page="../headNfoot/header.jsp" />

<div class="subsite-section">
      <div class="container">
        <div class="row rwd_top">
          <div class="col-md-4 col-lg-3 mb-1 text-center">
            <div class="block-heading-1">
            
              <a href="change_index.jsp" id="change"><h4 class="my">물물교환</h4></a>
              
            </div>
          </div>
          
          <div class="col-md-4 col-lg-3 mb-1 text-center">
            <div class="block-heading-1">
              <a href="#" id="with"><h4 class="clickmy">공동구매</h4></a>
            </div>
          </div>
		</div>
	</div>
</div>

<!-- 본문 -->
<div class="site-wrap bg-light"  id="home-section" style="min-height:900px;">

	<!-- 검색바 -->
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-12 col-lg-7 text-center searchContainer" >
				<!-- 상단검색바 -->
				<div class="col-md-10">
					<form id="lSearch" method="post">
						<input class="dbSearchBar" id="localSearch" name="localSearch" 
							placeholder="지역 검색" >
					</form>
				</div>
				<!-- 하단검색바 -->
				<div class="col-md-10">
				<form id="tSearch" method="post">
					<input class="dbSearchBar" id="titleSearch" name="titleSearch" 
						placeholder="제목 검색">
				</form>
				</div>
				<!-- 검색아이콘 -->
					<span class="dbIcon"> <input TYPE="IMAGE" id="dbSearch_icon"
						src="img/main/search.png" value="Submit">
					</span>
			</div>
		</div>
	</div>
	
  	 <!-- 테이블 -->
	 <div class="subsite-section" style="min-height:600px;">
      <div class="container">
        <div class="row mb-2">
        
          <div class="col-6 text-left" style="font-size:20px; color: #FFC69F;">
          	- 공동구매 -
          </div>
          <div class="col-6 text-right" style="font-size:20px; color: #FFC69F;">
          	<span class="writing" style="cursor:default">글쓰기</span>
          </div>
        </div>
         <div class="row">
        
			 <table class="table table-hover tablesorter text-center"id="chat_tb">
			 	<thead>
			 		<tr>
				 		<th>
				 			인 원
				 		</th>
				 		<th>
				 			지 역
				 		</th>
				 		<th>
				 			제 목
				 		</th>
				 		<th>
				 			방 장
				 		</th>
				 		<th>
				 			진행 / 마감
				 		</th>
				 		<th>
				 			날 짜
				 		</th>
				 	</tr>
				 </thead>
				 <tbody>
			 		<tr>
				 		<td>
				 			1/3
				 		</td>
				 		<td>
				 			[ 서울/ 서초 4동]
				 		</td>
				 		<td>
				 			<button class="font-gray-7 chatting" style="border:none; background:none;">
				 				감자 10개 교환하실 분~
				 			</button>
				 		</td>
				 		<td>
				 			연정쓰
				 		</td>
				 		<td>
				 			진행중
				 		</td>
				 		<td>
				 			2019-02-16
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			2/5
				 		</td>
				 		<td>
				 			[ 수원 / 정자 2동 ]
				 		</td>
				 		<td>
				 			<button class="font-gray-7 chatting" style="border:none; background:none;">
				 				오이3개랑 교환합니다!!! :)
				 			</button>
				 		</td>
				 		<td>
				 			아람쓰
				 		</td>
				 		<td>
				 			진행중
				 		</td>
				 		<td>
				 			2019-07-05
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			1/5
				 		</td>
				 		<td>
				 			[ 화성 / 영천동]
				 		</td>
				 		<td>
				 			<button class="font-gray-7 chatting" style="border:none; background:none;">
				 				당근있어요오오오
				 			</button>
				 		</td>
				 		<td>
				 			관수쓰
				 		</td>
				 		<td>
				 			마감
				 		</td>
				 		<td>
				 			2019-05-28
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			3/3
				 		</td>
				 		<td>
				 			[ 수원 / 영통동 ]
				 		</td>
				 		<td>
				 			<button class="font-gray-7 chatting" style="border:none; background:none;">
				 				파프리카3개랑 바꾸실분!
				 			</button>
				 		</td>
				 		<td>
				 			상언쓰
				 		</td>
				 		<td>
				 			마감
				 		</td>
				 		<td>
				 			2018-12-01
				 		</td>
				 	</tr>
				 </tbody>
				 
			 </table>
		
		</div>
			<div class="row" style="margin-top:20%; font-size:20px;">
				<div class="col-12 text-center">
					<i class="fas fa-angle-left"></i> &nbsp;&nbsp;1 &nbsp;&nbsp; 2 &nbsp;&nbsp; 3 &nbsp;&nbsp; 4 &nbsp;&nbsp; 5 &nbsp;&nbsp; <i class="fas fa-angle-right"></i>
				</div>	
			</div>
		</div>
	</div>
      
	
</div>
    
      
      
<jsp:include page="../headNfoot/footer.jsp"/>

<script>
var chatModal = document.getElementById('chattingModal');
var writeModal = document.getElementById('chatWriteModal')
var closeSpan = document.getElementById("close");
var closeWriteSpan = document.getElementById("closeWrite");
var write = document.getElementsByClassName("writing")[0];

$('.chatting').click(function() {
	 // 모달창 띄워줌
	chatModal.style.display = "block";
	/*  $(this).css('z-index', 3000); */
	 
   	// 제목 가져와서 모달창에 넘겨줌.
});
$('.writing').click(function(){
	writeModal.style.display = "block";
});


$('.writing').hover(function(){
	write.style.color = "#FFC69F";
}, function(){
	write.style.color = "#939393";
});

closeSpan.onclick = function() {
	chatModal.style.display = "none";
};
closeWriteSpan.onclick = function() {
	writeModal.style.display = "none";
};

// window.onclick 두개 있으면 함수 안 먹힐 수도 있다!!!!!!!!!!!!!!!!!
window.onclick = function(event) {
	if (event.target == writeModal) {
		writeModal.style.display = "none";
	}
	if (event.target == chatModal) {
		chatModal.style.display = "none";
	}
};
</script>
     
</body>
</html>