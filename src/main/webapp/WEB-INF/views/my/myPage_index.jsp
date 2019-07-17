<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 휴대폰 디스플레이를 위해 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
<!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    
    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
	

<style>
div.update_btn
{
   margin: auto;
   width: 5%;

}

.form-style-2 {
	max-width: 50%;
	
}

.form-style-2 label {
	display: block;
}

.form-style-2 label>span {

	font-weight: bold;
	float: left;
	padding-top: 8px;
	padding-right: 5px;
}





</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/jquery.sticky.js"></script>
  <script src="/resources/js/jquery.waypoints.min.js"></script>
  <script src="/resources/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/js/aos.js"></script>

  <script src="/resources/js/main.js"></script>
  <div class="site-wrap"  id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
      
    <jsp:include page = "../headNfoot/header.jsp"/> 
		
		<div class="subsite-section">
		      <div class="container">
		        <div class="row">
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_index.jsp" id="mypage"><h4 class="clickmy">회원정보</h4></a>
		              
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
		            
		              <a href="myPage_mark.jsp" id="mymark"><h4 class="my">찜</h4></a>
		              
		            </div>
		          </div>
		        </div>
		       </div>
		     </div>
		     
		     
		     
		<div class=" bg-light">  
	<!-- 아이디 -->
	
	<div class="content pt-5 pb-5">
		<div style="float: left; width: 50%; padding-left:25%">
			<div class="col-sm-10 col-md-10" align="center">
					<img src="img/user/base_user.png" width="200"
						style="margin-top: 30px;" class="img-circle" />
				</div>

				<div class="col-sm-10 col-md-10">
					<!-- https://www.sanwebe.com/2014/08/css-html-forms-designs -->
					<div class="sign_up_body" style="padding-top: 10px; ">
             	
				<form action="" method="post">
					
                  	<div class="form_sign_up_group pt-5 pl-5">
                  	<div class="font-size-30 pb-3 text-left">KingGodSoo
					</div>
                     
							 <label
								for="field2"><span>자기소개 </span> <textarea name="field5"
									class="form-control" rows="3"></textarea></label> <br><br>
							<label class="checkbox-inline">
								  <input type="checkbox" id="inlineCheckbox1" value="option1"> 프로필 비공개
							</label>
							</div>
						</form>
					</div>
				
				</div>
			</div>
		</div>
		<div class="verticalLine" style="border-left: thick solid #ff0000;">
		</div>
		<div
			style="float: left; width: 50%; border-left: 1px solid;">
			<div class="form-style-2" style="text-align: center;">
				<div class="sign_up_body" style="padding: 10px 50px;">
             	
				<form action="" method="post">
					
                  	<div class="form_sign_up_group">
                  	
                     
                     <label for="sign_pwd"><span class="font-size-15">비 밀 번 호</span>
                     <input type="password" class="form-control" id="sign_password" placeholder="원하는 암호를 입력하세요.."></label><br>
                     
                     <label for="sign_pwdcheck"><span class="font-size-15">비밀번호확인</span>
                     <input type="password" class="form-control" id="sign_password_check" placeholder="원하는 암호를 다시 입력해주세요.."></label><br>  
                    
                    <label for="sign_nickname"><span class="font-size-15">닉 네 임</span>
                     			<input type="text" class="form-control" id="sign_nickname" placeholder="닉네임을 입력해주세요.."> </label><br>
                     		 
                     
                     <label for="sign_name"><span class="font-size-15">이&emsp;&emsp;름</span>
                     <input type="text" class="form-control" id="sign_name" placeholder="이름을 입력해주세요.."></label><br>
                     
                     <!-- <label for="sign_prelocation1"><span class="font-size-15">선호지역1</span>
                     <input type="button" class="btn btn-primary btn-xs"  onclick="sample4_execDaumPostcode1()" value="우편번호 찾기"> <br>
                     <input type="text" class="form-control" id="sign_prelocation1" placeholder="선호지역을 입력해주세요.."></label> <br>
                     
                     <label for="sign_prelocation2"><span class="font-size-15">선호지역2</span>
                     <input type="button" class="btn btn-primary btn-xs"  onclick="sample4_execDaumPostcode2()" value="우편번호 찾기"> <br> 
                     <input type="text" class="form-control" id="sign_prelocation2" placeholder="선호지역을 입력해주세요.."> </label>
                     <br>  --><br>
                     
                     
                  </div>
				</form>
			</div>
		</div>
	</div>
	
		<div class="update_btn pt-5 pb-5">
		
			<button type="submit" id="update_submit" class="btn btn-success btn-block font-size-20 mt-5" >변  경</button> 
		</div>
	
	
	</div>   
	</div>
<jsp:include page = "../headNfoot/footer.jsp"/> 
</body>
</html>