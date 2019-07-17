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
	
	<style type="text/css">
		
		
		body {
		   font-family: 'Jua', sans-serif;
		}
		
		.text-center input#recipe_search {
		   margin-top: 6%;
		   margin-bottom: 2em;
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
		   /* margin-left: -50px; */
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
		   margin-left: 430px;
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
		
		
		/* 아래 부터는 나의  CSS */
		
		#recipe_search_group ,#searchForm>div[class~='input-group'] {
			margin-bottom: 0.5em;
		}
		
		
        .message_detail{
            position: absolute;
            top: 10%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: black
            
        }
        
        .message_detail {
         visibility: hidden;
        }
        
        .card-img-overlay *{
        	visibility: hidden;
        }
        

        
	</style>
	
		
	<title>레시피</title>
</head>
<body>
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
		
	
	
	<jsp:include page = "../headNfoot/header.jsp"/>  

<div class="site-wrap mb-5 bg-light">	
	<!-- 검색을 위한 섹션 -->
	<section>
		<div class="container mt-4 ">
			<!-- 검색바가 위치하는 행-->
			<div class="row align-items-center justify-content-center">
	            <div class="col-sm-12 col-lg-7 text-center search">
	                  <span class="icon"> <input TYPE="IMAGE" id="search_icon" src="img/main/search.png" value="Submit">
	                  </span> <input id="recipe_search" name="recipe_search" placeholder="재료 검색 ..." style="margin-left: 0px;">
	               
	            </div>
	         </div>
	         
	        <!-- 검색바로 검색한 단어들이 들어갈 input 태그 -->
	        <div class="row mb-5">
	        	 <form id="searchForm" class="form-inline"> 
	        	 
	        	 	
		          	<div class="input-group col-sm-12  col-md-4 offset-lg-1 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		            <div class="input-group col-sm-12  col-md-4 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		            <div class="input-group col-sm-12  col-md-4 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		            <div class="input-group col-sm-12 offset-md-2 col-md-4  offset-lg-0 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		            <div class="input-group col-sm-12 offset-md-1 col-md-4 offset-lg-0 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		          </form>
		          
	        </div>
	         
	         
	      
		</div>
	</section>
	
	
	<!-- 레시피 사진 및 정보를 위한 섹션 -->
	<section class="mb-5 text-center" id="Recipe_Section">
		<div class="container">
			<div class="row" id="append">
	            <!-- <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	              	<div class="boxing_card"  style="position: relative;text-align: center;color: white">
	                	<img class="card-img-top" src="/img/main/search.png" alt="Card image cap"  style="border: 1px solid gray">
	                	<div class="message_detail">something0</div>
	                </div>
	                <div class="card-body " style="border: 1px solid gray">
	                  <p class="card-text text-center">전복죽</p>
	                </div>
	              </div>
	            </div> -->
	            
	            
	            <!-- 부트스트랩 4의 카드를 썼다. -->
	            
	            
	            <!-- items="${json_list}"  -->
		
	            
	            
	         <c:forEach var="item" items="${json_list}" varStatus="status" >   
	            <!-- card 1 -->
	             <form class="col-md-3" id="recipe_detail${item.RECIPE_ID }" name="recipe_detail" action = "./recipe_detail.do" method = "post">

		            <div onClick="document.getElementById('recipe_detail${item.RECIPE_ID }').submit();" >


			            <div class="card img-fluid mb-4 box-shadow" >
			            
								<img class="card-img-top" src="${item.IMG_URL}" alt="Card image" style="width:100%;border: 1px solid gray" > 
							
				                <div class="card-img-overlay" style="padding-top: 2em;text-overflow: ellipsis;overflow:hidden; color: #65737e; border: 1px solid gray"  >
				                    <input type="hidden" id="recipe_id" name="recipe_id" value="${item.RECIPE_ID }"/>
			         		
				                    <%-- <h5 class="card-title">- ${item.RECIPE_NM_KO} -</h5><br> --%>
				                    <p class="card-text">
				                   			 주재료 :
							                      <c:forEach var="item3" items="${material_json_list}" >
													<c:if test="${item.RECIPE_ID==item3.RECIPE_ID}">
												    	 <c:if test="${item3.IRDNT_TY_NM == '주재료'}">
												    	 	${item3.IRDNT_NM}&nbsp;
												    	 </c:if>
													</c:if>
												</c:forEach>
				                    </p>
				                    <p class="card-text">
				                   			 부재료 :
							                     <c:forEach var="item3" items="${material_json_list}">
													<c:if test="${item.RECIPE_ID==item3.RECIPE_ID}">
														<c:if test="${item3.IRDNT_TY_NM == '부재료'}">
															${item3.IRDNT_NM}&nbsp;
														</c:if>
													</c:if>
												</c:forEach>
				                    </p>
				                    
				                   
				                </div>
				             <div class="card-head text-center" style="padding-top: 1em;margin-bottom: 1em;">${item.RECIPE_NM_KO}</div>
				                
		            	</div>
		            	
		            </div>
		           </form>
	            </c:forEach> 
	    
	            <!-- end of card 1 -->
	            <!-- 
	            card 2
	            <div class="col-md-4">
		            <div class="card img-fluid mb-4 box-shadow">
		                <div class="card-head text-center" style="padding-top: 1em;">오곡밥</div>
			                <img class="card-img-top" src="http://file.okdab.com/UserFiles/searching/recipe/000300.jpg" alt="Card image" style="width:100%;margin-top: 1em;border: 1px solid gray">
			                <div class="card-img-overlay" style="padding-top: 5em;text-overflow: ellipsis;overflow:hidden; color: black; border: 1px solid gray">
			                    <h5 class="card-title">정월대보름에 먹던 오곡밥! 영양을 한그릇에 담았습니다!</h5><br>
			                    <p class="card-text">
						                       주재료:돼지고기, 멥쌀, 찹쌀,수수<br><br>
						          	부재료: 콩, 팥, 차조
			                    </p>
			                </div>
	            	</div>
	            </div>
	            end of card 2
	            
	            
	            card 3
	            <div class="col-md-4">
		            <div class="card img-fluid mb-4 box-shadow">
		                <div class="card-head text-center" style="padding-top: 1em;">잡채밥</div>
			                <img class="card-img-top" src="http://file.okdab.com/UserFiles/searching/recipe/000400.jpg" alt="Card image" style="width:100%;margin-top: 1em;border: 1px solid gray">
			                <div class="card-img-overlay" style="padding-top: 5em;text-overflow: ellipsis;overflow:hidden; color: black; border: 1px solid gray">
			                    <h5 class="card-title">잡채밥 한 그릇이면 오늘 저녁 끝! 입 맛 없을 때 먹으면 그만이지요~</h5><br>
			                    <p class="card-text">
						                       주재료: 당면, 표고버섯, 부추<br><br>
						          	부재료: 호박, 당근, 홍고추
			                    </p>
			                </div>
	            	</div>
	            </div>
	            end of card 3
	            
	            반복...
	            
	            <div class="col-md-4">
		            <div class="card img-fluid mb-4 box-shadow">
		                <div class="card-head text-center" style="padding-top: 1em;">콩나물밥</div>
			                <img class="card-img-top" src="http://file.okdab.com/UserFiles/searching/recipe/000600.jpg" alt="Card image" style="width:100%;margin-top: 1em;border: 1px solid gray">
			                <div class="card-img-overlay" style="padding-top: 5em;text-overflow: ellipsis;overflow:hidden; color: black; border: 1px solid gray">
			                    <h5 class="card-title">다이어트에 으뜸인 콩나물밥. 밥 물 넣을때 평소보다 적게 넣는거 잊지마세요!</h5><br>
			                    <p class="card-text">
						                       주재료: 쌀, 콩나물, 쇠고기<br><br>
						                        부재료: 파, 마늘, 통후추, 진간장
			                    </p>
			                </div>
	            	</div>
	            </div>
	            
	            
	           <div class="col-md-4">
		            <div class="card img-fluid mb-4 box-shadow">
		                <div class="card-head text-center" style="padding-top: 1em;">약식</div>
			                <img class="card-img-top" src="http://file.okdab.com/UserFiles/searching/recipe/000800.jpg" alt="Card image" style="width:100%;margin-top: 1em;border: 1px solid gray">
			                <div class="card-img-overlay" style="padding-top: 5em;text-overflow: ellipsis;overflow:hidden; color: black; border: 1px solid gray">
			                    <h5 class="card-title">집에서도 쉽게 만들어 맛있게 먹을 수 있답니다. 어려워 마시고 만들어 보세요~!</h5><br>
			                    <p class="card-text">
						                       주재료: 찹쌀<br><br>
						                        부재료: 잣, 대추, 깐밤
			                    </p>
			                </div>
	            	</div>
	            </div>
	            
	            <div class="col-md-4">
		            <div class="card img-fluid mb-4 box-shadow">
		                <div class="card-head text-center" style="padding-top: 1em;">호박죽</div>
			                <img class="card-img-top" src="http://file.okdab.com/UserFiles/searching/recipe/001300.jpg" alt="Card image" style="width:100%;margin-top: 1em;border: 1px solid gray">
			                <div class="card-img-overlay" style="padding-top: 5em;text-overflow: ellipsis;overflow:hidden; color: black; border: 1px solid gray">
			                    <h5 class="card-title">호박죽 한 그릇이면 하루가 든든하답니다.</h5><br>
			                    <p class="card-text">
						                       주재료: 찹쌀, 청동호박<br><br>
						                        부재료: 팥, 완두콩
			                    </p>
			                </div>
	            	</div>
	            </div> -->
	            
	            
			</div><!-- end of row -->
		</div><!-- end of container -->
		
	</section>
