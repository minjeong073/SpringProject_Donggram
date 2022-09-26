<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl format library -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment</title>

<!-- bootstrap jquery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css" >

</head>
<body>
	
	<c:import url="/WEB-INF/jsp/include/comment-header.jsp"/>	
	
	<div class="container d-flex justify-content-center">
		<div class="col-3">
			
		</div>	
		<section class="contents d-flex flex-column align-items-center">
		<div class="m-3 mt-2 commentBox">
			<div class="mb-4">
				<span class="text-user-loginId mr-3"><b>${postDetail.user.loginId }</b></span>
				<span class="text-post-contents">${postDetail.post.contents }</span>
			</div>
			
			<br>
			
			<div class="mt-4">
				<table class="table" border="0">
				<c:forEach var="commentDetail" items="${postDetail.commentDetailList }">
					<tr>
						<th class="table-user-loginId"><h4 class="mr-3">${commentDetail.user.loginId }</h4></th>
						<td class=""><h5>${commentDetail.comment.comment }</h5></td>
						<td><h6 class="text-right"><fmt:formatDate value="${commentDetail.comment.createdAt }" pattern="yyyy.MM.dd HH:mm:ss"/></h6></td>
						<!-- 삭제 버튼 -->
						<td class="text-right">
						<c:choose>
							<c:when test="${commentDetail.user.id == userId }">
								<button type="button" class="more-btn delete-btn btn btn-sm btn-link text-danger" 
								data-toggle="modal" data-target="#deleteModalBtn" data-post-id="${postDetail.post.id }" data-comment-id="${commentDetail.comment.id }">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-sm btn-link text-danger"></button>
							</c:otherwise>
						</c:choose>
						
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>

		<!-- Modal -->
		<div class="modal fade" id="deleteModalBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-body">
		        <button type="button" class="btn btn-danger btn-block" id="deleteBtn">삭제하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		</div>
		
		</section>
		
		<div class="col-3">
		
		</div>
		
		
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			$(".more-btn").on("click", function() {
				
				// modal 의 삭제하기 button tag 에 data-post-id 속성에
				// 현재 more-btn 이 포함된 postId 를 저장하기
				
				let postId = $(this).data("post-id");
				let commentId = $(this).data("comment-id");
				$("#deleteBtn").data("post-id", postId);
				$("#deleteBtn").data("comment-id", commentId);
				
			});
			
			$("#deleteBtn").on("click", function() {
				
				let postId = $(this).data("post-id");
				let commentId = $(this).data("comment-id");
				
				$.ajax({
					type:"get"
					, url:"/post/comment/delete"
					, data:{"postId":postId, "commentId":commentId}
					, success:function(data) {
						if (data.result == "success") {
							location.reload();
						} else {
							alert("댓글 삭제 실패");
						}
					}
					, error:function() {
						alert("댓글 삭제 에러");
					}
				});
			});	
		});
		
		
	</script>
	
</body>
</html>	