<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl function library -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

						<!-- 사용자 정보 -->
						<div id="user-img" class="col-2 d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							</svg>
						</div>
						
						<div id="user-name" class="col-3">
							<div><h4>${postDetail.user.loginId }</h4></div>
						</div>
						
						<div class="col-4 mr-3"></div>
						
						<!-- 수정 삭제 메뉴 -->
						<div id="navbar-header dropdown" class="col-2 text-right" >
							<button class="btn btn-link" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gray" class="bi bi-three-dots" viewBox="0 0 16 16">
								  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
								</svg>
						  	</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="/post/detail/view">수정</a>
							    <a class="dropdown-item" href="/post/delete">삭제</a>
							</div>							
						</div>
					</div>
					
					
					<!-- 게시물 이미지 -->
					<div class="feed-img-box border  d-flex align-items-center"> <!-- width 700 -->
						<img class="feed-img" alt="게시물 사진" src="${postDetail.post.imagePath }">
					</div>
					
					<div class="feed-info-box border">
						<div class="mx-4 my-2">
						
						<!-- 좋아요, 댓글 버튼 -->
							<div id="feed-icon" class="d-flex">
								<a href="#" class="like-btn text-dark" data-post-id="${postDetail.post.id }">
								<c:choose>
									<c:when test="${postDetail.like }">
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-heart-fill mt-1 mr-2" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
										</svg>
									</c:when>
									<c:otherwise>
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart mt-1 mr-2" viewBox="0 0 16 16">
										  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
										</svg>				
									</c:otherwise>
								</c:choose>
								</a>
								<a href="/post/detail/comment/view" class="commentBtn text-dark">			
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 15">
									  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
									</svg>
								</a>
							</div>
							<!-- 좋아요 -->
							<div class="mt-1">
								<c:choose>
									<c:when test="${postDetail.likeCount == 0 }">
										
									</c:when>
									<c:when test="${postDetail.likeCount == 1 }">
										<b>${postDetail.likeDetailList[0].user.loginId }</b> 님이 좋아합니다
									</c:when>
									<c:otherwise>
										<b>${postDetail.likeDetailList[0].user.loginId }</b> 님 외 ${postDetail.likeCount -1 } 명이 좋아합니다
									</c:otherwise>
								</c:choose>
							</div>
							
							<!-- 게시물 글 -->
							<div class="d-flex align-items-center"> 
								<span class="mr-2 mb-2">
									<b class="mr-2">${postDetail.user.loginId }</b>
									<span id="contentsLengthLimit">${postDetail.post.contents }</span>
									<!-- TODO : 글이 길어지면 글자 옆에 더보기 버튼 -->
									<button id="moreTextBtn" class="small btn btn-link text-secondary d-none">더보기</button> 
								</span>
							</div>
							
							<!-- 댓글 입력 -->
							<div class="ml-4">
								<div>
									<!-- FIN : 입력한 댓글 하나만 보이기 (loginId + comment) -->
									<c:choose>
										<c:when test="${fn:length(postDetail.commentDetailList) != 0 }">	<!-- 댓글이 있으면 -->
											<div>
											<!-- 제일 최근 댓글 -->
												<span class="mr-2"><b>${postDetail.commentDetailList[0].user.loginId }</b></span>
												<span>${postDetail.commentDetailList[0].comment.comment }</span>
											</div>
										</c:when>
										<c:otherwise>
											<div></div>
										</c:otherwise>
									</c:choose>
								</div>
								<!-- 댓글 -->
								<div class="text-secondary">
									<a href="/post/detail/comment/view?postId=${postDetail.post.id }" class="text-dark" >
										<c:choose>
											<c:when test="${fn:length(postDetail.commentDetailList) != 0 }">
												<span class="text-secondary">댓글 ${fn:length(postDetail.commentDetailList) }개 모두 보기</span>
											</c:when>
											<c:otherwise>
												<br>
											</c:otherwise>
										</c:choose>
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
			
			$(".openPop").on("click", function() {
				let postId = $(this).data("post-id");
								
				$(".banner" + postId).removeClass("d-none");
			});
			
			$(".closeBtn").on("click", function() {
				
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