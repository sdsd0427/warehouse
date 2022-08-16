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

		.relation_tab{
		  	display: flex;
		  	border-bottom: 1px solid #ccc;
		   	font-size: 14px;
		  	margin-bottom: 0;
		}
		.relation_tab li{
			padding: 5px 7px;
			color: #858181;
			position: relative;
		    cursor: pointer;
		}

		.relation_tab li.active{
			color: #333;
		}

		.relation_tab li.active:after{
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
		<c:if test="${refer eq 'M112000' or refer eq 'M110000' }">
			<div style="display: flex; padding-top: 10px;" >
			</div>
		</c:if>
		<c:if test="${refer eq 'M113000'}">
			<div style="display: flex; padding-top: 10px;">
				<h3 class="title">내 업무</h3>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted" >업무 > 내 업무</span>
				</div>
			</div>
		</c:if>
		<c:if test="${refer eq 'M114000'}">
			<div style="display: flex; padding-top: 10px;">
				<h3 class="title">요청한 업무</h3>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted" >업무 > 요청한 업무</span>
				</div>
			</div>
		</c:if>
		<c:if test="${refer eq 'M115000'}">
			<div style="display: flex; padding-top: 10px;">
				<h3 class="title">부서업무</h3>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted" >업무 > 부서업무</span>
				</div>
			</div>
		</c:if>
		<hr>
			<div class="row" style="margin: 0;">
				<div class="col-8">
						<div class="row" style="justify-content: space-between; align-items: center">
							<div style="display: flex; align-items: center">
								<h3 class="title">${work.wtitle }</h3>
							</div>
						</div>
						<div class="row" style="justify-content:space-between; margin-top: 10px;">
								<c:if test="${refer ne 'M13' && refer ne 'M00'}">
									<button class="btn btn-outline-dark" style="width: 50px; height: 40px; margin-left:10px; display: flex;align-items: center;justify-content: center"
									onclick="returnList('${refer}')">
										<span class="material-symbols-outlined">
										menu
										</span>
									</button>
								</c:if>
								<c:if test="${work.wstatus ne '완료' }">
<%-- 									<c:if test="${refer eq 'M113000'}"> --%>
										<c:forEach items="${work.workManagerList}" var="manager">
											<c:if test="${manager.eno eq loginUser.eno and manager.answer eq '대기' or manager.eno eq loginUser.eno and manager.answer eq '반려'}">
												<div class="row col-6">
													<div class="col-4">
														<button type="button" class="btn btn-block btn-outline-dark" onclick="workApprove();">승인</button>
													</div>
													<div class="col-4">
														<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-objectionGo" data-backdrop="false">이의신청</button>
													</div>
													<div class="col-4">
														<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-report" data-backdrop="false">부당신고</button>
													</div>
												</div>
											</c:if>
											<c:if test="${manager.eno eq loginUser.eno and manager.eno ne work.eno and manager.answer ne '대기' and manager.answer ne '이의신청' and manager.answer ne '반려'}">
												<div class="row col-6 title menu detail-menu" style="display: flex;">
													<div class="col-4">
														<button type="button" class="btn btn-block btn-outline-dark" onclick="myWorkModify()">수정</button>
													</div>
													<c:if test="${work.wstatus ne '협업요청' && work.wstatus ne '대리요청'}">
														<div class="col-4">
															<button type="button" class="btn btn-block btn-outline-dark"  data-toggle="modal" data-target="#modal-cooper" data-backdrop="false">협업요청</button>
														</div>
														<div class="col-4">
															<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-proxy" data-backdrop="false">대리요청</button>
														</div>
													</c:if>
													<c:if test="${work.wstatus eq '협업요청'}">
														<c:if test="${cooperReq.result eq 0 }">
															<div class="col-8">
																<button type="button" class="btn btn-block btn-outline-dark"  data-toggle="modal" data-target="#modal-reqContent" data-backdrop="false">요청내용</button>
															</div>
														</c:if>
														<c:if test="${cooperReq.result eq 1 }">
															<div class="col-8">
																<button type="button" class="btn btn-block btn-outline-dark"  data-toggle="modal" data-target="#modal-reqResult" data-backdrop="false">처리확인</button>
															</div>
														</c:if>
													</c:if>
													<c:if test="${work.wstatus eq '대리요청'}">
														<c:if test="${proxyReq.result eq 0 }">
															<div class="col-8">
																<button type="button" class="btn btn-block btn-outline-dark"  data-toggle="modal" data-target="#modal-reqContent" data-backdrop="false">요청내용</button>
															</div>
														</c:if>
														<c:if test="${proxyReq.result eq 1 }">
															<div class="col-8">
																<button type="button" class="btn btn-block btn-outline-dark"  data-toggle="modal" data-target="#modal-reqResult" data-backdrop="false">처리확인</button>
															</div>
														</c:if>
													</c:if>
												</div>
											</c:if>
<%-- 											<c:if test="${manager.eno eq loginUser.eno and manager.answer eq '이의신청'}"> --%>
<!-- 												<div class="row col-3 mr-2"> -->
<!-- 													<button type="button" class="btn btn-block bg-primary"  data-toggle="modal" data-target="#modal-objection" data-backdrop="false">이의처리확인</button> -->
<!-- 												</div> -->
<%-- 											</c:if> --%>
										</c:forEach>
										<div class="row col-3 title menu detail-menu-modify" style="display: none;">
											<div class="col-6">
												<button type="button" class="btn btn-block btn-outline-primary" onclick="myWorkModifyGo('${work.wcode}')">저장</button>
											</div>
											<div class="col-6">
												<button type="button" class="btn btn-block btn-outline-dark" onclick="returnDetail()">취소</button>
											</div>
										</div>
									</c:if>
										<c:if test="${work.eno eq loginUser.eno }">
											<c:if test="${work.wstatus eq '협업요청'}">
												<c:if test="${cooperReq.result eq 0 }">
													<div class="row col-3 title menu detail-menu" style="display: flex;">
														<div class="col-12">
															<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-reqContent" data-backdrop="false">요청내용</button>
														</div>
													</div>
												</c:if>
												<c:if test="${cooperReq.result eq 1 }">
													<div class="row col-3 title menu detail-menu" style="display: flex;">
														<div class="col-12">
															<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-reqResult" data-backdrop="false">처리확인</button>
														</div>
													</div>
												</c:if>
											</c:if>
											<c:if test="${work.wstatus eq '대리요청' }">
												<c:if test="${proxyReq.result eq 0 }">
													<div class="row col-3 title menu detail-menu" style="display: flex;">
														<div class="col-12">
															<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-reqContent" data-backdrop="false">요청내용</button>
														</div>
													</div>
												</c:if>
												<c:if test="${proxyReq.result eq 1 }">
														<div class="row ${objection.result eq 0 ? 'col-6' : 'col-3'} title menu detail-menu" style="display: flex;">
															<div class="${objection.result eq 0 ? 'col-6' : 'col-12'}">
																<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-reqResult" data-backdrop="false">처리확인</button>
															</div>
															<c:if test="${objection.result eq 0 }">
																	<div class="col-6">
																		<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-objection" data-backdrop="false">이의내용</button>
																	</div>
															</c:if>
														</div>
												</c:if>
											</c:if>
											<c:if test="${work.wstatus eq '진행'}">
												<div class="row col-2 title menu detail-menu" style="display: flex;">
														<div class="col-12">
															<c:if test="${refer ne 'M13' && refer ne 'M00' }">
																<button type="button" class="btn btn-block btn-outline-dark" onclick="goDetail('<%=request.getContextPath()%>/work/toReqModifyGo.do?wcode=${work.wcode }', '${menu.mcode }')">수정</button>
															</c:if>
															<c:if test="${refer eq 'M13' || refer eq 'M00' }">
																<button type="button" class="btn btn-block btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/work/toReqModifyForm.do?wcode=${work.wcode }&mcode=M000000'">수정</button>
															</c:if>
														</div>
												</div>
											</c:if>
										</c:if>
							<div class="col-4 title menu report-menu">
								<button class="btn btn-block btn-outline-dark" style="width: 80px; height: 40px; margin:0 5px;" onclick="OpenWindow('<%=request.getContextPath()%>/office/wordRegistForm.do', 'word', '1200', '800')">
								<i class="fas fa-file-word"></i><span style="margin-left: 3px">word</span>
								</button>
								<button type="button" class="btn  btn-outline-dark" style="width: 120px; height:40px;"
								onclick="OpenWindow('<%= request.getContextPath()%>/work/reportRegistForm.do?wcode=${work.wcode }','보고서 작성', '800','600')">보고서 작성</button>
							</div>
							<div class="col-4 title menu proceeding-menu">
								<button class="btn  btn-outline-dark" style="width: 80px; height: 40px; margin:0 5px;" onclick="OpenWindow('<%=request.getContextPath()%>/office/wordRegistForm.do', 'word', '1200', '800')">
								<i class="fas fa-file-word"></i><span style="margin-left: 3px">word</span>
								</button>
								<button type="button" class="btn btn-block btn-outline-dark" style="width: 120px; height:40px;"
								onclick="OpenWindow('<%= request.getContextPath()%>/work/proceedRegistForm.do?wcode=${work.wcode }','회의록 작성', '800','600')">회의록 작성</button>
							</div>
							<div class="col-4 title menu qna-menu">
								<button type="button" class="btn btn-block btn-outline-dark" style="width: 120px; height:40px;"
								onclick="OpenWindow('<%= request.getContextPath()%>/work/qnaRegistForm.do?wcode=${work.wcode }','회의록 작성', '800','600')">질문 작성</button>
							</div>
							<div class="row col-6 title menu modify-menu">
								<div class="col-6">
									<button type="button" class="btn btn-block btn-outline-primary" onclick="">저장</button>
								</div>
								<div class="col-6">
									<button type="button" class="btn btn-block btn-outline-dark" onclick="calcelModify()">취소</button>
								</div>
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
																	<c:if test="${manager.answer eq '협업요청'}">
																		<span class="badge bg-primary"
																			>협업요청</span>
																	</c:if>
																	<c:if test="${manager.answer eq '대리요청' }">
																		<span class="badge bg-warning"
																			>대리요청</span>
																	</c:if>
																	<c:if test="${manager.answer eq '신고' }">
																		<span class="badge bg-danger"
																			>신고</span>
																	</c:if>
																	<c:if test="${manager.answer eq '대기' }">
																		<span class="badge bg-secondary">대기</span>
																	</c:if>
																	<c:if test="${manager.answer eq '반려'}">
																	<span class="badge bg-warning" style="cursor:pointer" data-toggle="modal" data-target="#modal-objection" data-backdrop="false"
																		onclick="getRefusedObjection('${work.wcode}', '${manager.eno }')">반려</span>
																	</c:if>
																	<c:if test="${manager.answer eq '이의신청' }">
																		<span class="badge bg-warning" style="cursor: pointer;" data-toggle="modal" data-target="#modal-objection" data-backdrop="false"
																		onclick="getObjection('${work.wcode}', '${manager.eno }')">이의신청</span>
																	</c:if>
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
					<div class="card-footer">
						<div class="card">
							<div class="card-header bg-navy" style="font-weight: bold; color: white">
								<h3 class="card-title">
									<i class="fas fa-comments"></i>&nbsp;&nbsp;댓글
								</h3>
							</div>

							<div class="card-body row">
								<input type="text" class="form-control col-11" id="replyContent" name="replyContent" placeholder="댓글을 입력하세요" value="" >
								<button type="button" id="replyAddBtn" class="btn btn-default col-1" onclick="replyRegist('${work.wcode}');">
									<i class="fas fa-edit"></i>
								</button>
							</div>

							<div class="card-footer">
								<div class="timeline">
									<div class="time-label" id="repliesDiv">
									</div>

								</div>
								<div class='text-center'>
									<ul class="pagination justify-content-center m-0" id="pagination"></ul>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-4" style="border-left: 1px solid gray" id="relationWorkList">
					<div>
						<p style="font-weight: bold">관련 노하우</p>
						<div style="display: flex">
							 <input class="form-control" type="text" name="rnKeyword"
									placeholder="검색어를 입력하세요." value="${param.keyword }" /> <span
									class="input-group-append">
									<button class="btn bg-navy" type="button"
										onclick="getRelationKnowhow(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
						</div>
						<div style=" height: 40vh">
							<table class="table table-hover" style="font-size: 12px; text-align: center;">
								<thead>
									<tr>
										<th style="width: 70%">제목</th>
										<th style="width: 30%">조회수</th>
									</tr>
								</thead>
								<tbody class="relationKnowhow">
								</tbody>
							</table>
						</div>
						<div class="text-center" style="padding-top:20px; ">
							<ul class="pagination justify-content-center m-0" id="relationKnowhowPagination">
							</ul>
						</div>
					</div>
					<div>
						<p style="font-weight: bold; margin-top: 20px;">관련 멘토 업무</p>
						<div style="display: flex">
							 <input class="form-control" type="text" name="rmKeyword"
									placeholder="검색어를 입력하세요." value="${param.keyword }" /> <span
									class="input-group-append">
									<button class="btn bg-navy" type="button"
										onclick="getRelationMentoWorkList(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
						</div>
						<div style="height: 40vh">
							<table class="table table-hover" style="margin-top: 10px; font-size: 12px; text-align: center;">
								<thead>
									<tr>
										<th style="width: 70%">제목</th>
										<th style="width: 30%">상태</th>
									</tr>
								</thead>
								<tbody class="relationMentoWork">
								</tbody>
							</table>
						</div>
						<div class="text-center" style="padding-top:20px;">
							<ul class="pagination justify-content-center m-0" id="relationMentoWorkPagination">
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- 협업요청하기  -->
	<div class="modal" id="modal-cooper">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="#" method="post">
					<div class="modal-header">
						<h4 class="modal-title">협업요청</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<b>요청 내용</b>
						<textarea class="form-control" rows="5" cols="5" id="cooperContent"></textarea>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-outline-primary" onclick="cooperReqGo('${work.wcode}')">협업 요청</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- 대리요청하기 -->
	<div class="modal" id="modal-proxy">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="#" method="post">
					<div class="modal-header">
						<h4 class="modal-title">대리요청</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<b>요청 내용</b>
						<textarea class="form-control" rows="5" cols="5" id="proxyContent"></textarea>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-outline-primary" onclick="proxyReqGo('${work.wcode}')">대리요청</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- 요청 반려하기 -->
	<div class="modal" id="modal-reqRefuse">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="#" method="post">
					<div class="modal-header">
						<h4 class="modal-title">반려내용작성</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<b>반려 내용</b>
						<textarea class="form-control" rows="5" cols="5" id="refuseContent"></textarea>
					</div>
					<div class="modal-footer justify-content-between refuseBtn">
						<button type="button" class="btn btn-outline-primary" onclick="reqRefuse()">반려</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- 요청내용확인 -->
	<div class="modal" id="modal-reqContent">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header" style="border: none;">
						<h4 class="modal-title">${work.wstatus }</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div style="float: right; margin-bottom: 10px;">
							<c:if test="${work.eno eq loginUser.eno}">
								<c:if test="${refer ne 'M13' && refer ne 'M00' }">
									<button type="button" class="btn btn-outline-primary" onclick="goDetail('<%=request.getContextPath()%>/work/toReqModifyGo.do?wcode=${work.wcode }', '${menu.mcode }')">승인</button>
								</c:if>
								<c:if test="${refer eq 'M13' || refer eq 'M00' }">
									<button type="button" class="btn btn-outline-primary" onclick="location.href='<%=request.getContextPath()%>/work/toReqModifyForm.do?wcode=${work.wcode }&mCode=${menu.mcode }'">승인</button>
								</c:if>
								<button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#modal-reqRefuse" data-backdrop="false">반려</button>
							</c:if>
						</div>
						<table class="table projects">
							<tr>
								<th>요청내용</th>
								<td>
									<c:if test="${work.wstatus eq '협업요청' }">
										${cooperReq.content }
									</c:if>
									<c:if test="${work.wstatus eq '대리요청' }">
										${proxyReq.content }
									</c:if>
								</td>
							</tr>
							<tr>
								<th>요청날짜</th>
								<td>
									<c:if test="${work.wstatus eq '협업요청' }">
										<fmt:formatDate value="${cooperReq.regDate }" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${work.wstatus eq '대리요청' }">
										<fmt:formatDate value="${proxyReq.regDate }" pattern="yyyy-MM-dd"/>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
			</div>

		</div>
	</div>
	<!-- 댓글수정 -->
	<div class="modal modal-default fade" id="modal-reply" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>댓글 수정</h4>
					<h4 class="modal-title" style="display:none;"></h4>
				</div>
				<div class="modal-body">
					<div class="row ">
					<input class="form-control col-12" type="text" id="replyText" name='replyText' class="form-control">
				</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-outline-primary" id="replyModBtn" style="text-align: right" onclick="replyModify_go();" data-dismiss="modal">수정</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 처리내용 확인 -->
	<div class="modal modal-default fade" id="modal-reqResult" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4>처리내용</h4>
					<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
				</div>
				<div class="modal-body">
					<div class="row ">
						<table class="table projects">
							<tr>
								<th>요청내용</th>
								<td>
									<c:if test="${work.wstatus eq '협업요청' }">
										${cooperReq.content }
									</c:if>
									<c:if test="${work.wstatus eq '대리요청' }">
										${proxyReq.content }
									</c:if>
								</td>
							</tr>
							<tr>
								<th>요청날짜</th>
								<td>
									<c:if test="${work.wstatus eq '협업요청' }">
										<fmt:formatDate value="${cooperReq.regDate }" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${work.wstatus eq '대리요청' }">
										<fmt:formatDate value="${proxyReq.regDate }" pattern="yyyy-MM-dd"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>처리날짜</th>
								<td>
									<c:if test="${work.wstatus eq '협업요청' }">
										<fmt:formatDate value="${cooperReq.resDate }" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${work.wstatus eq '대리요청' }">
										<fmt:formatDate value="${proxyReq.resDate }" pattern="yyyy-MM-dd"/>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 부당신고하기 -->
	<div class="modal" id="modal-report">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="#" method="post">
					<div class="modal-header">
						<h4 class="modal-title">부당신고</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table projects">
							<tr>
								<th>신고자</th>
								<td>
									<div style="align-items: center; display: flex; justify-content: center">
										<div style="padding: 5px;">
											<img class="table-avatar emp_profile" src="${loginUser.photo }">
										</div>
										<div>
											<p style="font-size: 16px; font-weight: bold">${loginUser.name} </p>
											<div style="font-size: 12px;">
												<p>${loginUser.ppsname }</p>
												<p>${loginUser.dname }</p>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>신고유형</th>
								<td>
									<select class="form-control" name="type" id="reportType">
										<option>직책남용</option>
										<option>부당업무</option>
										<option>근태불량</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>신고내용</th>
								<td>
									<textarea class="form-control" rows="5" cols="5" name="content" id="reportContent"></textarea>
								</td>
							</tr>
							<tr>
								<th>피신고자</th>
								<td>
									<div style="align-items: center; display: flex; justify-content: center">
										<div style="padding: 5px;">
											<img class="table-avatar emp_profile" src="${work.requestBy.photo }">
										</div>
										<div>
											<p style="font-size: 16px; font-weight: bold">${work.requestBy.name} </p>
											<div style="font-size: 12px;">
												<p>${work.requestBy.ppsname }</p>
												<p>${work.requestBy.dname }</p>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-outline-primary" onclick="goWorkReport('${work.wcode}')">신고</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- 이의신청하기 -->
	<div class="modal" id="modal-objectionGo">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="#" method="post">
					<div class="modal-header">
						<h4 class="modal-title">이의신청</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table">
							<tr>
								<th>이의유형</th>
								<td>
									<select class="form-control" name="objType">
										<option>업무관련</option>
										<option>일정관련</option>
										<option>기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>이의내용</th>
								<td>
									<textarea class="form-control" rows="5" cols="5" name="objContent"></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-outline-primary" onclick="reqObjection()">이의신청</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- 이의처리확인 -->
	<div class="modal" id="modal-objection">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="#" method="post">
					<div class="modal-header" style="border: none;">
							<h4 class="modal-title">이의신청</h4>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
							</button>
					</div>
					<div style="float: right; margin-right: 10px; margin-bottom: 10px" class="objection_btn">

					</div>
					<div class="modal-body" style="margin-top: 20px;">
						<table class="table objection_table">


						</table>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>

		</div>
	</div>

	<!-- workModifyForm -->

	<script>
		$(function(){
			getReplyList(1);
			getReportList(1);
			getProceedList(1);
			getWorkQnaList(1);
			getRelationKnowhow(1);
			getRelationMentoWorkList(1);
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

			if(dataLink == 'qna'){
				$('.menu').hide();
				$('.qna-menu').css({
					"display" : 'flex',
					"justify-content" : "flex-end"
				})
				$('.qna-menu').show();
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