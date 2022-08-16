<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
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
		.home_tab{
		  	display: flex;
		  	border-bottom: 1px solid #ccc;
		   	font-size: 14px;
		  	margin-bottom: 0;
		}
		.home_tab li{
			padding: 5px 7px;
			color: #858181;
			position: relative;
		    cursor: pointer;
		}

		.home_tab li.active{
			color: #333;
		}

		.home_tab li.active:after{
			content: "";
		    position: absolute;
		    bottom: -3px;
		    left: 0;
		    width: 100%;
		    border-bottom: 2px solid #001f3f;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div style="display: flex; justify-content: space-between; margin: 10px 0; align-items: center">
			<div style="display: flex;">
				<h3 class="title">부당신고</h3>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted" >업무 > 부당신고</span>
				</div>
			</div>
		</div>
		<div class="row" style="justify-content: space-between; padding: 7.5px;">
				<div class="card col-12 card-outline card-navy p-0">
					<div class="card-header bg-light" style="font-weight: bold">
						신고목록
					</div>
					<ul class="home_tab" id="thisWeekEndWork">
						<li class="wait ${result eq 0  ? 'active' : ''}" onclick="list_go('declareList.do', 1, 0)">처리대기</li>
						<li class="end ${result eq 1  ? 'active' : ''}" onclick="list_go('declareList.do', 1, 1)">처리완료</li>
					</ul>
					<table class="table table-hover text-nowrap projects">
						<thead>
							<tr>
								<th style="width: 25%">신고자</th>
								<th style="width: 20%">신고유형</th>
								<th style="width: 25%">피신고자</th>
								<th style="width: 20%">신고일자</th>
								<th style="width: 10%">처리상태
								</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty dataMap.workReportList }">
								<tr>
									<td colspan="5" style="text-align: center">
										접수된 신고가 존재하지 않습니다.
									</td>
								</tr>
							</c:if>
								<c:forEach items="${dataMap.workReportList }" var="workReport">
									<tr onclick="OpenWindow('<%=request.getContextPath()%>/work/getWorkReportDetail.do?wrepno=${workReport.wrepNo}', '신고상세', '800', '600')">
										<td>
											<div style="align-items: center; display: flex;">
												<div>
													<img class="table-avatar emp_profile" src="${workReport.reporterPhoto }">
												</div>
												<div>
													<span style="font-size:12px; font-weight:bold">${workReport.reporter }</span>
												</div>
											</div>
										</td>
										<td>
											<div style="align-items: center; display: flex;">
												<div>
													<img class="table-avatar emp_profile" src="${workReport.reportedPhoto }">
												</div>
												<div>
													<span style="font-size:12px; font-weight:bold">${workReport.reported }</span>
												</div>
											</div>
										</td>
										<td>
											${workReport.type }
										</td>
										<td>
											<fmt:formatDate value="${workReport.regDate }" pattern="yyyy-MM-dd"/>
										</td>
										<td>
											<c:if test="${workReport.result eq 0 }">
												<span class="badge bg-secondary">처리대기</span>
											</c:if>
											<c:if test="${workReport.result eq 1 }">
												<span class="badge bg-success">처리완료</span>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							<c:if test="${!empty dataMap.workReportList }">
							</c:if>
						</tbody>
					</table>
					<div class="card-footer">
						<ul class="pagination justify-content-center m-0">
							<li class="page-item">
								<a class="page-link" href="javascript:list_go('declareList.do', 1, ${result })">
									<i class="fas fa-angle-double-left"></i>
								</a>
							</li>
							<li class="page-item">
								<c:if test="${pageMaker.prev }">
									<a class="page-link" href="javascript:list_go('declareList.do', ${pageMaker.startPage - 1 }, ${result })">
										<i class="fas fa-angle-left"></i>
									</a>
								</c:if>
								<c:if test="${!pageMaker.prev }">
									<a class="page-link" href="">
										<i class="fas fa-angle-left"></i>
									</a>
								</c:if>
							</li>
							<c:forEach begin="${dataMap.pageMaker.startPage }" end="${dataMap.pageMaker.endPage }" var="page">
								<li class="page-item ${page eq dataMap.pageMaker.cri.page ? 'active' : ''}">
									<a class="page-link" href="javascript:list_go('declareList.do',${page }, ${result })">
									${page }
									</a>
								</li>
							</c:forEach>
							<li class="page-item">
								<c:if test="${pageMaker.next }">
									<a class="page-link" href="javascript:list_go('declareList.do', ${pageMaker.endPage + 1 }, ${result })">
										<i class="fas fa-angle-right"></i>
									</a>
								</c:if>
								<c:if test="${!pageMaker.next }">
									<a class="page-link" href="">
										<i class="fas fa-angle-right"></i>
									</a>
								</c:if>
							</li>
							<li class="page-item">
								<a class="page-link" href="javascript:list_go('declareList.do', ${dataMap.pageMaker.realEndPage }, ${result })">
									<i class="fas fa-angle-double-right"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
		</div>
	</div>
	<form id="jobForm">
		<input type="hidden" name="page">
		<input type="hidden" name="result">
		<input type="hidden" name="mCode" value="${ menu.mcode}">
	</form>
	<script>
	$(document).on('click', 'body > aside > div > ul > li:nth-child(2) > a', function(){
		$(this).attr("href", "#");
		OpenWindow('<%=request.getContextPath()%>/work/workRegistForm.do', '새 업무', '1000', '800');
	});

		function list_go(url, page, result){
			var form = $("#jobForm");
			form.find("[name='page']").val(page);
			form.find("[name='result']").val(result);

			form.attr({
				url : url,
				type : 'get',
			}).submit();
		}
	</script>
	<c:if test="${from eq 'approve' }">
		<script>
		Swal.fire({
		      icon: 'success',
		      title: '신고가 처리되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				window.close();
				window.opener.location.reload();
		    });
		</script>
	</c:if>
</body>