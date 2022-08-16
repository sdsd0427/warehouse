<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mentoring.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.rank tr:nth-child(1) > td:nth-child(1) {
	color: #ffc107;
}
.rank tr:nth-child(2) > td:nth-child(1) {
	color: #A3A3A3;
}
.rank tr:nth-child(3) > td:nth-child(1) {
	color: #CD7F32;
}
.btn{
	padding: 0rem 0.75rem;
}
.table td,.card-footer{
	padding: 4px 0.75rem;
}
.card-header, .table th{
	padding: 8px 0.75rem;
}

</style>
</head>

<body>

<div class="wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3>멘토링</h3>
				</div>
			</div>
		</div>
	</section>

	<!-- Main content -->
	<section>
			<div class="row">
				<div class="col-md-4">
					<div class="card bg-light d-flex flex-fill">
						<div class="card-body pt-0 pb-4" style="margin-top: 20px;">
							<div class="row">
								<div class="col-7" style="padding-left:20px;">
									<h2 class="lead" style="padding-top: 10px;">
										<b>${employee.name }</b>&nbsp;&nbsp;${employee.ppsname }
									</h2>
									<p class="text-muted text-sm">
										<b>${employee.dname }</b>
									</p><br>
								</div>
								<div class="col-5 text-center">
									<img width="75px;" height="75px;" data-cfsrc="../../dist/img/user1-128x128.jpg"
										alt="user" class="img-circle"
										src="${loginUser.photo }">
									<p class="text-muted text-sm">
										<b>MBTI</b>&nbsp;&nbsp;${employee.mbti }
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-7" style="padding-left:20px;">
									<p class="text-muted text-sm">
										<b>대표 업무이력</b>
									</p>
								</div>
								<div class="col-5 text-center">
								</div>
							</div>
							<ul class="text-muted ml-3" style="list-style: disc; padding-left: 10px;margin-bottom: 0.7rem;">
								<c:forEach items="${myWorkList }" var="myWork">
									<li class="small" style="padding-top: 5px;">
										<span class="">${myWork.wtitle }</span>
									</li>
								</c:forEach>
							</ul>

						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="card card-navy card-tabs">
						<div class="card-header p-0 pt-1">
							<div class="row">
								<div class="col-11">
									<ul class="nav nav-tabs border-bottom-0" id="custom-tabs-three-tab" role="tablist">
										<li class="nav-item">
											<a class="nav-link active" id="custom-tabs-three-home-tab" href="#custom-tabs-three-home" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="javascript:sysdateAllWorkGo(1);">전체</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="custom-tabs-three-home-tab" href="#custom-tabs-three-home" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="javascript:sysdateMentoWorkGo(1);">멘토</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="custom-tabs-three-home-tab" href="#custom-tabs-three-home" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="javascript:sysdateMenteeWorkGo(1);">멘티</a>
										</li>
									</ul>

								</div>
							</div>
						</div>
						<div class="card-body pt-0  pb-0" style="display : block; padding: 0;">
							<table class="table table-hover text-nowrap projects">
								<tbody id="custom-tabs-three-home" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">

								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<ul class="sysdateMentoWorkPage pagination pagination-sm justify-content-center m-0">
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="card card-navy">
						<div class="card-header">
							<div class="row">
								<div class="col-10">
									<span class="">나의 멘토(${mentoCount }명)</span>
								</div>
								<div class="col-2">
									<button type="button" class="btn" style="color:white;" onclick="goIframPage('<%=request.getContextPath() %>/mentoring/mento.do','${menu.mcode}')">
										<i class="fas fa-plus fa-xs"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap projects" style="border: none;">
								<tbody>
									<c:if test="${empty mentoList }" >
										<tr style="text-align: center;height: 45px;">
											<td colspan="6">
												<strong>해당 내용이 없습니다.</strong>
											</td>
										</tr>
									</c:if>
									<c:forEach items="${mentoList }" var="mento">
										<tr style='font-size: 0.9em;height:45px;' onclick="">
											<td>
												<div class="position-relative">
													<img src="${mento.photo }" alt="User" width="30" height="30" class="rounded-circle" loading="lazy">

													<c:if test="${mento.condition eq '업무중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${mento.condition eq '업무종료'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${mento.condition eq '휴직'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${mento.condition eq '외근 후 퇴근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${mento.condition eq '외근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${mento.condition eq '출장'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${mento.condition eq '회의중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${mento.condition eq '자리비움'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>

													<span class="ml-2"><b>${mento.name } ${mento.ppsName }</b></span>
												</div>
											</td>
											<td>
												금주 활동 ${mento.workCnt }건
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card card-lightblue">
						<div class="card-header">
							<div class="row">
								<div class="col-10">
									<span class="">나의 멘티(${menteeCount }명)</span>
								</div>
								<div class="col-2">
