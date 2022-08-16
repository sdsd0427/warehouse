<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="approveList" value="${dataMap.approveList }" />

<head>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/approve.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
body > div.wrapper > div:nth-child(5) > div > div.card-body > table > tbody > tr{
	padding: .4rem !important;
}
.left{
	text-align: left !important;
}
.field-content{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.inner, .nav-item, tbody tr{
	cursor: pointer;
}

</style>
</head>

<body>
	<div class="wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3>결재문서함</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted"  style="padding-right: 535px;">전자결재 > 결재문서함</span>
				</div>
			</div>
		</div>
	</section>

	<section>

		<div class="row" style="justify-content: space-between;  margin-bottom: -9px;">
			<div class="card col-12 card-outline card-navy" style="padding: 0">
				<div class="card-header bg-light" style="font-weight: bold; color: white">미확인 결재 현황</div>
				<div class="card-body" style="display: flex; justify-content: space-between;">
					<div class="col-md-2">
						<div class="small-box bg-danger" onclick="list_go('approveList.do',1,1);">
							<div class="inner">
								<b style="border: 1px soild white; border-radius: 50%">
									${noneCheckCnt.get('1')}
								</b>
								<p style="font-size: 12px;">대기</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-info" onclick="list_go('approveList.do',1,2);">
							<div class="inner">
								<b style="border: 1px soild white; border-radius: 50%">
									${noneCheckCnt.get('2')}
								</b>
								<p style="font-size: 12px;">보류</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-success" onclick="list_go('approveList.do',1,3);">
							<div class="inner">
								<b style="border: 1px soild white; border-radius: 50%">
									${noneCheckCnt.get('3')}
								</b>
								<p style="font-size: 12px;">진행</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-primary" onclick="list_go('approveList.do',1,4);">
							<div class="inner">
								<b style="border: 1px soild white; border-radius: 50%">
									${noneCheckCnt.get('4')}
								</b>
								<p style="font-size: 12px;">반려</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-warning" onclick="list_go('approveList.do',1,5);">
							<div class="inner">
								<b style="border: 1px soild white; border-radius: 50%">
									${noneCheckCnt.get('5')}
								</b>
								<p style="font-size: 12px;">완료</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-secondary" onclick="list_go('approveList.do',1,0);">
							<div class="inner">
								<b style="border: 1px soild white; border-radius: 50%">
									${noneCheckCnt.get('0')}
								</b>
								<p style="font-size: 12px;">전체</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-5" style="margin-top: 17px;">
				<div class="field" data-toggle="modal" data-target="#modal-fdefault">
					<button type="button" class="btn btn-default btn-sm" style="float: left;">
						<i class="fas fa-cog">&nbsp;필드설정</i>
					</button>
				</div>
			</div>
			<div class="col-7">
				<div style="display: flex; justify-content: space-between; float: right;">
					<div class="input-group input-group-sm row approve-search" style="display: flex; margin-top: 20px;">
						<select class="form-control col-3" name="signForm" id="signForm" onchange="list_go('approveList.do',1,0);" style="width: 30%;">
							<option value="전체" ${pageMaker.cri.signForm eq '전체' ? 'selected' : '' }>전체</option>
							<option value="업무기안" ${pageMaker.cri.signForm eq '업무기안' ? 'selected' : '' }>업무기안</option>
							<option value="업무협조" ${pageMaker.cri.signForm eq '업무협조' ? 'selected' : '' }>업무협조</option>
							<option value="보고서" ${pageMaker.cri.signForm eq '보고서' ? 'selected' : '' }>보고서</option>
							<option value="휴가신청" ${pageMaker.cri.signForm eq '휴가신청' ? 'selected' : '' }>휴가신청</option>
							<option value="해외출장" ${pageMaker.cri.signForm eq '해외출장' ? 'selected' : '' }>해외출장</option>
						</select>
						<select class="form-control col-3" name="searchType" id="searchType">
							<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected' : '' }>제목</option>
							<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected' : '' }>기안자</option>
						</select>
						<input class="form-control col-5" type="search" name="keyword" placeholder="검색어를 입력하세요" value="${param.keyword }" style="width: 212px;">
						<span class="input-group-append">
							<button class="btn btn-dark" type="button" data-card-widget="search" onclick="list_go('approveList.do',1,0);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade show" id="modal-fdefault"
			style="display: none;" aria-modal="true" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 620px;">
					<div class="modal-header">
						<h4 class="modal-title">필드 설정</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk1" value="기안일" checked disabled="disabled">
											<label class="form-check-label" for="chk1">기안일</label>
										</div>
									</td>
									<td class="left">최종 결재문서가 시작된 날짜를 표시합니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk2" value="결재양식" checked disabled="disabled">
											<label class="form-check-label" for="chk2">결재양식</label>
										</div>
									</td>
									<td class="left">최종 결재가 되어 결재 문서의 진행이 완료된 날짜입니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk3"  value="긴급">
											<label class="form-check-label" for="chk3">긴급</label>
										</div>
									</td>
									<td class="left">긴급으로 기안한 문서가 표시됩니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk4"  value="제목" checked disabled="disabled">
											<label class="form-check-label" for="chk4">제목</label>
										</div>
									</td>
									<td class="left">문서의 제목이 표시됩니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk5"  value="첨부">
											<label class="form-check-label" for="chk5">첨부</label>
										</div>
									</td>
									<td class="left">첨부파일이 포함되었는지 표시합니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk11"  value="기안자">
											<label class="form-check-label" for="chk11">기안자</label>
										</div>
									</td>
									<td class="left">문서의 기안자가 표시됩니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk6"  value="기안부서">
											<label class="form-check-label" for="chk6">기안부서</label>
										</div>
									</td>
									<td class="left">기안자가 소속된 부서를 표시합니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk7"  value="최종결재자">
											<label class="form-check-label" for="chk7">최종결재자</label>
										</div>
									</td>
									<td class="left">이 문서의 마지막 결재자를 표시합니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk8"  value="문서번호">
											<label class="form-check-label" for="chk8">문서번호</label>
										</div>
									</td>
									<td class="left">문서의 고유한 문서번호를 표시합니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk9"  value="결재상태" checked disabled="disabled">
											<label class="form-check-label" for="chk9">결재상태</label>
										</div>
									</td>
									<td class="left">현재 결재 상태를 표시합니다.</td>
								</tr>
								<tr>
									<td class="left">
										<div class="form-check">
											<input type="checkbox" class="form-check-input fieldCheck" id="chk10"  value="완료일">
											<label class="form-check-label" for="chk10">완료일</label>
										</div>
									</td>
									<td class="left">최종 결재가 일어난 날짜를 표시합니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer " style="float: right;">
						<button type="button" class="btn btn-outline-primary" onclick="fieldSave()" data-dismiss="modal">확인</button>
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 필드 설정 -->


		<div class="row">
			<div class="card col-12" style="margin-top: 15px; padding: 0;">
				<div class="card-header bg-navy p-0 pt-1 border-bottom-0">
					<ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
						<li class="nav-item">
							<a class="nav-link ${dataMap.signState eq 1 ? 'active' : '' }" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="list_go('approveList.do',1,1);">대기</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.signState eq 2 ? 'active' : '' }" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="list_go('approveList.do',1,2);">보류</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.signState eq 3 ? 'active' : '' }" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="list_go('approveList.do',1,3);">진행</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.signState eq 4 ? 'active' : '' }" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="list_go('approveList.do',1,4);">반려</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.signState eq 5 ? 'active' : '' }" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="list_go('approveList.do',1,5);">완료</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.signState eq 0 ? 'active' : '' }" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" onclick="list_go('approveList.do',1,0);">전체</a>
						</li>
					</ul>
				</div>
				<div class="card-body" style="padding: 2px !important;">
					<table class="table text-nowrap projects">
						<thead>
							<tr>
								<th style="width: 10%; padding: 0.5rem;" class="fieldItem" id="기안일">기안일</th>
								<th style="width: 10%; padding: 0.5rem;" class="fieldItem" id="결재양식">결재양식</th>
								<th style="width: 5%; padding: 0.5rem;" class="fieldItem" id="긴급">긴급</th>
								<th style="width: 13%; padding: 0.5rem;" class="fieldItem" id="제목">제목</th>
								<th style="width: 5%; padding: 0.5rem;" class="fieldItem" id="첨부">첨부</th>
								<th style="width: 5%; padding: 0.5rem;" class="fieldItem" id="기안자">기안자</th>
								<th style="width: 7%; padding: 0.5rem;" class="fieldItem" id="기안부서">기안부서</th>
								<th style="width: 5%; padding: 0.5rem;" class="fieldItem" id="최종결재자">최종결재자</th>
								<th style="width: 10%; padding: 0.5rem;" class="fieldItem" id="문서번호">문서번호</th>
								<th style="width: 5%; padding: 0.5rem;" class="fieldItem" id="결재상태">결재상태</th>
								<th style="width: 10%; padding: 0.5rem;" class="fieldItem" id="완료일">완료일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty approveList }" >
								<tr style="text-align: center;">
									<td colspan="11">
										<strong>해당 내용이 없습니다.</strong>
									</td>
								</tr>
							</c:if>

							<c:forEach items="${approveList }" var="approve">
								<tr style="font-weight:${approve.scheck eq 1 ? '' : 'bold'};" onclick="goDetail('approval/detailGo.do?signNo=${approve.signNo }','${menu.mcode }')" >
									<td class="field-content" data-field="기안일">
										<fmt:formatDate value="${approve.ddate}" pattern="yyyy-MM-dd"/>
									</td>
									<td class="field-content" data-field="결재양식">${approve.formText}</td>
									<td class="field-content" data-field="긴급">
										<c:if test="${approve.emergency eq '1'}">
											<span class="material-symbols-outlined">e911_emergency </span>
										</c:if>
									</td>
									<td class="field-content" data-field="제목" style="text-align: left; max-width: 130px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${approve.title}</td>
									<td class="field-content" data-field="첨부">
										<c:if test="${!empty approve.attachList }">
											<i class="fas fa-paperclip"></i>
										</c:if>
									</td>
									<td class="field-content" data-field="기안자">${approve.drafter}</td>
									<td class="field-content" data-field="기안부서">${approve.dname}</td>
									<td class="field-content" data-field="최종결재자" style="text-align: left;">${approve.lastSigner }</td>
									<td class="field-content" data-field="문서번호">${approve.signNo}</td>
									<td class="field-content" data-field="결재상태">
										<c:if test="${approve.signState eq '1'}">
											<span class="badge bg-danger">대기</span>
										</c:if>
										<c:if test="${approve.signState eq '2'}">
											<span class="badge bg-info">보류</span>
										</c:if>
										<c:if test="${approve.signState eq '3'}">
											<span class="badge bg-success">진행</span>
										</c:if>
										<c:if test="${approve.signState eq '4'}">
											<span class="badge bg-primary">반려</span>
										</c:if>
										<c:if test="${approve.signState eq '5'}">
											<span class="badge bg-warning">완료</span>
										</c:if>
									</td>
									<td class="field-content" data-field="완료일">
										<fmt:formatDate value="${approve.edate}" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="card-footer">
