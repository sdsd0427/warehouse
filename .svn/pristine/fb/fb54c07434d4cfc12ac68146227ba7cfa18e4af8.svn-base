<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
.card {
    box-shadow: 0 0 0px rgb(0 0 0), 0 0px 0px rgb(0 0 0);
}
</style>

</head>

<body>

	<div class="hold-transition login-page">
		<img alt="" src="../resources/images/책상.jpg" style="width:80%;height:90%;position:relative;">
	   <div class="login-box card" style="position:absolute;">
		<div class="card card-body login-card-body" style=" background:rgb(60, 141, 188, 0.5);box-shadow:0">
		  	<img alt="" src="../resources/images/name.png" style="width:250px;height:40px;margin-left:30px;">
		  	<img alt="" src="../resources/images/logo.png" style="width:250px;height:170px;margin-top:20px;margin-bottom:20px;margin-left:30px;">

			<form action="login.do"	method="post" name="login" id="login">
				<input type="hidden" name="retUrl" value="${retUrl }" />
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="eno" id="eno" placeholder="사번" value="">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="pwd" placeholder="비밀번호"  value="">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="social-auth-links text-center mb-3">
					<button type="submit" class="btn btn-block btn-dark" onclick="locateion.href='index.do'">로그인</button>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="checkbox icheck">
							<label style="color:black;"><input type="checkbox" name="remember" id="remember" value="enoCheck"> 사번저장</label>
						</div>
					</div>
					<div class="col-sm-8">
						<a href="#" style="color:black;float:right;" data-toggle="modal" data-target="#modal-pdefault">비밀번호 찾기</a><br>
					</div>
				</div>
			</form>
	  </div>

	</div>
  </div>


<div class="modal fade show" id="modal-pdefault" style="display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">비밀번호 찾기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group row">
					<div class="input-group input-group-md">
						<input type="text" class="form-control" placeholder="사번입력">
					</div>
				</div>
				<div class="form-group row">
					<div class="input-group input-group-md">
						<input type="text" class="form-control" placeholder="휴대폰번호입력">
						<span class="input-group-append">
						<button type="button" class="btn btn-info btn-sm btn-append">인증</button>
						</span>
					</div>
				</div>
				<p></p>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-info">확인</button>
			</div>
		</div>
	</div>
</div>

</body>
