<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="myRelateDocList" value="${dataMap.myRelateDocList }" />

<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/approveRegist.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style>
.signBtn{
	width: 90px !important;
	margin-right: 5px !important;
	height: 38px !important;
}
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
   color: #fff;
   background-color: #001f3f;
}
</style>

</head>

<body>

	<div class="wrapper mt-4">
		<form name="deleteSignDoc"  method="post">
			<input type="hidden" name="signNo" value="${signDoc.signNo }">
		</form>
		<div id="bottom">
			<div class="upAll row" style="display: flex; padding-top: 20px;">
				<div class="col-11">
					<c:if test="${refer eq 'M122000'}">
						<c:set var="url" value="approveList.do" />
						<%@ include file="./approveSignBtn.jsp"%>
					</c:if>
					<c:if test="${refer eq 'M123000'}">
						<c:set var="url" value="viewerList.do" />
						<%@ include file="./viewerSignBtn.jsp"%>
					</c:if>
					<c:if test="${refer eq 'M124000'}">
						<c:set var="url" value="draftList.do" />
						<%@ include file="./draftSignBtn.jsp"%>
					</c:if>
					<c:if test="${refer eq 'M125000'}">
						<c:set var="url" value="tempList.do" />
						<%@ include file="./tempSignBtn.jsp"%>
					</c:if>
					<c:if test="${refer eq 'M126000'}">
						<c:set var="url" value="circulateList.do" />
						<%@ include file="./viewerSignBtn.jsp"%>
					</c:if>
					<c:if test="${refer eq 'M120000' or refer eq 'M121000' or refer eq 'M000000'}">
						<c:if test="${loginUser.eno eq signDoc.eno and signDoc.state ne 1 and signDoc.state ne 2 }">
							<c:set var="url" value="draftList.do" />
							<%@ include file="./draftSignBtn.jsp"%>
						</c:if>
						<c:if test="${loginUser.eno eq signDoc.eno and signDoc.tempSave eq 1}">
							<c:set var="url" value="tempList.do" />
							<%@ include file="./tempSignBtn.jsp"%>
						</c:if>
						<c:forEach items="${signDoc.signerList }" var="signer">
							<c:if test="${signer.signCheck eq 1 and signer.eno eq loginUser.eno }">
								<c:set var="url" value="approveList.do" />
								<%@ include file="./approveSignBtn.jsp"%>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
				<div class="col-1">
					<button class="btn btn-outline-dark" style="float: rignt !important" onclick="goIframPage('<%=request.getContextPath()%>/approval/${url }','${menu.mcode }')">목록</button>
				</div>


			</div>
			<!-- class="upAll" -->
			<hr>

			<div class="row" style="justify-content: space-between;">
				<div class="col-lg-8 card" style="border: 1px solid; padding-bottom: 50px">
					<div style="padding-top: 10px;" id="document">
						<c:if test="${signDoc.sformNo eq 'SF000001' }">
						   <%@ include file="./workDocDetail.jsp" %>
						</c:if>
						<c:if test="${signDoc.sformNo eq 'SF000005' }">
						   <%@ include file="./vacationDocDetail.jsp" %>
						</c:if>
					</div>
					<!-- chart -->
					<div class="card card-light card-outline">
						<div class="card-header">
							<h5 class="card-title" style="font-size: medium;"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
						</div>
						<div class="card-footer">
							<div class="row">
								<c:forEach items="${signDoc.attachList }" var="attach">
									<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;" onclick="location.href='getFile.do?attachNo=${attach.attachNo}';">
										<div class="info-box">
										 	<span class="info-box-icon bg-navy">
												<i class="fa fa-copy"></i>
											</span>
											<div class="info-box-content">
												<span class ="info-box-text">
													<fmt:formatDate value="${attach.regDate }" pattern="yyyy-MM-dd" />
												</span>
												<span class ="info-box-number">${attach.fileName }</span>
											</div>
										</div>
									 </div>
								</c:forEach>
							</div>
						</div>
					</div>

					<div>
						해시태그
						<div style="word-break: break-all;">
							<input type="text" id="hashTag" name="hashTag" class="form-control form-control-sm" value="${signDoc.tagContent }" style="width: 100%" disabled="disabled">
						</div>
					</div>

				</div>
				<!-- col-lg-8 card  -->
				<div class="col-lg-4 card">
					<div class="">
						<div class="card-header p-1">
							<ul class="nav nav-pills">
								<li class="nav-item"><a class="nav-link active" style="padding: .0 .5rem 0.6rem; padding-top: 10px" href="#activity" data-toggle="tab">관련문서</a></li>
								<li class="nav-item"><a class="nav-link" href="#timeline" style="padding: .0 .5rem 0.6rem; padding-top: 10px" data-toggle="tab">문서정보</a></li>
								<li class="nav-item"><a class="nav-link" href="#settings" style="padding: .0 .5rem 0.6rem; padding-top: 10px" data-toggle="tab">결재선</a></li>
								<li class="nav-item"><a class="nav-link" href="#refer" style="padding: .0 .5rem 0.6rem; padding-top: 10px" data-toggle="tab">참조자</a></li>
							</ul>
						</div>
						<div class="card-body" style="padding-top: 10px;">
							<div class="tab-content">
								<div class="tab-pane active" id="activity">
									<div id="reldoc" class="bot" style="margin-left: 7px;">
										<div class="input-group input-group-sm row" style="padding-bottom:10px;">
											<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요" value="">
											<span class="input-group-append">
												<button class="btn btn-dark" type="button" data-card-widget="search">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>
										<div style="overflow: scroll; height: 600px; overflow-x: hidden">
											<c:forEach items="${myRelateDocList }" var="RelateDocList">
												<div class="info-box" style="margin-left: -5px;" onclick="OpenWindow('../kw/RelateddetailDocform.do?signNo=${RelateDocList.signNo }','관련문서',900,800);">
													<div class="imgContainer">
														<li class="list-inline-item">
															<img class="table-avatar emp_profile" src="${RelateDocList.photo}">
														</li>
													</div>
													<div class="info-box-content">
														<div class="infoandspan" style="display: flex;">
															<span class="info-box-text">${RelateDocList.title}</span>
															<span class="material-symbols-outlined">
															assignment
															</span>
														</div>
														<span class="info-box-number">${RelateDocList.name} ${RelateDocList.ppsname}</span>
													</div>
												</div>
												<input type="hidden" name="sFormNo" id="${RelateDocList.sFormNo}" value="">

											</c:forEach>
										</div>
										<!-- 결재선 목록 전체 -->
									</div>
									<!-- id="reldoc" -->
								</div>
								<!-- activity -->

								<!-- 문서정보 -->
								<div class="tab-pane" id="timeline">
									<div id="docInfo">
										<strong><span style="margin-right: 30px">문서정보</span></strong>
											<span id="signDOCNO2">${signDoc.signNo }</span>
										<br><br>
										<strong><span style="margin-right: 30px">공개여부</span></strong>
										<c:if test="${signDoc.sopen eq '1'}">
											<label><input type="radio" name="sOpen" value="1" checked disabled="disabled"> 공개 </label>
											<label><input type="radio" name="sOpen" value="0" disabled="disabled"style="margin-left: 15px">비공개</label> <br><br>
										</c:if>
										<c:if test="${signDoc.sopen eq '0'}">
											<label><input type="radio" name="sOpen" value="1" disabled="disabled"> 공개 </label>
											<label><input type="radio" name="sOpen" value="0" checked disabled="disabled" style="margin-left: 15px">비공개</label> <br><br>
										</c:if>


										<strong><span style="margin-right: 30px">보존연한</span></strong>
										<span>${signDoc.takeOver }년</span> <br><br>
										<strong><span style="margin-right: 30px">기안부서</span></strong>
										<span id="departName">${signDoc.dname }</span>
									</div>
								</div>
								<!-- 문서정보 class="tab-pane" -->

								<!-- 결재선 -->
								<div class="tab-pane" id="settings">
									<c:if test="${empty signDoc.signerList }" >
										<span>등록된 결재선이 없습니다.</span>
									</c:if>
									<c:forEach items="${signDoc.signerList }" var="signer" varStatus="status">
										<div id="signAdd">
											<input type="hidden"  name="signLineno" value="${signer.signLineno }">
											<input type="hidden"  name="${signer.eno}" value="${signer.signRank }">
											<input type="hidden"  name="signerEno" value="${signer.eno}">
											<c:if test="${status.first}">
												<input type="hidden"  name="${signer.eno }First" value="first">
											</c:if>
											<c:if test="${status.last}">
												<input type="hidden"  name="${signer.eno }Last" value="last">
											</c:if>

											<div class="info-box" style="margin-left: -5px;cursor:pointer" id="OriginalEmp" data-signer="${signer.eno}">
												<div class="imgContainer">
													<li class="list-inline-item">
														<img class="table-avatar emp_profile" src="${signer.photo}">
													</li>
												</div>
												<div class="info-box-content">
													<div class="infoandspan">
														<span class="info-box-number">
															${signer.name}
															${signer.ppsName }
														</span>
														<span class="info-box-text">${signer.dname}</span>
														<c:if test="${signer.signCheck eq 1 }">
															<span class="info-box-text">결재 대기</span>
														</c:if>
														<c:if test="${signer.signCheck eq 2 }">
															<span class="info-box-text">결재 완료</span>
														</c:if>
														<c:if test="${signer.signCheck eq 3 }">
															<span class="info-box-text" style="color: red;">반려 처리</span>
														</c:if>
														<span>${signer.signComment }</span>
													</div>
												</div>
											</div>
											<!--class="info-box"  -->
										</div>
									</c:forEach>
								</div>
								<!-- 결재선 class="tab-pane" -->

								<!-- 참조자 -->
								<div class="tab-pane" id="refer">
									<div id="reFAdd">
										<c:if test="${empty signDoc.signRefList }">
											<span>등록된 참조자가 없습니다.</span>
										</c:if>
										<c:forEach items="${signDoc.signRefList }" var="signRef">
											<div id="signAdd">
												<div class="info-box" style="margin-left: -5px" id="OriginalEmp" data-signer="${signRef.eno}">
													<div class="imgContainer">
														<li class="list-inline-item">
															<img class="table-avatar emp_profile" src="${signRef.photo}">
														</li>
													</div>
													<div class="info-box-content">
														<div class="infoandspan">
															<span class="info-box-number">
																${signRef.name}
																${signRef.ppsName }
															</span>
															<span class="info-box-text">${signRef.dname}</span>
														</div>
													</div>
												</div>
												<!--class="info-box"  -->
											</div>
										</c:forEach>

									</div>
								</div>
								<!-- tab-pane -->
							</div>
							<!-- 참조자 tab-content -->
						</div>
						<!-- card-baby -->
					</div>
					<!-- card -->
				</div>
				<!-- card-4 -->
			</div>
			<!-- row -->
		</div>
		<!-- class="bottom" -->
	</div>
	<!-- <div id="wrapper"> -->

	<!-- 개인결재선 모달  -->
	<div id="priappro">
		<div class="modal fade" id="myModal" role="dialog" style="z-index: 1060">
			<div class="modal-dialog modal-mg">
				<div class="modal-content" style="width: 400px">
					<div class="modal-header">
						<h5 class="modal-title">개인결재선으로 저장</h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<label>결재선 이름<input type="text" name=signGroupName style="margin-left: 20px"></label><br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-outline-dark" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-sm btn-outline-primary" data-dismiss="modal" onclick='clickEvent()'>저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 결재선/참조자 모달 -->
	<div class="modal" id="myModal2" style="z-index: 1040">
		<div class="modalBox" style="width: 850px; height: 530px;">
			<div class="card card-navy" style="border: 1px solid;">
				<div class="card-header">
					<h3 class="card-title">
						<span id="infoname"></span>
					</h3>
				</div>
				<div class="card-body" style="display: block;">
					<div class="chart">
						<div class="chartjs-size-monitor">
							<div class="row">
								<div class="col-lg-5">
									<div class="card card-navy card-outline card-outline-tabs">
										<div class="card-header p-0 border-bottom-0">
											<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist" style="text-align: center;">
												<li class="nav-item">
													<a class="nav-link active"
														id="custom-tabs-four-home-tab" data-toggle="pill"
														href="#custom-tabs-four-home" role="tab"
														aria-controls="custom-tabs-four-home" aria-selected="true"
														style="width: 150px">조직도
													</a>
												</li>
												<li class="nav-item">
													<a class="nav-link"
														id="custom-tabs-four-profile-tab" data-toggle="pill"
														href="#custom-tabs-four-profile" role="tab"
														aria-controls="custom-tabs-four-profile"
														aria-selected="false" style="width: 150px">
														<span id="myLine">나의 그룹</span>
													</a>
												</li>
											</ul>
										</div>
										<div class="card-body" style="overflow: scroll; height: 415px; overflow-x: hidden">
											<div class="tab-content" id="custom-tabs-four-tabContent" style="margin-top: 20px">
												<div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab" style="margin-top: -30px">
													<div id="container"></div>
												</div>
												<div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
													<div class="card">
														<div class="card-body table-responsive p-0">
															<table class="table table-hover text-nowrap">
																<c:forEach items="${mySignGroupList }" var="SignGroupList">
																	<tbody>
																		<tr>
																			<td onclick="ClickSignGroupName('${SignGroupList.signGroupNo}')">
																				<a href="#">${SignGroupList.signGroupName}</a>
																				<a href="#" onclick="removeGrName('${SignGroupList.signGroupNo}')">
																					<i class="fas fa-times" style="float: right; color: burlywood;"></i>
																				</a>
																			</td>
																		</tr>
																	</tbody>
																</c:forEach>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-7">
									<div class="card card-navy card-tabs">
										<div class="card-header p-0 pt-1">
											<ul class="nav nav-tabs modalTab" id="custom-tabs-one-tab"
												role="tablist">
												<li class="nav-item">
													<a class="nav-link active"
														id="custom-tabs-one-work-tab" data-toggle="pill"
														href="#custom-tabs-one-work" role="tab"
														aria-controls="custom-tabs-one-work" aria-selected="true">
														결재선
													</a>
												</li>
												<li class="nav-item">
													<a class="nav-link"
														id="custom-tabs-one-document-tab" data-toggle="pill"
														href="#custom-tabs-one-document" role="tab"
														aria-controls="custom-tabs-one-document"
														aria-selected="false">
														참조자
													</a>
												</li>
												<li class="nav-item">
													<a class="nav-link"
														id="custom-tabs-one-menual-tab" data-toggle="pill"
														href="#custom-tabs-one-menual" role="tab"
														aria-controls="custom-tabs-one-menual"
														aria-selected="false">
														열람자
													</a>
												</li>
											</ul>
										</div>
										<div class="card-body">
											<div class="tab-content" id="custom-tabs-one-tabContent">
												<div class="tab-pane fade active show in" id="custom-tabs-one-work" role="tabpanel" aria-labelledby="custom-tabs-one-work-tab">
													<div class="row">
														<div class="col-12 mt-3">
															<div class="card">
																<div class="card-body table-responsive p-0" style="overflow: scroll; height: 315px; overflow-x: hidden;">
																	<table class="table table-hover text-nowrap">
																		<tr>
																			<th style="width: 10%"></th>
																			<th style="width: 20%">이름</th>
																			<th style="width: 50%">부서</th>
																			<th style="margin-left: 15px; width: 20%">상태</th>
																			<th><span class="material-symbols-outlined"> delete </span></th>
																		</tr>
																	</table>
																	<div class="apply" style="background-color: #6c757d !important; color: white; padding-left: 15px;">신청</div>
																	<div class="apply">
																		<table class="table table-hover text-nowrap">
																			<tr>
																				<th style="width: 10%"></th>
																				<th style="width: 20%" class="SignName"></th>
																				<th style="width: 50%" class="DepName"></th>
																				<th style="width: 20%; padding-right: 50px">
