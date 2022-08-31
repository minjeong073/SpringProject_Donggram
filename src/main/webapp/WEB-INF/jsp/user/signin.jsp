<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

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
			<img alt="로그인 화면 메인 이미지" src="/static/img/login-main-img.png" class="m-4" width="400">
			
			<div class="join-box my-4">
				<div class="login border mb-4">
					<div class="m-4">
						<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
						
						<input type="text" class="form-control mt-4" placeholder="아이디">
						<input type="password" class="form-control mt-3" placeholder="비밀번호">
						<button class="btn btn-secondary btn-block my-3">login</button>	
						<br>
						<hr>
						<br>
						<div class="d-flex justify-content-between">
							<a>아이디 찾기</a>
							<a>비밀번호 찾기</a>
						</div>
						
					</div>
				</div> <!-- login -->
				
				<div class="signup border">
					<div class="d-flex m-4">
						<span>계정이 없으신가요?</span>
						<span><a href="/user/signup/view">가입하기</a></span>
					</div>
				</div> <!-- signup -->
			
			</div> <!-- join-box -->
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
</body>
</html>