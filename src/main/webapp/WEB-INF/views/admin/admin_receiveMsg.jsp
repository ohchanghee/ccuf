<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%
	int startPage = (int)request.getAttribute("startPage");
	int endPage = (int)request.getAttribute("endPage");
	int totalPage = (int)request.getAttribute("totalPage");
	int curPage = (int)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>받은 쪽지</title>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/jquery-ui.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">

<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">

<link rel="stylesheet" href="../resources/css/aos.css">

<link rel="stylesheet" href="../resources/css/style.css">
<!-- MetisMenu CSS -->
<link href="../resources/css/metisMenu.min.css" rel="stylesheet">


<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript" src="../resources/js/jquery.tablesorter.min.js"></script>

 <script src="../resources/js/popper.min.js"></script>
  <script src="../resources/js/bootstrap.min.js"></script>
  <script src="../resources/js/owl.carousel.min.js"></script>
  <script src="../resources/js/jquery.magnific-popup.min.js"></script>
  <script src="../resources/js/jquery.sticky.js"></script>
  <script src="../resources/js/jquery.waypoints.min.js"></script>
  <script src="../resources/js/jquery.animateNumber.min.js"></script>
  <script src="../resources/js/aos.js"></script>

  <script src="../resources/js/main.js"></script>
  <!-- Metis Menu Plugin JavaScript -->
	<script src="../resources/js/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../resources/js/sb-admin-2.js"></script>
<!-- <script src="../resources/js/jquery-3.3.1.min.js"></script> -->
<script src="../resources/js/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>
<script>

$(document).ready(function(){ 
    $("#message_tb").tablesorter();
 });

</script>
<style>

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}


/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}@media (max-width:500px){
	.modal-content{
		margin: 2% 5%; /* 15% from the top and centered */
		padding: 1%;
		width: 93%;
	}
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
/* 모달 스크롤바 다 지워버림 */
.modal::-webkit-scrollbar { 
    display: none; 
}

/* 메시지함 관련 */
.messageC{
	letter-spacing: 1px;
    word-spacing: 3px;
    line-heigh: 35px;
}
@media (max-width:500px){
	#message_tb{
		font-size:5px;
	}
	#msg_write{
		font-size:1rem;
	}
	.messageHeads{
		font-size:1rem !important;
	}
}


.search {
	/* margin-top: -250px; */
}

/* -webkit-border-radius: 5px;
  			-moz-border-radius: 5px;
  			두개는 테두리를 둥글게  */
.text-center input#search {
	width: 100%;
	height: 7.0rem;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: white;
	opacity: 0.7;
	border: none;
	margin-left: -2%;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.5rem;
	letter-spacing: 5px;
	padding-left: 10%;
}

/* 클릭 시 파란테두리 없애기  */
.table .msg
	{
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
	top: 10%;
	width: 75%;
	/* height: 30%; */
	margin-left: 45%;
	margin-top: 3%;
	z-index: 1;
}

.text-center .icon #search_icon {
	height: 50px;
	width: 50px;
	opacity: 0.8;
}


/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 3000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}


