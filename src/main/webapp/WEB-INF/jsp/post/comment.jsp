<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	<c:import url="/WEB-INF/jsp/include/timeline-header.jsp"/>	
	
	<div class="container d-flex flex-column align-items-center">
		
		<section class="contents d-flex flex-column align-items-center">
		<div class="m-3 commentBox">
			<div class="h-50 display-4">
				<b class="mr-3">${postDetail.user.loginId }</b>
				${postDetail.post.contents }
			</div>
			
			<br>
			
			<div class="h-50">
				<table class="table" border="0">
				<c:forEach var="commentDetail" items="${postDetail.commentDetailList }">
					<tr>
						<th class="table-user-loginId"><h4>${commentDetail.user.loginId }</h4></th>
						<td class=""><h5>${commentDetail.comment.comment }</h5></td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
		</section>
	</div>
	
</body>
</html>	