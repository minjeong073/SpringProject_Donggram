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
<title>사용자 정보</title>

<!-- bootstrap jquery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css" >

</head>
<body>
	<c:import url="/WEB-INF/jsp/include/comment-header.jsp"/>
		
	<div class="container d-flex flex-column align-items-center ">
	
		<section class=" w-75 d-flex justify-content-center mt-5 mb-3">
			<div class="m-3 ">
				
				<div class=" d-flex justify-content-around mt-4 mb-3">
					<div class="m-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					</div>
					
					<div>
						<div class="d-flex">
							<div class=""><h4>${user.loginId }</h4></div>
							<!-- <div><button type="button" class="btn btn-sm btn-secondary">프로필 편집</button></div> -->
						</div>
						<div>게시물 ${fn:length(postList) }</div>						
					</div>
					
					<div class="col-2">
					</div>
					
				</div>
				
				<hr>
				<div class="d-flex ">
					<div class="d-flex ml-5 mt-3 flex-wrap">
					
						<c:forEach var="post" items="${postList }">
							<div style="width: 200px; height: 200px;" class="border m-2 d-flex  align-items-center">
								<div class="d-flex justify-content-center ">
									<a href="/post/detail/view?id=${post.id }"><img src="${post.imagePath }" width="198"></a>
								</div>
							</div>
						</c:forEach>
						
					</div>
				</div>
				
			</div>
		</section>

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />

	</div>
	
</body>
</html>