<!-- 									<button type="button" class="btn btn-info btn-sm">수정</button> -->
									<button type="button" class="btn" style="color:white;" onclick="goIframPage('<%=request.getContextPath() %>/mentoring/mentee.do','${menu.mcode}')">
										<i class="fas fa-plus fa-xs"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap projects" style="border: none;">
								<tbody>
									<c:if test="${empty menteeList }" >
										<tr style="text-align: center;height: 45px;">
											<td colspan="6">
												<strong>해당 내용이 없습니다.</strong>
											</td>
										</tr>
									</c:if>
									<c:forEach items="${menteeList }" var="menteeList">
										<tr style='font-size: 0.9em;height:45px;' onclick="">
											<td>
												<div class="position-relative">
													<img src="${menteeList.photo }" alt="User" width="30" height="30" class="rounded-circle" loading="lazy">

													<c:if test="${menteeList.condition eq '업무중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${menteeList.condition eq '업무종료'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${menteeList.condition eq '휴직'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${menteeList.condition eq '외근 후 퇴근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${menteeList.condition eq '외근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${menteeList.condition eq '출장'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${menteeList.condition eq '회의중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${menteeList.condition eq '자리비움'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 111px;"><span class="visually-hidden"></span></span>
													</c:if>

													<span class="ml-2"><b>${menteeList.name } ${menteeList.ppsName }</b></span>
												</div>
											</td>
											<td>
												금주 활동 ${menteeList.workCnt }건
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card card-gray">
						<div class="card-header" style="height:45px;">
							<div class="row">
								<div class="col-10">
									<span class="">사내 인기 멘토</span>
								</div>
							</div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap projects rank" style="border: none;">
								<tbody>
									<c:forEach items="${rankList }" var="rankList">
										<tr style='font-size: 0.9em;height:45px;' onclick="">
											<td>
												<i class="fas fa-crown"></i>
											</td>
											<td>
												<div class="position-relative">
													<img src="${rankList.photo }" alt="User" width="30" height="30" class="rounded-circle" loading="lazy">

													<c:if test="${rankList.condition eq '업무중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="right: 100px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${rankList.condition eq '업무종료'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 100px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${rankList.condition eq '휴직'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 100px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${rankList.condition eq '외근 후 퇴근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 100px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${rankList.condition eq '외근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 100px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${rankList.condition eq '출장'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 100px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${rankList.condition eq '회의중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 100px;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${rankList.condition eq '자리비움'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 100px;"><span class="visually-hidden"></span></span>
													</c:if>

													<span class="ml-2"><b>${rankList.name } ${rankList.ppsName }</b></span>
							                    </div>
											</td>
											<td>
												&nbsp;&nbsp;멘티 ${rankList.count }명
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="card card-navy card-outline">
						<div class="card-header border-bottom-0">
							<div class="row">
								<div class="col-11">
									<span class="">멘토링 신청내역</span>
								</div>
								<div class="col-1">
<!-- 									<button type="button" class="btn btn-info btn-sm">수정</button> -->
									<button type="button" class="btn" style="visibility: hidden;">
										<i class="fas fa-plus fa-xs"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="card-body p-0">
							<table class="table table-hover text-nowrap projects">
								<tbody class="subMentoringList"></tbody>
							</table>
						</div>
						<div class="card-footer">
							<ul class="subMentoringPage pagination pagination-sm justify-content-center m-0">
							</ul>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="card card-navy card-outline">
						<div class="card-header">
							<div class="row">
								<div class="col-10">
									<span class="">만료직전 멘토링</span>
								</div>
								<div class="col-2">
<!-- 									<button type="button" class="btn btn-info btn-sm">수정</button> -->
									<button type="button" class="btn" style="visibility: hidden;" >
										<i class="fas fa-plus fa-xs"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="card-body p-0">
							<table class="table table-hover text-nowrap projects">
								<tbody class="endMentoringList">
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<ul class="endMentoringPage pagination pagination-sm justify-content-center m-0">
							</ul>
						</div>
					</div>
				</div>
			</div>
   	</section>

   	<div class="modal fade" id="modal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">

	          <h4 class="modal-title" style="font-size: large;" value="">연장기간 선택</h4>
	           <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	        	<div class="row">
	            <label style="padding-left: 10px;">
					<input type="radio" id="radioName" name="radioName" value="0" >&nbsp;&nbsp;6개월<br>
					<input type="radio" id="radioName" name="radioName" value="1" >&nbsp;&nbsp;12개월
	            </label>
	           </div>
	        </div>
	        <div class="modal-footer">
	     	  <button id="groupsave"type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick='exdateApply_Go()'>신청</button>
	          <button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>

</div>

<form>

</form>

<script type="text/javascript">
$(document).on('click', 'body > aside > div > ul > li:nth-child(2) > a', function(){
	$(this).attr("href", "#");
	OpenWindow('registForm.do','멘토링 신청',800,600);
})

$(function(){
	subMentoringListGo(1);
// 	endDateMentoringGo();
	endMentoringListGo(1);
	sysdateAllWorkGo(1);
	getThisWeekWorkCount();
});



<c:if test="${from eq 'regist'}" >
	Swal.fire({
	    icon: 'success',
	    title: '멘토링이 신청되었습니다.',
	    confirmButtonColor: '#3085d6',
	  }).then(function(){
	 	window.close();
		opener.parent.location.reload();
	  });
</c:if>

<c:if test="${from eq 'accept' }">
	Swal.fire({
	    icon: 'success',
	    title: '멘토링을 수락하였습니다.',
	    confirmButtonColor: '#3085d6',
	  }).then(function(){
			var target = ${menteeSignal};
		// 	console.log("target",target);
			opener.parent.sendSignal(target, "멘토링신청", "E102", "mentoring/mento.do", 'M193000');
			window.close();
			window.opener.location.reload();
	  });
</c:if>

<c:if test="${from eq 'refuse'}" >
	Swal.fire({
	    icon: 'success',
	    title: '멘토링이 거절되었습니다.',
	    confirmButtonColor: '#3085d6',
	  }).then(function(){
		var target = ${menteeSignal};
	// 	console.log("target",target);
		opener.parent.sendSignal(target, "멘토링신청", "E103", "mentoring/mento.do", 'M193000');
		window.close();
		window.opener.location.reload();
	  });
</c:if>
</script>

<%@ include file="./mentoring_js.jsp" %>

</body>
