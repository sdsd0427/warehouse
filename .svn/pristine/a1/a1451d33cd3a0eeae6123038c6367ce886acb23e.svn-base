<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="freeBoardList" value="${fdataMap.boardList }" />
<c:set var="eventBoardList" value="${edataMap.boardList }" />
<c:set var="fixBoardList" value="${dataMap.fixBoardList }" />
<c:set var="weekStart" value="${dataMap.weekStart }" />
<c:set var="weekEnd" value="${dataMap.weekEnd }" />

<fmt:parseDate var="weekStartDate" value="${weekStart }" pattern="yyyy-MM-dd"/>
<fmt:parseDate var="weekEndDate" value="${weekEnd }" pattern="yyyy-MM-dd"/>
<fmt:formatDate value="${weekStartDate }" pattern="yyyy-MM-dd"/>
<fmt:formatDate value="${weekEndDate }" pattern="yyyy-MM-dd"/>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
.card-header{
	padding: 1px 0.75rem;
}
.table th{
	padding: 8px 0.75rem;
	text-align: center;
}
.table td{
	padding: 6px 0.75rem;
	text-align: center;
}

</style>
<script type="text/javascript">
</script>
</head>

<div class="wrapper">
	<section class="content-header" style="padding-top: 0">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3>게시판</h3>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="row">
			<div class="col-6">
				<div class="card card-navy">

					<div class="card-header">
							<div class="row">
								<div class="col-10"  style="padding-top: 7px;">
									<span><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;공지</span>
								</div>
								<div class="col-2" style="padding-left: 30px;">
									<button type="button" class="btn" style="color:white;" onclick="goIframPage('<%=request.getContextPath() %>/board/notice/list.do','${menu.mcode}')">
										<i class="fas fa-plus fa-xs"></i>
									</button>
								</div>
							</div>
						</div>

					<c:forEach items="${fixBoardList }" var="fixBoard">
					<div class="card-body" style="padding-bottom:0;padding-top:10px;cursor:pointer;" onclick="goDetail('board/notice/detailGo.do?boardNo=${fixBoard.boardNo }','${menu.upcode }')">
						<div class="row"><h5 style="font-weight: bold;font-size: medium;">${fixBoard.boardTitle }</h5>&nbsp;&nbsp;&nbsp;<i class="fas fa-light fa-eye" style="padding-top: 5px;"></i>&nbsp;${fixBoard.viewCnt }</div>
						<div class="row"><h5 style="font-size: medium;width:450px;">${fn:substring(fixBoard.boardContent,0,60) }</h5></div>
						<div class="row user-panel d-flex" style="padding-top: 5px;">
							<div class="cat">
								<img class="img-circle" alt="img" src="${fixBoard.photo }" style="height: 35px;">
							</div>
							<div class="info">
								<span>${fixBoard.name }</span> <span class="date">&nbsp;&nbsp;<fmt:formatDate value="${fixBoard.regDate }" pattern="yyyy-MM-dd"/></span>
							</div>
						</div>
						<hr style="margin-top: 10px;margin-bottom: 1px;">
					</div>
					</c:forEach>

				</div>
			</div>

			<div class="col-6">
				<div class="card card-navy">

					<div class="card-header">
							<div class="row">
								<div class="col-10"  style="padding-top: 7px;">
									<span>금주 경조사</span>
								</div>
								<div class="col-2" style="padding-left: 30px;">
									<button type="button" class="btn" style="color:white;" onclick="goIframPage('<%=request.getContextPath() %>/board/event/list.do','${menu.mcode}')">
										<i class="fas fa-plus fa-xs"></i>
									</button>
								</div>
							</div>
						</div>

					<div class="card-body" style="padding: 0;">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>참석자수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty eventBoardList }" >
									<tr style="text-align: center;">
										<td colspan="6">
											<strong>해당 내용이 없습니다.</strong>
										</td>
									</tr>
								</c:if>
								<c:forEach items="${eventBoardList }" var="eventBoard">

									<c:if test="${weekStartDate < eventBoard.regDate && weekEndDate > eventBoard.regDate}">
									<tr onclick="goDetail('board/event/detailGo.do?boardNo=${eventBoard.boardNo }','${menu.upcode }')" style="cursor: pointer;">
										<td style="text-align: left; max-width: 130px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<c:if test="${eventBoard.eventcate eq 1 }"><strong>[결혼]</strong> </c:if>
										<c:if test="${eventBoard.eventcate eq 2 }"><strong>[부고]</strong> </c:if>
										${eventBoard.boardTitle }
										</td>
										<td>${eventBoard.name }</td>
										<td>
											<fmt:formatDate value="${eventBoard.regDate }" pattern="yyyy-MM-dd"/>
										</td>
										<td><i class="fas fa-users"></i> ${eventBoard.replyCnt }</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>

				<div class="card card-navy">

					<div class="card-header">
							<div class="row">
								<div class="col-10"  style="padding-top: 7px;">
									<span>인기 자유게시글</span>
								</div>
								<div class="col-2" style="padding-left: 30px;">
									<button type="button" class="btn" style="color:white;" onclick="goIframPage('<%=request.getContextPath() %>/board/free/list.do','${menu.mcode}')">
										<i class="fas fa-plus fa-xs"></i>
									</button>
								</div>
							</div>
						</div>

					<div class="card-body" style="padding: 0;">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th style="width: 35%;">제목</th>
									<th style="width: 30%;">작성자</th>
									<th style="width: 20%;">작성일</th>
									<th style="width: 15%;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty freeBoardList }" >
									<tr style="text-align: center;">
										<td colspan="6">
											<strong>해당 내용이 없습니다.</strong>
										</td>
									</tr>
								</c:if>
								<c:forEach items="${freeBoardList }" var="freeBoard">
									<tr onclick="goDetail('board/free/detailGo.do?boardNo=${freeBoard.boardNo }','${menu.upcode }')" style="cursor: pointer;">
										<td style="text-align: left; max-width: 130px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<span class="col-sm-12">${freeBoard.boardTitle }
										<c:if test="${freeBoard.replyCnt ne 0 }">
											<span class="nav-item">&nbsp;&nbsp;<i class="fas fa-comments"></i>
												<span class="badge badge-warning navbar-badge badge-signal" style="top:-5px;">${freeBoard.replyCnt }</span>
											</span>
										</c:if>
										</span>
										</td>
										<td>
											<c:if test="${freeBoard.anonym eq 1 }">익명</c:if>
											<c:if test="${freeBoard.anonym eq 0 }">${freeBoard.name }</c:if>
										</td>
										<td>
											<fmt:formatDate value="${freeBoard.regDate }" pattern="yyyy-MM-dd"/>
										</td>
										<td><i class="fas fa-light fa-eye"></i> ${freeBoard.viewCnt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>

			</div>

		</div>
	</section>
</div>


<script>


</script>
