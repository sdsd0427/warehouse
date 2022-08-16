<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.user-block img {
	float: left;
	height: 50px;
	width: 50px;
}

.username {
	padding-left: 20px;
	padding-top: 3px;
}

.post .user-block {
	margin-bottom: 0px;
}

.post {
	border-bottom: 0px solid #adb5bd;
}

.profile-user-img{
	height: 100%;
	width: 100%;
	object-fit: fill;
}
.cat {
	height: 120px;
}
</style>
</head>

<body>
<section class="content-header">
	<div class="container-fluid">
		<div class="row ">
			<div class="col-sm-4">
				<h3>멘토링 신청</h3>
			</div>
			<div class="col-sm-8">
						<button class="btn btn-outline-dark float-right" style="margin-left: 20px;" type="button" onclick="javascript:history.back();">취소</button>
						<button class="btn btn-outline-primary float-right" style="margin-left: 20px;" type="button" onclick="regist_go()">신청</button>
					</div>
		</div>
	</div>
</section>

<section class="content container-fluid">
	<div class="row">
		<div class="col-md-6">
			<div class="card card-navy">
				<div class="card-header">
					<h3 class="card-title">멘토 상세</h3>
				</div>

				<form class="form-horizontal">
					<div class="card-body" style="padding-bottom:0">
						<div class="card-body box-profile">
							<div class="row">
								<div class="col-5 text-center cat">
									<img src="${mento.photo }"
										alt="user-avatar"
										class="profile-user-img img-fluid img-circle">
								</div>
								<div class="col-7">
									<h2 class="lead">
										<b>${mento.name } ${mento.ppsname }</b>
									</h2>
									<p class="text-muted text">
										<b>부서 : </b>&nbsp;&nbsp; ${mento.dname }
									</p>
									<p class="text-muted text">
										<b>직책 : </b>&nbsp;&nbsp; ${mento.job }
									</p>
									<p class="text-muted text">
										<b>MBTI : </b>&nbsp;&nbsp;${mento.mbti }
									</p>
								</div>
							</div>
							<p class="text-muted text-center">
								<b>대표 업무이력</b>
							</p>
							<hr>
								<c:forEach items="${myWorkList }" var="myWork">
							<ul class="list-group list-group-unbordered mb-3" style="list-style: disc;margin-left: 20px;">
									<li style="font-weight: bold;">${myWork.wtitle } </li>
							</ul>
								</c:forEach>
						</div>
					</div>
				</form>

			</div>
		</div>

		<div class="col-md-6">
			<div class="card card-navy">
				<div class="card-header">
					<h3 class="card-title">멘토링 신청</h3>
				</div>


					<div class="card-body">
					<form role="form" method="post" action="regist.do" name="registForm">
					<input type="hidden" name="mentee" id="mentee" value="${loginUser.eno}">
					<input type="hidden" name="mento" id="mento" value="${mento.eno}">
						<div class="card-body box-profile">
							<div class="row" style="padding-bottom: 3px;">
								<div class="col-5 text-center cat">
									<img src="${loginUser.photo }"
										alt="user-avatar"
										class="profile-user-img img-fluid img-circle">
<!-- 										<h5 style="padding-top: 20px;">서난희 사원</h5> -->
								</div>
								<div class="col-7">
								<h2 class="lead">
									<b>${employee.name } ${employee.ppsname }</b>
								</h2>
									<p class="text-muted text">
										<b>부서 : </b>&nbsp;&nbsp; ${employee.dname }
									</p>
									<p class="text-muted text">
										<b>직책 : </b>&nbsp;&nbsp; ${employee.job }
									</p>
									<p class="text-muted text">
										<b>MBTI : </b>&nbsp;&nbsp;${employee.mbti }
									</p>
									<select  class="custom-select form-control-border border-width-2" id="period" name="period" style="width: 100px;height: 35px;'">
										<option value="0">6개월</option>
										<option value="1">12개월</option>
									</select>
								</div>

							</div>

							<hr>
							<div class="row">
							<div class="col-3">
								<p class="text-center">
									<b>소개글</b>
								</p>
							</div>
							<div class="col-8">
								<textarea rows="8" cols="27" name="intro" id="intro" placeholder="소개글을 작성하세요"></textarea>
							</div>
							</div>
						</div>
						</form>
					</div>


			</div>
		</div>
	</div>
</section>

<script>

function regist_go(){
	var form = document.registForm;
	if(form.intro.value==""){
		Swal.fire({
		    icon: 'warning',
		    title: '소개글은 필수입니다.',
		    confirmButtonColor: '#3085d6',
		  });
		return;
	}
	form.submit();
}



</script>

</body>
