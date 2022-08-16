<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="teamList" value="${dataMap.teamList }" />

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
	right: 90px;
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
					<h3 class="title" style="padding-left: 10px;">부서 인사정보</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 25px;">
					<span  class="text-muted">근태 > 부서 인사정보 > ${loginUser.dname }</span>
				</div>
			</div>
		</div>
	</section>


	<section>

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">

						<div class="card card-navy card-outline">
							<div class="card-header with-border">
								<button type="button" class="btn btn-sm btn-default" onclick="listAll_go(1)">
									<span class="visually-hidden"></span>전체(${allCount }명)
								</button>
								<button type="button" class="btn btn-sm btn-default" onclick="teamHrGreenList_go(this)" data-condition="업무중">
									<span class="badge rounded-circle bg-success mt-1 mr-2" style="width:10px; height: 10px;"><span class="visually-hidden"></span></span>업무중(${countMap.workingCount }명)
								</button>
								<button type="button" class="btn btn-sm btn-default" onclick="teamHrYellowList_go(this)" data-condition="자리비움">
									<span class="badge rounded-circle bg-warning mt-1 mr-2" style="width:10px; height: 10px;"><span class="visually-hidden"></span></span>자리비움(${countMap.outCount }명)
								</button>
								<button type="button" class="btn btn-sm btn-default" onclick="teamHrRedList_go(this)" data-condition="업무종료">
									<span class="badge rounded-circle bg-danger mt-1 mr-2" style="width:10px; height: 10px;"><span class="visually-hidden"></span></span>업무종료(${countMap.workoffCount }명)
								</button>

								<input type="hidden" id="condition" value="${condition }">

								<div id="" class="card-tools" style="width: 450px;">
									<div class="input-group input-group-sm row" style="margin-top: 0;">
										<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);">
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
									<tr style="font-size: 0.95em;">
										<th>사번</th>
										<th>이름</th>
										<th>직위</th>
										<th>직책</th>
										<th>내선번호</th>
										<th>입사일</th>
										<th>상태</th>
									</tr>

									<c:forEach items="${teamList }" var="teamList">
										<tr style='font-size: 0.95em;cursor: pointer;' onclick="hrDetail_go(${teamList.eno });">
											<td>${teamList.eno }</td>
											<td>
												<div class="position-relative">
													<img src="${teamList.photo }" alt="User" width="30" height="30" class="rounded-circle" loading="lazy">

													<c:if test="${teamList.condition eq '업무중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamList.condition eq '업무종료'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamList.condition eq '휴직'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamList.condition eq '외근 후 퇴근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamList.condition eq '외근'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamList.condition eq '출장'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamList.condition eq '회의중'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>
													<c:if test="${teamList.condition eq '자리비움'}">
														<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;right: 90!important;"><span class="visually-hidden"></span></span>
													</c:if>

													<span class="ml-2">${teamList.name }</span>
							                    </div>
											</td>
											<td>${teamList.ppsname }</td>
											<td>${teamList.job }</td>
											<td>${teamList.call }</td>
											<td>
												<fmt:formatDate value="${teamList.hiredate }" pattern="yyyy-MM-dd"/>
											</td>
											<c:if test="${teamList.enabled eq 0 }">
												<td>퇴사</td>
											</c:if>
											<c:if test="${teamList.enabled eq 1 }">
												<td>재직</td>
											</c:if>
											<c:if test="${teamList.enabled eq 2 }">
												<td>휴직</td>
											</c:if>
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

</div>

<script>
function teamHrGreenList_go(condition){
	$('#condition').val($(condition).attr("data-condition"));
	list_go(1);
}
function teamHrYellowList_go(condition){
	$('#condition').val($(condition).attr("data-condition"));
	list_go(1);
}
function teamHrRedList_go(condition){
	$('#condition').val($(condition).attr("data-condition"));
	list_go(1);
}

//pagination
function list_go(page,url){
	//alert(page);
	if(!url) url="teamHrList.do";

	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

	jobForm.find("[name='condition']").val($('#condition').val());

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}
function listAll_go(page,url){
	//alert(page);
	if(!url) url="teamHrList.do";

	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}

function hrDetail_go(eno){
	OpenWindow('teamHrDetail.do?eno='+eno, '인사정보', '800', '600');
}

</script>

</body>