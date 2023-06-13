<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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

	<my:navBar></my:navBar>

	<my:alert></my:alert>
	<!-- toast -->
	<div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
		<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
				<div class="toast-body"></div>
				<button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>


	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-12 col-md-8 col-lg-6">
				<a class="btn btn-secondary" href="/ptBoard/list">HOME</a>
				<div class="me-auto">
					<h1>
						<span id="boardIdText"> ${board.id } </span>
						번 알바게시물
					</h1>
				</div>
				<div>
					<h1>
						<span id="likeIcon">
							<i class="fa-regular fa-thumbs-up"></i>
						</span>
						<span id="likeNumber"> ${board.like } </span> 
					</h1>
				</div>

				<div>
					<div class="mb-3">
						<label for="" class="form-label">제목</label>
						<input type="text" class="form-control" value="${board.title }" readonly />
					</div>

					<!-- 그림 파일 출력 -->
					<div class="mb-3">
						<c:forEach items="${board.fileName }" var="fileName">
							<div class="mb-3">
								<img class="img-thumbnail img-fluid" src="${bucketUrl }/${board.id }/${fileName}" alt="" />
							</div>
						</c:forEach>
					</div>

					<div class="mb-3">
						<label for="" class="form-label">본문</label>
						<textarea class="form-control" readonly rows="10">${board.body }</textarea>
					</div>
					<div class="mb-3">
						<label for="" class="form-label">작성자</label>
						<input type="text" class="form-control" value="${board.writer }" readonly />
					</div>
					<div class="mb-3">
						<label for="" class="form-label">작성일시</label>
						<input type="text" readonly class="form-control" value="${board.inserted }" />
					</div>

					<a class="btn btn-secondary" href="/ptBoard/modify/${board.id }">수정</a>
					<button id="removeButton" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">삭제</button>
				</div>

				<hr />
				<div class="commentContainer">
					<div id="addCommentContainer">
						<h6>입력</h6>
						<textarea id="commentTextArea"></textarea>
						<button id="sendCommentBtn">전송</button>
					</div>
					<div id="updateCommentContainer">
						<h6>수정</h6>
						<input type="hidden" id="commentUpdateIdInput" />
						<textarea id="commentUpdateTextArea"></textarea>
						<button id="updateCommentBtn">수정</button>
					</div>


					<div id="commentListContainer">
						<div>댓글1 내용 : 누가 : 언제</div>
						<div>댓글2 내용 : 누가 : 언제2</div>
						<div>댓글3 내용 : 누가 : 언제3</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="d-none">
		<form action="/ptBoard/remove" method="post" id="removeForm">
			<input id="inputId" type="text" name="id" value="${board.id }" />
		</form>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">삭제 하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-danger" form="removeForm">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="/js/ptBoard/like.js"></script>
	<script src="/js/ptBoard/comment.js"></script>
</body>
</html>