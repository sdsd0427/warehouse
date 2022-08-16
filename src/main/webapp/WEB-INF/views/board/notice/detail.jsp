<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<body>

	<div class="wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div>
						<h3>공지사항</h3>
					</div>
					<div style="display: inline; margin-left: 10px; margin-top: 10px;"> 	
						<span  class="text-muted"  style="padding-right: 620px;">게시판 > 공지사항</span>
					</div>
				</div>
			</div>
		</section>

		<section class="content container-fluid">
			<div class="card card-navy card-outline">
				<div class="card-header">
					<h3 class="card-title" style="padding-top: 8px;">공지사항 상세</h3>
					<div class="col-lg-12">
						<button class="btn btn-outline-danger float-right"
							style="margin-left: 20px;" type="button" ${loginUser.eno!=board.eno? 'hidden':'' } onclick="remove_go();">삭제</button>
						<button class="btn btn-outline-primary float-right"
							style="margin-left: 20px;" type="button" ${loginUser.eno!=board.eno? 'hidden':'' }
							onclick="goDetail('<%=request.getContextPath()%>/board/notice/modifyGo.do?boardNo=${board.boardNo}','${menu.mcode}')">수정</button>
						<button class="btn btn-outline-dark float-right" type="button"
							onclick="goIframPage('<%=request.getContextPath() %>/board/notice/list.do','${menu.mcode}')">목록</button>
					</div>
				</div>

				<div class="card-body">
					<h5 style="font-weight: bold;">${board.boardTitle }</h5>
					<div class="form-group row">
						<div class="user-panel pb-3 d-flex">
							<div class="image cat">
								<img class="img-circle elevation-2" alt="img" src="${board.photo }" style="height: 35px;">
							</div>
							<div class="info">
								<span>${board.name }</span> <span class="date">&nbsp;&nbsp;<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></span>
							</div>
						</div>
					</div>
					<div class="form-group">${board.boardContent }</div>

					<div class="form-group">
						<span class="txt_ txt_b">
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

		</section>
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
</script>

</body>
