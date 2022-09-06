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

</head>
<body>
	
	<div class="container">
	
		<header></header>
		
		<section class="postBox d-flex bg-danger justify-content-center">
			
			<div id="postImgBox" class="bg-info d-flex flex-column align-items-center">
				
				<img id="postImg" alt="게시물 사진" src="/static/img/Sienna-Palette-title-1128x640.jpg" width="360">
				<input type="file">
				
			</div>
			
			<div id="postContent" class="bg-warning border d-flex">
			
				<div class="m-4">				
					<div id="postTextBox" class="bg-danger">
						<input type="text" placeholder="문구 입력 ...">
					</div>
					
					<div id="userTagBox" class="bg-primary d-flex">
						<div>사람 태그하기</div>
						<button> &gt; </button>
					</div>
					
					<div id="locationBox" class="bg-info d-flex">
						<div>위치 추가</div>
						<button> &gt; </button>
					</div>
				</div>
			
				
			</div>
			
		</section>
		
		
	
	</div>
	
	
	
</body>
</html>