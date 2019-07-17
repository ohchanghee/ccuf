<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>레시피그램작성</title>


<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/style.css">
<!-- MetisMenu CSS -->
<link href="resources/css/metisMenu.min.css" rel="stylesheet">


<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
	


<style>

#delete:hover, #delete:focus {
	cursor: pointer;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    clip:rect(0,0,0,0);
    border: 0;
}

input.cooking_txt, input.cooking_btn{
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
}

input.cooking_txt{
	border-color:#FFD7BE;
	background-color: #FFD7BE;
	width:100%;
	height:4.5rem;
	opacity :0.6;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.0rem;
	letter-spacing: 2px;
	padding-left: 3%;
}


/* 클릭 시 파란테두리 없애기  */
input.cooking_txt:focus, .recipegram_btn:focus, #recipegram_hashtag:focus
	{
	outline: none;
}

/* 이미지 부분 */
#imgWrapper {
	border:1px dashed #65737e; 
	position: relative;
	padding-bottom: 75%; /* 16:9 비율인 경우 */
	/* padding-bottom값은 4:3 비율인 경우 75%로 설정합니다 */
	padding-top: 25px;
	height: 0;
	}	
	
#imgWrapper #mainImg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	}

/* 이미지 모달 부분 */
.imgModal{
 	width: 100%; /* Full width */
	height: 100%; /* Full height */
	display: none;
	position: fixed;
	z-index: 2000; /* Sit on top */
	left: 0;
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
.imgModal-content{
	margin-top: 5%;
	margin-left: 8%;
	margin-right: 8%;
	padding: 1%;
	width: 80%;
	height:70%;
	text-align:center;
}
#imgInModal{
	max-width:100%;
	max-height:100%;
}
	
#recipegram_hashtag{
	height:20.0rem;
	background-color: #FFD7BE;
	border:none;
	opacity :0.8;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.3rem;
	letter-spacing: 2px;
	padding-left: 6%;
}

#indexNum, #backBtn, #nextBtn, #delete{
	position:absolute;
}
#delete{
	top:3%;
	right:15%;
}
#backBtn{
	top:79%;
	right:52%;
}
#nextBtn{
	top:79%;
	right:48%;
}
#indexNum{
	top:78%;
	right:15%;
}

@media(max-width:500px){
	.recipegram_btn{
		margin-left:70% !important;
	}
	.imgModal-content{
		margin-top:30%;
		height:50%;
	}
	#nextBtn{	
		right:40%;
	}
	#backBtn{
		right:60%;
	}
}
</style>

</head>


<jsp:include page="recipegram_imgModal.jsp"/>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery.tablednd.js"></script>
<script src="resources/js/jquery-ui.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/jquery.sticky.js"></script>
  <script src="resources/js/jquery.waypoints.min.js"></script>
  <script src="resources/js/jquery.animateNumber.min.js"></script>
  <script src="resources/js/aos.js"></script>

  <script src="resources/js/main.js"></script>
  <!-- Metis Menu Plugin JavaScript -->
	<script src="resources/js/metisMenu.min.js"></script>
	<script src="https://kit.fontawesome.com/d2c6942021.js"></script>
	
