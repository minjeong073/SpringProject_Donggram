<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

<!-- bootstrap jquery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css" >

</head>
<body>
	
	<div class="container">
		
		<section class="contents d-flex justify-content-center">
			<div class="content-box my-4 d-flex flex-column justify-content-center">
				<div class="signup mb-4 border">
					
					<div class="m-4">
						<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
						<div class="mt-3">
							<div class="d-flex input-group">
								<input type="text" class="form-control mt-3" placeholder="아이디">
								<span class="input-group-btn mt-4">
									<button type="button" class="btn btn-sm btn-outline-secondary mx-3">중복확인</button>												
								</span>
							</div>
							<input type="password" class="form-control mt-3" placeholder="비밀번호">
							<input type="password" class="form-control mt-3" placeholder="비밀번호 확인">
							<input type="text" class="form-control mt-3" placeholder="사용자 이름">
							<input type="text" class="form-control mt-3" placeholder="이메일">
							
							<button type="button" id="signupBtn" class="btn btn-primary btn-block text-white mt-3">가입하기</button>					
						
						</div><!-- form -->
					</div>
									
				</div><!-- signup -->
				
				
				<div class="signup border">
					<div class="d-flex m-4 justify-content-around">
						<span>계정이 있으신가요?</span>
						<span><a href="/user/signin/view">로그인하기</a></span>
					</div>
				</div> <!-- signin -->
				
			</div>
			
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
		
		$(document).ready(function() {
			
			$("#signupBtn").on("click", function() {
				
			});
		})
		
	</script>

</body>
</html>