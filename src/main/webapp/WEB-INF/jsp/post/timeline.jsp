<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>timeline</title>

<!-- bootstrap jquery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css" >

</head>
<body>
	
	<c:import url="/WEB-INF/jsp/include/timeline-header.jsp"/>	
	
	<div class="container d-flex flex-column align-items-center">
		
		<section class="contents d-flex flex-column align-items-center">
		
			<div>
				<c:forEach var="postDetail" items="${postDetailList }">
				
				<div id="feed" class="feed border m-3" value="${postDetail.post.id }">
				
					<div class="user-info-box border d-flex align-items-center">
						<div id="user-img" class="col-2  d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							</svg>
						</div>
						
						<div id="user-name" class="col-3">
							<div><h4>${postDetail.user.loginId }</h4></div>
							<div>#location#</div>
						</div>
						
						<div id="follow-btn" class="col-2">
							<button class="btn btn-outline-info btn-sm">follow</button>
						</div>
						
						<div class="col-3 mr-3"></div>
						
						<div id="navbar-header" class="col-1">
							<button type="button" class="btn btn-sm btn-link" id="openPop">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gray" class="bi bi-three-dots" viewBox="0 0 16 16">
								  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
								</svg>
							</button>
							
							<div id="banner" class="d-none border rounded">
								<div id="closeBtn" style="cursor:pointer;" class="text-right">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
									  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
									</svg>
								</div>
								<div class="text-center">
									<p> 수정 </p>
									<p> 삭제 </p>
								</div>
							</div>
							
						</div>
					</div>
					
					<div class="feed-img-box border  d-flex align-items-center"> <!-- width 700 -->
						<img class="feed-img" alt="게시물 사진" src="${postDetail.post.imagePath }" width="700">
					</div>
					
					<div class="feed-info-box border">
						<div class="mx-4 my-2">
							<div id="feed-icon" class="d-flex">
								<a href="#" class="like-btn" data-post-id="${postDetail.post.id }">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart mt-1 mr-2" viewBox="0 0 16 16">
									  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
									</svg>				
								</a>
								<a href="#" id="commentBtn">				
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 15">
									  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
									</svg>
								</a>
							</div>

							<div class="mt-1">
								<b>user2</b> 님 외 50명이 좋아합니다
							</div>
							
							<div class="d-flex align-items-center"> 
								<span class="mr-2 mb-2">
									<b class="mr-2">${postDetail.user.loginId }</b>
									<span id="contentsLengthLimit">${postDetail.post.contents }</span>
									<!-- 글자 옆에 더보기 버튼이 있도록 ? -->
									<button id="moreTextBtn" class="small btn btn-link text-secondary d-none">더보기</button> 
								</span>
							</div>
							
							<!-- 댓글 입력 -->
							<div class="ml-4">
								<div>
									<!-- TODO : 입력한 댓글 하나만 보이기 (loginId + comment) -->
								</div>
								<div class="text-secondary">
									<a href="/post/detail/comment/view?postId=${postDetail.post.id }" class="text-dark" >
										댓글 <!-- TODO -->개 모두 보기
									</a>
								</div>
								<div class="text-secondary d-flex mt-2">
									<input type="text" class="form-control" placeholder="댓글 달기 ..." id="commentInput${postDetail.post.id }">
									<button class="btn mx-4 comment-btn" data-post-id="${postDetail.post.id }">입력</button>
								</div>
							</div>
						</div>
					</div>
				
				</div>
				</c:forEach>
								
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#openPop").on("click", function() {
				$("#banner").removeClass("d-none");
			});
			
			$("#closeBtn").on("click", function() {
				$("#banner").addClass("d-none");
			});
			
			
			// 좋아요 버튼
			$(".like-btn").on("click", function(e) {
				e.preventDefault(); // a tag 의 기본 기능 제거
				
				let postId = $(this).data("post-id"); // click event 가 발생한 부분의 data 속성 값
				
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data) {
						if (data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					}	
					, error:function() {
						alert("좋아요 에러");
					}
				});
				
			});
			
			
			// 댓글 달기 버튼
			$(".comment-btn").on("click", function() {
				
				let postId = $(this).data("post-id");
				let comment = $("#commentInput" + postId).val();	// $("#commentInput3") 과 동일! (문자열)
				
				// validation
				
				if (comment == "") {
					alert("댓글을 입력해주세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "comment":comment}
					, success:function(data) {
						if (data.result == "success") {
							location.reload();
						} else {
							alert("댓글 달기 실패");
						}
					}
					, error:function() {
						alert("댓글 달기 에러");
					}
					
				});
				
			});
			
			
			// 더보기 버튼
			// 36, 40(32)
			/*
			var contents = $("#contentsLengthLimit").val();
			var contents_short = contents.substring(0,32) + "...";

			if (contents.length > 32) {
				$("#contentsLengthLimit").html(contents_short);
				$("#moreTextBtn").removeClass("d-none");
				
			} else {
				$("#moreTextBtn").addClass("d-none");
			}
			
			$("#moreTextBtn").on("click", function() {
				if ($(this).hasClass("d-none")) {
					$("#contentsLengthLimit").html(contents_sh)
					$(this).removeClass("d-none");
				}
			});
			*/
	
		});
		
	</script>
	
</body>
</html>