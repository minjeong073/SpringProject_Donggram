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
	<c:import url="/WEB-INF/jsp/include/create-header.jsp"/>
	
	<div class="container d-flex flex-column align-items-center my-3">
		
		<section class="postBox d-flex justify-content-center">
			
			<div id="postImgBox" class=" d-flex flex-column justify-content-center align-items-center">
				<div class="my-4">
					<div id="postImgDiv" class="border d-flex justify-content-center align-items-center my-3">
						<div>
							<!-- <img alt="게시물 사진" src="/static/img/photographer-407068_960_720.jpg" class="w-100"> -->
						</div>
					</div>	
					<input type="file">
				</div>
				
			</div>
			
			<div id="postContent" class=" border d-flex justify-content-center">
			
				<div class="my-4 col-11">				
					<div id="postTextBox" class=" my-3">
						<textarea class="w-100 tagBox" rows="10" placeholder="문구 입력 ..."></textarea>
					</div>
					
					<div id="userTagBox" class="tagBox border d-flex justify-content-between align-items-center mb-3">
						<div class="ml-4">사람 태그하기</div>
						<button class="tagBtn btn btn-link mr-4 text-dark"><h5>&gt;</h5></button>
					</div>
					
					<div id="locationBox" class="tagBox border d-flex justify-content-between align-items-center">
						<div class="ml-4">위치 추가</div>
						<button class="tagBtn btn btn-link mr-4 text-dark"><h5>&gt;</h5></button>
					</div>
				</div>
			
				
			</div><!-- postContent -->
			
		</section>
		
	</div>
	
</body>
</html>