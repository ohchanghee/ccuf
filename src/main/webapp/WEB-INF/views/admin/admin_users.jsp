<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.solrecipe.recipe.user.domain.MemberVO" %>
<!DOCTYPE html>
<html>
<%
	int startPage = (int)request.getAttribute("startPage");
	int endPage = (int)request.getAttribute("endPage");
	int totalPage = (int)request.getAttribute("totalPage");
	int curPage = (int)request.getAttribute("page");
%>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>회원관리</title>

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
<!-- <script src="../resources/js/jquery-3.3.1.min.js"></script> -->
<script src="../resources/js/jquery-ui.js"></script>
<script>

$(document).ready(function(){ 
    $("#users_tb").tablesorter();
 });

</script>
<style>



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
.text-center input#search:focus, .text-center .icon #search_icon:focus
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

@media (max-width:500px){
	.table {
		font-size : 0.7em;
	}
}

.btns{
	border:none; 
	background:none;
	color:#939393;
	outline:none;
}


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
	height: auto;
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

</style>

</head>


<body bgcolor="black">


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
        <div class="row align-items-center position-relative mb-5">
          
            <!-- 로고 -->
            <div class="site-logo">
              <a href="/admin_index" ><img src="../img/admin/admin_logo.png" width="6%"/></a>
              
              <img src="../img/admin/admin_menu.png" style="width:85%; padding-top:5%;"/>
              <a href="/admin_users"><font style="position: absolute;top: 79%;left: 13%; font-size:60%; color:#fff;"> 회원 </font></a>
              <a href="/admin_recipe"><font style="position: absolute;top: 79%;left: 26%; font-size:60%; color:#fff;"> 레시피 </font></a>
              <a href="/admin_foodvideo"><font style="position: absolute;top: 79%;left: 39%; font-size:60%; color:#fff;"> 요리영상 </font></a>
              <a href="/recipegram_index"><font style="position: absolute;top: 79%;left: 52%; font-size:60%; color:#fff;"> 레시피그램 </font></a>
              <a href="/admin_chat"><font style="position: absolute;top: 79%;left: 67.5%; font-size:60%; color:#fff;"> 채팅방 </font></a>
              <a href="/admin_receiveMsg"><font style="position: absolute;top: 79%;left: 82%; font-size:60%; color:#fff;"> 메시지 </font></a>
             
            </div>
         </div>
       </div>
    </header>
    
    <div class="bg-dark" >
		
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center search">
      
                
				<form id="searchText" action="/admin_searchuserlist" method="get">
					<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					<span class="icon">
						<input  TYPE="IMAGE" id="search_icon" src="../img/main/search.png" value="Submit" >
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
        
          <div class="col-9 text-left">
           <div class="block-heading-1">
              <h4>- 회 원 관 리 -</h4>
            </div>
          </div>
         <div class="col-3 text-right">
          	<div class="block-heading-1" style="color:#FFC69F;">
             	${totalPosts }
          	</div>
          </div>
        </div>
          <div class="row mb-5">
        
			 <table class="table table-hover tablesorter text-center" id="users_tb">
			 	<thead>
			 		<tr>
				 		<th>
				 			번 호
				 		</th>
				 		<th>
				 			이메일
				 		</th>
				 		<th>
				 			이 름
				 		</th>
				 		<th>
				 			닉네임
				 		</th>
				 		<th>
				 			경 고
				 		</th>
				 		<th>
				 			블 랙
				 		</th>
				 	</tr>
				 </thead>
				 <tbody>
					<c:forEach items="${userlist}" var="userList"> 
					<%-- <%for(int i=0; i<userlist.size(); i++){ %> --%>
			 		<tr>
				 		<td>
				 		   ${userList.user_num} 
				 		   <%-- <%=userlist.get(i).getUser_num() %> --%>
				 		</td>
				 		<td>
				 		   <a href='javascript:sendNewMsg(${userList.user_num})'>${userList.user_username }</a> 
				 		 	<%-- <%=userlist.get(i).getUser_username() %> --%>
				 		</td>
				 		<td>
				 		  ${userList.user_name }
				 			<%--  <%=userlist.get(i).getUser_name() %> --%>
				 		</td>
				 		<td>
				 		 ${userList.user_nickname }
				 			<%--  <%=userlist.get(i).getUser_nickname() %> --%>
				 		</td>
				 		<td>
				 			<input type="button" class="btns" id="warning_btn${userList.user_num }" name="warning_btn${userList.user_num }" onclick="warning_click(${userList.user_num});" value="${userList.user_warning }"/>
				 		</td>
				 		<td>
				 			<input type="button" class="btns" id="black_btn${userList.user_num }" <%-- onclick="black_click(${userList.user_num});" --%> value="${userList.user_black }"/> 
				 		</td> 
				 	</tr>
					  </c:forEach>
					  <%-- <%} %> --%>
				 </tbody>
				 
			 </table>
		
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
					<a href='javascript:movePage("${endPage+1 }")'><i class="fas fa-angle-right"  ></i></a>
					<%} %>
				</div>	
			</div>
			<div class="row" style="margin-top:5%;"></div> 
		</div>
	</div>
      

    </div>
    
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>

<script type="text/javascript">
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";


