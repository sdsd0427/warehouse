<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>




.post .user-block {
	margin-bottom: 0px;
}

.post {
	border-bottom: 0px solid #adb5bd;
}

.profile-user-img{
	height: 100%;
	width: 60%;
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
				<h3>멘토링 신청서</h3>
			</div>
			<div class="col-sm-8">
						<button class="btn btn-outline-dark float-right" style="margin-left: 20px;" type="button" onclick="window.close();">취소</button>
						<button class="btn btn-outline-danger float-right" style="margin-left: 20px;" type="button" onclick="refuse_go();">거절</button>
						<button class="btn btn-outline-primary float-right" style="margin-left: 20px;" type="button" onclick="accept_go();">수락</button>
					</div>
		</div>
	</div>
</section>

<section class="content container-fluid">
	<div class="row">

		<div class="col-md-12">
			<div class="card card-navy">
				<div class="card-header">
					<h3 class="card-title">멘티 상세</h3>
				</div>


					<div class="card-body">

						<div class="card-body box-profile">
							<div class="row">
								<div class="col-5 text-center cat">
									<img src="${mentee.photo }"
										alt="user-avatar"
										class="profile-user-img img-fluid img-circle">
<!-- 										<h5 style="padding-top: 20px;">서난희 사원</h5> -->
								</div>
								<div class="col-7">
								<h2 class="lead">
									<b>${mentee.name } ${mentee.ppsName }</b>
								</h2>
									<p class="text-muted text">
										<b>부서 : </b>&nbsp;&nbsp; ${mentee.dname }
									</p>
									<p class="text-muted text">
										<b>직책 : </b>&nbsp;&nbsp; ${mentee.job }
									</p>
									<p class="text-muted text">
										<b>MBTI : </b>&nbsp;&nbsp;${mentee.mbti }
									</p>
									<p class="text-muted text">
										<b>기간 : </b>&nbsp;&nbsp; ${mentee.period eq 0 ? '6개월':'12개월'}
									</p>
								</div>
							</div>

							<hr>
							<div class="row">
								<div class="col-4">
									<p class="text-center" style="padding-left: 40px;">
										<b>소개글</b>
									</p>
								</div>
								<div class="col-7" style="padding-left: 50px;">${mentee.intro }</div>
							</div>
						</div>

					</div>


			</div>
		</div>
	</div>
</section>

<form role="form">
	<input type="hidden" name="smno" id="smno" value="${mentee.smno}">
	<input type="hidden" name="menteeEno" id="menteeEno" value="${mentee.mentee}">
</form>

<script>
function accept_go(){
	//alert("fffff");
	var form = $("form[role='form']");
	console.log(form);
	form.attr("action", "accept.do");
	form.attr("method", "post");
	form.submit();
}
function refuse_go(){
	var form = $("form[role='form']");
	
	Swal.fire({
	    title: '거절',
	    text: "정말 거절하시겠습니까?",
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
	        '거절하였습니다.'
	      ).then(function(){
	    	  form.attr("action", "refuse.do");
	  		form.attr("method", "post");
	  		form.submit();
	      })
	    }
	 })
	
	
}


</script>

</body>
