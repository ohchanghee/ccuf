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
	
	
	<!-- 여기부분 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  
	<link rel="stylesheet" href="/resources/css/SYS.css">
<title>Home</title>
</head>
<body>
	<%@include file="../headNfoot/header.jsp"%>
			
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
		
		<br>
		<div class="row mb-2" style="clear: both;">
			<div class="col-sm-11" contentEditable="true" style="padding-left:10px; padding-bottom:10px; width: 100%; border: 1; overflow: visible; text-overflow: ellipsis; border-color: #eaedef; border-style: solid; FONT-FAMILY: 돋움; font-weight: bold; table-layout: fixed;">
				<c:forEach var="item" items="${cooking_list}">
					<br>
					<c:if test="${item.cooking_img != '' || item.cooking_img != null}">
						<img src="${item.cooking_img}" />
						<br>
					</c:if>
					${item.cooking_num}&nbsp;${item.cooking_content}
					<br>
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
	</script>
	
	<%@include file="../headNfoot/footer.jsp"%>
</body>
</html>