<jsp:include page = "../headNfoot/header.jsp"/>   
<div class="site-wrap mb-5 bg-light"  id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
      
 
   
  
   
	 <div class="site-section">
      <div class="container">
        <div class="row mb-5 text-center">
        	<div class="col-md-12" style="color:#FFC69F ; font-size:1.5rem;">
    	    	- 레시피그램 작성 -
	        </div>
        </div>
     	<div class="row">
         <div class="col-lg-6 col-md-6 mb-4 mb-lg-0" >
         		<span style="margin-left:95%;" onclick="document.getElementById('imgs').click();"><i class="fas fa-plus" title="이미지 추가"></i></span>
         		<div class="text-center rounded">
    			
         		<!-- 업로드한 이미지가 들어갈 부분 -->
       			<div id="imgWrapper">
       				<img id="mainImg" src="img/recipegram/default.jpg">
       			</div>
           		<input type="file" id="imgs" style="display:none;" multiple/>
           			
           		</div>
		</div>
						
				
           
           	<div class="col-lg-6 col-md-6 mb-4 mb-lg-0 mt-5">
           	<div class="rounded">
    			
           		<!--textarea에 <a>태그를 넣지 못해 링크 못해서 <div> contenteditable 속성 사용  onkeyup="HashTag();"  -->
           		<div id="recipegram_hashtag" contenteditable="true" style="width:100%; overFlow:auto;" ></div>
           		
           		
          	</div>
          	<div class="rounded">
    		
         			 <label class="checkbox-inline">
								  <input type="checkbox" id="inlineCheckbox1" value="option1"> 나만 보기
							</label>
			</div>
			      
        </div>
		</div>
		<div class="row">
          <input class="recipegram_btn mt-4 " style="margin-left: 90%; width:5.5rem; height:2.5rem; background-color:#f8f9fa; color:#65737e;border-color:#65737e;" type="button" name="button" value="등 록" onClick="frmCheck();">
		</div>
		</div>
		   <!-- <span class="icon"><img src="img/main/search.png" /></span>
                <input type="text" id="recipe_search" /> -->

		
            </div>
 </div>
<jsp:include page = "../headNfoot/footer.jsp"/> 

<script>
// 이미지 추가 및 메인이미지 초기화 로직
	var imgSrcList=[];
	$(document).ready(function(){
		$("#imgs").on("change", handleImgFiles)
	});
	
	function handleImgFiles(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")	){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			var reader = new FileReader();
			
			reader.onload = function(e){
				imgSrcList.push(e.target.result);
				$("#mainImg").attr("src",imgSrcList[0]);
			}
			
			reader.readAsDataURL(f);
		});
	}
</script>

<script>
// 이미지 모달창 로직
var imgModal = document.getElementById('imgModal');
var deleteSpan = document.getElementById("delete");
var nextBtn = document.getElementById("nextBtn");
var backBtn = document.getElementById("backBtn");
var index=1; // 몇 번째 사진을 보여줄 것인지 알려주는 변수
var maxIndex;	// 총 사진의 개수

$('#mainImg').click(function() {
	// 아무것도 없으면 띄우지 않는다.
	if(imgSrcList.length==0){
		imgModal.style.display = "none";
	}
	
	// 모달창 띄워줌
	else{
	imgModal.style.display = "block";
	index=1;// 1번째 사진으로 초기화.
	maxIndex=imgSrcList.length;	// 총 사진의 개수도 초기화
	$("#imgInModal").attr("src",imgSrcList[index-1]);
	/*  $(this).css('z-index', 3000); */
	$("#indexNum").html(index+"/"+maxIndex);
	}
});

$('#nextBtn').click(function() {
	if (index==maxIndex){
		index=1;
	}
	else{
		index ++;
	}
	$("#imgInModal").attr("src",imgSrcList[index-1]);
	$("#indexNum").html(index+"/"+maxIndex);
});

$('#backBtn').click(function() {
	if (index==1){
		index=maxIndex;
	}
	else{
		index --;
	}
	$("#imgInModal").attr("src",imgSrcList[index-1]);
	$("#indexNum").html(index+"/"+maxIndex);
});

// 이미지 삭제 로직
deleteSpan.onclick = function() {
	// 이미지 리스트에서 제거
	imgSrcList.splice(index-1,1);
	
	// 사진이 한 장만 있는 경우
	if(maxIndex==1){
		$("#mainImg").attr("src","img/recipegram/default.jpg");	// 메인 이미지를 default로 변경
		imgModal.style.display = "none";	// 모달창 끔
	}
	// 사진이 맨 처음이었던 경우(메인이미지였던 경우)
	else if(index==1){
		$("#mainImg").attr("src",imgSrcList[index-1]);
	}
	// 사진이 맨 마지막이었던 경우
	else if (index==maxIndex){
		index--;
	}
	
	// 모달상 이미지를 초기화하고, 최대크기를 1 줄인다.
	$("#imgInModal").attr("src",imgSrcList[index-1]);
	maxIndex --;
	$("#indexNum").html(index+"/"+maxIndex);
};

