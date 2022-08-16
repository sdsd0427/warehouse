<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${dataMap.myWorkList }" var="myWorkList"/>
<c:set value="${dataMap.pageMaker }" var="pageMaker"/>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/work/workMain.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		.table th,.table td{
			padding: 4px 0.75rem;
		}

		.table th{
			text-align:center;
		}

		.table td:not(:first-child){
			text-align:center;
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
		.page-link {
		    line-height: 1;
		    color: #001f3f;
		    background-color: #fff;
		}
		.page-item.active .page-link {
		    z-index: 3;
		    color: #fff;
		    background-color: #001f3f;
		    border-color: #001f3f;
		}
		a.nav-link{
			color: white;
		}
		.inner{
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div class="wrapper">
<!-- 		<div class="preloader flex-column justify-content-center align-items-center" style="max-width:1130px; height: 100vh; margin-left:220px;"> -->
<%-- 			<img class="animation__shake" src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/AdminLTELogo.png" width="60" height="60"> --%>
<!-- 		</div> -->
		<div style="display: flex; justify-content: space-between; padding: 10px 0; align-items: center">
			<div style="display: flex;">
				<h3 class="title">내 업무</h3>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted" >업무 > 내업무</span>
				</div>
			</div>
			<div class="work-search input-group input-group-sm" style="padding-top: 10px; width: 40%">
					<select class="form-control col-4" name="searchType" id="searchType">
						<option value="tmrh" ${pageMaker.cri.searchType eq 'tmrh' ? 'selected' : '' }>전체</option>
						<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected' : '' }>제목</option>
						<option value="m" ${pageMaker.cri.searchType eq 'm' ? 'selected' : '' }>담당자</option>
						<option value="r" ${pageMaker.cri.searchType eq 'r' ? 'selected' : '' }>요청자</option>
						<option value="h" ${pageMaker.cri.searchType eq 'h' ? 'selected' : '' }>해시태그</option>
					</select>
					<input class="form-control col-8" type="search" name="keyword" value="${pageMaker.cri.keyword }" placeholder="검색어를 입력하세요">
					<span class="input-group-append">
						<button type="button" class="btn bg-navy" onclick="list_go('myWorkList.do', 1, 0)">
							<i class="fa fa-search"></i>
						</button>
					</span>
			</div>
		</div>
		<div class="row" style="padding:7.5px; justify-content: space-between;">
			<div class="card col-12 card-outline card-navy" style="padding: 0">
				<div class="card-header bg-light" style="font-weight: bold; color: white">미확인 업무 현황</div>
				<div class="card-body" style="display: flex; justify-content: space-between;">
					<div class="col-md-2">
						<div class="small-box bg-danger">
							<div class="inner" onclick="list_go('myWorkList.do',1,0)">
								<b style="border: 1px soild white; border-radius: 50%">
										${noneCheckCnt.get('0')}
								</b>
								<p style="font-size: 12px;">대기</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-info">
							<div class="inner" onclick="list_go('myWorkList.do',1,1)">
								<b style="border: 1px soild white; border-radius: 50%">
										${noneCheckCnt.get('1')}
								</b>
								<p style="font-size: 12px;">진행</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-success">
							<div class="inner" onclick="list_go('myWorkList.do',1,2)">
								<b style="border: 1px soild white; border-radius: 50%">
										${noneCheckCnt.get('2')}
								</b>
								<p style="font-size: 12px;">완료</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-primary">
							<div class="inner" onclick="list_go('myWorkList.do',1,3)">
								<b style="border: 1px soild white; border-radius: 50%">
										${noneCheckCnt.get('3')}
								</b>
								<p style="font-size: 12px;">협업요청</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-warning">
							<div class="inner" onclick="list_go('myWorkList.do',1,4)">
								<b style="border: 1px soild white; border-radius: 50%">
										${noneCheckCnt.get('4')}
								</b>
								<p style="font-size: 12px;">대리요청</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="small-box bg-secondary">
							<div class="inner" onclick="list_go('myWorkList.do',1,5)">
								<b style="border: 1px soild white; border-radius: 50%">
										${noneCheckCnt.get('5')}
									</b>
								<p style="font-size: 12px;">전체</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="padding:7.5px;">
			<div class="card col-12 " style="padding: 0;">
				<div class="card-header bg-navy p-0 pt-1 border-bottom-0">
					<ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
						<li class="nav-item">
							<a class="nav-link ${dataMap.statusNo eq 0 ? 'active' : '' }" id="custom-tabs-three-home-tab"  role="tab" aria-controls="custom-tabs-three-home"
							aria-selected="true" href="javascript:list_go('myWorkList.do',1,0)" data-status="0">대기
							<c:if test="${noneCheckCnt.get('0') > 0 }">
								<span class="badge bg-danger">new</span>
							</c:if>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.statusNo eq 1 ? 'active' : '' }" id="custom-tabs-three-home-tab" role="tab" aria-controls="custom-tabs-three-home"
							aria-selected="true" href="javascript:list_go('myWorkList.do',1,1)" data-status="1">진행
							<c:if test="${noneCheckCnt.get('1') > 0 }">
								<span class="badge bg-danger">new</span>
							</c:if>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.statusNo eq 2 ? 'active' : '' }" id="custom-tabs-three-home-tab" role="tab" aria-controls="custom-tabs-three-home"
							aria-selected="true" href="javascript:list_go('myWorkList.do',1,2)" data-status="2">완료
							<c:if test="${noneCheckCnt.get('2') > 0 }">
								<span class="badge bg-danger">new</span>
							</c:if>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.statusNo eq 3 ? 'active' : '' }" id="custom-tabs-three-home-tab" role="tab" aria-controls="custom-tabs-three-home"
							aria-selected="true" href="javascript:list_go('myWorkList.do',1,3)" data-status="3">협업요청
							<c:if test="${noneCheckCnt.get('3') > 0 }">
								<span class="badge bg-danger">new</span>
							</c:if>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.statusNo eq 4 ? 'active' : '' }" id="custom-tabs-three-home-tab" role="tab" aria-controls="custom-tabs-three-home"
							aria-selected="true" href="javascript:list_go('myWorkList.do',1,4)" data-status="4">대리요청
							<c:if test="${noneCheckCnt.get('4') > 0 }">
								<span class="badge bg-danger">new</span>
							</c:if>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${dataMap.statusNo eq 5 ? 'active' : '' }" id="custom-tabs-three-home-tab" role="tab" aria-controls="custom-tabs-three-home"
							aria-selected="true" href="javascript:list_go('myWorkList.do',1,5)" data-status="5">전체
							<c:if test="${noneCheckCnt.get('5') > 0 }">
								<span class="badge bg-danger">new</span>
							</c:if>
							</a>
						</li>
					</ul>
				</div>
					<table class="table table-hover text-nowrap projects">
						<thead>
							<tr>
								<th style="width: 30%;">제목</th>
								<th style="width: 15%">요청자</th>
								<th style="width: 20%">담당자</th>
								<th style="width: 15%">진척도</th>
								<th style="width: 15%">기한
								</th>
								<th style="width: 5%">상태</th>
							</tr>
						</thead>
						<tbody class="workList">
							<c:if test="${empty myWorkList }">
								<tr>
									<td colspan="6" style="text-align: center">해당 상태의 업무가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${myWorkList }" var="work">
								<tr style="color:${work.wcheck eq 1 ? 'gray' : ''}; cursor:pointer" onclick="detail_go('${work.wstatus}', '${work.wcode }')">
									<td><span style="font-weight:${work.wcheck eq 1 ? '' : 'bold'}">${work.wtitle }</span>
										<c:if test="${work.wstatus eq '대기' and work.overDay >= 3 }">
											<span class="badge bg-danger">D+${work.overDay}</span>
										</c:if>
									</td>
									<td>
										<div style="align-items: center; display: flex;">
											<div>
												<img class="table-avatar emp_profile" src="${work.requesterPhoto }">
											</div>
											<div>
												<span style="font-size:12px; font-weight:bold">${work.requester }</span>
											</div>
										</div>
									</td>
									<td>
										<div style="align-items: center; display: flex;">
													<div>
														<img class="table-avatar emp_profile" src="${work.managerPhoto}">
													</div>
													<div>
														<span style="font-size:12px; font-weight:bold">${work.manager}</span>

													</div>
													<c:if test="${work.managerCnt > 0 }">
														<div style="font-size: 12px; ">
															<span style="font-size: 8px; margin-left: 5px">외 ${ work.managerCnt}명</span>
														</div>
													</c:if>
										</div>
									</td>
									<td class="project_progress">
										<div class="progress progress-sm">
											<div class="progress-bar bg-green" role="progressbar" aria-valuenow="{{wprogress}}" aria-valuemin="0"
											aria-valuemax="100" style="width: ${work.wprogress}%"></div>
										</div>
										<small>${work.wprogress}% 완료</small>
									</td>
									<td>
										<fmt:formatDate value="${work.wend }" pattern="yyyy-MM-dd"/>
										<c:if test="${work.dDay <= 3 and work.dDay ne 0 and  work.wstatus ne '완료'}">
												<span class="badge bg-danger">임박</span>
										</c:if>
									</td>
									<td>
										<span class="badge
											${work.wstatus eq '대기' ? 'bg-secondary' : work.wstatus eq '진행' ? 'bg-info' : work.wstatus eq '완료' ? 'bg-success' :
											work.wstatus eq '이의신청' ? 'bg-danger' : work.wstatus eq '협업요청' ? 'bg-primary' : 'bg-warning'}">
											${work.wstatus }
										</span>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<div class="card-footer">
					<ul class="pagination justify-content-center m-0">
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('myWorkList.do',1,${dataMap.statusNo })">
								<i class="fas fa-angle-double-left"></i>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('myWorkList.do',${pageMaker.cri.page - 1 lt 0 ? 1 : pageMaker.cri.page - 1 },${dataMap.statusNo })">
								<i class="fas fa-angle-left"></i>
							</a>
						</li>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="page">
							<li class="page-item ${page eq pageMaker.cri.page ? 'active' : ''}">
								<a class="page-link" href="javascript:list_go('myWorkList.do',${page },${dataMap.statusNo })">
								${page }
								</a>
							</li>
						</c:forEach>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('myWorkList.do',${pageMaker.cri.page + 1},${dataMap.statusNo })">
								<i class="fas fa-angle-right"></i>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('myWorkList.do',${pageMaker.realEndPage },${dataMap.statusNo })">
								<i class="fas fa-angle-double-right"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
