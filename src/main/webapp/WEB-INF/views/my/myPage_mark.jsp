<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/jquery-ui.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../resources/css/aos.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

<style>
.mainRow{
	max-height:1500px;
	overflow-y:scroll;
}
.mainRow::-webkit-scrollbar { 
    /* display: none; */
}
.rWrapper {
	position: relative;
	padding-bottom: 56.25%; /* 16:9 비율인 경우 */
	/* padding-bottom값은 4:3 비율인 경우 75%로 설정합니다 */
	padding-top: 25px;
	height: 0;
	}	
.rWrapper img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	}

.vWrapper {
	position: relative;
	padding-bottom: 56.25%; /* 16:9 비율인 경우 */
	/* padding-bottom값은 4:3 비율인 경우 75%로 설정합니다 */
	padding-top: 25px;
	height: 0;
	}
.vWrapper iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	}
	
body{
	min-width:540px;
}
.wholeContainer h5{
	margin-top:2%;
}
.bottom{
	margin-bottom:7%;
}

.videoHead hr, .recipeHead hr{
	margin-top:6%;
	margin-bottom:6%;
}

.title{
	font-size:2rem;
	color:#FFC69F;
}
/* .videoBody, .recipeBody{
	max-height:1000px;
	overflow-y: scroll;
} */
.videoBody::-webkit-scrollbar, .recipeBody::-webkit-scrollbar { 
    /* display: none;  */
}
.deleteBtn{
	margin-left:95%;
	cursor:pointer;
}

@media(max-width:500px){
	.left, .right{
		margin-top:1.5rem !important;
		height:500px;
	}
	.right{
		margin-bottom:2rem;
	}
	.videoHead hr, .recipeHead hr{
	margin-top:3%;
	margin-bottom:3%;
	}
	.videoBody, .recipeBody{
		max-height:80%;
		overflow-y: scroll;
	}
	.wholeContainer img{
		width:100%;
	}
	.wholeContainer iframe{
		width:100%;
	}
	
	/* 휴대폰 보기일 시 스크롤바 모양 */
	.videoBody::-webkit-scrollbar-track, .recipeBody::-webkit-scrollbar-track{
		border-radius: 10px;
		background-color: #F8F9FA;
	}
	.videoBody::-webkit-scrollbar, .recipeBody::-webkit-scrollbar{
		width:4px;
		background-color: #F5F5F5;
	}
	
	.videoBody::-webkit-scrollbar-thumb, .recipeBody::-webkit-scrollbar-thumb{
		background-color: #FFD7BE;
	}
}
</style>

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/js/jquery-ui.js"></script>
<script src="../resources/js/popper.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/owl.carousel.min.js"></script>
<script src="../resources/js/jquery.magnific-popup.min.js"></script>
<script src="../resources/js/jquery.sticky.js"></script>
<script src="../resources/js/jquery.waypoints.min.js"></script>
<script src="../resources/js/jquery.animateNumber.min.js"></script>
<script src="../resources/js/aos.js"></script>
<script src="../resources/js/main.js"></script>
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>