// window.onclick 두개 있으면 함수 안 먹힐 수도 있다!!!!!!!!!!!!!!!!!
window.onclick = function(event) {
	if (event.target == imgModal) {
		imgModal.style.display = "none";
	}
};


</script>

<script>
// 아래는 모두 해쉬태그로직
var saveSelection, restoreSelection;

//커서위치...
if (window.getSelection && document.createRange) {
    saveSelection = function(containerEl) {
        var range = window.getSelection().getRangeAt(0);
        var preSelectionRange = range.cloneRange();
        preSelectionRange.selectNodeContents(containerEl);
        preSelectionRange.setEnd(range.startContainer, range.startOffset);
        var start = preSelectionRange.toString().length;

        return {
            start: start,
            end: start + range.toString().length
        }
    };

    restoreSelection = function(containerEl, savedSel) {
        var charIndex = 0, range = document.createRange();
        range.setStart(containerEl, 0);
        range.collapse(true);
        var nodeStack = [containerEl], node, foundStart = false, stop = false;

        while (!stop && (node = nodeStack.pop())) {
            if (node.nodeType == 3) {
                var nextCharIndex = charIndex + node.length;
                if (!foundStart && savedSel.start >= charIndex && savedSel.start <= nextCharIndex) {
                    range.setStart(node, savedSel.start - charIndex);
                    foundStart = true;
                }
                if (foundStart && savedSel.end >= charIndex && savedSel.end <= nextCharIndex) {
                    range.setEnd(node, savedSel.end - charIndex);
                    stop = true;
                }
                charIndex = nextCharIndex;
            } else {
                var i = node.childNodes.length;
                while (i--) {
                    nodeStack.push(node.childNodes[i]);
                }
            }
        }

        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
    }
} else if (document.selection) {
    saveSelection = function(containerEl) {
        var selectedTextRange = document.selection.createRange();
        var preSelectionTextRange = document.body.createTextRange();
        preSelectionTextRange.moveToElementText(containerEl);
        preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
        var start = preSelectionTextRange.text.length;

        return {
            start: start,
            end: start + selectedTextRange.text.length
        }
    };

    restoreSelection = function(containerEl, savedSel) {
        var textRange = document.body.createTextRange();
        textRange.moveToElementText(containerEl);
        textRange.collapse(true);
        textRange.moveEnd("character", savedSel.end);
        textRange.moveStart("character", savedSel.start);
        textRange.select();
    };
}

//a태그 
function createLink(matchedTextNode) {
    var el = document.createElement("a");
    el.href = matchedTextNode.data;  //링크는 해시태그 텍스트.. 
    el.appendChild(matchedTextNode);
    return el;
}

function shouldLinkifyContents(el) {
    return el.tagName != "A";
}

function surroundInElement(el, regex, surrounderCreateFunc, shouldSurroundFunc) {
    var child = el.lastChild;
    while (child) {
        if (child.nodeType == 1 && shouldSurroundFunc(el)) {
            surroundInElement(child, regex, createLink, shouldSurroundFunc);
        } else if (child.nodeType == 3) {
            surroundMatchingText(child, regex, surrounderCreateFunc);
        }
        child = child.previousSibling;
    }
}

function surroundMatchingText(textNode, regex, surrounderCreateFunc) {
    var parent = textNode.parentNode;
    var result, surroundingNode, matchedTextNode, matchLength, matchedText;
    while ( textNode && (result = regex.exec(textNode.data)) ) {
        matchedTextNode = textNode.splitText(result.index);
        matchedText = result[0];
        matchLength = matchedText.length;
        textNode = (matchedTextNode.length > matchLength) ?
            matchedTextNode.splitText(matchLength) : null;
        surroundingNode = surrounderCreateFunc(matchedTextNode.cloneNode(true));
        parent.insertBefore(surroundingNode, matchedTextNode);
        parent.removeChild(matchedTextNode);
    }
}

