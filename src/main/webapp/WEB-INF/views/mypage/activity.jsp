<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #fff;
	background-color: #17a2b8;
}

a {
	color: #17a2b8;
	text-decoration: none;
	background-color: transparent;
}

.small-box {
	margin-bottom: 0px;
	width: 220;
}

.nav-pills .nav-link:not (.active ):hover {
	color: #fff;
}

.mentoring .table-avatar img, .mentoring img.table-avatar {
	border-radius: 50%;
	display: inline;
	width: 2.5rem;
}

.info-box {
	min-height: 106px;
}
</style>
</head>

<div class="wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h3>마이페이지 > 나의 활동</h3>
				</div>
			</div>
		</div>
	</section>

	<section class="content container-fluid">
		<div class="row">
			<div class="col-md-3 col-sm-6 col-12">
				<div class="info-box">
					<span class="info-box-icon bg-success" style="width: 80px;"><i
						class="far fa-star"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">진행중인 멘토링</span> <span
							class="info-box-number">1,410</span>
					</div>
				</div>

				<div class="info-box">
					<span class="info-box-icon bg-warning" style="width: 80px;"><i
						class="far fa-bookmark"></i></i></span>
					<div class="info-box-content">
						<span class="info-box-text">종료된 멘토링</span> <span
							class="info-box-number">410</span>
					</div>
				</div>
			</div>

			<div class="col-md-9">
				<div class="card card-info card-outline">

					<div class="card-header with-border">
						<span style="float: left;">나의 멘토 목록</span>
					</div>

					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap mentoring">
							<thead>
								<tr>
									<th>이름</th>
									<th>부서</th>
									<th>직위</th>
									<th>직책</th>
									<th>기간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><img class="table-avatar emp_profile"
										src="/warehouse/resources/bootstrap/dist/img/avatar.png"
										data-name="최민규 팀장">&nbsp;&nbsp;최민규</td>
									<td>영업팀</td>
									<td>팀장</td>
									<td>부장</td>
									<td>2022-07-12~2022-07-28</td>
								</tr>
								<tr>
									<td><img class="table-avatar emp_profile"
										src="/warehouse/resources/bootstrap/dist/img/avatar.png"
										data-name="최민규 팀장">&nbsp;&nbsp;최민규</td>
									<td>영업팀</td>
									<td>팀장</td>
									<td>부장</td>
									<td>2022-07-12~2022-07-28</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card card-success">
					<div class="card-header">가입한 커뮤니티</div>
					<div class="card-body " style="overflow: auto; height: 180px;">
						<table class="table table-hover text-nowrap"
							style="text-align: center;">
							<tbody>
								<tr>
									<td>독서회</td>
									<td>이순신</td>
									<td><i class="fas fa-users"></i> 3</td>
									<td>2022-06-28</td>
								</tr>
								<tr>
									<td>롤 하자</td>
									<td>프로젝트</td>
									<td><i class="fas fa-users"></i> 4</td>
									<td>2022-03-01</td>
								</tr>
								<tr>
									<td>프로젝트</td>
									<td>이순신</td>
									<td><i class="fas fa-users"></i> 3</td>
									<td>2022-02-15</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card card-warning">
					<div class="card-header">내가 쓴 커뮤니티 게시글</div>
					<div class="card-body " style="overflow: auto; height: 180px;">
						<table class="table table-hover text-nowrap"
							style="text-align: center;">
							<tbody>
								<tr>
									<td>영화감상회</td>
									<td>안녕하세요~</td>
									<td>이순신</td>
									<td>2022-07-27</td>
								</tr>
								<tr>
									<td>신입사원 커뮤</td>
									<td>환영합니다~</td>
									<td>이순신</td>
									<td>2022-07-11</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-12">
				<div class="card card-info card-outline">
					<div class="card-header">내가 쓴 게시글</div>

					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>첨부파일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>12</td>
									<td>자유게시판</td>
									<td>자유자유</td>
									<td>서난희 사원</td>
									<td>2022-07-15</td>
									<td></td>
									<td>0</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</section>
</div>