// 쪽지 쓰기(message_write)
var writeMsgModal = document.getElementById("write_msg");

	
	function warning_click(userNum){
		
		var warning_cnt = document.getElementById('warning_btn' + userNum).value;
		var black_cnt = document.getElementById('black_btn' + userNum).value;
		var warning_btn = document.getElementById('warning_btn' + userNum);
		
		
	if(warning_cnt==2){
		
		if (confirm("블랙리스트 명단에 올라갑니다.")==true){//확인
			document.getElementById('warning_btn' + userNum).value = 3;
			document.getElementById('black_btn' + userNum).value = 1;
			$.ajax({
				url:"/admin_warning",
				type:"POST",
				dataType:"text",
				data: {"user_num":userNum, "user_warning":warning_cnt, "user_black": black_cnt},
			    beforeSend: function(xhr) {
				          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success:function(data){
					console.log(userNum);
					console.log(typeof data);
					console.log("warning: " + warning_cnt);
					
				},
				error:function(request, status, error){
					console.log("code : " + request.status +"\n" + "message : " + request.responseText + "\n" + " error : " + error);
					alert("실패" + userNum + "&" + warning_cnt);
				}
			});
		 }else{   //취소
			return false;
		 }
		
	}else if(warning_cnt<=2){	
				
				sendMsg(userNum);
			}
	}
	
	var sendMsg = function(userNum){
		// 쪽지 쓰기(message_write)
		var writeMsgModal = document.getElementById("write_msg");
		
		var warning_cnt = document.getElementById('warning_btn' + userNum).value;
		var black_cnt = document.getElementById('black_btn' + userNum).value;
		var warning_btn = document.getElementById('warning_btn' + userNum);
	
		   writeMsgModal.style.display = "block";
		   
		   // 보내기버튼 누르면
		   $("#write_btn").click(function(){
		      if($('#recv').val() == ""){
		         alert("메시지를 작성하세요!");
		         return false;
		      }
		      $.ajax({
		         type:"POST",
		         url:"/admin_warning",
		         data:{"message_content": $('#recv').val(), "user_num":userNum, "user_warning":warning_cnt, "user_black": black_cnt},
		         dataType:"text",
		         beforeSend: function(xhr) {
		               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		           },
		         success: function(data){
		            if(data == "good"){
		               alert("메시지 발송 완료");
		               
		               var search = "${search}";
		               var page = "${page}";
		               // 검색 안 한 경우 이동하는 위치
		               if(search==""){
		                  window.location="admin_users?page="+page;
		                  
		                  if(warning_cnt == 0){
								document.getElementById('warning_btn' + userNum).value =1;
								return false;
						/* 		//쪽지모딜 종료
							      window.onclick = function(event) {
							         if (event.target == writeMsgModal){
							            writeMsgModal.style.display ="none";
							         }
							      } */
							}else  if(warning_cnt==1){
								document.getElementById('warning_btn' + userNum).value =2;
								return false;
						/* 		//쪽지모딜 종료
							      window.onclick = function(event) {
							         if (event.target == writeMsgModal){
							            writeMsgModal.style.display ="none";
							         }
							      } */
							}
		               }
		               // 검색한 경우
		               else{
		                  window.location="admin_searchuserlist?page="+page+"&search="+search;
		               }
		               
		            }else{
		               alert("메시지 발송 실패! 잠시 후 다시 시도하세요.");
		            }
		         }
		      });   

		   }); 
		 //쪽지모딜 종료
		    window.onclick = function(event) {
		       if (event.target == writeMsgModal){
		          writeMsgModal.style.display ="none";
		       }
		    }	
		      // x버튼 누르면 현재 모달 없어지는 로직
		      $('.closeMsg').on("click",function(){
		         
		         writeMsgModal.style.display = "none";
		         // 작성했던 내용 지우기
		         $("#send").val("");
		         $("#recv").val("");
		      }) 
	}
	
//이메일 눌러서 쪽지 보내는 로직
// 쪽지보내기
var sendNewMsg = function(recver_num){
	var writeMsgModal = document.getElementById("write_msg");
	
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
						window.location="admin_users?page="+page;	
					}
					// 검색한 경우
					else{
						window.location="admin_searchuserlist?page="+page+"&search="+search;
					}
					
				}else{
					alert("메시지 발송 실패! 잠시 후 다시 시도하세요.");
				}
			}
		});	
	});
	//쪽지모딜 종료
	window.onclick = function(event) {
	   if (event.target == writeMsgModal){
		   writeMsgModal.style.display ="none";
	   }
	}
	// x버튼 누르면 현재 모달 없어지는 로직
	$('.closeMsg').on("click",function(){
		
		writeMsgModal.style.display = "none";
		// 작성했던 내용 지우기
		$("#send").val("");
		$("#recv").val("");
	})
}
	

</script>




<script type="text/javascript">
	//페이지 이동 함수
	var search = "${search}"
	function movePage(page){
		//검색 안한 경우
		if(search==""){
			location.href="admin_users?page="+page;
		}
		//검색한 경우
		else{
			location.href="admin_searchuserlist?page="+page+"&search="+search;
		}
	}
</script>

 <!-- 메시지 관련 -->
<jsp:include page = "admin_message_write.jsp"/> 
           
</body>
</html>