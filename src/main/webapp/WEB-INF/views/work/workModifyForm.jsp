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
	</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<script type="text/javascript">
	console.log('${refer}')
	$(document).ready(function(){
		summernote_go($('textarea[name="wcontent"]'), '<%=request.getContextPath()%>');
	});
	</script>
</head>
<body>
	<div class="wrapper">
		<c:if test="${refer eq 'M112000' or refer eq 'M110000' }">
			<div style="display: flex; padding-top: 10px;" >
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
								<h3 class="title" >${work.wtitle }</h3>
								<c:if test="${refer ne 'M13' && refer ne 'M00' }">
									<button class="btn btn-outline-dark" style="width: 50px; height: 40px; margin-left:10px; display: flex;align-items: center;justify-content: center"
									onclick="returnList('${refer}')">
										<span class="material-symbols-outlined">
										menu
										</span>
									</button>
								</c:if>
							</div>
						</div>

							<div class="row" style="justify-content: flex-end">
								<div class="row col-4">
									<div class="col-6">
										<button type="button" class="btn btn-block btn-outline-dark" onclick="toReqModify()">수정</button>
									</div>
									<div class="col-6">
										<c:if test="${refer ne 'M13' && refer ne 'M00' }">
											<button type="button" class="btn btn-block btn-outline-dark" onclick="detail_go('${work.wstatus}', '${work.wcode }')">취소</button>
										</c:if>
										<c:if test="${refer eq 'M13' || refer eq 'M00' }">
											<button type="button" class="btn btn-block btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/work/workDetail.do?wcode=${work.wcode}&mCode=M000000'">취소</button>
										</c:if>
									</div>
								</div>
							</div>
