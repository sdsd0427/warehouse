<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
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
.mentoring .table-avatar img, .mentoring img.table-avatar {
    border-radius: 50%;
    display: inline;
    width: 2.5rem;
}
.emp_card .table-avatar img, .emp_card img.table-avatar {
    border-radius: 50%;
    display: inline;
    width: 2rem;
}
.emp_card {
    display: none;
    width: 250px;
    height: 170px;
    position: absolute;
    left: 0;
    top: 0;
    background: #f8f9fa;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: 0.25rem;
    box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);
}
.table td,.card-footer{
	padding: 4px 0.75rem;
	text-align: center;
}
.card-header, .table th{
	padding: 8px 0.75rem;
	text-align: center;
}
.card-body.p-0 .table tbody>tr>td:first-of-type{
	padding-left: 0.75rem;
}
</style>
</head>

<body>
<div class="wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3>나의 멘티</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 8px;">
					<span  class="text-muted">멘토링 > 나의 멘티</span>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="row">
			<div class="col-12">
				<div class="card card-navy card-outline">

					<div class="card-header with-border">
						<span style="float: left;">나의 멘티 목록</span>
					</div>

					<div class="card-body p-0">
						<table class="table table-hover text-nowrap mentoring">
							<thead>
								<tr>
									<th>이름</th>
									<th>부서</th>
									<th>직책</th>
									<th>멘토링기간</th>
									<th></th>
								</tr>
							</thead>
							<tbody class="myMenteeList">
							</tbody>
						</table>
					</div>

					<div class="card-footer">
						<ul class="myMenteePage pagination pagination-sm justify-content-center m-0">
						</ul>
					</div>

				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-6">
				<div class="card card-navy">

					<div class="card-header with-border">
						<span style="float: left;">나의 멘티 업무</span>
					</div>

					<div class="card-body p-0">
						<table class="table table-hover text-nowrap mentoring" style="table-layout: fixed;">
							<thead>
								<tr>
									<th style="width:35%">제목</th>
									<th style="width:30%">담당자(멘티)</th>
									<th style="width:20%">기한</th>
									<th style="width:15%">상태</th>
								</tr>
							</thead>
							<tbody class="myMenteeWorkList">
							</tbody>
						</table>
					</div>

					<div class="card-footer">
						<ul class="myMenteeWorkPage pagination pagination-sm justify-content-center m-0">
						</ul>
					</div>

				</div>
			</div>


			<div class="col-6">
				<div class="card card-navy">

					<div class="card-header with-border">
						<span style="float: left;">나의 멘티 결재문서</span>
					</div>

					<div class="card-body p-0">
						<table class="table table-hover text-nowrap mentoring docu" style="table-layout: fixed;">
							<thead>
								<tr>
									<th style="width: 25%">제목</th>
									<th style="width: 20%">기안자(멘티)</th>
									<th style="width: 20%">결재양식</th>
									<th style="width: 20%">기안일</th>
									<th style="width: 15%">상태</th>
								</tr>
							</thead>
							<tbody class="myMenteeDocList">
							</tbody>
						</table>
					</div>

					<div class="card-footer">
						<ul class="myMenteeDocPage pagination pagination-sm justify-content-center m-0">
						</ul>
					</div>

				</div>
			</div>
		</div>

	</section>

</div>


<div class="emp_card" style="top: 0px; left: 0px; display: none;">
			<div class="card-header" style="display: flex; align-items: center;">
				<img class="table-avatar emp_profile" src="/warehouse/resources/bootstrap/dist/img/avatar.png">&nbsp;&nbsp;<span class="name" style="font-weight: bold;">최민규 팀장</span>
				<a class="mail" href="#">
					<span class="material-symbols-outlined">
					mail
					</span>
				</a>
			</div>
			<div class="card-body">
				<span>부서: </span>
				<span class="dep">개발팀</span>
				<br>
				<span>연락처: </span>
				<span>010-1111-1111</span>
				<br>
				<span>내선번호: </span>
				<span>070-111-1111</span>
			</div>
		</div>

<script>
$(document).on('click', 'body > aside > div > ul > li:nth-child(2) > a', function(){
	$(this).attr("href", "#");
	OpenWindow('registForm.do','멘토링 신청',800,600);
})

$(function(){
	myMenteeListGo(1);
	myMenteeWorkListGo(1);
	myMenteeDocListGo(1);
});
</script>

<%@ include file="./mentee_js.jsp" %>

</body>

