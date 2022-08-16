<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/community.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
	.page-link {
	    line-height: 1;
	    background-color: #fff;
	    border: 1px solid #1e6e0c;
	    color: #1e6e0c;
	}
	.page-item.active .page-link {
	    z-index: 3;
	    color: #fff;
	    border-color: #1e6e0c;
	    background: #1e6e0c;
	}
	
	.card-success.card-outline{
 		border-top: 3px solid #1e6e0c;
 	}
 	
 	.card-success:not(.card-outline)>.card-header{
 		background-color: #1e6e0c;
 	}
</style>
</head>


<title>게시글 상세</title>

<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">


		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-sm-6">
						<h3>상세보기</h3>
					</div>

				</div>
			</div>
		</section>


		<!-- Main content -->
		<section class="content container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-outline card-success">
						<div class="card-header">
							<h5 class="card-title">상세보기</h5>
							<div class="card-tools">
							<c:if test="${commuPost.eno eq loginUser.eno}">
								<button type="button" id="modifyBtn" class="btn btn-outline-primary"
									onclick="modifyForm_go();">수정</button>
								<button type="button" id="modifyBtn" class="btn btn-outline-danger"
									onclick="remove_go();">삭제</button>
							</c:if>
								<button type="button" id="listBtn" class="btn btn-outline-dark"
									onclick="CloseWindow();">닫기</button>
							</div>
						</div>
						<div class="card-body">
							<div class="form-group col-sm-12">
								<label for="title">제목</label> <input type="text"
									class="form-control" id="" readonly disabled name="title" value="${commuPost.title }" />
							</div>
							<div class="row">
								<div class="form-group col-sm-6">
									<label for="writer">작성자</label> <input type="text"
										class="form-control" id="" readonly name="name" value="${commuPost.name }" />
								</div>

								<div class="form-group col-sm-6">
									<label for="regDate">등록일</label> <input type="text"
										class="form-control" id="regDate" name="regDate" readonly value="<fmt:formatDate value="${commuPost.regDate}" pattern="yyyy-MM-dd"/>" />
								</div>

							</div>
							<div class="form-group col-sm-12">
								<div id="content">${commuPost.content}</div>
							</div>
						</div>
						
						
							<div class="card-footer">
								<div class="card card-success">
									<div class="card-header">
										<h3 class="card-title">
											<i class="fas fa-comments"></i>&nbsp;&nbsp;댓글
										</h3>
									</div>
									<c:if test="${commuPost.replyOpen eq 0 }">
									<div class="card-body row">
										<input type="text" class="form-control col-11" id="newReplyText" placeholder="댓글을 입력하세요" value="" />
										<button type="button" id="replyAddBtn" class="btn btn-default col-1" onclick="replyRegist_go();">
											<i class="fas fa-edit"></i>
										</button>
									</div>
									</c:if>
	
									<div class="card-footer">
										<div class="timeline">
	
											<div class="time-label" id="repliesDiv">
												<span style="background:#1e6e0c; color: white;">댓글 목록</span>
											</div>
	
										</div>
										<div class='text-center'>
											<ul id="pagination" class="pagination justify-content-center m-0" >
	
											</ul>
										</div>
									</div>
	
								</div>
							</div>
						
					</div>
					<!-- end card -->
				</div>
				<!-- end col-md-12 -->
			</div>
			<!-- end row  -->
		</section>
		<!-- /.content -->

		<div class="modal modal-default fade" id="modal-reply" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4>댓글 수정</h4>
							<h4 class="modal-title" style="display:none;"></h4>
						</div>
						<div class="modal-body">
							<div class="row ">
							<input class="form-control col-12" type="text" id="replyText" name='replyText' class="form-control">
						</div>
						</div>
						<div class="modal-footer justify-content-between">
							<button type="button" class="btn btn-outline-dark"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-outline-primary" id="replyModBtn" style="text-align: right" onclick="replyModify_go();" data-dismiss="modal">수정</button>
						</div>
					</div>
				</div>
			</div>

	</div>
	<!-- /.content-wrapper -->

<form role="form">
	<input type="hidden" name="cpostNo" value="${commuPost.cpostNo}" />
</form>



<script>
	function modifyForm_go(){
		var formObj = $("form[role='form']");
		formObj.attr({
			'action':'boardModifyForm.do',
			'method':'post'
		});
		formObj.submit();
	}
	function remove_go(){
		var formObj = $("form[role='form']");
		
		Swal.fire({
		    title: '삭제',
		    text: "정말 삭제하시겠습니까?",
		    icon: 'question',
		    showCancelButton: true,
		    confirmButtonColor: '#3085d6',
		    cancelButtonColor: '#d33',
		    confirmButtonText: '확인',
		    cancelButtonText: '취소',
		    reverseButtons: true, // 버튼 순서 거꾸로
		  }).then((result) => {
		    if (result.isConfirmed) {
		      Swal.fire(
		        '삭제하였습니다.'
		      ).then(function(){
		    	formObj.attr("action", "boardRemove.do");
				formObj.attr("method", "post");
				formObj.submit();
		      })
		    }
		 })
	}

	<c:if test="${from eq 'modify'}" >
		Swal.fire({
	      icon: 'success',
	      title: '수정되었습니다.',
	      confirmButtonColor: '#3085d6',
	    });
	</c:if>
	<c:if test="${from eq 'remove'}" >
		Swal.fire({
	      icon: 'success',
	      title: '삭제되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			window.close();
			window.opener.location.reload();
		});
	</c:if>
	</script>

<%@ include file="./boardReply_js.jsp" %>
</body>