</th>
																				<th></th>
																			</tr>
																		</table>
																	</div>

																	<div class="apply" style="background-color: #6c757d !important; color: white; padding-left: 15px; margin-top: -20px">승인</div>
																	<table>
																		<tbody>
																			<tr class="appr-activity activity ui-droppable" data-isnullactivity="true" style="height: 100%">
																				<td style="width: 100%; height: 100%"></td>
																			</tr>
																		</tbody>
																	</table>
																	<table class="table table-hover text-nowrap" id="approvalEmp">
																		<c:forEach items="${mySignLineList }" var="SignLineList">
																			<tr data-eno="${SignLineList.eno }" data-signer="${SignLineList.eno }" id="mySignEmp" class="FirstEmp">
																				<th style="width: 10%"></th>
																				<th style="width: 20%">${SignLineList.name}</th>
																				<th style="width: 50%">${SignLineList.dname}</th>
																				<th style="margin-left: 15px; width: 20%">예정</th>
																				<th>
																					<a href="javascript:removeSigner('${SignLineList.eno }')">
																						<span class="material-symbols-outlined" onclick="removeSigner('${SignLineList.eno}')">delete</span>
																					</a>
																				</th>
																			</tr>
																		</c:forEach>
																	</table>
																	<!--   </div> -->
																</div>
																<div class="card-footer clearfix">
																	<ul class="pagination pagination-sm m-0 float-right"></ul>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane fade" id="custom-tabs-one-document" role="tabpanel" aria-labelledby="custom-tabs-one-document-tab">
													<div class="row">
														<div class="col-12 mt-3">
															<div class="card">
																<div class="card-body table-responsive p-0" style="overflow: scroll; height: 315px; overflow-x: hidden;">
																	<table class="table table-hover text-nowrap">
																		<tr>
																			<th style="width: 10%"></th>
																			<th style="width: 20%">이름</th>
																			<th style="width: 50%">부서</th>
																			<th style="margin-left: 15px; width: 20%">상태</th>
																			<th><span class="material-symbols-outlined">delete </span></th>
																		</tr>
																	</table>
																	<div class="apply" style="background-color: #6c757d !important; color: white; padding-left: 15px;">신청</div>
																	<div class="apply">
																		<table class="table table-hover text-nowrap">
																			<tr>
																				<th style="width: 10%"></th>
																				<th style="width: 20%" class="SignName"></th>
																				<th style="width: 50%" class="DepName"></th>
																				<th style="width: 20%; padding-right: 50px">예정</th>
																				<th></th>
																			</tr>
																		</table>
																	</div>
																	<div class="apply" style="background-color: #6c757d !important; color: white; padding-left: 15px; margin-top: -20px">참조</div>
																	<table>
																		<tbody>
																			<tr class="appr-activity activity ui-droppable" data-isnullactivity="true" style="height: 100%">
																				<td style="width: 100%; height: 100%"></td>
																			</tr>
																		</tbody>
																	</table>
																	<table class="table table-hover text-nowrap"
																		id="twoEmp">
																	</table>
																	<!--   </div> -->
																</div>

																<div class="card-footer clearfix">
																	<ul class="pagination pagination-sm m-0 float-right">
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane fade" id="custom-tabs-one-menual" role="tabpanel" aria-labelledby="custom-tabs-one-menual-tab">
													<div class="row">
														<div class="col-12 mt-3">
															<div class="card">
																<div class="card-body table-responsive p-0" style="overflow: scroll; height: 315px; overflow-x: hidden;">
																	<table class="table table-hover text-nowrap">
																		<tr>
																			<th style="width: 10%"></th>
																			<th style="width: 20%">이름</th>
																			<th style="width: 50%">부서</th>
																			<th style="margin-left: 15px; width: 20%">상태</th>
																			<th><span class="material-symbols-outlined">delete </span></th>
																		</tr>
																	</table>
																	<div class="apply" style="background-color: #6c757d !important; color: white; padding-left: 15px;">신청</div>
																	<div class="apply">
																		<table class="table table-hover text-nowrap">
																			<tr>
																				<th style="width: 10%"></th>
																				<th style="width: 20%" class="SignName"></th>
																				<th style="width: 50%" class="DepName"></th>
																				<th style="width: 20%; padding-right: 50px">예정</th>
																				<th></th>
																			</tr>
																		</table>
																	</div>

																	<div class="apply" style="background-color: #6c757d !important; color: white; padding-left: 15px; margin-top: -20px">열람</div>
																	<table>
																		<tbody>
																			<tr class="appr-activity activity ui-droppable" data-isnullactivity="true" style="height: 100%">
																				<td style="width: 100%; height: 100%"></td>
																			</tr>
																		</tbody>
																	</table>

																	<table class="table table-hover text-nowrap"
																		id="threeEmp">
																	</table>
																	<!--   </div> -->
																</div>
																<div class="card-footer clearfix">
																	<ul class="pagination pagination-sm m-0 float-right">
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="chartjs-size-monitor-expand">
								<div class=""></div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class=""></div>
							</div>
						</div>
					</div>
				</div>
				<div style="margin: 10px; margin-top: -20px">
					<button class="btn-sm bg-navy" data-toggle="modal" data-target="#myModal" data-backdrop="false" style="margin-right: 20px; margin-left: 150px">개인결재선으로 저장</button>
					<div class="twosaca" style="float: right; margin-right: 13px">
						<button class="saca saveBtn btn-sm btn-outline-primary" data-dismiss="modal" style="margin-right: 10px" onclick='clickSave()'>확인</button>
						<button class="saca btn-sm btn-outline-dark" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝  -->

	<!-- 결재코멘트 모달 -->
	<div class="modal fade" id="commentModal" role="dialog" style="display: none">
		<div class="modal-dialog modal-mg" style="width: 350px">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<strong>결재 코멘트</strong>
					</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<textarea rows="3" cols="42" id="signComment" value="signComment"></textarea>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-outline-dark" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-sm btn-outline-primary" data-dismiss="modal" onclick="approveSignDoc();">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->

	<!-- 반려코멘트 모달 -->
	<div class="modal fade" id="rejectCommentModal" role="dialog" style="display: none">
		<div class="modal-dialog modal-mg" style="width: 350px">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<strong>반려 코멘트</strong>
					</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<textarea rows="3" cols="42" id="rejectComment" value="rejectComment"></textarea>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-outline-dark" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-sm btn-outline-primary" data-dismiss="modal" onclick="rejectSignDoc();">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->

	<!-- 보류코멘트 모달 -->
	<div class="modal fade" id="waitCommentModal" role="dialog" style="display: none">
		<div class="modal-dialog modal-mg" style="width: 350px">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<strong>보류 코멘트</strong>
					</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<textarea rows="3" cols="42" id="waitComment" value="waitComment"></textarea>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-outline-dark" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-sm btn-outline-primary" data-dismiss="modal" onclick="waitSignDoc();">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->

	<form id="signDocForm">
		<input type="hidden" name="title" value="">
		<input type="hidden" name="eno" value="">
		<input type="hidden" name="signNo" value="">
		<input type="hidden" name="dno" value="">
		<input type="hidden" name="sFormNo" value="">
		<input type="hidden" name="emergency" value="0">
		<input type="hidden" name="sOpen" value="">
		<input type="hidden" name="signContent" value="">
		<input type="hidden" name="tempSave" value="0">
		<input type="hidden" name="hashTag" value="">
	</form>

	<%@ include file="./approval_js.jsp" %>
	<%@ include file="./approve_js.jsp"%>

</body>
