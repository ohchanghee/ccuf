<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	
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
	<style>
	#mob_timer{
		display:none;
	}
	@media (max-width:500px){
		#mob_timer {
			display:block;
			font-size : 0.7em;
			
		}
		.cooking_dc{
			height:	40%;
		}
		
		
		
	}
	</style>
	
		
	<title>레시피 상세보기</title>
	
	
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/jquery.countdown.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/mediaelement-and-player.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/typed.js"></script>
	

<div class="site-wrap mb-5 bg-light">
	
<div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
		
	

	
<jsp:include page = "../headNfoot/header.jsp"/>  
 <div class="site-section">
<!-- items="${json_list}"  -->
	<c:forEach var="item" items="${json_list}" varStatus="status" >
		
		<c:if test="${item.RECIPE_ID == recipe_id}">
					    	 	
		
		<%-- <c:if test="${item.RECIPE_ID==num}"> --%>
	<%-- 	<p>=========================${status.count}===========================</p> --%>
		<div class="container">
		<div class="row">

			<div class="col-sm-5" style="float: center;">
				<img src="${item.IMG_URL}" class="img-fluid rounded" style=" width:100%;">
			</div>
			
			<div class="col-sm-6" style="float: left; border: 1px solid #FFC69F; margin-left: 15px; margin-right:15px;">
				<table style="width: 100%; ">
					<tr>
						<td class="pt-3">  
							<img src = "img/recipe/share.png" style="float:right; width:5%;"/> <!-- 공유하기 -->
							<img src = "img/recipe/non-mark.png" name="mark" class="mr-2" style="float:right; width:5%;" onclick="changeMark()"/> <!-- 찜하기 -->
						</td>
					</tr>
					<tr>
						<!-- 제목 -->
						<th class="font-size-30 text-center pt-4 pb-5" style="color:#FFC69F;">${item.RECIPE_NM_KO}
						
					</th>
					</tr>
					
					<tr>
					 	<!-- 텍스트 -->
						<td class="pb-5 text-center" style="color:#FFD7BE;">"${item.SUMRY }"</td>
					</tr>
					<tr>
						<td class="pb-2 text-center">
							주재료 :
							<c:forEach var="item3" items="${material_json_list}" >
								<c:if test="${item.RECIPE_ID==item3.RECIPE_ID}">
							    	 <c:if test="${item3.IRDNT_TY_NM == '주재료'}">
							    	 	${item3.IRDNT_NM}&nbsp;
							    	 </c:if>
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td class="pb-2 text-center">	
							양념 : 
							<c:forEach var = "item3" items="${material_json_list}" >
								<c:if test="${item.RECIPE_ID==item3.RECIPE_ID}">
										<c:if test="${item3.IRDNT_TY_NM == '양념'}">
											${item3.IRDNT_NM}&nbsp;
										</c:if>
									</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td class="pb-2 text-center">
							부재료 : 
							<c:forEach var="item3" items="${material_json_list}">
								<c:if test="${item.RECIPE_ID==item3.RECIPE_ID}">
									<c:if test="${item3.IRDNT_TY_NM == '부재료'}">
										${item3.IRDNT_NM}&nbsp;
									</c:if>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<br>
		
		<div class="row mb-2" id="cooking_list">
			<div class="col-sm-11"
				style="width: 100%; border: 1; border-color: #FFC69F; border-style: solid; font-weight: bold; ">
				<div class=" text-center mt-3" id="mob_timer" >
        
				        <!-- Timer -->
				
				       <span class="minutes"style="color:#FFC69F; " >00</span> : <span class="seconds" style="color:#FFC69F; " >00</span>
				        
				                <button class="btn  " data-action="start"> <!-- Data- Allows you to create custome HTML elements for Js purposes -->
				                    Start
				                </button>
				                <button class="btn  " data-action="stop">
				                    Stop
				                </button>
				                <button class="btn  " data-action="reset">
				                    Reset
				                </button>
				            
				    
				</div>
				
				<h3 align="center" class="mb-5 mt-3">- 조리순서 -</h3>
				
				<c:forEach var="item2" items="${process_json_list}" varStatus="status1">
					<c:if test="${item.RN == item2.RECIPE_ID}">
						<div class="cooking_dc mb-2" >
						
						<c:if test="${item2.STRE_STEP_IMAGE_URL != '' || item2.STRE_STEP_IMAGE_URL != null}">
							<img src="${item2.STRE_STEP_IMAGE_URL}" style="float:right;" class="cooking_img"/>
							<br>
							
						</c:if>
						
						${item2.COOKING_NO}&nbsp;.&nbsp;${item2.COOKING_DC}
						
						</div>
					</c:if>
					
				</c:forEach>
			</div>
		</div>
	</div>
	<%-- </c:if> --%>
	</c:if>
	</c:forEach>




 	<aside class="sidebar" >
			<jsp:include page="recipe_timer.jsp"/>
  </aside> 

		
	</div>


</div>


<jsp:include page = "../headNfoot/footer.jsp"/>  
 
 <script>
 	var mark_state =0;
 	
 	function changeMark(){
 		if(mark_state == 0){
 			document.mark.src = "img/recipe/mark.png";
 			mark_state = 1;
 		}else{
 			document.mark.src = "img/recipe/non-mark.png";
 			mark_state = 0;
 		}
 	}
 	
 </script>
 
 
	<script>
$(document).ready(function(){
	var list_height = $("#cooking_list").height();
	var dc_height = $(".cooking_dc").height();
	var img_height = $(".cooking_img").height();
	
	var count=0;
	
	<c:forEach var="item" items="${json_list}" varStatus="status" >
		<c:forEach var="item2" items="${process_json_list}" varStatus="status1">
			<c:if test="${item.RN == item2.RECIPE_ID}">
				count =  ${item2.COOKING_NO} +3;
			</c:if>
		</c:forEach>
	</c:forEach>
	
	
	if(img_height==0){
		dc_height = 50;
	}else{
		dc_height=img_height;
	}

	
	$("#cooking_list").height(dc_height*count);
	
	$(".cooking_dc").height(dc_height);
	
	
});
</script>
</body>
</html>