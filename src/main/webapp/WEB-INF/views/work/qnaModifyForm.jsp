<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		th{
			vertical-align: middle!important;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div style="display: flex; justify-content: space-between; padding: 10px 20px">
			<h3 class="title">질문 수정</h3>
			<div class="row col-4">
				<div class="col-6">
					<button type="button" class="btn btn-block btn-outline-primary" onclick="modifyGo()">저장</button>
				</div>
				<div class="col-6">
					<button type="button" class="btn btn-block btn-outline-dark" onclick="location.href='qnaDetail.do?qnaNo=${qna.qnaNo}'">취소</button>
				</div>
			</div>
		</div>
		<div class="card" style="padding: 20px 40px 20px 20px;">
			<form role="form" id="modifyForm" method="post" action="qnaModify.do" >
				<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
				<table class="table projects">
					<tr>
						<th>작성자</th>
						<td>
							<div style="align-items: center; display: flex;">
								<div>
									<img class="table-avatar emp_profile" src="${qna.writer.photo }">
								</div>
								<div>
									<span style="font-size:12px; font-weight:bold">${qna.writer.name } ${qna.writer.ppsname }</span>
									<div style="font-size:8px;">
										<p>${qna.writer.dname }</p>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" class="form-control" name="title" value="${qna.title }">
						</td>
					</tr>
				</table>
				<div>
					<textarea class="textarea" name="content" id="content" rows="20"
									cols="90" placeholder="1000자 내외로 작성하세요.">${qna.content }</textarea>
				</div>
			</form>
		</div>
	</div>
	<script>
	window.onload = function(){
		summernote_go($('textarea[name="content"]'), '<%=request.getContextPath()%>');
		var today = new Date().toISOString().split('T')[0];
		$('input[name="regDate"]').val(today);
	}


	function modifyGo(){
		var modifyForm = $('#modifyForm')

		if($('input[name="title"]').val() == ""){
			Swal.fire({
			      icon: 'warning',
			      title: '제목은 필수입력입니다.',
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}


		modifyForm.submit();
	}

	</script>
</body>