<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="/resources/css/aos.css" rel="stylesheet">
<link href="/resources/css/bootstrap-datepicker.css" rel="stylesheet">
<link href="/resources/css/jquery-ui.css" rel="stylesheet">
<link href="/resources/css/magnific-popup.css" rel="stylesheet">
<!-- <link href="/resources/css/mediaelementplayer.css" rel="stylesheet"> -->
<link href="/resources/css/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/css/owl.theme.default.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
	<!-- 여기부분 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  
	<link rel="stylesheet" href="/resources/css/SYS.css">
	<script type="text/javascript">
	var recipe_delete = location.pathname.replace("recipe_detail","recipe_delete");
	var recipe_modify = location.pathname.replace("recipe_detail","recipe_modify");
	var recipe_dib = location.pathname.replace("recipe_detail","recipe_dib");
	
	var pathname = location['pathname'];
	var excel = pathname.split("/")[2];
	var recipe_num = pathname.split("/")[3];
	
	<sec:authorize access="isAuthenticated()">
	var user_num = '<sec:authentication property="principal.member.user_num"/>'; 
	</sec:authorize>
	
	<sec:authorize access="isAnonymous()">
	var user_num = '';
	</sec:authorize>
	
	
	
	
	</script>
<title>Home</title>
</head>
<body>
		<jsp:include page="../headNfoot/header.jsp"></jsp:include>
		<%-- <%@include file="../headNfoot/header.jsp" %> 이상하게 에러 걸림;;;--%>
		
		<div class="container mt-5">
		<div class="row">

			<!-- 대표 이미지 -->
			<div class="col-sm-5" style="float: left;">
				<img src="${basic.recipe_img}" class="img-fluid rounded">
			</div>
			
			<!-- 레시피 이름, 주재료, 부재료,  -->
			<div class="col-sm-6" style="float: left; border: 1px solid; margin-left: 15px;">
				<table style="width: 100%; height: 300px;">
					<tr>
						<th>${basic.recipe_title}</th>
					</tr>
					
					<tr>
						<td>
							주재료 : ${basic.recipe_food_main}
							
							<!-- <br>
							양념 :  -->
							
							<br>
							부재료 : ${basic.recipe_food_suv}
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="container mt-5">
			<div class="row">
				<div class="col text-center">
				
					<c:if test="${not empty isWriter}">
					<button class="btn btn-primary"  onclick="location.href= recipe_modify">수정하기</button>
					<button class="btn btn-primary" onclick="location.href = recipe_delete">삭제하기</button>
					</c:if>
					<c:if test="${empty isLogin and isDib == 'dib'}">
						<button class="btn btn-primary" id="recipe_dibBtn">찜해제</button>
					</c:if>
					<c:if test="${empty isLogin and isDib == 'not_dib'}">
						<button class="btn btn-primary" id="recipe_dibBtn">찜하기</button>
					</c:if>
					
				</div>
			</div>
		</div>
		
		<br>
		<div class="row mb-2" style="clear: both;">
			<div class="col-sm-11 text-center" contentEditable="true" style="padding-left:10px; padding-bottom:10px; width: 100%; border: 1; overflow: visible; text-overflow: ellipsis; border-color: #eaedef; border-style: solid; FONT-FAMILY: 돋움; font-weight: bold; table-layout: fixed;">
				<c:forEach var="item" items="${cooking_list}" varStatus="index">
					<br>
					<c:if test="${item.cooking_img != '' || item.cooking_img != null}">
						<img src="${item.cooking_img}" style="width: 50%;"/>
						<br>
					</c:if>
					${item.cooking_num}&nbsp;${item.cooking_content}
					<br>
					<c:if test="${!index.last}">
					<hr>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<aside class="sidebar" >
         <jsp:include page="recipe_timer.jsp"/>
    </aside> 
	

	<script>
		
	</script>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/aos.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/jquery.stellar.min.js"></script>
	<script src="/resources/js/jquery.sticky.js"></script>
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/main.js"></script>
	<!-- <script src="/resources/js/mediaelement-and-player.min.js"></script> -->
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/slick.min.js"></script>
	<script src="/resources/js/typed.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		$('header').addClass(' border-bottom');
		
		var flag=true;
		
		//필요한 거  user_num, recipe_num, excel
		$(document).ready(function() {
			$('#recipe_dibBtn').on("click",function(e){
				
				if(!flag){return;}
				flag= false;
				
				if($(this).text()==='찜하기'){
					$.ajax({
						url: "/recipe_dib",
						data: {user_num: user_num,excel: excel, recipe_num : recipe_num},
						success: function(response){
							if(response==='-1'){
								alert('이미 찜하신 레시피입니다');
							} else {
								console.log(response);
								alert('레시피를 찜했습니다');
							}
							$('#recipe_dibBtn').text('찜해제')
							
						},
						error: function(error) {
							console.log("error")
					    },
					    complete: function() {
					    	flag = true;
					    }
					});	 
				} else {
					$.ajax({
						url: "/recipe_dib_delete",
						data: {user_num: user_num,excel: excel, recipe_num : recipe_num},
						success: function(response){
							console.log(response);
							alert('레시피 찜을 해제했습니다');
							$('#recipe_dibBtn').text('찜하기')
						},
						error: function(error) {
							console.log("error");
					    },
					    complete: function() {
					    	flag = true;
					    }
					});
				}
			
			});
		})
	
	</script>
	
	<%@include file="../headNfoot/footer.jsp"%>
</body>
</html>