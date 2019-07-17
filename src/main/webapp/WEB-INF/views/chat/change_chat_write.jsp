<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<head>
<style>
.chatWrite-body{
	font-size:2rem;
}
.chatWrite-body .searchBtn {
	vertical-align:middle;
	position: relative;
	margin-left: 20%;
	z-index: 1;
}
.chatWrite-body #searchIcon {
	height: 40px;
	width: 40px;
	opacity: 0.6;
}
.chatWrite-body input{
	padding: 5px;
	padding-left:20px;
	padding-right:20px;
	width : 590px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	outline: none;
	font-size:1.5rem;
}
.chatWrite-body input::placeholder{
	opacity:0.2;
}
.chatWrite-body select{
	padding: 10px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	outline: none;
	height:80%;
}
.chatWrite-body .eachRow{
	padding-top:3%;
}
.writeBtn{
	height: 45px;
	width: 20%;
	margin-left:80%;
}

</style>

</head>

<body>

<div id="chatWriteModal" class="chatWriteModal" >
	<div class="chatWrite-modal-content block-heading-1">
		<span class="close" id="closeWrite"><i class="fas fa-times fa-2x"></i></span>
			<form>
			<table class="chatWrite-body">
				<tr>
					<td colspan="2" style="text-align:center; font-size:2.5rem; color:#FFC69F;">
						&nbsp; 물물교환 채팅방 개설
					</td>
					
				</tr>
				<tr>
					<td class="eachRow">
						&nbsp; &nbsp; 지역
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="읍, 면, 동 단위로 입력 후 검색">
					</td>
					<td>
						<span class="searchBtn"><img src="img/main/search.png" id="searchIcon"></span>
					</td>
				</tr>			
				<tr>
					<td  class="eachRow">
						&nbsp; &nbsp; 제목
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="방 제목을 입력하세요" maxlength="20">
					</td>
				</tr>
				<tr>
					<td  class="eachRow">
						&nbsp; &nbsp; 인원
						<select>
	    					<option value="2">2명</option>
	    					<option value="3">3명</option>
	    					<option value="4">4명</option>
	    					<option value="5">5명</option>
						</select>
					</td>
					<td>
					</td>
				</tr>
			</table>
				<span>
					<input type="submit" class="btn btn-primary btn-xs writeBtn" value="개설하기">
				</span>
			</form>
<!-- 		<div class="container chatWrite-body">
			<form>
			<div class="row">
				<div class="md-col-2">
					지역
				</div>
				<div class="md-col-9">
					<input type="text"> <span class="searchBtn"><img src="img/main/search.png" id="searchIcon"></span>
				</div>
			</div>
			
			<div class="row">
				<div class="md-col-2">
					제목
				</div>
				<div class="md-col-9">
					<input type="text">
				</div>
			</div>
			
			<div class="row">
				<div class="md-col-2">
					인원
				</div>
				<div class="md-col-9">
					<select>
    					<option value="2">2</option>
    					<option value="3">3</option>
    					<option value="4">4</option>
    					<option value="5">5</option>
					</select>
				</div>
			</div>
			</form>
		</div> -->
	</div>
</div>
	
</body>
</html>