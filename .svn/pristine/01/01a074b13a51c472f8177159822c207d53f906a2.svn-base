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
		}
		.card-footer{
			padding: 0.75rem, 0.5rem;
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
	<div class="row ml-2" style="margin: 0">
		<div class="col-8" style="padding: 10px;">
			<div class="row" style="justify-content: space-between;">
				<h3 class="title" >${work.wtitle }</h3>
			</div>
			<div class="row" style="justify-content: flex-end; padding-bottom: 10px;">
					<c:forEach items="${work.workManagerList }" var="manager">
						<c:if test="${manager.eno eq loginUser.eno and manager.answer eq '대기' or manager.eno eq loginUser.eno and manager.answer eq '반려' }">
							<div class="row col-6">
								<div class="col-4">
									<button type="button" class="btn btn-block btn-outline-dark" onclick="workApprove()">승인</button>
								</div>
								<div class="col-4">
									<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-objectionGo" data-backdrop="false">이의신청</button>
								</div>
								<div class="col-4">
									<button type="button" class="btn btn-block btn-outline-dark" data-toggle="modal" data-target="#modal-report" data-backdrop="false">부당신고</button>
								</div>
							</div>
						</c:if>
					</c:forEach>
<%-- 				<c:if test="${refer eq 'M115000' }"> --%>
<%-- 					<c:forEach items="${work.workManagerList }" var="manager"> --%>
<%-- 						<c:if test="${manager.eno eq loginUser.eno and manager.answer eq '대기' }"> --%>
<!-- 							<div class="row col-8"> -->
<!-- 								<div class="col-4"> -->
<!-- 									<button type="button" class="btn btn-block bg-info" onclick="workApprove()">승인</button> -->
<!-- 								</div> -->
<!-- 								<div class="col-4"> -->
<!-- 									<button type="button" class="btn btn-block bg-danger" data-toggle="modal" data-target="#modal-objectionGo" data-backdrop="false">이의신청</button> -->
<!-- 								</div> -->
<!-- 								<div class="col-4"> -->
<!-- 									<button type="button" class="btn btn-block bg-warning" data-toggle="modal" data-target="#modal-report" data-backdrop="false">부당신고</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:if> --%>
<%-- 					</c:forEach> --%>
<%-- 					<c:if test="${!empty objection}"> --%>
<%-- 						<c:if test="${objection.result eq 0 }"> --%>
<!-- 							<div class="row col-3 mr-2"> -->
<!-- 								<div class="col-12"> -->
<!-- 									<button type="button" class="btn btn-block bg-primary"  data-toggle="modal" data-target="#modal-objection" data-backdrop="false">이의내용</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:if> --%>
<%-- 					</c:if> --%>
<%-- 				</c:if> --%>
			</div>
			<div class="card card-outline card-navy">
				<table class="table projects" style="width: 100%; table-layout: fixed; font-size: 14px; margin-top: 50px; ">
					<tr>
						<th style="width: 30%;">
							요청자
						</th>
						<td style="width: 60%">
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
					<tr>
						<th style="width: 30%">제목</th>
						<td style="word-break:break-all">
							${work.wtitle }
						</td>
					</tr>
					<tr>
						<th style="width: 30%">상세내용</th>
						<td style="width: 60%;word-break:break-all;">
							${work.wcontent }
						</td>
					</tr>
					<tr>
						<th style="width: 30%">담당자</th>
						<td style="width: 60%">
							<div class="row col-12 emp_List" style="align-items: center; display: flex; justify-content: center; position: relative;">
								<c:forEach items="${work.workManagerList}" var="manager">
									<div class="emp_select_card col-6" data-eno="${manager.eno }" style="align-items: center; display: flex; justify-content: center;">
										<div style="padding: 5px; position: relative;">
											<input type="hidden" name="workManagerEno" value="${manager.eno }">
											<input type="radio" style="display: none;" name="wmstep" value="${manager.eno }" id="${manager.eno }"
												onclick="wmstepCheck(this)">
												<c:if test="${manager.wmstep eq 1 }">
													<span class="badge bg-success" style="position:absolute; top: 0; left: 0">책임</span>
												</c:if>
											<label for="${manager.eno }"><img class="table-avatar emp_profile" src="${manager.photo }"></label>
										</div>
										<div class="text-left"  style="position: relative;">
											<div style="display: flex; align-items: center">
												<p style="font-size: 12px; font-weight: bold">${manager.name } </p>&nbsp;&nbsp;
												<c:if test="${manager.answer eq '대기'}">
												<span class="badge bg-secondary" style="cursor:pointer" onclick="sendSignal('${manager.eno}')">대기</span>
												</c:if>
												<c:if test="${manager.answer eq '반려'}">
												<span class="badge bg-warning" style="cursor:pointer" data-toggle="modal" data-target="#modal-objection" data-backdrop="false"
													onclick="getRefusedObjection('${work.wcode}', '${manager.eno }')">반려</span>
												</c:if>
												<c:if test="${manager.answer eq '이의신청' }">
													<span class="badge bg-warning" style="cursor: pointer;" data-toggle="modal" data-target="#modal-objection" data-backdrop="false"
													onclick="getObjection('${work.wcode}', '${manager.eno }')">이의신청</span>
												</c:if>
												<c:if test="${manager.answer eq '신고' }">
													<span class="badge bg-danger" style="cursor: pointer;"
													>신고</span>
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
						<td style="width: 60%; word-break:break-all;">
							${work.hashTag }
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
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
							<table class="table table-hover" style="margin-top: 10px; font-size: 12px; text-align: center;">
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
						<div class="text-center">
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
						<div class="text-center">
							<ul class="pagination justify-content-center m-0" id="relationMentoWorkPagination">
							</ul>
						</div>
					</div>
				</div>
	</div>
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
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-outline-dark" onclick="goWorkReport('${work.wcode}')">신고</button>
					</div>
				</form>
			</div>

		</div>
	</div>
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
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-outline-dark" onclick="reqObjection()">신청</button>
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
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
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

					</div>
				</form>
			</div>

		</div>
	</div>
	<script>
		$(function(){
			getRelationKnowhow(1);
			getRelationMentoWorkList(1);
		})

		function sendSignal(eno){
			Swal.fire({
			    title: '알림',
			    text: "알림을 보내시겠습니까?",
			    icon: 'question',
			    showCancelButton: true,
			    confirmButtonColor: '#3085d6',
			    cancelButtonColor: '#d33',
			    confirmButtonText: '확인',
			    cancelButtonText: '취소',
			    reverseButtons: true, // 버튼 순서 거꾸로
			  }).then((result) => {
			    if (result.isConfirmed) {
			      Swal.fire(
			        '알림을 보냈습니다.'
			      ).then(function(){
			    	  opener.parent.sendSignal(eno, "${work.wtitle}", "B101", "work/myWorkList.do", 'M113000');
			      })
			    }
			 })

		}

	</script>
	<%@ include file="./work_js.jsp" %>
</body>
