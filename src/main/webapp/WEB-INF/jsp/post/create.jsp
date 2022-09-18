<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 게시물</title>

<!-- bootstrap jquery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css" >
	
<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
	
	<header class=" d-flex justify-content-around align-items-center border-bottom">
		<div class="w-25 ">
			<div class="text-center">
				<button class="btn btn-link" onclick="history.go(-1)">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="black" class="bi bi-chevron-left" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					</svg>
				</button>
			</div>
		</div><!-- 이전 버튼 -->
		
		<div class="text-center display-4 w-50">
			새 게시물
		</div>
		
		<div class=" w-25">
			<div class="text-center">
				<button id="shareBtn" class="btn btn-link"><h3>공유</h3></button>
			</div>
		</div>
		
	</header>
	
	<div class="container d-flex flex-column align-items-center my-3">
		
		<section class="postBox d-flex justify-content-center">
			
			<div id="postImgBox" class=" d-flex flex-column justify-content-center align-items-center">
				<div class="my-4">
					<div id="postImgDiv" class="border d-flex justify-content-center align-items-center my-3">
						<div>
							<img id="preview" src="" class="w-100 h-100">
						</div>
					</div>	
					<input type="file" id="fileInput">
				</div>
				
			</div>
			
			<div id="postContent" class=" border d-flex justify-content-center">
			
				<div class="my-4 col-11">				
					<div id="postTextBox" class=" my-3">
						<textarea id="contentInput" class="w-100 tagBox" rows="10" placeholder="문구 입력 ..."></textarea>
					</div>
					
					<div id="userTagBox" class="tagBox border d-flex justify-content-between align-items-center mb-3">
						<div class="ml-4">사람 태그하기</div>
						<!-- TODO : 태그 팝업 --><button class="tagBtn btn btn-link mr-4 text-dark"><h5>&gt;</h5></button>
					</div>
					
					<div id="locationBox" class="tagBox border d-flex justify-content-between align-items-center">
						<div class="ml-4">위치 추가</div>
						<!-- TODO : 위치 추가 팝업 --><button class="tagBtn btn btn-link mr-4 text-dark"><h5>&gt;</h5></button>
					</div>
				</div>
			
				
			</div><!-- postContent -->
			
		</section>
		
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			$("#shareBtn").on("click", function() {
				
				let file = $("#fileInput").val();
				let content = $("#contentInput").val();
				
				// validation
				
				if (file == "") {
					alert("사진을 추가하세요");
					return ;
				}
				
				if (content == "") {
					alert("게시물 내용을 입력하세요");
					return ;
				}
				
				
				var formData = new FormData();
				formData.append("content", content);
				// 파일 하나만 (나중에 여러개 업로드 수정)
				formData.append("file", $("#fileInput")[0].files[0]);
				
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if (data.result == "success") {
							location.href = "/post/timeline/view";
						} else {
							alert("게시물 공유 실패");
						}
					}
					, error:function() {
						alert("게시물 공유 에러");
					}
				});
			});
			
			$("#fileInput").change(function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader();
					
					reader.onload = function(e) {
						$("#preview").attr('src', e.target.result);
					}
					reader.readAsDataURL(this.files[0]);
				}
			})
		});
	
	</script>
	
</body>
</html>