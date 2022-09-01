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
								<input type="text" class="form-control mt-3" placeholder="아이디" id="loginIdInput">
								<span class="input-group-btn mt-4">
									<button type="button" id="duplicateBtn" class="btn btn-sm btn-outline-secondary mx-3">중복확인</button>												
								</span>
							</div>
							<span class="small text-danger d-none" id="duplicateId">이미 사용 중인 아이디 입니다</span>
							<span class="small text-info d-none" id="possibleId">사용 가능한 아이디 입니다</span>
							<input type="password" class="form-control mt-3" placeholder="비밀번호" id="pwInput">
							<input type="password" class="form-control mt-3" placeholder="비밀번호 확인" id="pwConfirmInput">
							<input type="text" class="form-control mt-3" placeholder="사용자 이름" id="nameInput">
							<input type="text" class="form-control mt-3" placeholder="이메일" id="emailInput">
							
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
			
			// 아이디 중복 확인 - 확인 유무 저장
			var isCheck = false;
			
			// 아이디 중복 확인 - 상태 저장
			var isDuplicate = true;
			
			<%-- 아이디 변경 시 중복 확인 초기화 --%>
			$("input").on("propertychange change keyup paste input", function() {
				
				isCheck = false;
				isDuplicate = true;
				
				$("#duplicateId").addClass("d-none");
				$("#possibleId").addClass("d-none");
				
			});
			
			<%-- 아이디 중복 확인 --%>
			$("#duplicateBtn").on("click", function() {
				
				let loginId = $("#loginIdInput").val();
				
				// 유효성 검사
				
				if (loginId == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate_id"
					, data:{"loginId":loginId}
					, success:function(data) {
						
						// 중복 체크 한 후에 진행
						isCheck = true;
						
						if (data.id_duplicate) {	// 중복일 경우
							// 중복 상태 변경
							isDuplicate = true;
							$("#duplicateId").removeClass("d-none");
							$("#possibleId").addClass("d-none");
						} else {	// 중복 아닐 경우
							isDuplicate = false;
							$("#duplicateId").addClass("d-none");
							$("#possibleId").removeClass("d-none");
						}
					}
					, error:function() {
						alert("중복 확인 에러");
					}
				});
				
			});
			
			
			<%-- 가입하기 --%>
			$("#signupBtn").on("click", function() {
				
				// 변수에 값 저장
				let loginId = $("#loginIdInput").val();
				let password = $("#pwInput").val();
				let passwordConfirm = $("#pwConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				
				// validation
				
				if (loginId == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if (password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다");
					return ;
				}
				
				if (name == "") {
					alert("이름을 입력하세요");
					return ;
				}
				
				if (email == "") {
					alert("이메일을 입력하세요");
					return ;
				}
				
				// 아이디 중복 확인
				if (!isCheck) {
					alert("아이디 중복 확인 해주세요");
					return ;
				}
				
				if (isDuplicate) {
					alert("중복된 아이디 입니다");
					return ;
				}
				
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId":loginId, "password":password, "name":name, "email":email}
					, success:function(data) {
						if (data.result == "success") {
							alert("회원가입이 완료되었습니다");
							location.href="/user/signin/view";
						} else {
							alert("회원가입 실패");
						}
					}
					, error:function() {
						alert("회원가입 에러");
					}
				});
				
			});
		})
		
	</script>

</body>
</html>