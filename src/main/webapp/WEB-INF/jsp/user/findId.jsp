<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<!-- bootstrap jquery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css" >

</head>
<body>

	<div class="container">

		<section class="contents d-flex justify-content-center ">
			<div class="my-4  w-25">
				<div class="">
					<button class="btn btn-outline-secondary" onclick="history.go(-1)">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
						  <path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>
						</svg>
					</button>
					
				</div>
			
			</div><!-- 이전 버튼 -->
		
			<div class="content-box my-4">
				<div class="find-id mb-4 border">
					<div class="m-4">
						<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
						
						<input type="text" class="form-control mt-3" placeholder="사용자 이름">
						<input type="text" class="form-control mt-3" placeholder="이메일">
						
						<button type="button" id="findBtn" class="btn btn-primary btn-block text-white mt-3">아이디 찾기</button>					
					</div>
				</div>
			
			</div>
			
		</section>

			<c:import url="/WEB-INF/jsp/include/footer.jsp" />

		
	</div>
	
</body>
</html>