<!-- 							<div class="col-3 title menu report-menu"> -->
<!-- 								<button type="button" class="btn btn-block btn-outline-dark" -->
<%-- 								onclick="OpenWindow('<%= request.getContextPath()%>/work/reportRegistForm.do','보고서 작성', '800','600')">보고서 작성</button> --%>
<!-- 							</div> -->
<!-- 							<div class="col-3 title menu proceeding-menu"> -->
<!-- 								<button type="button" class="btn btn-block btn-outline-dark" -->
<%-- 								onclick="OpenWindow('<%= request.getContextPath()%>/work/proceedRegistForm.do','회의록 작성', '800','600')">회의록 작성</button> --%>
<!-- 							</div> -->
<!-- 							<div class="row col-6 title menu modify-menu"> -->
<!-- 								<div class="col-6"> -->
<!-- 									<button type="button" class="btn btn-block btn-outline-dark" onclick="">저장</button> -->
<!-- 								</div> -->
<!-- 								<div class="col-6"> -->
<%-- 									<button type="button" class="btn btn-block btn-outline-dark" onclick="detail_go('${work.wstatus}', '${work.wcode }')">취소</button> --%>
<!-- 								</div> -->
<!-- 							</div> -->
					<div class="card" style="margin-top: 20px;">
						<div class="card-header p-0 pt-1 border-bottom-0 bg-navy">
							<ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" href="#detail" id="custom-tabs-three-home-tab" data-toggle="pill" role="tab" aria-controls="detail"
									aria-selected="true" data-link="detail">업무상세</a>
								</li>
							</ul>
						</div>
						<div class="card-body">
								<div class="tab-pane fade active in show" id="detail" role="tabpanel"
								 aria-labelledby="detail-tab">
									<table class="table projects" style="width: 100%; table-layout: fixed; font-size: 14px;  ">
										<tr>
											<th style="width: 30%;">
												요청자
											</th>
											<td style="width: 60%">
												<input type="hidden" name="eno" value="${work.requestBy.eno }">
												<input type="hidden" name="dno" value="${work.requestBy.eno }">
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
													<c:forEach items="${work.workManagerList}" var="manager">
														<div class="emp_select_card col-6" data-eno="${manager.eno }" style="align-items: center; display: flex; justify-content: center;">
															<div style="padding: 5px; position: relative;">
																<input type="hidden" name="workManagerEno" value="${manager.eno }">
																<span class="badge bg-success wmstepBtn" style="display:${manager.wmstep eq 1 ? 'block' : 'none'}; position:absolute; top: 0; left: 0">책임</span>
																<input type="radio" style="display: none;" name="wmstep" value="${manager.eno }" id="${manager.eno }"
																	onclick="wmstepCheck(this)" ${manager.wmstep eq 1 ? 'checked' : '' }>
																<label for="${manager.eno }"><img class="table-avatar emp_profile" src="${manager.photo }"></label>
															</div>
															<div class="text-left"  style="position: relative;">
																<div style="display: flex; align-items: center">
																	<p style="font-size: 12px; font-weight: bold">${manager.name } </p>&nbsp;&nbsp;
																	<c:if test="${objection.eno eq manager.eno}">
																	<i class="fas fa-times removeBtn text-danger" onclick="removeManager('${manager.eno}')" style="cursor:pointer;"></i>
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
												<input type="date" class="form-control" value="<fmt:formatDate value="${work.wend }" pattern="yyyy-MM-dd"/>" name="wend">
											</td>
										</tr>
										<tr>
											<th style="width: 30%">해시태그</th>
											<td style="width: 60%; word-break:break-all;" >
												<input type="text" class="hashtag-input form-control" name="hashTag" value="${work.hashTag }">
											</td>
										</tr>
										<tr>
											<th style="width: 30%">진척도</th>
											<td class="project_progress">
												<select class="form-control" name="wprogress" id="progress">
													<option value="0" ${work.wprogress eq '0' ? 'selected' : ''}>0%</option>
													<option value="10" ${work.wprogress eq '10' ? 'selected' : ''}>10%</option>
													<option value="20" ${work.wprogress eq '20' ? 'selected' : ''}>20%</option>
													<option value="30" ${work.wprogress eq '30' ? 'selected' : ''}>30%</option>
													<option value="40" ${work.wprogress eq '40' ? 'selected' : ''}>40%</option>
													<option value="50" ${work.wprogress eq '50' ? 'selected' : ''}>50%</option>
													<option value="60" ${work.wprogress eq '60' ? 'selected' : ''}>60%</option>
													<option value="70" ${work.wprogress eq '70' ? 'selected' : ''}>70%</option>
													<option value="80" ${work.wprogress eq '80' ? 'selected' : ''}>80%</option>
													<option value="90" ${work.wprogress eq '90' ? 'selected' : ''}>90%</option>
													<option value="100" ${work.wprogress eq '100' ? 'selected' : ''}>100%</option>
												</select>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<textarea class="form-control" name="wcontent">${work.wcontent }</textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="card card-light card-outline">
													<div class="card-header">
													<h5 class="card-title" style="font-size: medium;"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
													&nbsp;&nbsp;&nbsp;<button class="btn btn-xs btn-info"
																	onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
													</div>
													<div class="card-footer fileInput">
													<div class="form-group">
														<c:if test="${!empty work.attachList }">
															<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
																<c:forEach items="${work.attachList }" var="attach" >
																	<li class="attach-item thumb${attach.refNo }" file-name="${attach.fileName }" target-ano="${attach.refNo }">
																		<div class="mailbox-attachment-info ">
																			<a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${attach.fileName }" attach-no="${attach.refNo }" href=""  >
																				<i class="fas fa-paperclip"></i>
																				${attach.fileName }&nbsp;&nbsp;
																				<button type="button" onclick="removeFile_go('thumb${attach.refNo}');return false;" style="border:0;outline:0;"
																						class="badge bg-red">X</button>
																			</a>
																		</div>
																	</li>
																</c:forEach>
															</ul>
														</c:if>
													</div>
												</div>
												</div>
											</td>
										</tr>
									</table>
								</div>
						</div>
					</div>
				</div>
				<div class="col-4" style="border-left: 1px solid gray">
					<div>
						<div class="card">
							<div id="inAll" style="margin: 30px">
								<div id="wrap">
									<span class="material-symbols-outlined">
										corporate_fare
									</span>
								  	<span >PoJo기업</span>
									<div id="organization" >

									</div>
								</div>
							</div>
						</div>
					</div>
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
	<script>
	$(function(){
		getRelationKnowhow(1);
		getRelationMentoWorkList(1);
	})
		var li = $('li .nav-link');
		li.click(function(){
			var dataLink = $(this).attr('data-link');

			if(dataLink == 'detail'){
				$('.menu').hide();
				$('.detail-menu').show();
			}

			if(dataLink == 'report'){
				$('.menu').hide();
				$('.report-menu').show();
			}

			if(dataLink == 'proceeding'){
				$('.menu').hide();
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

		function cancelModify(){
			detail_go('${work.wstatus}', '${work.wcode }');
		}

		var dataNum=0;
		function addFile_go(){
			if($('input[name="uploadFile"]').length>=5){
				Swal.fire({
				      icon: 'warning',
				      title: '파일첨부는 5개까지만 가능합니다.',
				      confirmButtonColor: '#3085d6',
				    });
				return;
			}

			var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
			var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
			div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");

			$('.fileInput').append(div);
			dataNum++;
		}

		function remove_go(dataNum){
			$('div[data-no="'+dataNum+'"]').remove();
		}

		$('#organization').jstree({
			core : {
				data :${organizationNode}
			},
			types : {
				'default' : {'icon': 'jstree-folder'}
			},
			 plugins: ['wholerow', 'types']
		})

		 $('#organization').on("changed.jstree", function (e, data) {
		    if(data.node.id.length > 3){
		    	$.ajax({
		    		url : "<%=request.getContextPath()%>/work/getEmpByNodeId.do?eno=" + data.node.id,
		    		type:'get',
		    		success:function(res){
		    			if(res.eno == ${work.eno}){
		    				Swal.fire({
		  				      icon: 'warning',
		  				      title: '업무 요청자는 담당자로 추가할 수 없습니다.',
		  				      confirmButtonColor: '#3085d6',
		  				    });
		    			}else if($('div[data-eno="' + res.eno + '"]').length == 0){
		    				if('${work.wstatus}' == '대리요청' && newWorkManager.length >= 1){
		    					Swal.fire({
				  				      icon: 'warning',
				  				      title: '이미 담당자를 수정하였습니다.',
				  				      confirmButtonColor: '#3085d6',
				  				    });
		    				}else if('${work.wstatus}' == '진행'){
				    			Swal.fire({
				  				      icon: 'warning',
				  				      title: '담당자를 추가할 수 없습니다.',
				  				      confirmButtonColor: '#3085d6',
				  				    });
		    				}else{
				    			addEmp(res, $('.emp_List'), $('#addEmp-template'))
				    			var hashTag = $('input[name=hashTag]').val();

			    				var tagList = hashTag.split(" ");
			    				console.log(tagList);
			    				var hashCodeSet = new Set(tagList);
			    				hashCodeSet.add("#" + res.year + "년차");
			    				console.log(hashCodeSet);

			    				var result = "";
			    				for(var code of hashCodeSet){
			    					result += code+" ";
			    				}

			    				$('input[name=hashTag]').val(result.trim());

				    			addWorkManager(res.eno);
		    				}
		    			}else{
		    				Swal.fire({
			  				      icon: 'warning',
			  				      title: '이미 등록된 담당자는 추가할 수 없습니다.',
			  				      confirmButtonColor: '#3085d6',
			  				    });
		    			}

		    		},
		    		error:function(error){
		    			alert(error);
		    		}
		    	});
		    }
	 	 });

		function addEmp(data, target, templateObject){
			var template=Handlebars.compile(templateObject.html());
			var html = template(data);
			target.append(html);
		}
	</script>

	<%@ include file="./work_js.jsp" %>
</body>