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
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>	
	
	<div class="container d-flex flex-column align-items-center">
		
		<section class="contents d-flex flex-column align-items-center">
			
			<div class="feed border m-3">
				
				<div class="user-info-box border  d-flex align-items-center">
					<div id="user-img" class="col-2  d-flex align-items-center">
						<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					</div>
					
					<div id="user-name" class="col-3 ">
						<div><h4>userId</h4></div>
						<div>#location#</div>
					</div>
					
					<div id="follow-btn" class="col-2">
						<button class="btn btn-outline-info">follow</button>
					</div>
					
					<div class="col-3 mr-3"></div>
					
					<div id="navbar-header" class="col-1">
						<button type="button" class="btn btn-sm btn-link">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gray" class="bi bi-three-dots" viewBox="0 0 16 16">
							  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
							</svg>
						</button>
						
					</div>
				</div>
				
				<div class="feed-img-box border  d-flex align-items-center"> <!-- width 700 -->
					<img class="feed-img" alt="게시물 사진" src="/static/img/durham-7245140_960_720.jpg" width="700">
				</div>
				
				<div class="feed-info-box border">
					<div class="mx-4 my-2">
						<div><h3>🤍💬</h3></div>
						
						<div>
							<b>user2</b> 님 외 50명이 좋아합니다
						</div>
						
						<div class="d-flex align-items-center"> 
							<span class="mr-2">
								<b class="mr-2">Username</b>
								오늘 일기 해외 여행을 가고 싶다 영국 성 사진이다 노을 지는 모습을 직접 가서 봤으면 좋겠다 글이 길어지면 어떻게 될까
								<!-- 글자 옆에 더보기 버튼이 있도록 ? -->
								<button class="small btn btn-link text-secondary">더보기</button> 
							</span>
						</div>
						<div class="ml-4">
							<div class="text-secondary">댓글 3개 모두 보기</div>
							<div class="text-secondary d-flex">
								<input type="text" class="form-control" placeholder="댓글 달기 ...">
								<button class="btn mx-4">입력</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 게시물 2 -->
			<div class="feed border m-3">
				
				<div class="user-info-box border  d-flex align-items-center">
					<div id="user-img" class="col-2  d-flex align-items-center">
						<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					</div>
					
					<div id="user-name" class="col-3 ">
						<div><h4>userId</h4></div>
						<div>#location#</div>
					</div>
					
					<div id="follow-btn" class="col-2">
						<button class="btn btn-outline-info">follow</button>
					</div>
					
					<div class="col-3 mr-3"></div>
					
					<div id="navbar-header" class="col-1">
						<button type="button" class="btn btn-sm btn-link">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gray" class="bi bi-three-dots" viewBox="0 0 16 16">
							  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
							</svg>
						</button>
						
					</div>
				</div>
				
				<div class="feed-img-box border  d-flex align-items-center"> <!-- width 700 -->
					<img class="feed-img" alt="게시물 사진" src="/static/img/photographer-407068_960_720.jpg" width="700">
				</div>
				
				<div class="feed-info-box border">
					<div class="mx-4 my-2">
						<div><h3>🤍💬</h3></div>
						
						<div>
							<b>user2</b> 님 외 50명이 좋아합니다
						</div>
						
						<div class="d-flex align-items-center"> 
							<span class="mr-2">
								<b class="mr-2">Username</b>
								사진찍는 나를 찍는 사진
								<!-- 글자 옆에 더보기 버튼이 있도록 ? -->
								<!-- <button class="small btn btn-link text-secondary">더보기</button> --> 
							</span>
						</div>
						<div class="ml-4">
							<div class="text-secondary">댓글 3개 모두 보기</div>
							<div class="text-secondary d-flex">
								<input type="text" class="form-control" placeholder="댓글 달기 ...">
								<button class="btn mx-4">입력</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 게시물 3 -->
			<div class="feed border m-3">
				
				<div class="user-info-box border  d-flex align-items-center">
					<div id="user-img" class="col-2  d-flex align-items-center">
						<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					</div>
					
					<div id="user-name" class="col-3 ">
						<div><h4>userId</h4></div>
						<div>#location#</div>
					</div>
					
					<div id="follow-btn" class="col-2">
						<button class="btn btn-outline-info">follow</button>
					</div>
					
					<div class="col-3 mr-3"></div>
					
					<div id="navbar-header" class="col-1">
						<button type="button" class="btn btn-sm btn-link">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gray" class="bi bi-three-dots" viewBox="0 0 16 16">
							  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
							</svg>
						</button>
						
					</div>
				</div>
				
				<div class="feed-img-box border  d-flex align-items-center"> <!-- width 700 -->
					<img class="feed-img" alt="게시물 사진" src="/static/img/durham-7245140_960_720.jpg" width="700">
				</div>
				
				<div class="feed-info-box border">
					<div class="mx-4 my-2">
						<div><h3>🤍💬</h3></div>
						
						<div>
							<b>user2</b> 님 외 50명이 좋아합니다
						</div>
						
						<div class="d-flex align-items-center"> 
							<span class="mr-2">
								<b class="mr-2">Username</b>
								오늘 일기 해외 여행을 가고 싶다 영국 성 사진이다 노을 지는 모습을 직접 가서 봤으면 좋겠다 글이 길어지면 어떻게 될까
								<!-- 글자 옆에 더보기 버튼이 있도록 ? -->
								<button class="small btn btn-link text-secondary">더보기</button> 
							</span>
						</div>
						<div class="ml-4">
							<div class="text-secondary">댓글 3개 모두 보기</div>
							<div class="text-secondary d-flex">
								<input type="text" class="form-control" placeholder="댓글 달기 ...">
								<button class="btn mx-4">입력</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
</body>
</html>