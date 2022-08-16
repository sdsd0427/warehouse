<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		th{
			vertical-align: middle !important;
			text-align: center;
		}
		section{
			display: none;
		}
		.menu{
			display: none;
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
		.table{
			margin: 0;
		}
		a{
			color: white;
		}
		.timeline::before{
			left:20px;
		}
		.modal-header{
			padding-bottom: 0;
		}
		.modal-body{
			padding-top: 0;
		}

		#relationWorkList table td{
			padding: 0.3rem;
		}
	</style>
</head>
<body>
	<div class="wrapper">
			<div class="row" style="margin: 0;">
				<div class="col-12">
						<div class="row" style="justify-content: space-between; align-items: center">
							<div style="display: flex; align-items: center">
								<h2 class="title">노하우 상세보기</h2>
							</div>
						</div>
					<div class="card" style="margin-top: 20px;">
						<div class="card-header p-0 pt-1 border-bottom-0 bg-navy" style="font-weight: bold; color: white">
							<ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" href="#detail" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="detail"
									aria-selected="true" data-link="detail">업무상세</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#report" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="report"
									aria-selected="true" data-link="report">업무보고</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#proceeding" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="proceeding"
									aria-selected="true" data-link="proceeding">회의록</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#qna" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="qna"
									aria-selected="true" data-link="qna">질의응답</a>
								</li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade active in show" id="detail" role="tabpanel"
								 aria-labelledby="detail-tab">
									<table class="table projects" style="width: 100%; table-layout: fixed; font-size: 14px;  ">
										<tr>
											<th style="width: 30%;">
												요청자
											</th>
											<td style="width: 60%;">
												<div style="align-items: center; display: flex; justify-content: center;">
													<div>
														<img class="table-avatar emp_profile" src="${work.requestBy.photo }">
													</div>
													<div>
														<span style="font-size:12px; font-weight:bold">${work.requestBy.name } ${work.requestBy.ppsname }</span>
														<div style="font-size:8px;">
															<p>${work.requestBy.dname }</p>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th style="width: 30%">제목</th>
											<td style="word-break:break-all">
												${work.wtitle }
											</td>
										</tr>
										<tr>
											<th style="width: 30%">담당자</th>
											<td style="width: 60%">
												<div class="row col-12 emp_List" style="align-items: center; display: flex; justify-content: center; position: relative;">
													<c:forEach items="${work.workManagerList }" var="manager">
														<div class="emp_select_card col-6" style="align-items: center; display: flex; justify-content: center;">
															<div style="padding: 5px; position: relative;">
																	<c:if test="${manager.wmstep eq 1 }">
																		<span class="badge bg-success" style="position:absolute; top: 0; left: 0">책임</span>
																	</c:if>
																<img class="table-avatar emp_profile" src="${manager.photo }">
															</div>
															<div>
																<div style="display: flex; align-items: center">
																	<p style="font-size: 12px; font-weight: bold">${manager.name } </p>
																</div>
																<div style="font-size: 8px;">
																	<p>${manager.ppsname }</p>
																	<p>${manager.dname }</p>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<th style="width: 30%">기한</th>
											<td style="width: 60%;">
												<fmt:formatDate value="${work.wend }" pattern="yyyy-MM-dd"/>
											</td>
										</tr>
										<tr>
											<th style="width: 30%">해시태그</th>
											<td style="width: 60%; word-break:break-all;" >
												<input type="text" class="hashtag-input form-control" value="${work.hashTag }" name="hashTag" id="hashTag" disabled="disabled">
											</td>
										</tr>
										<tr>
											<th style="width: 30%">진척도</th>
											<td class="project_progress">
												<div class="progress progress-sm">
													<div class="progress-bar bg-green" role="progressbar" aria-valuenow="${work.wprogress }" aria-valuemin="0"
													aria-valuemax="100" style="width: ${work.wprogress}%"></div>
												</div>
												<small>${work.wprogress }% 완료</small>
											</td>
										</tr>
										<tr>
											<th style="width: 30%">상세내용</th>
											<td style="width: 60%;word-break:break-all;">
												${work.wcontent }
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="card card-light card-outline">
													<div class="card-footer col-12" style="justify-content: space-between;">
														<c:if test="${!empty work.attachList }">
															<c:forEach items="${work.attachList }" var='attach'>
																<div  style="cursor:pointer; display: inline-block" onclick="location.href='getWorkFile.do?attachNo=${attach.refNo}'">
																	<div class="info-box">
																	 	<span class="info-box-icon bg-yellow" style="width: 50px;">
																			<i class="fa fa-copy"></i>
																		</span>
																		<div class="info-box-content">
																			<span class ="info-box-text">
																				<fmt:formatDate value="${attach.regDate }" pattern="yyyy-MM-dd"/>
																			</span>
																			<span class ="info-box-number">${attach.fileName }</span>
																		</div>
																	</div>
																 </div>
															</c:forEach>
														</c:if>
														<c:if test="${empty work.attachList }">
															<span style="font-size: 14px">첨부파일이 존재하지 않습니다.</span>
														</c:if>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="report" role="tabpanel"
								 aria-labelledby="report-tab">
									<table class="table table-hover projects" style="table-layout: fixed; font-size: 14px;">
										<thead>
											<tr>
												<th style="width: 40%">제목</th>
												<th style="width: 30%">보고자</th>
												<th style="width: 20%">등록일</th>
												<th style="width: 10%">첨부</th>
											</tr>
										</thead>
										<tbody class="reportList">
										</tbody>
									</table>
									<div class='text-center' style="margin-top: 10px;">
										<ul class="pagination justify-content-center m-0" id="reportPageNation"></ul>
									</div>
								</div>
								<div class="tab-pane fade" id="proceeding" role="tabpanel"
								 aria-labelledby="proceeding-tab">
									<table class="table table-hover projects" style="table-layout: fixed; font-size: 14px;">
										<thead>
											<tr>
												<th style="width: 40%">제목</th>
												<th style="width: 30%">작성자</th>
												<th style="width: 20%">등록일</th>
												<th style="width: 10%">첨부</th>
											</tr>
										</thead>
										<tbody class="proceedList">

										</tbody>
									</table>
									<div class='text-center' style="margin-top: 10px;">
										<ul class="pagination justify-content-center m-0" id="proceedPageNation"></ul>
									</div>
								</div>
								<div class="tab-pane fade" id="qna" role="tabpanel"
								 aria-labelledby="qna-tab">
									<table class="table table-hover projects" style="table-layout: fixed; font-size: 14px;">
										<thead>
											<tr>
												<th style="width: 40%">제목</th>
												<th style="width: 40%">작성자</th>
												<th style="width: 20%">등록일</th>
											</tr>
										</thead>
										<tbody class="qnaList">

										</tbody>
									</table>
									<div class='text-center' style="margin-top: 10px;">
										<ul class="pagination justify-content-center m-0" id="qnaPageNation"></ul>
									</div>
								</div>
							</div>
						</div>
					</div>






	<script>
		$(function(){
			getReplyList(1);
			getReportList(1);
			getProceedList(1);
			getWorkQnaList(1);
		});
		var li = $('li .nav-link');
		li.click(function(){
			var dataLink = $(this).attr('data-link');

			if(dataLink == 'detail'){
				$('.menu').hide();
				$('.detail-menu').show();
			}

			if(dataLink == 'report'){
				$('.menu').hide();
				$('.report-menu').css({
					"display" : 'flex'
				})
				$('.report-menu').show();
			}

			if(dataLink == 'proceeding'){
				$('.menu').hide();
				$('.proceeding-menu').css({
					"display" : 'flex'
				})
				$('.proceeding-menu').show();
			}
		});
		$('.modal-backdrop').remove();

		function myWorkModify(){

			$('.menu').hide();
			$('.modify-menu').css({
				"display":"flex"
			});

			$('.hashtag-input').removeAttr("disabled")
		}

		function calcelModify(){
			$('.menu').hide();
			$('.detail-menu').show();
			$('.hashtag-input').val("#개발1팀 #5년차 #2년차 #1년차 #전자결재 #그룹웨어");
			$('.hashtag-input').attr("disabled","disabled");
		}
	</script>

	<%@ include file="./work_js.jsp" %>
</body>