<!-- 		<div class="emp_card"> -->
<!-- 			<div class="card-header" style="display: flex; align-items: center;"> -->
<!-- 				<span class="name"></span> -->
<!-- 				<a class="mail" href="#"> -->
<!-- 					<span class="material-symbols-outlined"> -->
<!-- 					mail -->
<!-- 					</span> -->
<!-- 				</a> -->
<!-- 			</div> -->
<!-- 			<div class="card-body"> -->
<!-- 				<span>부서</span> -->
<!-- 				<span class="dep">개발팀</span> -->
<!-- 				<br> -->
<!-- 				<span>연락처</span> -->
<!-- 				<span>010-1111-1111</span> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<form id="jobForm">
	 	<input type="hidden" name="page" value=""/>
	 	<input type="hidden" name="searchType" value=""/>
	 	<input type="hidden" name="keyword" value=""/>
	 	<input type="hidden" name="statusNo" value=""/>
	 	<input type="hidden" name="mCode" value="${menu.mcode }"/>
	</form>
	<c:if test="${from eq 'reportRegist' }">
		<script>
		Swal.fire({
		      icon: 'success',
		      title: '보고서가 작성되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
		    	window.close();
				window.opener.location.reload();
		      });
		</script>
	</c:if>
	<c:if test="${from eq 'reportDelete' }">
		<script>
		Swal.fire({
		      icon: 'success',
		      title: '보고서가 삭제되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
		    	window.close();
				window.opener.location.reload();
		      });
		</script>
	</c:if>
	<c:if test="${from eq 'proceedRegist' }">
		<script>
		Swal.fire({
		      icon: 'success',
		      title: '회의록이 작성되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
		    	window.close();
				window.opener.location.reload();
		      });
		</script>
	</c:if>
	<c:if test="${from eq 'proceedDelete' }">
		<script>
		Swal.fire({
		      icon: 'success',
		      title: '회의록이 삭제되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
		    	window.close();
				window.opener.location.reload();
		      });
		</script>
	</c:if>
	<c:if test="${from eq 'qnaDelete' }">
		<script>
		Swal.fire({
		      icon: 'success',
		      title: '질문 삭제되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
		    	window.close();
				window.opener.location.reload();
		      });
		</script>
	</c:if>
	<%@ include file="./work_js.jsp" %>
</body>