<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
	}
	.btn-block+.btn-block {
		margin-top: 0px;
	}
	.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	    color: #fff;
	    background-color: #001f3f;
	}
</style>
</head>

<body>

	<div class="wrapper">
		<section class="content-header" style="margin-left: 30px">
			<h3>전사문서함 상세보기</h3> 
			<!-- <div class="row md-2">
				<div class="col-lg-10" style="margin-top: 20px; margin-left: 30px;">
					<h5>
						<strong>업무기안</strong>
					</h5>
				</div>
			</div> -->
			<!--row md-2  -->
		</section>
		<form name="deleteSignDoc" action="deleteSignDoc.do" method="post">
			<input type="hidden" name="signNo" value="${signDoc.signNo }">
		</form> 
		
		
		<div class="upAll" style="display: flex; justify-content: space-between;margin-left: 42px">
			<div style="display: flex;">
				<button onclick="pdfDownload()" type="button" class="groupbtn btn btn-block btn-outline-primary col-5" data-toggle="modal" data-target="#myModalAdd" data-backdrop="false" style="display: flex; justify-content: center; width: 150px; height: 38px;">
					<span class="material-symbols-outlined">file_download</span>
					<span>다운로드</span>
				</button>
				<button type="button" class="groupbtn btn btn-block btn-outline-primary col-5" onclick="OpenWindow('../mail/registForm.do?mFrom=${loginUser.eno}','메일보내기',1000,800);" style="margin-left:10px; display: flex;justify-content: center;width: 150px; height: 38px;">
					<span class="material-symbols-outlined">mail</span>
					<span>메일작성</span>
				</button>
				
				<button type="button" class="btn btn-outline-dark" onclick="goIframPage('<%=request.getContextPath() %>/kw/approvalList.do','${menu.mcode }')" style="margin-left:10px; display: flex;justify-content: center; height: 38px;">
	               <span class="material-symbols-outlined">menu</span>
	               <span style="width: 40px;">목록</span>
           		 </button>
            
            
			</div>
		</div> <!-- class="upAll" -->
		
		
		<div id="bottom">
			<div class="upAll" style="display: flex; padding-top: 20px;">
				<c:if test="${refer eq 'M122000'}">
					<%@ include file="./approveSignBtn.jsp"%>
				</c:if>
				<c:if test="${refer eq 'M123000' || refer eq 'M126000'}">
					<%@ include file="./viewerSignBtn.jsp"%>
				</c:if>
				<c:if test="${refer eq 'M124000'}">
					<%@ include file="./draftSignBtn.jsp"%>
				</c:if>
				<c:if test="${refer eq 'M125000'}">
					<%@ include file="./tempSignBtn.jsp"%>
				</c:if>
			</div>
			<!-- class="upAll" -->
			<hr>

			<div class="row" style="justify-content: space-between;">
				<div class="col-lg-10 card" style="border: 1px solid; padding-bottom: 50px">
					<div style="padding-top: 10px;" id="document">
						<%@ include file="./workDocDetail.jsp"%>
					</div>
					<!-- chart -->
					<div class="card card-light card-outline">
						<div class="card-header">
							<h5 class="card-title"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
						</div>
						<div class="card-footer">
							<div class="row">
								<c:forEach items="${signDoc.attachList }" var="attach">
									<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;" onclick="location.href='getFile.do?attachNo=${attach.attachNo}';">
										<div class="info-box">
										 	<span class="info-box-icon bg-info">
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
																				<th style="width: 20%; padding-right: 50px">예정</th>
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
					<button class=btn-sm btn-outline-dark" data-toggle="modal" data-target="#myModal" data-backdrop="false" style="margin-right: 20px; margin-left: 150px">개인결재선으로 저장</button>
					<div class="twosaca" style="float: right; margin-right: 13px">
						<button class="saca saveBtn btn-sm btn-outline-dark" data-dismiss="modal" style="margin-right: 20px" onclick='clickSave()'>확인</button>
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


<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>
<!-- pdf 다운 -->
<script src="<%=request.getContextPath() %>/resources/pds/html2canvas.js"></script>
<script src="<%=request.getContextPath() %>/resources/pds/jspdf.min.js"></script>

<script>
//pdf로 저장 할 수 있도록 하는 함수
function pdfDownload(){
	
    html2canvas($('#document')[0],{ logging: true, letterRendering: 1,  allowTaint: false, useCORS: false }).then(function(canvas) { //저장 영역 div id

    console.log("pdsfdsf")	
    // 캔버스를 이미지로 변환

   var  imgData = canvas.toDataURL();
    
   // var imgData = canvas.toDataURL('image/png');

    var imgWidth = 170; // 이미지 가로 길이(mm) / A4 기준 210mm
    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
    var imgHeight = canvas.height * imgWidth / canvas.width;
    var heightLeft = imgHeight;
    var margin = 20; // 출력 페이지 여백설정
    var doc = new jsPDF('p', 'mm');
    var position = 10;
    

    // 첫 페이지 출력
    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
    heightLeft -= pageHeight;

    var info = new Image();
    
    // 한 페이지 이상일 경우 루프 돌면서 출력
    while (heightLeft >= 20) {
        position = heightLeft - imgHeight;
        doc.addPage();
        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;
    }

    // 오늘 날짜
    var day = new Date();
    day = day.toLocaleDateString();

    doc.save(day + name + '업무기안.pdf');
	})

}
</script>


</body>
