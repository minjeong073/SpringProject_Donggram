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
			게시물
		</div>
		
		<!-- 수정 버튼 -->
		<div class=" w-25">
			<div class="text-center">
				<button type="button" id="editBtn" class="btn btn-link" data-post-id="${post.id }"><h3>수정</h3></button>
			</div>
		</div>
		
	</header>
	
	<div class="container d-flex flex-column align-items-center my-3">
		
		<section class="postBox d-flex justify-content-center">
			
			<div id="postImgBox" class=" d-flex flex-column justify-content-center align-items-center">
				<div class="my-4">
					<div id="postImgDiv" class="border d-flex justify-content-center align-items-center my-3">
						<div>
							<img id="preview" src="${post.imagePath }" class="w-100 h-100">
						</div>
					</div>
					
					<a href="#" id="imageIcon" class="ml-3">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="black" class="bi bi-image" viewBox="0 0 16 16">
						  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
						  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
						</svg>
					</a>
					<input type="file" id="fileInput" class="d-none">
					
				</div>
				
			</div>
			
			<div id="postContent" class=" border d-flex justify-content-center">
			
				<div class="my-4 col-11">				
					<div id="postTextBox" class=" my-3">
						<textarea id="contentInput" class="w-100 tagBox" rows="20" placeholder="문구 입력 ...">
${post.contents }
						</textarea>
					</div>
					
					<!-- 삭제 -->
					<div class="text-right">
						<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModalBtn">삭제</button>
					</div>
				</div>
				
			</div><!-- postContent -->

		</section>
		
		<!-- Modal -->
		<div class="modal fade" id="deleteModalBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-body">
		        <button type="button" class="btn btn-danger btn-block" id="deleteBtn" data-post-id=${post.id }>삭제하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			$("#deleteBtn").on("click", function() {
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data) {
						if (data.result == "success") {
							alert("삭제되었습니다");
							location.href = "/post/timeline/view";
						} else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						alert("삭제 에러");
					}
				});
			});
			
			$("#editBtn").on("click", function() {
				
				let postId = $(this).data("post-id");
				let content = $("#contentInput").val();
				
				// validation
				
				// file 에 대한 validation
				/* if ($("#fileInput")[0].files.length == 0) {
					alert("사진을 추가하세요");
					return ;
				} */
				
				if (content == "") {
					alert("게시물 내용을 입력하세요");
					return ;
				}
				
				var formData = new FormData();
				formData.append("postId", postId);
				formData.append("content", content);
				// formData.append("file", $("#fileInput")[0].files[0]);
				
				
				$.ajax({
					type:"post"
					, url:"/post/detail/update"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if (data.result == "success") {
							location.href = "/post/timeline/view";
						} else {
							alert("게시물 수정 실패");
						}
					}
					, error:function() {
						alert("게시물 수정 에러");
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
			});
			
			$("#imageIcon").on("click", function() {
				$("#fileInput").click();
			});
		});
	
	</script>
	
</body>
</html>