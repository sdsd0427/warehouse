<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="boardList" value="${dataMap.boardList }" />
<c:set var="fixBoardList" value="${dataMap.fixBoardList }" />





<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

</head>

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
				<button style="width:100px;" type="button" onclick="goRegist('<%=request.getContextPath() %>/board/notice/registGo.do', '${menu.upcode }')" class="btn btn-outline-primary float-right">등록</button>
			</div>
		</div>
	</section>

	<section>
		<div class="row">
			<div class="col-12">
				<div class="card card-navy card-outline">

					<div class="card-header with-border">
						<span style="float: left;">총 ${pageMaker.totalCount }건</span>
						<div id="" class="card-tools" style="width: 450px;">
							<div class="input-group input-group-sm row">
								<select class="form-control col-3" name="perPageNum" id="perPageNum" onchange="list_go(1);">
									<option value="10">정렬</option>
									<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20</option>
									<option value="30" ${cri.perPageNum == 30 ? 'selected':''}>30</option>
									<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50</option>
								</select>
								<select class="form-control col-3" name="searchType" id="searchType">
									<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>전체</option>
									<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
									<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내용</option>
									<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
								</select> <input class="form-control col-5" type="text" name="keyword"
									placeholder="검색어를 입력하세요" value="${param.keyword }"> <span
									class="input-group-append">
									<button class="btn btn-dark" type="button" onclick="list_go(1);"
										data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>

					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th style="width: 12%;">첨부파일</th>
									<th style="width: 12%;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${fixBoardList }" var="fixBoard">
									<tr onclick="goDetail('board/notice/detailGo.do?boardNo=${fixBoard.boardNo }','${menu.upcode }')" style="cursor: pointer;">
										<td><i class="fas fa-bullhorn" style="color:red;"></i></td>
										<td style="color:red;font-weight:bold;text-align: left;">
										${fixBoard.boardTitle }
										<c:if test="${fixBoard.newCheck eq 1 }">
											<span class="right badge badge-danger">New</span>
										</c:if>
										</td>
										<td>${fixBoard.name }</td>
										<td>
											<fmt:formatDate value="${fixBoard.regDate }" pattern="yyyy-MM-dd"/>
										</td>
										<td>
											<c:if test="${!empty fixBoard.attachList }">
												<i class="fas fa-paperclip"></i>
											</c:if>
										</td>
										<td><i class="fas fa-light fa-eye"></i> ${fixBoard.viewCnt }</td>
										</tr>
								</c:forEach>
								<c:if test="${empty boardList }" >
									<tr style="text-align: center;">
										<td colspan="6">
											<strong>해당 내용이 없습니다.</strong>
										</td>
									</tr>
								</c:if>
								<c:forEach items="${boardList }" var="board">
									<tr onclick="goDetail('board/notice/detailGo.do?boardNo=${board.boardNo }','${menu.upcode }')" style="cursor: pointer;">
										<td>${fn:substring(board.boardNo,5,8) }</td>
										<td style="text-align: left;">
										${board.boardTitle }
										<c:if test="${board.newCheck eq 1 }">
											<span class="right badge badge-danger">New</span>
										</c:if>
										</td>
										<td>${board.name }</td>
										<td>
											<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/>
										</td>
										<td>
											<c:if test="${!empty board.attachList }">
												<i class="fas fa-paperclip"></i>
											</c:if>
										</td>
										<td><i class="fas fa-light fa-eye"></i> ${board.viewCnt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="card-footer">
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<form id="oa">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
	<input type="hidden" name="mCode" value="${menu.mcode }"/>
</form>

<script>
<c:if test="${from eq 'remove'}" >
Swal.fire({
    icon: 'success',
    title: '삭제되었습니다.',
    confirmButtonColor: '#3085d6',
  });
</c:if>
</script>
<script>

//pagination
function list_go(page,url){
	if(!url) url="list.do";

	var jobForm=$('#oa');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}


</script>
