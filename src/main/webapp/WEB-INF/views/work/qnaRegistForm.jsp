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
			<h3 class="title">질문 작성</h3>
			<div class="col-2">
				<button type="button" class="btn btn-block btn-outline-primary" onclick="registGo()">작성</button>
			</div>
		</div>
		<div class="card" style="padding: 20px 40px 20px 20px;">
			<form id="qnaForm" method="post" action="qnaRegist.do">
				<input type="hidden" name="eno" value="${loginUser.eno }">
				<input type="hidden" name="wcode" value="${wcode }">
				<table class="table">
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" class="form-control" value="${loginUser.name } ${loginUser.ppsname}" disabled="disabled">
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" class="form-control" placeholder="질문 제목을 입력해주세요." name="title">
						</td>
					</tr>
				</table>
				<div>
					<textarea class="textarea" name="content" id="content" rows="20"
									cols="90" placeholder="1000자 내외로 작성하세요." ></textarea>
				</div>
			</form>
		</div>
	</div>
	<script>
	window.onload = function(){
		summernote_go($('textarea[name="content"]'), '<%=request.getContextPath()%>');
	}
	function registGo(){
		var qnaForm = $('#qnaForm')



		if($('input[name="title"]').val() == ""){
			Swal.fire({
			      icon: 'warning',
			      title: '제목은 필수입력입니다.',
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}


		qnaForm.submit();
	}

	</script>
	<c:if test="${from eq 'qnaRegist' }">
		<script>
		Swal.fire({
		      icon: 'success',
		      title: '질문이 등록되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				window.close();
				window.opener.location.reload();
		      });
		</script>
	</c:if>
</body>