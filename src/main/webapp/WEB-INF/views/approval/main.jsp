<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		.approve-search{
			display: flex;
			margin-top: 10px;
		}
		.table th,.table td{
			padding: 4px 0.75rem;
		}
		.table th{
			text-align: center;
		}

/* 		.card-body.p-0 .table tbody>tr>td:last-of-type{ */
/* 			padding-right: 0; */
/* 		} */
/* 		.card-body.p-0 .table tbody>tr>td:first-of-type{ */
/* 			padding-left: 0.75rem; */
/* 		} */
		.card-header{
			padding: 4px 1.25rem;
		}
		.card-body{
			padding: 0.75rem 1.25rem;
		}
		.small-box{
			margin: 0;
		}
		.table{
			margin: 0;
		}
		.page-link {
		    line-height: 1;
		    color: #001f3f;
		    background-color: #fff;
		}
		.page-item.active .page-link {
		    z-index: 3;
		    color: #fff;
		    background-color: #001f3f;
		    border-color: #001f3f;
		}

	</style>
</head>
<body>
	<div class="wrapper">
		<div style="display: flex; justify-content: space-between; align-items: center; padding: 10px 0;">
			<h3 class="title">전자결재</h3>
		</div>
		<div class="row" style="padding: 7.5px; height: 300px; justify-content: space-between;">
			<div class="card card-navy card-outline" style="padding: 0; height: 100%; width: 49%">
				<div class="card-header bg-light">반려 기안문서</div>
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<thead>
							<tr>
								<th style="width: 15%">기안일</th>
								<th style="width: 15%">결재양식</th>
								<th style="width: 25%">제목</th>
								<th style="width: 25%">최종 결재자</th>
							</tr>
						</thead>
						<tbody class="refuseDraftList">

						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<ul class="pagination justify-content-center m-0" id="refuseDraftPage">

					</ul>
				</div>
			</div>
			<div class="card card-navy card-outline" style="padding: 0; height: 100%; width: 49%">
				<div class="card-header bg-light">보류 결재문서</div>
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<thead>
							<tr>
								<th style="width: 15%">기안일</th>
								<th style="width: 15%">결재양식</th>
								<th style="width: 25%">제목</th>
								<th style="width: 25%">기안자</th>
							</tr>
						</thead>
						<tbody class="waitSignList">

						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<ul class="pagination justify-content-center m-0" id="waitSignPage">

					</ul>
				</div>
			</div>
		</div>
		<div class="row" style="padding: 7.5px; height: 300px;">
			<div class="card card-navy card-outline col-md-12" style="padding: 0;height: 100%">
				<div class="card-header bg-light">결재문서</div>
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<thead>
							<tr>
								<th style="width: 10%">기안일</th>
								<th style="width: 10%">결재양식</th>
								<th style="width: 5%">긴급</th>
								<th style="width: 35%">제목</th>
								<th style="width: 20%">기안자</th>
								<th style="width: 20%">최종 결재자</th>
							</tr>
						</thead>
						<tbody class="signMyTurnList">

						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<ul class="pagination justify-content-center m-0" id="signPage">

					</ul>
				</div>
			</div>
		</div>
		<div class="row" style="padding: 7.5px; justify-content: space-between; height: 300px;">
			<div class="card card-navy card-outline" style="padding: 0; width: 49%; height: 100%">
				<div class="card-header bg-light">진행 기안문서</div>
				<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap" style="table-layout: fixed;">
							<thead>
								<tr>
									<th style="width: 15%">기안일</th>
									<th style="width: 15%">결재양식</th>
									<th style="width: 25%">제목</th>
									<th style="width: 25%">현재결재자</th>
								</tr>
							</thead>
							<tbody class="proceedDoc">

							</tbody>
						</table>
				</div>
				<div class="card-footer">
					<ul class="pagination justify-content-center m-0" id="proceedPage">

					</ul>
				</div>
			</div>
			<div class="card card-navy card-outline" style="padding: 0; width: 49%; height: 100%">
				<div class="card-header bg-light">최근 임시저장문서</div>
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<thead>
							<tr>
								<th style="width: 20%">결재양식</th>
								<th style="width: 60%">제목</th>
								<th style="width: 20%">수정일</th>
							</tr>
						</thead>
						<tbody class="tempDoc">

						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<ul class="pagination justify-content-center m-0" id="tempDocPage">

					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			getProceedingDraftDocList(1);
			getRecentTempSaveDocList(1);
			getSignMyTurnDocList(1);
			getRefuseDraftList(1);
			getWaitSignList(1);
		})
	</script>
	<%@ include file="./main_js.jsp" %>
	<%@ include file="./approval_js.jsp" %>
	<c:if test="${from eq 'regist' }">
		<script>
// 			alert("결재가 요청되었습니다.");
		</script>
	</c:if>
</body>