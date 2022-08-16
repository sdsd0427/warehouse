<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<div class="wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h3>마이페이지 > 나의 업무</h3>
				</div>
			</div>
		</div>
	</section>

	<section class="content container-fluid">
		<div class="card card-info card-outline">
			<div class="card-header">
				<h3 class="card-title">나의 업무 현황</h3>
			</div>

			<div class="row">
				<div class="col-sm-3 col-6">
					<div class="description-block border-right">
						<a class="btn btn-app bg-warning"> <i class="fas fa-envelope"></i>
							대기
						</a>
						<h5 class="description-header">&nbsp;&nbsp;0 개</h5>
					</div>
				</div>

				<div class="col-sm-3 col-6">
					<div class="description-block border-right">
						<a class="btn btn-app bg-info"> <i class="fas fa-users"></i>
							진행
						</a>
						<h5 class="description-header">&nbsp;&nbsp;1 개</h5>
					</div>
				</div>

				<div class="col-sm-3 col-6">
					<div class="description-block border-right">
						<a class="btn btn-app bg-danger"> <i class="fas fa-inbox"></i>
							보류
						</a>
						<h5 class="description-header">&nbsp;&nbsp;0 개</h5>
					</div>
				</div>

				<div class="col-sm-3 col-6">
					<div class="description-block border-right">
						<a class="btn btn-app bg-success"> <i class="fas fa-heart"></i>
							완료
						</a>
						<h5 class="description-header">&nbsp;&nbsp;0 개</h5>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>제목</th>
									<th>요청자/담당자</th>
									<th>기한</th>
									<th>진척도</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>전자결재</td>
									<td>최민규 팀장</td>
									<td>2022-07-15</td>
									<td class="project_progress">
									<div class="progress progress-sm">
										<div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 60%"></div>
									</div>
									<small>60% 완료</small>
								</td>
									<td>진행</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="card card-info card-outline">
			<div class="card-header">
				<h3 class="card-title">나의 결재문서 현황</h3>
			</div>

			<div class="row">
				<div class="col-sm-3 col-6">
					<div class="description-block border-right">
						<a class="btn btn-app bg-warning"> <i class="fas fa-envelope"></i>
							결재
						</a>
						<h5 class="description-header">&nbsp;&nbsp;0 개</h5>
					</div>
				</div>

				<div class="col-sm-3 col-6">
					<div class="description-block border-right">
						<a class="btn btn-app bg-info"> <i class="fas fa-users"></i>
							참조
						</a>
						<h5 class="description-header">&nbsp;&nbsp;0 개</h5>
					</div>
				</div>

				<div class="col-sm-3 col-6">
					<div class="description-block border-right">
						<a class="btn btn-app bg-danger"> <i class="fas fa-inbox"></i>
							임시
						</a>
						<h5 class="description-header">&nbsp;&nbsp;0 개</h5>
					</div>
				</div>

				<div class="col-sm-3 col-6">
					<div class="description-block border-right">
						<a class="btn btn-app bg-success"> <i class="fas fa-heart"></i>
							기안
						</a>
						<h5 class="description-header">&nbsp;&nbsp;1 개</h5>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>기안일</th>
									<th>결재양식</th>
									<th>제목</th>
									<th>첨부파일</th>
									<th>긴급</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2022-07-15</td>
									<td>휴가신청서</td>
									<td>휴가휴가</td>
									<td></td>
									<td>긴급</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>



