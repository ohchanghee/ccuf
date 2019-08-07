<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>레시피수정</title>

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
	
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/js/jquery.tablednd.js"></script>

<script src="../resources/js/jquery-ui.js"></script>
<script >
function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            document.getElementById("img").src = e.target.result;
            document.getElementById("img").style.width = "100%";
            document.getElementById("img").style.height = "100%";
            document.getElementById("img").style.paddingTop = "0%";
            
            //$target.html('<img src="' + e.target.result + '" border="0" alt="" style="width:100%; height:100%;"/>');
    
        }
        reader.readAsDataURL(html.files[0]);
    }
}


/* 추가, 삭제버튼 */

var oTbl;
var count=${cooking_list.size()+2};

// 기존 row에 함수 등록
window.onload=function(){
	oTbl = document.getElementById("addTable");
	for(i=1; i<oTbl.rows.length; i++){
		oTbl.rows[i].onmouseover = function(){oTbl.clickedRowIndex=this.rowIndex;};
	}
}

//Row 추가
function insRow() {
  var oRow = oTbl.insertRow();
  oRow.id = "add"+count; //tr에 id 부여 
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex;}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell(0);
  oCell.style.width = "80%";
  var oCell1 = oRow.insertCell(1);
  oCell1.style.width = "4%"
  var oCell2 = oRow.insertCell(2);
  oCell2.style.width = "4%"
  var oCell3 = oRow.insertCell(3);
  oCell3.style.width = "5%";
  
  //삽입될 Form Tag
  var frmTag = "<input class='cooking_txt' type='text' name='add_txt' placeholder='조리순서를 입력하세요 ...' >";
  
  var frmTag1 = "<div id='add_img"+count+"' style='height:150%; border-color:#65737e; text-align:center'>";
  frmTag1 += '<img src = "../img/admin/admin_plus.png" id="add_img'+count+'"' +' style="width:4.5rem; border:none; padding-top:60%;" '+'onclick=\"document.getElementById(\'img' + count+'\').click();\">';
  frmTag1 += "</div>";
  
  var frmTag2 = "<input class='cooking_btn' id='close' type=IMAGE value='삭제' onClick='removeRow();' src='../img/admin/admin_delete.png'/>";
  var frmTag3 = '<input type="file" id="img'+count+'" style="display:none;"  onchange="cooking_getThumbnailPrivew(this,$(\'#add_img'+count+'\'))">';

  
  oCell.innerHTML = frmTag;
  oCell1.innerHTML = frmTag1;
  oCell2.innerHTML = frmTag2;
  oCell3.innerHTML = frmTag3;
  //행이동 
  $("#addTable").tableDnD();
  count++
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.clickedRowIndex);
}

function frmCheck()
{
	var frm = document.form;
	  
	for( var i = 0; i <= frm.elements.length - 1; i++ ){
	    if( frm.elements[i].name == "add_txt" )
	    {
	        if( !frm.elements[i].value ){
				alert("텍스트박스에 값을 입력하세요!");
				frm.elements[i].focus();
				return;
	    	}
		}
	}
  	
	// 수정: 만약 위에서 return이 되지 않고 무사히 여기까지 왔으면 ajax를 통해서 FormData를 보낸다.
	
	var s1 = new FormData($('form#form')[0]);
	var s2 = new FormData($('form#cooking')[0]); 
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";

	           
	for(var s of s2.entries()){	//이클립스에서는 오류가 뜨는데 전혀 문제 없는 코드다.
	   if(s.includes('add_txt')) {
	      s1.append('add_txt',s[1]);
	   } else {
	      s1.append('img',s[1]);
	   }
	}
  	
	$.ajax({
        url : "/modify_recipe",
        data : s1,
        dataType : 'text',
        processData : false,
        contentType : false,
        type : 'POST',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
        success : function(response) {
           console.log('got response');
           console.log(response);
           if(response === 'good') {self.location = "/admin_recipe"} 
           else {alert('데이터 입력 실패!')}
        },                  
        error : function(jqXHR) {
        	alert('데이터 전송에 실패했습니다. 통신 상태가 좋지 않거나 서버에 문제가 있을 수 있습니다.')
			console.log('error');
        },            
     });
	
 }


