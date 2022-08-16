<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/ehr.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		.list-group-item{
			padding: 6px 0.75rem;
		}
		.table th,.table td{
			padding: 4px 0.75rem;
		}

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
/* 		.page-link { */
/* 		    line-height: 1; */
/* 		    color: #0c4b8d; */
/* 		    background-color: #fff; */
/* 		    border: 1px solid #0c4b8d; */
/* 		} */
/* 		.page-item.active .page-link { */
/* 		    z-index: 3; */
/* 		    color: #fff; */
/* 		    background-color: #0c4b8d; */
/* 		    border-color: #0c4b8d; */
/* 		} */
/**/
	</style>
</head>

<body>
<c:set var="today" value="<%=new java.util.Date() %>"/>
<div class="wrapper">
<!-- 	<div class="preloader flex-column justify-content-center align-items-center" style="max-width:1130px; height: 100vh; margin-left:220px;"> -->
<%-- 		<img class="animation__shake" src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/AdminLTELogo.png" width="60" height="60"> --%>
<!-- 	</div> -->
<!-- 	<h3 class="title">내 근태관리</h3> -->
<!-- 	<div style="display: inline; margin-left: 10px; margin-top: 25px;"> 	 -->
<%-- 		<span  class="text-muted"  style="">근태 > 부서 근태관리 > ${loginUser.dname }</span> --%>
<!-- 	</div> -->
	<section class="content-header p-0">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3 class="title" style="padding-left: 10px;">내 근태관리</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 25px;">
					<span  class="text-muted"  style="">근태 > 내 근태관리</span>
				</div>
			</div>
		</div>
	</section>

 	<!-- Main content -->
	<section class="top">
<!-- 		<div class="card"> -->
			<div class="row">
   				<div class="card-body" style="text-align:left; padding: 7px;">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6">
								<p style="margin-bottom: 4px;"><b>${hrType.hrType }</b>&nbsp;&nbsp;${hrType.onTime } - ${hrType.offTime }</p>
							</div>
							<div class="col-sm-6 text-right">
								<p style="margin-bottom: 4px; font-size: 0.8em; cursor: pointer;" onclick="excel();"><i class="fas fa-cloud-download-alt"></i>&nbsp;목록 다운로드&nbsp;</p>
							</div>
						</div>
						<div class="info-box card-navy card-outline" style="padding: 0px; margin-bottom: 0px;">
							<span class="info-box-icon" style="width: 60; height: 60;">
								<img width="60px;" height="60px;" class="ml-2 rounded-circle" alt="img" src="${employee.photo }">
							</span>
							<div class="info-box-content">
								<div class="row text-center">
									<div class="col-md-2">
										<span class="info-box-text text-left"><b>${employee.name }&nbsp;${employee.ppsname }</b></span>
										<span class="info-box-text text-left" style="font-size: 0.8em;">${employee.dname }</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">이번 달 누적근무</span>
										<span class="info-box-number mHrTime">시간</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">이번 달 기본근무</span>
										<span class="info-box-number mStdTime">시간</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">이번 달 연장근무</span>
										<span class="info-box-number mOverTime">시간</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">이번 달 지각</span>
										<span class="info-box-number mTardy">건</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">이번 달 수정</span>
										<span class="info-box-number mModify">건</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
    		</div>
<!-- 	     </div> -->
   	</section>

	<section class="month" style="margin-bottom: 25px;">
		<div class="row text-center" style="display: flex;">
			<div class="col-md-12" style="font-size: 1.5em;padding-top:10px;">
				<a class="btn btn-default btn-sm" href="javascript:changeMonth(-1);"> <i class="fas fa-angle-left"></i></a>
				<span id="month">&nbsp;&nbsp;<fmt:formatDate value="${standardDate }" pattern="yyyy-MM"/>&nbsp;&nbsp;</span>
				<a class="btn btn-default btn-sm" href="javascript:changeMonth(1);"> <i class="fas fa-angle-right"></i></a>
				<a class="" style="font-size: 0.6em;" href="javascript:location.reload()">Today</a>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">

					<div class="card card-navy card-outline">
						<div class="card-body box-profile">
							<p class="text-muted text-left" id="today" style="margin-bottom: 1px;"><fmt:formatDate value="${today }" pattern="yyyy-MM-dd(E)"/></p>
							<p class="text-left js-time" style="font-size: 2.5em;"><b style="padding: 0px;">12:20:42</b></p>
<!-- 							<div class="progress"> -->
<!-- 								<div class="progress-bar" style="width: 60%"></div> -->
<!-- 							</div> -->
							<ul class="list-group list-group-unbordered mb-3 list">
								<li class="list-group-item onTime-target"><b>출근시간</b>
									<a class="float-right onTimeRemove">미등록</a>
								</li>
								<li class="list-group-item offTime-target"><b>퇴근시간</b>
									<a class="float-right offTimeRemove">미등록</a>
								</li>