/* Modal Content/Box */
.msg-modal-content{
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}@media (max-width:500px){
	.msg-modal-content{
		margin-left:2%;
		margin-top:15%;
		padding:1%;
		width:95%;
	}

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

@media (max-width:500px){
	.table {
		font-size : 0.7em;
	}
	
	
}
</style>

</head>

<body bgcolor="black" data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<div class="site-wrap"  id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
      
   <!-- Header -->
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">
		<div class="container">
        <div class="row align-items-center position-relative">
          
            <!-- 로고 -->
            <div class="site-logo">
              <a href="/admin_index" ><img src="../img/admin/admin_logo.png" width="10%"/></a>
            </div>
         </div>
       </div>
    </header>
    
    
  
    <div class="bg-dark" >
		
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center search">
      
                
				<form id="searchText" action="/admin_searchReceiveMsg" method="get">
					<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					<span class="icon">
						<input  TYPE="IMAGE" id="search_icon" src="../img/main/search.png" type="submit" value="Submit" >
					</span>
					<input type="text" id="search" name="search" value="${search }">
				</form>
            </div>
          </div>
        </div>

      </div>
	
	 <div class="subsite-section">
      <div class="container">
        <div class="row mb-2">
        
          <div class="col-12 text-left">
           <div class="block-heading-1">
              <h4>- 쪽 지 관 리 -</h4>
            </div>
			<div class="row rwd_top">
				<div class="col-md-4 col-lg-3 mb-1 text-center">
					<div class="block-heading-1">

						<a href="/admin_receiveMsg"><h4 class="clickmy">받은 쪽지</h4></a>

					</div>
				</div>

				<div class="col-md-4 col-lg-3 mb-1 text-center">
					<div class="block-heading-1">
						<a href="/admin_sendMsg"><h4 class="my">보낸 쪽지</h4></a>
					</div>
				</div>
	          <div class="col-md-6 text-right">
	          	<div class="block-heading-1" style="color:#FFC69F;">
	             	${totalPosts }
	          	</div>
	          </div>
			</div>
          </div>
        </div>
         <div class="row mb-5">
        
			 <table class="table table-hover tablesorter text-center" id="message_tb">
			 	<thead>
			 		<tr>
				 		<th>
				 			번 호
				 		</th>
				 		<th>
				 			닉네임
				 		</th>
				 		<th>
				 			내 용
				 		</th>
				 		<th>
				 			날 짜
				 		</th>
				 		<th>
				 			답변여부
				 		</th>
				 	</tr>
				 </thead>
				 <tbody>
				 	<c:forEach var="vo" items="${msgList}">
				 		<tr>
					 		<td>
					 			${vo.message_num }
					 		</td>
					 		<td>
					 			<a href='javascript:sendMsg(${vo.sender_num})'>${vo.sender_nickname }</a>
					 		</td>
					 		<td>
					 			<a href='javascript:fn_msgDetail(${vo.message_num })'>${vo.index_content }</a>
					 		</td>
					 		<td>
					 			${vo.sendDate }
					 		</td>
					 		
				 			<c:choose>
				 				<c:when test="${vo.isRecvSend == 0 }">
				 					<td style='color : #86D5FF;'>답변 대기중</td>
				 				</c:when>
				 				<c:when test="${vo.isRecvSend == 1 }">
				 					<td>완료됨</td>
				 				</c:when>
				 			</c:choose>
				 		</tr>
					</c:forEach> 
			 		<!-- <tr>
				 		<td>
				 			1
				 		</td>
				 		<td>
				 			연정쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			광고글이 있어요. 레시피그램 아람언니꺼에 .....
							</button>
				 		</td>
				 		<td>
				 			2019-02-16
				 		</td>
				 		<td>
				 			읽 음
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			4
				 		</td>
				 		<td>
				 			아람쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			이상한 사람이 있습니다.... 경고 좀 주 .....
					 		</button>
				 		</td>
				 		<td>
				 			2019-07-12
				 		</td>
				 		<td>
				 			안읽음
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			2
				 		</td>
				 		<td>
				 			관수쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			간단한 쿠키레시피도 올려주세요오오오오오오오 .....
					 		</button>
				 		</td>
				 		<td>
				 			2019-03-29
				 		</td>
				 		<td>
				 			읽 음
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			3
				 		</td>
				 		<td>
				 			상언쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			하하하하하ㅏ하하하 좋아요!!!! 만족스 .....
					 		</button>
				 		</td>
				 		<td>
				 			2019-07-01
				 		</td>
				 		<td>
				 			안읽음
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			5
				 		</td>
				 		<td>
				 			창희쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			많은 정보더 올려주시면 감사할꺼 같습 .....
					 		</button>
				 		</td>
				 		<td>
				 			2018-11-10
				 		</td>
				 		<td>
				 			읽음
				 		</td>
				 	</tr> -->
				 </tbody>
				 
			 </table>
		
		</div>
		</div>
      <!-- 페이징 -->
		<div class="row" style="font-size:23px;">
			<div class="col-12 text-center">
				<%if(startPage != 1){ %>
				<a href='javascript:movePage("${startPage-10 }")'><i class="fas fa-angle-left" style="color:#FFC69F;"></i></a>
				&nbsp;
				&nbsp;
				<%}%>
				<%for(int i=startPage; i<=endPage; i++){
					if (i==curPage){
				%>
					<a href='javascript:movePage(<%=i %>)' style="color:white;"><%=i %></a>
					&nbsp;
					&nbsp;
				<%}else{ %>
					<a href='javascript:movePage(<%=i %>)'><%=i %></a>
					&nbsp;
					&nbsp;
				<%}} %>
				<%if(endPage != totalPage){ %>
				<a href='javascript:movePage("${endPage+1 }")'><i class="fas fa-angle-right"  style="color:#FFC69F;"></i></a>
				<%} %>
			</div>	
		</div>
		<div class="row" style="margin-top:5%;"></div>
	</div>
    </div>
    
<jsp:include page="admin_message_detail.jsp"/>
<jsp:include page="admin_message_write.jsp"/>
      
            	
<script>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";

var boxmodal = document.getElementById('msgboxModal');

var msgModal = document.getElementById('msgModal');

var writeMsgModal = document.getElementById("write_msg");

//페이지 이동 함수
var search = "${search}"
function movePage(page){
	// 검색 안한 경우
	if(search==""){
		location.href="admin_receiveMsg?page="+page;	
	}
	// 검색한 경우
	else{
		location.href="admin_searchReceiveMsg?page="+page+"&search="+search;
	}
}

//특정 쪽지 행을 누르면 message_detail 모달을 불러오는 로직
var fn_msgDetail = function(message_num) {
	$.ajax({
		type:"POST",
		url:"/detailMsg",
		data:{"message_num":message_num},
		dataType:"json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
		success: function(data){
			$("#send_content").val(data.send_content);
			// value 초기화(message_num으로)
			$("#message_num").val(data.message_num);
			
			// 색칠
			$("#answer_area").css('background-color','#FFD7BE');
			$("#send_content").css('background-color','#e9ecef');
			
			// 답변이 완료 된 경우에만 답변칸이 보임.
			if(data.isRecvSend == 1){
				$("#answerMsgFrm").hide();
				$("#answer_div").css("display", "block");
				$("#answer_area").val(data.recv_content);
			}
			else{
				$("#answerMsgFrm").css('display','block');
				$("#answer_div").css("display", "none");
			}

			msgModal.style.display = "block";
		},
	});
}
//글쓰기 모달 불러오는 로직
var sendMsg = function(recver_num){
	writeMsgModal.style.display = "block";
	
	// 보내기버튼 누르면
	$("#write_btn").click(function(){
		if($('#recv').val() == ""){
			alert("메시지를 작성하세요!");
			return false;
		}
		$.ajax({
			type:"POST",
			url:"/sendMsg",
			data:{"message_content": $('#recv').val(), "recver_num": recver_num},
			dataType:"text",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
			success: function(data){
				if(data == "good"){
					alert("메시지 발송 완료");
					
					var search = "${search}";
					var page = ${page};
					// 검색 안 한 경우 이동하는 위치
					if(search==""){
						window.location="admin_receiveMsg?page="+page;	
					}
					// 검색한 경우
					else{
						window.location="admin_searchReceiveMsg?page="+page+"&search="+search;
					}
					
				}else{
					alert("메시지 발송 실패! 잠시 후 다시 시도하세요.");
				}
			}
		});	
	});
	
}

//배경 누르면 종료되는 로직 (여기선 됨)
window.onclick = function(event) {
   if (event.target == boxmodal) {
      boxmodal.style.display = "none";
   } else if (event.target == msgModal) {
	   msgModal.style.display = "none";
   }else if (event.target == writeMsgModal){
	   writeMsgModal.style.display ="none";
   }
}
// x버튼 누르면 현재 모달 없어지는 로직
$('.closeMsg').on("click",function(){
	
	msgModal.style.display = "none";
	writeMsgModal.style.display = "none";
	// 작성했던 내용 지우기
	$("#send").val("");
	$("#recv").val("");
})

</script>
           
</body>
</html>