function cooking_getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
           	$target.css('padding-top', '0%');
	        $target.html('<img src="' + e.target.result + '" border="0" alt="" style="width:6.0rem; height:6.0rem;" />');
    
        }
        reader.readAsDataURL(html.files[0]);
    }
}


//행 이동  ... 
/* $(document).ready(function() {
    $("#addTable").tableDnD();
}); */
</script>
<style>

#close {
	-webkit-filter: opacity(1.0) drop-shadow(0 0 0 #fff);
	filter: opacity(1.0)) drop-shadow(0 0 0 #fff);
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

input.cooking_txt, input.cooking_btn{
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
}

input.cooking_txt{
	background-color: #FFD7BE;
	width:100%;
	height:4.5rem;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.0rem;
	letter-spacing: 2px;
	padding-left: 3%;
}


/* 클릭 시 파란테두리 없애기  */
input.cooking_txt:focus, .cooking_btn:focus, #cooking_title:focus, #cooking_sub:focus, #cooking_main:focus
	{
	outline: none;
}



/* z-index : 숫자가 적으면 뒤로 배치 크면 앞으로 배치 */


#cooking_title{
	height:4.0rem;
	background-color: #FFD7BE;
	border:none;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.3rem;
	letter-spacing: 2px;
	padding-left: 6%;
}

#cooking_main{
	height:6.5rem;
	background-color: #FFD7BE;
	border:none;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.3rem;
	letter-spacing: 2px;
	padding-left: 6%;
}

#cooking_sub{
	height:7.5rem;
	background-color: #FFD7BE;
	border: none;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.3rem;
	letter-spacing: 2px;
	padding-left: 6%;
}


</style>

</head>