<!-- 								<li class="list-group-item"><b>주간 누적근무시간</b> -->
<%-- 									<a class="float-right">${calcHr.hrTime }</a> --%>
<!-- 								</li> -->
							</ul>
							<div class="row">
								<div class="col-12 goToWork" style="display: block;">
									<button type="button" class="btn btn-outline-dark btn-block" onclick="goToWork()">출근</button>
								</div>
								<div class="col-12 leaveWork" style="display: none;">
									<button type="button" class="btn btn-outline-dark btn-block" onclick="leaveWork()">퇴근</button>
								</div>
							</div>
							<div class="row" style="margin-top: 6px;">
								<div class="col-12">
<!-- 									<button type="button" class="btn btn-block btn-outline-dark dropdown-toggle" data-toggle="dropdown" aria-expanded="false">근무상태</button> -->
<!-- 									<div class="dropdown-menu" style=""> -->
<!-- 										<a class="dropdown-item" href="#">업무중</a> -->
<!-- 										<a class="dropdown-item" href="#">업무종료</a> -->
<!-- 										<div class="dropdown-divider"></div> -->
<!-- 										<a class="dropdown-item" href="#">외근</a> -->
<!-- 										<a class="dropdown-item" href="#">출장</a> -->
<!-- 										<a class="dropdown-item" href="#">휴가</a> -->
<!-- 										<a class="dropdown-item" href="#">회의중</a> -->
<!-- 										<a class="dropdown-item" href="#">자리비움</a> -->
<!-- 										<a class="dropdown-item" href="#">외근 후 퇴근</a> -->
<!-- 									</div> -->
									<select onchange="changeCondition()" class="form-control btn btn-outline-dark btn-block" name="condition" id="condition" style="text-align: center; ">
								  		<option value="업무중" style="background: none;" ${employee.condition eq '업무' ? 'selected':'' }>업무중</option>
								  		<option value="업무종료" style="background: none;" ${employee.condition eq '업무종료' ? 'selected':'' }>업무종료</option>
								  		<option value="외근" style="background: none;" ${employee.condition eq '외근' ? 'selected':'' }>외근</option>
								  		<option value="출장" style="background: none;" ${employee.condition eq '출장' ? 'selected':'' }>출장</option>
								  		<option value="휴가" style="background: none;" ${employee.condition eq '휴가' ? 'selected':'' }>휴가</option>
								  		<option value="회의중" style="background: none;" ${employee.condition eq '회의중' ? 'selected':'' }>회의중</option>
								  		<option value="자리비움" style="background: none;" ${employee.condition eq '자리비움' ? 'selected':'' }>자리비움</option>
								  		<option value="외근 후 퇴근" style="background: none;" ${employee.condition eq '외근 후 퇴근' ? 'selected':'' }>외근 후 퇴근</option>
								  	</select>
								</div>
							</div>
						</div>

					</div>

					<div class="card card-navy card-outline">
						<div class="card-body box-profile">
							<p class="text-left mb-2" style="font-size: 1em;"><b style="padding: 0px;">내 근무유형 : ${hrType.hrType }</b></p>
							<ul class="list-group list-group-unbordered mb-3 list">
								<li class="list-group-item"><b>출근시간</b>
									<a class="float-right">${hrType.onTime }</a>
								</li>
								<li class="list-group-item"><b>퇴근시간</b>
									<a class="float-right">${hrType.offTime }</a>
								</li>
								<li class="list-group-item"><b>주간 근무시간</b>
									<a class="float-right">${hrType.weekTime }시간</a>
								</li>
							</ul>
							<a href="#" class="btn btn-outline-dark btn-block"  onclick="OpenWindow('hrTypeModifyForm.do','근무계획표',600,550);"><b>근무유형 변경</b></a>
						</div>

					</div>

				</div>

				<div class="col-md-9">
					<div class="row weekCalc" style="display:flex; justify-content: space-between; padding-left: 8px; padding-right: 8px; font-size: 0.9em;">
						<!-- 주차 섬네일 -->

					</div>

						<div class="card card-navy card-tabs">
							<div class="card-header p-0 pt-1 border-bottom-0" style="font-weight: bold;">
								<ul class="nav nav-tabs" id="custom-tabs-five-tab" role="tablist">
									<li class="nav-item clickLi" onclick="weekTable(null,this);">
										<input type="hidden" class="weekStart" value="">
										<a class="nav-link" id="custom-one-home-tab"
											data-toggle="pill" href="#custom-tabs-one"
											role="tab" aria-controls="custom-tabs-one"
											aria-selected="true">1주차</a>
									</li>
									<li class="nav-item clickLi" onclick="weekTable(null,this);">
										<input type="hidden" class="weekStart" value="">
										<a class="nav-link" id="custom-tabs-two-tab"
											data-toggle="pill" href="#custom-tabs-two"
											role="tab" aria-controls="custom-tabs-two"
											aria-selected="false">2주차</a>
									</li>
									<li class="nav-item clickLi" onclick="weekTable(null,this);">
										<input type="hidden" class="weekStart" value="">
										<a class="nav-link" id="custom-tabs-three-tab"
											data-toggle="pill" href="#custom-tabs-three"
											role="tab" aria-controls="custom-tabs-three"
											aria-selected="false">3주차</a>
									</li>
									<li class="nav-item clickLi" onclick="weekTable(null,this);">
										<input type="hidden" class="weekStart" value="">
										<a class="nav-link" id="custom-tabs-four-tab"
											data-toggle="pill" href="#custom-tabs-four"
											role="tab" aria-controls="custom-tabs-four"
											aria-selected="false">4주차</a>
									</li>
									<li class="nav-item clickLi" onclick="weekTable(null,this);">
										<input type="hidden" class="weekStart" value="">
										<a class="nav-link" id="custom-tabs-five-tab"
											data-toggle="pill" href="#custom-tabs-five"
											role="tab" aria-controls="custom-tabs-five"
											aria-selected="false">5주차</a>
									</li>
								</ul>
							</div>
							<div class="card-body">
								<div class="tab-content" id="custom-tabs-five-tabContent">
									<div class="tab-pane fade"
										id="custom-tabs-one"
										role="tabpanel"
										aria-labelledby="custom-tabs-one-tab">
											<table class="table table-hover projects text-center table-target2" style="font-size: 0.9em;">
											</table>
									</div>
									<div class="tab-pane fade"
										id="custom-tabs-two"
										role="tabpanel"
										aria-labelledby="custom-tabs-two-tab">
											<table class="table table-hover projects text-center table-target2" style="font-size: 0.9em;">
											</table>
									</div>
									<div class="tab-pane fade"
										id="custom-tabs-three"
										role="tabpanel"
										aria-labelledby="custom-tabs-three-tab">
											<table class="table table-hover projects text-center table-target2" style="font-size: 0.9em;">
											</table>
									</div>
									<div class="tab-pane fade"
										id="custom-tabs-four"
										role="tabpanel"
										aria-labelledby="custom-tabs-four-tab">
											<table class="table table-hover projects text-center table-target2" style="font-size: 0.9em;">
											</table>
									</div>
									<div class="tab-pane active show"
										id="custom-tabs-five"
										role="tabpanel"
										aria-labelledby="custom-tabs-five-tab">
											<table class="table table-hover projects text-center table-target2" style="font-size: 0.9em;">
											</table>
									</div>
								</div>
							</div>
						</div>