<jsp:include page = "../headNfoot/header.jsp"/> 
	
		<div class="subsite-section">
		      <div class="container">
		        <div class="row">
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_index.jsp" id="mypage"><h4 class="my">회원정보</h4></a>
		              
		            </div>
		          </div>
		          
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            	<a href="#table2">	
		              <a href="myPage_recipegram.jsp" id="myrecipegram"><h4 class="my">레시피그램</h4></a>
		              </a>
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_recipe.jsp" id="myrecipe"><h4 class="my">레시피</h4></a>
		              
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_mark.jsp" id="mymark"><h4 class="clickmy">찜</h4></a>
		              
		            </div>
		          </div>
		        </div>
		       </div>
		     </div>
		     
		     
		<div class="wholeContainer bg-light">
		<div class="container">
			<div class="row mainRow">
				<!-- 좌측 -->
				<div class="col-md-6 mt-5 left">
					
					<div class="col-md-12 text-center recipeHead">
						<span class="title">찜한 레시피</span>
						<hr>
					</div>
					
					<div class="col-md-12 recipeBody">
						<% for(int i=0; i<5; i++){  %>
						<div class="each">
							<span class="deleteBtn"><i class="fas fa-times"></i></span>
							<div class="rWrapper">
								<img src="../img/main/mainimg4">
							</div>
							<h5><%=i %> 번째 블럭</h5>
						</div>
						<%} %>
					</div>
				</div>
				
				<!-- 우측 -->
				<div class="col-md-6 mt-5 right">
					<div class="col-md-12 text-center videoHead">
						<span class="title">찜한 요리영상</span>
						<hr>
					</div>
					
					<div class="col-md-12 videoBody">
						<c:forEach var="vo" items="${myVideoVO}">
							<div class="each">		 						<!-- 에러 무시 -->
								<span class="deleteBtn" onClick=deleteMarkedVideo(${vo.video_num})><i class="fas fa-times"></i></span>
									<div class="vWrapper">
										<iframe src="https://www.youtube.com/embed/${vo.video_id }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
								<h5>${vo.video_title}  &nbsp; &nbsp;<a href="/foodvideo_detail?video_num=${vo.video_num }">- 보러가기 -</a></h5>
								<div class="bottom text-right">찜한 날짜 : ${vo.firstdate }</div>
							</div>
						</c:forEach> 
					</div>
				</div>
			</div>
			<div class="row mb-5">
			</div>
		</div>
		</div>

<jsp:include page = "../headNfoot/footer.jsp"/> 
<script>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";
//무한스크롤 구현
var mainRow = document.getElementsByClassName("mainRow")[0];

var startNum=6;
$(".mainRow").scroll(function() {
	var maxHeight =  mainRow.scrollHeight;
	var currentScroll = mainRow.clientHeight + mainRow.scrollTop;
	if (maxHeight <= currentScroll) {
		$.ajax({
			// 비디오 영상 호출
			type:"GET",
			async:false,
			url:"/getMoreVideos",
			data:{"startNum":startNum},
			dataType:"json",
			beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
			success: function(data){
				 $.each(data, function(index, item){
					 // date객체는 자바스크립트에서 본인들만의 형식으로 변환되므로, 아래와같은 변환과정을 거쳐야한다.
					 var d = new Date(item.firstdate);
					 year = d.getFullYear();
					 month = d.getMonth()+1
					 if(month<10){
						 month = "0"+(d.getMonth()+1);
					 }
					 day = d.getDate();
					 if(day<10){
						 day = "0"+(d.getDate());
					 }
					 var date = year+"-"+month+"-"+day;
					 
					$(".videoBody").append("<div class='each'>"
						+"<span class='deleteBtn' onClick=deleteMarkedVideo("+item.video_num+")><i class='fas fa-times'></i></span>"
						+"<div class='vWrapper'>"
						+"<iframe src='https://www.youtube.com/embed/"+item.video_id+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
						+"</div>"
						+"<h5>"+item.video_title+"</h5>"
						+"<div class='bottom text-right'>찜한 날짜 : "+date+"</div>"
						+"</div>"
					);
	             });
			}
		});
		// 레시피 호출
		/* $.ajax({
			type:"GET",
			async:false,
			url:"/getMoreRecipes",
			data:{"startNum":startNum},
			dataType:"json",
			beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
			success: function(data){
				 $.each(data, function(index, item){
					$(".thumbnails").append("<div class='col-md-12 thumbnailcontainer'>"
						+"<a href='javascript:goDetail("+item.video_num+")'>"
						+"<img class='thumbnail' src='"+item.video_thumbnail+"'></a>"
						+"<br>"+item.video_title
						+"<br><hr>"
						+"</div>"
					);
	             });
			}
		}); */
		// 4개씩 불러냄.
		startNum += 4;
	};
});

function deleteMarkedVideo(video_num){
	if (confirm("찜 목록에서 제거하시겠습니까?")==true){    //확인
		location.href="/deleteMarkedVideo?video_num="+video_num;
	 }else{   //취소
		return false;
	 }
}

</script>
</body>
</html>