<%-- 					<%@ include file="/WEB-INF/views/common/pagination.jsp" %> --%>

					<ul class="pagination justify-content-center m-0">
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('approveList.do',1,${dataMap.signState })">
								<i class="fas fa-angle-double-left"></i>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('approveList.do',${pageMaker.cri.page - 1 lt 0 ? 1 : pageMaker.cri.page - 1 },${dataMap.signState })">
								<i class="fas fa-angle-left"></i>
							</a>
						</li>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="page">
							<li class="page-item ${page eq pageMaker.cri.page ? 'active' : ''}">
								<a class="page-link" href="javascript:list_go('approveList.do',${page },${dataMap.signState })">
								${page }
								</a>
							</li>
						</c:forEach>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('approveList.do',${pageMaker.cri.page+1 gt pageMaker.realEndPage ? pageMaker.realEndPage : pageMaker.cri.page+1},${dataMap.signState })">
								<i class="fas fa-angle-right"></i>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('approveList.do',${pageMaker.realEndPage },${dataMap.signState })">
								<i class="fas fa-angle-double-right"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
 	</div> <!--<div class="wrapper"> -->

	<form id="jobForm">
		<input type='hidden' name="page" value="" />
		<input type='hidden' name="perPageNum" value="10"/>
		<input type='hidden' name="searchType" value="" />
		<input type='hidden' name="keyword" value="" />
		<input type="hidden" name="signState" value=""/>
		<input type="hidden" name="signForm" value=""/>
		<input type="hidden" name="mCode" value="${menu.mcode }"/>
	</form>

	<%@ include file="./approval_js.jsp" %>
	<%@ include file="./approve_js.jsp" %>

</body>