<!-- 						<div class="card card-navy card-outline"> -->
<!-- 							<div class="card-header"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-2 week-target" style="padding-top: 5px;"> -->
<!-- 										<span class="whatWeek" style="font-weight: bold;">1주차</span> -->
<!-- 									</div> -->
<!-- 									<div class="col-2" style="padding-top: 5px;"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-body p-0 tableCard"> -->
<!-- 								<table class="table table-hover projects text-center" style="font-size: 0.9em;"> -->
<!-- 									<thead> -->
<!-- 										<tr> -->
<!-- 											<th style="width: 12%">일자</th> -->
<!-- 											<th style="width: 15%">업무시작</th> -->
<!-- 											<th style="width: 15%">업무종료</th> -->
<!-- 											<th style="width: 15%">총 근무시간</th> -->
<!-- 											<th style="width: 23%">근무시간 상세</th> -->
<!-- 											<th style="width: 20%">승인요청내역</th> -->
<!-- 										</tr> -->
<!-- 									</thead> -->
<!-- 									<tbody class="table-target"> -->

<!-- 									</tbody> -->
<!-- 								</table> -->
<!-- 							</div> -->
<!-- 						</div> -->


		            <button type="button" class="btn btn-sm">
						<span class="badge rounded-circle bg-black mt-1 mr-2" style="width:10px; height: 10px;"><span class="visually-hidden"></span></span>정상
					</button>
					<button type="button" class="btn btn-sm">
						<span class="badge rounded-circle bg-danger mt-1 mr-2" style="width:10px; height: 10px;"><span class="visually-hidden"></span></span>지각
					</button>
					<button type="button" class="btn btn-sm">
						<span class="badge rounded-circle bg-primary mt-1 mr-2" style="width:10px; height: 10px;"><span class="visually-hidden"></span></span>수정
					</button>
				</div>

			</div>

		</div>
	</section>
</div>
<%@ include file="./hr_js.jsp" %>
<!-- weekCalc(); -->
</body>