</div>	
	
	
	<jsp:include page="../headNfoot/footer.jsp" />

	
	

	<script>
	//$('#Recipe_Section .row')

	
	
	var json;
	
	$(document).ready(function() {
     
    	
        // nav-bar에 있는 아이콘에 마우스를 대면 아래 title 글씨가 말풍선으로 달린다.
        $('#recipe_link').tooltip({title:"레시피",placement:"bottom"});
    	$('#video_link').tooltip({title:"요리 영상",placement:"bottom"});
    	$('#recipegram_link').tooltip({title:"레시피그램",placement:"bottom"});
    	$('#sale_link').tooltip({title:"할인정보",placement:"bottom"});
    	$('#chat_link').tooltip({title:"채팅방",placement:"bottom"});
	
	    
		//$( 'header' ).addClass( ' border-bottom' ); //<header> 밑에 선을 긋는다. <hr>을 쓰면 왜인지 모르겠지만 header가 그걸 잡아 먹는다.
		
		var ings=$('input[name="searching_Ing"]');	//메모란에 있는 재료들의 값을 읽어오기 해당 DOM을 가져오는 선언 및 초기화, ings 는 ingredients의 함축어다.
		var deleteBtns = $('button.btn.btn-danger');//메모란 옆에 있는 X 버튼을 DOM을 읽어오기 위한 선언 및 초기화
	    var exist_ings = ['당근','오이','감자','양파','호박','소시지','김치','수박'];	//(prototype) 우리의 DB(혹은 JSON)에서 해당 재료가 있는지를 확인하기 위한 것이다.
		
	    
	    
	    /* 오른쪽에 메모되는 "재료들"의 목록을 배열로 가져오는 함수 */
	    function memoCollect() {
			var Buffer = [];
			for(let j = 0 ; j < ings.length ; j++){//차례대로 재료를 넣는다.
		    	if(ings[j].value) {Buffer.push(ings[j].value);}
		    }
			return Buffer;
		}
	    
	    
	    
	   
		
	    /* 메모의 X버튼을 눌렀을 때 발생하는 이벤트를 등록 */
	    /* 해당 메모의 내용을 지우고 모든 메모들을 다시 앞에서부터 채워지게 해놨다. */
	    for( let i = 0 ; i < deleteBtns.length ; i++) {
	    	deleteBtns[i].onclick = function(){ 	//1. 버튼을 누르면
	    		ings[i].value = '';					//2. 해당 버튼과 연관된 메모(input)의 내용이 삭제된다.
	    		let buf = memoCollect();			//3. 메모의 내용을 모두 모아서 buf 배열에 담는다.
	    		for(let j=0 ; j <ings.length ; j++){//4. buf의 내용을 순차적으로 넣는다. 만약 이미 메모에 내용이 있으면 지운다.
	    			if(buf[j]){ings[j].value=buf[j];}
	    			else {ings[j].value = '';}
	            }
	    	}
	    }	
	    
		
	  
	   
		
		
	     /* 그림이 그려져있는 "카드"에 걸어 놓은 이벤트 */
	     $('.card-img-overlay')
	    .mouseover(function() {//handler 메서드를 절대로 ()=> {} 로 하지말것 , this가 무조건 window로 잡혀버림;;			
	    		$(this).prev().css('filter','opacity(0.3)');	//일단 앞의 <img> 태그의 투명도를 0.3 으로 낮추고
	    		($(this).children()).css('visibility','visible');//css로 숨어 있던 카드 사진 위의 내용들이 검은색 글자로 뜸
	            $(this).css('cursor','pointer');				//그리고 해당 카드에 마우스를 대면 pointer 표시
	    }).mouseout(function() { 
	    		$(this).prev().css('filter','opacity(1)');		//마우스가 다시 나가면 사진의 투명도가 1이 되고
	            ($('.card-img-overlay').children()).css('visibility','hidden');	//카드 위의 글자들은 보이지 않게 한다.
	    }).mouseup(function() {
	    	//나중에 클릭했을 때 특정 주소로 가야되는데 그 작업을 여기서 할 것이다. 아직은 딱히 작업을 하지 않았다.
	    			
	    	console.log('mouseup');
		});
	    
	    
	    
	    //"검색 버튼"을 눌렀을 때의 이벤트를 등록 
		$('#search_icon').on("click",function(e){
			var recipe_search = $('#recipe_search');
			var ingsMemo = memoCollect();//현재 메모장에 적혀있는 재료를 읽어온다
			
			var search_value = recipe_search.val(); //검색창에 있는 재료를 읽어온다.
			
			//빈 문자열은 그냥 return!
			if(!search_value) return;
			
			recipe_search.val('');	//검색창의 내용을 비우고
			recipe_search.focus(); //커서를 놓아준다.
			
			
			// 만약 5개를 다 쓰면 어떻게 반응할지 결정한다.
			if(ingsMemo.length===5){
				alert('5개의 재료 선택을 이미 모두하셨습니다.');
				return;
			}		
	
			// 만약 검색바에 적은 재료가 현재 내가 DB나 JSON의 재료 목록에 존재하지 않으면 내용이 들어가지 못하게 함
			if(!exist_ings.includes(search_value)) {
				
				alert('존재하지 않는 재료입니다.');  
				return;
			}
			
			if(ingsMemo.length !== 0) {
				// ※주의: [].includes('값')도 false다
				if(ingsMemo.includes(search_value)) {
					alert('이미 메모장에 있는 재료입니다. \n다른 재료를 검색해주세요');
					return;//함수를 끝낸다.
				}
			} 
			
			
			//실제 메모장에 재료를 기입하는 for문, 마지막 비어있는 공간에 넣는다.
			for(var i = 0 ; i < ings.length ; i++){
				//맨 마지막에 재료를 넣는다
	            if(!ings[i].value) {ings[i].value=search_value; break;}
	         }
	
			
			
		})
	    
		
		/* "검색창"에 "엔터"를 눌렀을 경우 , 내용은 검색 버튼을 눌렀을 때와 완전히 동일하다(맨앞의 if문 빼고)*/
	    $('#recipe_search').keypress(function(e){
	        if(e.which === 13){ //검색차에서 엔터를 치는 경우
	          
				var recipe_search = $('#recipe_search');
				var ingsMemo = memoCollect();//현재 메모장에 적혀있는 재료를 읽어온다
	  		
				var search_value = recipe_search.val(); //검색창에 있는 재료를 읽어온다.
				recipe_search.val('');	//검색창의 내용을 비우고
				recipe_search.focus(); //커서를 놓아준다.
	           
				//빈 문자열은 그냥 return!
				if(!search_value) return;
				
				// 만약 5개를 다 쓰면 어떻게 반응할지 결정한다.
				if(ingsMemo.length===5){
					alert('5개의 재료 선택을 이미 모두하셨습니다.');
					return;
				}		
	
				// 만약 검색바에 적은 재료가 현재 내가 DB나 JSON의 재료 목록에 존재하지 않으면 내용이 들어가지 못하게 함
				if(!exist_ings.includes(search_value)) {
					
					alert('존재하지 않는 재료입니다.');  
					return;
				}
				
				// 메모에 현재 내가 검색하고자 하는 재료가 이미 있는 경우 이것을 중복으로 생각하고 경고창을 날린다.
				if(ingsMemo.length !== 0) {
					// ※주의: [].includes('값')도 false다
					
					if(ingsMemo.includes(search_value)) {				//메모장에 현재 존재하는 재료이면
						alert('이미 메모장에 있는 재료입니다. \n다른 재료를 검색해주세요');//경고창으로 중복됐음을 보여준다
						return;//함수를 끝낸다.
					}
				} 
				
				
				//검색창의 재료를 메모로 옮기는 것이다.
				for(var i = 0 ; i < ings.length ; i++){
		            if(!ings[i].value) {ings[i].value=search_value; break;}
		        }
			}
		});

    
	});
	
  </script>
</body>
</html>-