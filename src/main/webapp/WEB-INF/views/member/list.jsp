<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
</head>
<body>

	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-12">
				<h1>회원 목록</h1>			
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>PASSWORD</th>
							<th>별명</th>
							<th>이메일</th>
							<th>이름</th>
							<th>성별</th>
							<th>핸드폰 번호</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList }" var="user">
							<tr>
<!-- 								<td> -->
<%-- 									<c:url value="/member/info" var="memberInfoLink"> --%>
<%-- 										<c:param name="id" value="${member.id }"></c:param> --%>
<%-- 									</c:url> --%>
<%-- 									<a href="${memberInfoLink }"> --%>
<%-- 										${member.id } --%>
<!-- 									</a> -->
								
<!-- 								</td> -->
								<td>${user.id }</td>
								<td>${user.password }</td>
								<td>${user.nickName }</td>
								<td>${user.email }</td>
								<td>${user.name }</td>
								<td>${user.gender }</td>
								<td>${user.phoneNum }</td>
								<td>${user.address }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>