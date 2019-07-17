<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<body>
<!-- 회원가입 모달창 -->
<form method = "post" >
<div id="sign_up_Modal" class="modal">
         <div class="sign_up_content block-heading-1">
            <span class="close">&times;</span>
            <h2 align="center">회 원 가 입</h2>
            <div class="sign_up_body" style="padding: 40px 50px;">
               
                  <div class="form_sign_up_group">
                     <label for="sign_id">Email</label><br> 
                     <input type="email" class="form-control" id="sign_id" placeholder="인증받은 이메일이 넘어온다!! "><br> 
                     
                     <label for="sign_pwd">Password</label> &emsp; <span class="font-size-12 text-right">영어 + 숫자 8 ~  15자 </span><br> 
                     <input type="password" class="form-control" id="sign_password" placeholder="원하는 암호를 입력하세요.."><br>
                     
                     <label for="sign_pwdcheck">Password 확인</label><br> 
                     <input type="password" class="form-control" id="sign_password_check" placeholder="원하는 암호를 다시 입력해주세요.."> <br> 
                    
                     <label for="sign_name">이 름</label> <br> 
                     <input type="text" class="form-control" id="sign_name" placeholder="이름을 입력해주세요.."> <br>
                     
                     <label for="sign_nickname">닉네임</label> <br> 
                     <input type="text" class="form-control" id="sign_nickname" placeholder="닉네임을 입력해주세요.."> <br>
                     
                     <!-- <label for="sign_prelocation1">선호지역 1 </label>
                     <input type="button" class="btn btn-primary btn-xs"  onclick="sample4_execDaumPostcode1()" value="우편번호 찾기"> <br>
                     <input type="text" class="form-control" id="sign_prelocation1" placeholder="선호지역을 입력해주세요.."> <br>
                     
                     <label for="sign_prelocation2">선호지역 2</label>
                     <input type="button" class="btn btn-primary btn-xs"  onclick="sample4_execDaumPostcode2()" value="우편번호 찾기"> <br> 
                     <input type="text" class="form-control" id="sign_prelocation2" placeholder="선호지역을 입력해주세요.."> 
                      --><br> 
                     
                     <button type="submit" id="sign_submit" class="btn btn-success btn-block">회원가입</button> 

                  </div>

               

            </div>

         </div>
       </div>
</form>



<script type="text/javascript">
	$("#sign_submit").click(function () {
		
		var id= $("#sign_id").val();
		
		var paw1= $("#sign_password").val();
		
		var paw2= $("#sign_password_check").val();
		
		var Name= $("#sign_name").val();
	
		var Nickname= $("#sign_nickname").val();
		
		var Prelocation1 = $('#sign_prelocation1').val();
		
		var Prelocation2 = $('#sign_prelocation2').val();
		
		
		//alert(name + ", " + Email + ", " + nickname);
	
		
		/* if(id == "" || id == null){
			$("#id_check").show();
			return;
		} */
		
		var passRule = /^[A-Za-z0-9]{8,15}$/;//숫자와 문자 포함 형태의 8~15자리 이내의 암호 정규식
		 
		//정규식안맞는 경우 (비밀번호조건과 다를경우)
		if(!passRule.test(paw1)) {
			$("#sign_password").css("background-color", "#FFA19D");
		    return false;
		}	
		if(paw1 =="" || paw2 =="" || paw1 != paw2){
			$("#sign_password").css("background-color", "#FFA19D");
			$("#sign_password_check").css("background-color", "#FFA19D");
			return false;
		}
		if(Name =="" || Name == null){
			$("#sign_password").css("background-color", "#fff");
			$("#sign_password_check").css("background-color", "#fff");
			$("#sign_name").css("background-color", "#FFA19D");
			return false;
		}
	/* 	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
		 
		 if(!emailRule.test($("input[id='Email']").val())) {     
			alert("이메일이 맞지 않습니다.");
		            //경고
		            return false;
		} */

		
		if(Nickname ==""|| Nickname == null){
			//이메일 아이디부분(@앞부분)이 닉네임이 된다.
			return;
		}
		
		
		
	});

</script>

<!-- 다음 API사용 Sciprt -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode1() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
              /*   document.getElementById("sample4_roadAddress1").value = roadAddr; */
                document.getElementById("sign_prelocation1").value = data.jibunAddress;
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode2() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                /* document.getElementById("sample4_roadAddress").value = roadAddr; */
                document.getElementById("sign_prelocation2").value = data.jibunAddress;
                
          

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</body>
</html>