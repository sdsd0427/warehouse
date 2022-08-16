<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<body>

	<div class="wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div>
						<h3>자유게시판</h3>
					</div>
					<div style="display: inline; margin-left: 10px; margin-top: 10px;">
						<span  class="text-muted"  style="padding-right: 580px;">게시판 > 자유게시판</span>
					</div>
				</div>
			</div>
		</section>

		<section class="content container-fluid">
			<div class="card card-navy card-outline">
				<div class="card-header">
					<h3 class="card-title" style="padding-top: 8px;">자유게시판 상세</h3>
					<div class="col-lg-12">
						<button class="btn btn-outline-danger float-right"
							style="margin-left: 20px;" type="button" ${loginUser.eno!=board.eno? 'hidden':'' } onclick="remove_go();">삭제</button>
						<button class="btn btn-outline-primary float-right"
							style="margin-left: 20px;" type="button" ${loginUser.eno!=board.eno? 'hidden':'' }
							onclick="goDetail('<%=request.getContextPath()%>/board/free/modifyGo.do?boardNo=${board.boardNo}','${menu.mcode}')">수정</button>
						<button class="btn btn-outline-dark float-right" type="button"
							onclick="goIframPage('<%=request.getContextPath() %>/board/free/list.do','${menu.mcode}')">목록</button>
					</div>
				</div>

				<div class="card-body">

					<h5 style="font-weight: bold;">${board.boardTitle }</h5>
					<div class="form-group row">
						<div class="user-panel pb-3 d-flex">
							<div class="image">
							<c:if test="${board.anonym eq 1 }"><img src="<%=request.getContextPath() %>/resources/images/익명2.png" alt="Product 1" class="img-circle elevation-2" style="height: 35px;"></c:if>
							<c:if test="${board.anonym eq 0 }"><img class="img-circle elevation-2" alt="img" src="${board.photo }" style="height: 35px;"></c:if>
							</div>
							<div class="info">
								<span>
									<c:if test="${board.anonym eq 1 }">익명</c:if>
									<c:if test="${board.anonym eq 0 }">${board.name }</c:if>
								</span>
								<span class="date">&nbsp;&nbsp;<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></span>
							</div>
						</div>
					</div>

					<div class="form-group">${board.boardContent }</div>

					<div class="form-group">
						<span class="ic_classic ic_reply"></span> <span class="txt_b">댓글
							<span class="num txt_b" id="commentCount"> ${board.replyCnt }</span>개
						</span> <span class="part">&nbsp;|&nbsp;</span> <span class="txt_ txt_b">
							조회 <span>${board.viewCnt }</span>
						</span>
					</div>

					<div class="card card-light card-outline">
						<div class="card-header">
							<h5 class="card-title" style="font-size: medium;">
								<i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일
							</h5>
						</div>
						<div class="card-footer">
							<div class="row">
								<c:forEach items="${board.attachList }" var="attach">
									<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;" onclick="location.href='getFile.do?attachNo=${attach.attachNo}'">
										<div class="info-box">
										 	<span class="info-box-icon bg-yellow">
												<i class="fa fa-copy"></i>
											</span>
											<div class="info-box-content">
												<span class ="info-box-text">
													<fmt:formatDate value="${attach.regDate }" pattern="yyyy-MM-dd"/>
												</span>
												<span class ="info-box-number">${attach.fileName }</span>
											</div>
										</div>
									 </div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="card card-navy">
				<div class="card-header">
					<h3 class="card-title" style="font-size: medium;">
						<i class="fas fa-comments"></i>&nbsp;&nbsp;댓글
					</h3>
				</div>

				<div class="card-body row" style="padding-bottom: 0">
					<input type="text" class="form-control col-11" id="newReplyText" placeholder="댓글을 입력하세요" value="" >
					<button type="button" id="replyAddBtn" class="btn btn-default col-1" onclick="replyRegist_go();">
						<i class="fas fa-edit"></i>
					</button>
					<div class="custom-control col-12 mt-1">
						<div class="custom-checkbox">
							<input class="form-check-input" type="checkbox" id=anonym name="anonym" value="">
							<label style="font-size: small;">익명 사용</label>
						</div>
					</div>
				</div>

				<div class="card-footer">
					<div class="timeline">
						<div class="time-label" id="repliesDiv">
							<span class="bg-lightblue">댓글 목록</span>
						</div>

					</div>

					<div class='text-center'>
						<ul class="pagination justify-content-center m-0" id="pagination"></ul>
					</div>

				</div>
			</div>
		</section>

		<div class="modal modal-default fade" id="modal-reply" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4>댓글 수정</h4>
						<h4 class="modal-title" style="display:none;"></h4>
						<h4 class="modal-anonym" style="display:none;"></h4>
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

<form role="form">
	<input type="hidden" name="boardNo" value="${board.boardNo }" />
</form>

<script>
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
	    	  formObj.attr("action", "remove.do");
	  		formObj.attr("method", "post");
	  		formObj.submit();
	      })
	    }
	 })
	
}

<c:if test="${from eq 'remove'}" >
Swal.fire({
    icon: 'warning',
    title: '삭제되었습니다.',
    confirmButtonColor: '#3085d6',
  });
</c:if>
</script>

<%@ include file="./freeReply_js.jsp" %>

</body>
