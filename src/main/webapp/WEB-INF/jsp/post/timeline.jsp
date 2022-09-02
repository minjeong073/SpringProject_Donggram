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
		
		<section class="contents bg-warning d-flex flex-column align-items-center">
			
			<div class="feed border m-3">
				
				<div class="user-info bg-primary d-flex align-items-center">
					<div id="user-img" class="col-2 bg-success">
						<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					</div>
					
					<div id="user-name" class="col-3 bg-warning">
						<div><h4>${userId }</h4></div>
						<div>#location#</div>
					</div>
					
					<div id="follow-btn" class="col-2">
						<button class="btn btn-outline-info">follow</button>
					</div>
					
					<div class="col-4"></div>
					
					<div id="navbar-header" class="col-1">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-bar">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
							  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
							</svg>
						</button>
						
						<div class="collapse navbar-collapse" id="nav-bar">
							<ul>
								<li>수정</li>
								<li>삭제</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="feed-img bg-primary">
					
				</div>
				
				<div class="feed-info bg-danger">
					
				</div>
				
			</div>
			
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</section>
		
		
	</div>
	
</body>
</html>