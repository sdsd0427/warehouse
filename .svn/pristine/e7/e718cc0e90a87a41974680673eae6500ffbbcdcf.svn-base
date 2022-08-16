<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="teamVacList" value="${dataMap.teamVacList }" />
<c:set var="allCount" value="${dataMap.allCount }" />

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/ehr.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.table td,.card-footer{
	padding: 6px 0.75rem;
}
.card-header, .table th{
	padding: 8px 0.75rem;
}
.end-0{
	right: 55px;
}
/**/
</style>
</head>

<body>

<div class="wrapper">

	<section class="content-header p-0">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3 class="title" style="padding-left: 10px;">부서 연차관리</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 25px;">
					<span  class="text-muted">근태 > 부서 연자관리 > ${loginUser.dname }</span>
				</div>
			</div>
		</div>
	</section>


<!-- 	<span style="margin-left: 7px;">전체인원 22명</span> -->
	<section class="week">
		<div class="row text-center" style="display: flex;">
			<div class="col-md-12" style="font-size: 1.5em;">
				<a class="btn btn-default btn-sm">&lt;</a>
				<span>&nbsp;&nbsp;2022년&nbsp;&nbsp;</span>
				<a class="btn btn-default btn-sm">&gt;</a>
				<a class="" style="font-size: 0.6em;">Today</a>
			</div>
		</div>
	</section>

	<span style="padding-left: 10px;">전체인원 ${allCount }명</span>
	<section class="content">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-md-12">

<!-- 						<span>전체인원 22명</span> -->
						<div class="card card-navy card-outline mt-2">
							<div class="card-header with-border">
								<button type="button" class="btn btn-sm btn-default allCheckBtn" style="display: inline;" onclick="allChecked()">
									<i class="fas fa-check">&nbsp;전체선택</i>
								</button>
								<button type="button" class="btn btn-sm btn-default allUnCheckBtn" style="display: none;" onclick="allChecked()">
									<i class="fas fa-check">&nbsp;선택해제</i>
								</button>
								<button type="button" class="btn btn-sm btn-default" onclick="messageAllModal_go();">
									<i class="fas fa-bell">&nbsp;사용촉진</i>
								</button>
								<div id="" class="card-tools" style="width: 450px;">
									<div class="input-group input-group-sm row" style="margin-top: 0;">
										<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
											<option value="10">정렬개수</option>
											<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개</option>
											<option value="30" ${cri.perPageNum == 30 ? 'selected':''}>30개</option>
											<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개</option>
										</select>
										<select class="form-control col-md-3" name="searchType" id="searchType">
											<option value="np" ${cri.searchType eq 'np' ? 'selected':'' }>전체</option>
											<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>이름</option>
											<option value="p" ${cri.searchType eq 'p' ? 'selected':'' }>직위</option>
										</select>
										<input class="form-control" type="text" name="keyword"
											placeholder="검색어를 입력하세요" value="${param.keyword }" />
										<span class="input-group-append">
											<button class="btn btn-dark" type="button"
												onclick="list_go(1);" data-card-widget="search">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>

							<div class="card-body">
								<table class="table table-hover text-center">
									<tr style="font-size: 0.91em;">
										<th style="width: 3%;"></th>
										<th>이름</th>
										<th>사번</th>
										<th>직위</th>
										<th>입사일</th>
										<th>퇴사일</th>
										<th>근속연수</th>
										<th>발생연차</th>
										<th>총연차</th>
										<th>사용연차</th>
										<th>잔여연차</th>
										<th>사용촉진</th>
									</tr>

									<c:forEach items="${teamVacList }" var="teamVac">
										<tr style='font-size: 0.95em;' onclick="">
											<td>
											<c:if test="${teamVac.eno != loginUser.eno }">
												<input class='form-check-input ml-0 messageCheck' type='checkbox' value='${teamVac.eno }'>
											</c:if>
											</td>
											<td>
												<div class="position-relative">
													<img src="${teamVac.photo }" alt="User" width="30" height="30" class="rounded-circle" loading="lazy">

													<c:if test="${teamVac.condition eq '업무중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamVac.condition eq '업무종료'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamVac.condition eq '휴직'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamVac.condition eq '외근 후 퇴근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamVac.condition eq '외근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamVac.condition eq '출장'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamVac.condition eq '회의중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamVac.condition eq '자리비움'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>

													<span class="ml-2">${teamVac.name }</span>
							                    </div>
											</td>
											<td>${teamVac.eno }</td>
											<td>${teamVac.ppsname }</td>
											<td><fmt:formatDate value='${teamVac.hiredate }' pattern='yyyy-MM-dd'/></td>
											<td>
											<c:if test="${teamVac.retiredate eq null}">-</c:if>
											<fmt:formatDate value='${teamVac.retiredate }' pattern='yyyy-MM-dd'/>
											</td>
											<td>${teamVac.year }년차</td>
											<td>${teamVac.generVac }일</td>
											<td>${teamVac.totalVac }일</td>
											<td>${teamVac.useVac }일</td>
											<td>${teamVac.remainVac }일</td>
											<td>
											<c:if test="${teamVac.eno != loginUser.eno }">
												<i class="fas fa-bell" onclick="messageModal_go('${teamVac.eno }');"
												 data-toggle="modal" data-target="#modal-message" style="cursor:pointer;"></i>
											</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>

							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
							</div>

						</div>



					</div>
				</div>
			</div>
		</section>

		<div class="modal modal-default fade" id="modal-message" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4>사용 촉진</h4>
						<h4 class="modal-eno" style="display:none;"></h4>
					</div>
					<div class="modal-body">
						<div class="row ">
						<input class="form-control col-12" type="text" id="message" name='message' class="form-control" placeholder="메시지를 입력하세요">
					</div>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-outline-dark"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-outline-primary" id="replyModBtn" style="text-align: right" onclick="message_go();" data-dismiss="modal">전송</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal modal-default fade" id="modal-messageAll" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4>사용 촉진</h4>
						<h4 class="modal-eno" style="display:none;"></h4>
					</div>
					<div class="modal-body">
						<div class="row ">
						<input class="form-control col-12" type="text" id="messageAll" name='message' class="form-control" placeholder="메시지를 입력하세요">
					</div>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-outline-dark"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-outline-primary" id="replyModBtn" style="text-align: right" onclick="messageAll_go();" data-dismiss="modal">전송</button>
					</div>
				</div>
			</div>
		</div>