var textbox = document.getElementById("recipegram_hashtag");
var hashTag = /#([^#\s]+)/; //해시태그 정규식 

function updateLinks() {
    var savedSelection = saveSelection(textbox); //커서위치 저장 
    surroundInElement(textbox, hashTag, createLink, shouldLinkifyContents);
    restoreSelection(textbox, savedSelection);
}

var $textbox = $(textbox); //해시태그 

$(document).ready(function () {
    $textbox.focus(); //커서위치 뿌려줌 

    var keyTimer = null, keyDelay = 1000; //해시태그가 적용되는 시간... 안하면 바로 변경되어 이어지지가 않는다... 

    $textbox.keyup(function() {
        if (keyTimer) {
            window.clearTimeout(keyTimer);
        }
        keyTimer = window.setTimeout(function() {
            updateLinks();
            keyTimer = null;
        }, keyDelay);
        
        
    });
});





//해쉬태그
/* function HashTag(){
	var content = document.getElementById('recipegram_hashtag'); // html 안에 'content'라는 아이디를 content 라는 변수로 정의한다.
	//var content =  $("#recipegram_hashtag").val(); // html 안에 'content'라는 아이디를 content 라는 변수로 정의한다.
	
	
	
	
	var linkedContent = '';  //a 태그 추가한 해시태그 
	var hash = '';  // 해시태그내용 
	var totalContent = ''; // 전체 글 
	for(var idx in content.innerHTML){  //# 찾아라... 
		
		if(content.innerHTML[idx] == '#'){ 
			
			
			for(var hash_idx=parseInt(idx)+1; hash_idx<content.innerHTML.length ; hash_idx++){
				var blank = /[\s]/g; 
				if(blank.test(content.innerHTML[hash_idx])==true){
					linkedContent='<a class="editor-link" contenteditable="false" href="">#'+hash+'</a>';
					content.innerHTML = content.innerHTML.replace('#'+hash, linkedContent); //바꿔라.
					break;
				}
				hash += content.innerHTML[hash_idx];
				
			}
			
			
		}
		
	}
	
	/* 
	
	
	var caretID = '_caret'; 
	var cc = document.createElement('span');
	cc.id = caretID; 
	
	//  현재 커서 위치를 기억
	window.getSelection().getRangeAt(0).insertNode(cc);
  
	content.blur(); //포커스 없애기.. 
	
	
	var splitedArray = content.innerHTML.split(' '); // 공백을 기준으로 문자열을 자른다.
	var linkedContent = '';
	for(var word in splitedArray)
	{
	  word = splitedArray[word];
		
	   if(word.indexOf('#') == 0) // # 문자를 찾는다.
	   {
		 //linkedContent = word;
	      word = '<a class="editor-link" contenteditable="false" href="#">'+word+'</a>'; 
	      //document.getElementById('recipegram_hashtag').innerHTML = linkedContent;
	     //alert(word);
	     
	   }
	   //alert(linkedContent);
	   	   //alert(linkedContent);
	  	linkedContent += word+' ';
	} 
	
	//content.innerHTML = content.innerHTML.replace(linkedContent, word); //바꿔라.
	content.innerHTML = linkedContent;
    content.focus();  //포커스 되돌리기...
	
	
	//document.getElementById('recipegram_hashtag').innerHTML = linkedContent;
	//content.innerHTML = linkedContent;
	
	var range = document.createRange(); 
	cc = document.getElementById(caretID); 
	range.selectNode(cc);
	var selection = window.getSelection(); 
	selection.removeAllRanges(); 
	selection.addRange(range); 
	range.deleteContents(); 
 */
	//$("#recipegram_hashtag").val(linkedContent); 
	

//}; */
</script>          
</body>
</html>