<body bgcolor="black" data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<div class="site-wrap mb-5"  id="home-section">

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
    
   
  
   
	 <div class="site-section">
      <div class="container">
        <div class="row mb-2">
        
          <div class="col-12 text-left">
           <div class="block-heading-1">
              <h4>- 레 시 피 수 정 -</h4>
              
            </div>
          </div>
        </div>
       <form name="form" id="form" method="post" enctype="multipart/form-data" autocomplete="off">
     	<div class="row">
         <div class="col-lg-6 col-md-6 mb-4 mb-lg-0" >
         		<div class="text-center rounded">
    			
         			<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
         			<input type = "hidden" name = "recipe_num" value = "${recipe_num}"/>
    				<div id="mainimg_1" class="mb-5" style="height:25.0rem;border:1px solid #FFD7BE; text-align:center">
           					<img src = "${basic.recipe_img}" id="img"style="width:100%; height:100%; border:none;" onclick="document.getElementById('mainimg').click();"> <!-- 이미지버튼으로 파일첨부  -->
          				</div>
           		
           					<input type="file" id="mainimg" name="mainimg" style="display:none; " onchange="getThumbnailPrivew(this,$('#mainimg_1'))">
           		
           			
           		</div>
           		
           	</div>
           	<div class="col-lg-6 col-md-6 mb-4 mb-lg-0 mt-5">
           	<div class="rounded">

           		<!-- user_num과 excel을 함께 보내줌 -->
	          	<sec:authentication var="user_num" property="principal.member.user_num"/>
	    		<input type="hidden" id="user_num" name="user_num" value="${user_num }">
	    		<input type="hidden" id="excel" name="excel" value="1">
           		<input id="cooking_title" name="cooking_title" class="mb-4" type="text" value = "${basic.recipe_title}" placeholder="제목을 입력하세요 ..." style="width:100%;">
           		<textarea id="cooking_main" name="cooking_main" placeholder="주 재료를 입력하세요 ..."style="width:100%;">${basic.recipe_food_main}</textarea>
           		<textarea id="cooking_sub"  name="cooking_sub" placeholder="추가 재료를 입력하세요 ..."style="width:100%;">${basic.recipe_food_suv}</textarea>
           		
          </div>
        </div>
		</div>
        </form>
		</div>
		   <!-- <span class="icon"><img src="img/main/search.png" /></span>
                <input type="text" id="recipe_search" /> -->
      <div class="container">
        <div class="row">
        <div class="col-12">
        	
		<form id="cooking" method="post">
			<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					<!-- <input type="submit" id="search_btn" name="search_btn" >
					<span class="icon"><img src="img/main/search.png" /></span> -->
		
						
					
			<table style="width:100%;">
			  <tr>
			    <td colspan="2" align="left" >
			      <table style="width:100%" style="border:0" >
			        <tr>
			         <td colspan="5" height="25" align="left">
			         </td>
			        </tr>
			        <tr>
			         <td>
			           <table id="addTable" style="width:100%; height:100%;" >
			           	<tr>
			           		<td align="center"><input class="cooking_btn mb-4" name="addButton" type="button" style="cursor:hand; width:7.5rem; height:2.5rem; color:#FFD7BE; background-color:black; border-color:#FFD7BE;" onClick="insRow()" value="조리순서 추가">
			        		</td>
			        	</tr>
			        	
			        	<c:set var="cnt" value="2" />
			        	<c:forEach var="item" items="${cooking_list }">
			        		<tr id="add${cnt}">
			              <td style="width:80%;">
			              	<input class="cooking_txt" type="text" name="add_txt" value="${item.cooking_content}"placeholder="조리순서를 입력하세요 ...">	</td>
			              <td style="width:4%">
			              <div id="add_img${cnt}"  style="height:150%; border-color:#65737e; text-align:center; padding-top:70%;" >	
				              	<c:choose>
				              		<c:when test='${item.cooking_img != " " && item.cooking_img != null}'>
				              			<img src = "${item.cooking_img}"  id="add_img${cnt}"style="width:4.5rem;" onclick="document.getElementById('img${cnt}').click();">
				              		</c:when>
				              		<c:otherwise>
				              			<img src ="../img/admin/admin_plus.png" id="add_img${cnt}"style="width:4.5rem;" onclick="document.getElementById('img${cnt}').click();"> 
				              		</c:otherwise>
				              	</c:choose>	
           					</div>
           					</td>
	           				<td style="width:4%;">
	           				<input class='cooking_btn' id='close' type=IMAGE value='삭제' onClick='removeRow()' src='../img/admin/admin_delete.png'/>
	          				<input type="file" id="img${cnt}" style="display:none; " name="img" onchange="cooking_getThumbnailPrivew(this,$('#add_img${cnt}'))"></td>
				            <td style="width:5%"></td>
				            <c:set var="cnt" value="${cnt+1}"/> 
			        	</c:forEach>
			            <!-- 
			            <tr id="add2">
			              <td style="width:80%;">
			              	<input class="cooking_txt" type="text" name="add_txt" placeholder="조리순서를 입력하세요 ...">	</td>
			              <td style="width:4%">
			              	<div id="add_img2"  style="height:150%; border-color:#65737e; text-align:center; padding-top:70%;" >		
           						<img src = "../img/admin/admin_plus.png" id="add_img2"style="width:4.5rem;" onclick="document.getElementById('img2').click();"> 이미지버튼으로 파일첨부 
           					</div>
           				</td>
           				<td style="width:4%;">
          				<input type="file" id="img2" style="display:none; " name="img" onchange="cooking_getThumbnailPrivew(this,$('#add_img2'))"></td>
			            <td style="width:5%"></td>	
			            	
			            </tr> 
			            -->
			        
			          </table></td>
			        </tr>
			       </table>
			      </td>
			   </tr>
			
			
			    <tr>
			      <td align="right" colspan="5">
			      <input class="cooking_btn mt-4 " style="width:5.5rem; height:2.5rem; background-color:black; color:#FFD7BE;border-color:#FFD7BE;" type="button" name="button" value="등 록" onClick="frmCheck();">
			      </td>
			    </tr>
			 </table>
			</form>
		</div>
		</div>

      </div>
	
            </div>
 
     </div>      
</body>
</html>