</div>

<script>
function list_go(page,url){
// 	alert(page);
	if(!url) url="teamVacationList.do";

	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());


	console.log(url);

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}

//전체 선택, 해제
function allChecked(){
	var allCheckBtn = $('.allCheckBtn');
	var allUnCheckBtn = $('.allUnCheckBtn');
	if(allCheckBtn.css("display")=="inline-block"){
		allCheckBtn.css("display", "none");
		allUnCheckBtn.css("display", "inline");

		$('input[type="checkbox"]').prop("checked", true);
		changeBtn();
		return;
	}

	if(allUnCheckBtn.css("display")=="inline-block"){
		allUnCheckBtn.css("display", "none");
		allCheckBtn.css("display", "inline");

		$('input[type="checkbox"]').prop("checked", false);
		changeBtn();
		return;
	}

}

function messageModal_go(eno){
	//alert(eno);
	$('div#modal-message div.modal-header h4.modal-eno').text(eno);
}

function message_go(){
	var eno=$('div#modal-message h4.modal-eno').text();
	var message=$('#modal-message input[name="message"]').val();
	//alert(eno);
 	if(message == ""){

 		Swal.fire({
	      icon: 'warning',
	      title: '메시지를 입력하세요.',
	      confirmButtonColor: '#3085d6',
	    });
		return;
	}

 	parent.sendSignal(eno, message, "F101", "ehr/vacation.do", 'M142000');
 	Swal.fire({
	      icon: 'success',
	      title: '메시지가 전송되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			$('#message').val("");
	     });
}

function messageAll_go(){

	var message=$('#modal-messageAll input[name="message"]').val();
	if(message == ""){
		Swal.fire({
		      icon: 'warning',
		      title: '메시지를 입력하세요.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				$("input[type='checkbox']").prop("checked", false).attr("checked", false).removeAttr("checked");
		     });
		return;
	}
	$('input.messageCheck:checked').each(function(){
		parent.sendSignal($(this).val(), message, "F101", "ehr/vacation.do", 'M142000');
	});

	Swal.fire({
	      icon: 'success',
	      title: '메시지가 전송되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			$('#messageAll').val("");
			$("input[type='checkbox']").prop("checked", false).attr("checked", false).removeAttr("checked");
	     });
}

function messageAllModal_go(){
	if($('input.messageCheck:checked').val() == undefined){
		Swal.fire({
		      icon: 'warning',
		      title: '체크박스를 선택하세요.',
		      confirmButtonColor: '#3085d6',
		    });
		return;
	}
	$('#modal-messageAll').modal('show')
}
</script>

</body>