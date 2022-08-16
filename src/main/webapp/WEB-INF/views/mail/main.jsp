<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="mailList" value="${dataMap.mailList }" />
<c:set var="noReadCount" value="${dataMap.noReadCount }" />

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mail.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.material-symbols-outlined {
	color: red !important;
	font-size: 20px;
}


</style>
</head>

<body>
	<div class="wrapper">
		<div class="Allmidle">
			<div id="upAll">
				<section class="content-header">
					<div class="row md-2">
						<div class="col" style="display: inline; width: 200px">
							<h3 style="width: 200px; display: inline;">받은메일함</h3>

							<div id="bigLine">
								<a>안읽은 메일</a> <a> ${noReadCount}</a> <a>/</a> <a>전체메일</a> <a>${pageMaker.totalCount}</a>
							</div>
						</div>
					</div>
				</section>

				<div id="total" style="display: flex; justify-content: space-between;">
					<div class="aa">
						<div class="btn_submenu">
							<button type="button" class="btn btn-sm checkbox-toggle" style="font-size: 1.0em !important;" onclick="response();">
								<i class="fas fa-reply">답장</i>
							</button>
						</div>
						<div class="btn_submenu">
							<button type="button" class="btn btn-sm checkbox-toggle" style="font-size: 1.0em !important;" onclick="trash();">
								<i class="fas fa-trash-alt">삭제</i>
							</button>
						</div>
						<div class="btn_submenu">
							<button type="button" class="btn btn-sm checkbox-toggle" style="font-size: 1.0em !important;" onclick="read('${mail.mailNo}')">
								<i class="fas fa-inbox">읽음</i>
							</button>
						</div>
					</div>

					<div id="rig" class=" input-group input-group-sm row" style="width: 40%; padding-left: 33px;padding-right: 10px;">
						<select class="form-control col-md-4" name="perPageNum" id="perPageNum" onchange="list_go(1);" style="width: 30%;">
							<option value="10">정렬</option>
							<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20</option>
							<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50</option>
							<option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100</option>
						</select>
						<input class="form-control col-7" type="text" name="keyword" placeholder="검색어를 입력하세요" value="${param.keyword }" />
						<span class="input-group-append" style="height: 31px;">
							<button class="btn btn-dark" type="button" onclick="list_go(1);" data-card-widget="search">
								<i class="fa fa-fw fa-search" style="font-size: small;"></i>
							</button>
						</span>
						<!-- <button class="btn btn-info ml-1" type="button" >상세</button> -->
<!-- 						<button type="button" style="height: 31px;" class="btn btn-sm btn-outline-dark ml-2" data-toggle="modal" data-target="#myModal">상세</button> -->
					</div>
				</div>
				<!-- total -->
			</div>
			<!-- 맨위 상단 -->

			<div class="all">
				<div class="card card-navy card-outline" style="margin-top: 10px">
					<div class="card-body p-0">
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th style="width: 7%">
											<div class="form-check">
												<input type="checkbox" class="form-check-input" id="checkAll" name="checkAll">
												<label class="form-check-label" for="checkAll">&nbsp;&nbsp;</label>
											</div>
										</th>
										<th style="width: 8%">중요</th>
										<th style="width: 10%">보낸 사람</th>
										<th style="width: 20%">제목</th>
										<th style="width: 10%">첨부</th>
										<th style="width: 20%">수신 시간</th>
									</tr>
								</thead>

								<tbody>
									<c:if test="${empty mailList }" >
										<tr style="text-align: center;">
											<td colspan="6">
												<strong>해당 내용이 없습니다.</strong>
											</td>
										</tr>
									</c:if>
									<c:forEach items="${mailList }" var="mail">
										<c:forEach items="${mail.mtoList }" var="mto">
											<c:if test="${mto.eno eq loginUser.eno}">
												<c:if test="${mto.mtoCheck eq 0 }">
													<tr style="font-weight: bold;">
												</c:if>
												<c:if test="${mto.mtoCheck eq 1 }">
													<tr>
												</c:if>
											</c:if>
										</c:forEach>
											<td>
												<div class="form-check">
													<input type="checkbox" class="form-check-input chk" name="chk" >
													<input type="hidden" name="mailNo" value="${mail.mailNo}">
													<input type="hidden" name="mFrom" value="${mail.mFrom}">
													<label class="form-check-label" for="chk">&nbsp;&nbsp;</label>
												</div>
											</td>
											<td>
											<c:forEach items="${mail.mtoList }" var="mto">

												<c:if test="${mto.eno eq loginUser.eno}">
													<c:if test="${mto.mtoImpor eq 0 }">
														<button type="button" class="btn btn-sm checkbox-toggle imporMail" onclick="starClick('updateMtoImpor.do', '${mail.mailNo}');" name="mtoImpor" value="${mto.mtoImpor}">
															<i class="far fa-star text-warning" ></i>
														</button>
													</c:if>
													<c:if test="${mto.mtoImpor eq 1 }">
														<button type="button" class="btn btn-sm checkbox-toggle imporMail" onclick="starClick('updateMtoImporCancel.do', '${mail.mailNo}');" name="mtoImpor" value="${mto.mtoImpor}">
															<i class="fas fa-star text-warning"></i>
														</button>
													</c:if>
												</c:if>
											</c:forEach>
											</td>
											<td>${mail.name }</td>
											<td style="text-align: left; cursor: pointer;" onclick="goDetail('mail/detailGo.do?mailNo=${mail.mailNo }&test=main&from=${menu.mcode}&eno=${loginUser.eno}','${menu.upcode }')">
												<c:if test="${mail.emergency eq '1'}">
													<span class="material-symbols-outlined">e911_emergency </span>
													${mail.title }
												</c:if>
												<c:if test="${mail.emergency eq '0'}">
													${mail.title }
												</c:if>
											</td>
											<td>
												<c:if test="${!empty mail.attachList }">
													<i class="fas fa-paperclip"></i>
												</c:if>
											</td>
											<td>
												<fmt:formatDate value="${mail.mDate }" pattern="yyyy-MM-dd HH:mm"/>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="card-footer">
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
					</div>
				</div>
			</div>
		</div>
		<!--  div class="Allmidle"-->
	</div>





<!--  <!-- Modal --> -->
<!--   <div class="modal fade" id="myModal" role="dialog"> -->
<!--     <div class="modal-dialog"> -->

<!--       Modal content -->
<!--       <div class="modal-content" style="width: 400px"> -->
<!--         <div class="modal-header"> -->
<!--           <h5 class="modal-title">상세검색</h5> -->
<!--           <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--         </div> -->
<!--         <div class="modal-body"> -->
<!--         	<div> -->
<!-- 	          <label style="width: 100px">메일함</label> -->
<!-- 	          <select name="mbti"class="custom-select "id="exampleSelectBorder" style="width: 150px"> -->
<%-- 					<option value="ISTJ" ${myList.mbti eq 'ISTJ' ? 'selected' : '' }>받은메일함</option> --%>
<%-- 					<option value="INTJ" ${myList.mbti eq 'INTJ' ? 'selected' : '' } >보낸메일함</option> --%>
<%-- 					<option value="INTJ" ${myList.mbti eq 'INTJ' ? 'selected' : '' } >임시메일함</option> --%>
<%-- 					<option value="INTJ" ${myList.mbti eq 'INTJ' ? 'selected' : '' } >내게쓴메일함</option> --%>
<%-- 					<option value="INTJ" ${myList.mbti eq 'INTJ' ? 'selected' : '' } >중요메일함</option> --%>
<!-- 			  </select> <input id="check" type="checkbox"><label for="check" > 휴지통 포함 </label> -->
<!-- 			</div> -->
<!-- 			<label style="width: 100px;margin-top: 10px">보낸사람</label><input type="text" style="width: 250px"><br> -->
<!-- 			<label style="width: 100px;margin-top: 10px">받는사람</label><input type="text" style="width: 250px"><br> -->
<!-- 			<label style="width: 100px;margin-top: 10px">기      간</label><input type="date"> ~ <input type="date"> -->



<!--         </div> -->
<!--         <div class="modal-footer"> -->
<!--           <button type="button" class="btn btn-outline-primary btn-sm" data-dismiss="modal">확인</button> -->
<!--           <button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal">취소</button> -->
<!--         </div> -->
<!--       </div> -->

<!--     </div> -->
<!--   </div> -->






<form id="jobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
	<input type="hidden" name="mCode" value="${menu.mcode }"/>
</form>



<c:if test="${from eq 'commuRegist'}" >
	<script>
		swal("메일 전송", "메일이 전송되었습니다.", "success");
// 		alert("메일을 전송하였습니다.");
		window.close();
	</script>
</c:if>

<c:if test="${from eq 'regist'}" >
	<script>
		swal("메일 전송", "메일이 전송되었습니다.", "success");
// 		alert("메일을 전송하였습니다.");
		window.close();
	</script>
</c:if>
<script>
parent.countMail();
//pagination
function list_go(page, url){
	//alert(page);
	if(!url) url="main.do";

	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());


	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}


// checkbox 선택
$(document).ready(function() {
	$("#checkAll").click(function() {
		if($("#checkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true);
	});
})

// 중요 메일 등록, 해제
function starClick(url, mailNo){
	var data = {
			'mailNo' : mailNo

	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mail/'+url,
		data : data,
		type : 'post',
		success : function(res){
			Swal.fire({
			      icon: 'success',
			      title: res,
			      confirmButtonColor: '#3085d6',
			  }).then(function(){
				  console.log(res);
				  window.location.reload();
		      });
		},
		error : function(error){
			Swal.fire({
			      icon: 'error',
			      title: "error : " + error.status,
			      confirmButtonColor: '#3085d6',
			  })
		}
	})
}


//휴지통으로 이동
function trash(){
	if($("input[type='checkbox']:checked").length > 0){
		Swal.fire({
		    title: '메일 삭제',
		    text: "메일을 삭제하시겠습니까?",
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
		        '휴지통으로 이동되었습니다.'
		      ).then(function(){
		    	  $("input[type='checkbox']:checked").each(function(index){
						var mailNo = $(this).next().val();
						location.href='<%=request.getContextPath()%>/mail/trashUpdate.do?mailNo='+mailNo+'&mCode='+'${menu.mcode}&move=main';
					})
		      })
		    }
		 })
		 
// 		if(answer){
// 			$("input[type='checkbox']:checked").each(function(index){
// 				var mailNo = $(this).next().val();
<%-- 				location.href='<%=request.getContextPath()%>/mail/trashUpdate.do?mailNo='+mailNo+'&mCode='+'${menu.mcode}&move=main'; --%>
// 			})
// 		}
	}else{
		 Swal.fire({
		      icon: 'warning',
		      title: '메일을 선택해주세요',
		      confirmButtonColor: '#3085d6',
		    });
	}
}





// 메일함에서 답장 버튼 클릭
function response(){
	if($("input[type='checkbox']:checked").length > 1){
		 Swal.fire({
		      icon: 'warning',
		      title: '한 번에 하나의 답장만 가능합니다.',
		      confirmButtonColor: '#3085d6',
		    });
		$("input[type='checkbox']").prop("checked", false);
	}
	else{
		$("input[type='checkbox']:checked").each(function(index){
			var mFrom = $(this).next().next().val();
			console.log(mFrom);
			location.href='<%=request.getContextPath()%>/mail/resendRegistFormGo.do?mFrom='+mFrom+'&mCode='+'${menu.mcode}&move=main';
		})
	}
}


// 읽은 메일로 상태 변경
function read(mailNo){
	if($("input[type='checkbox']:checked").length > 0){
		Swal.fire({
		    title: '메일 읽음',
		    text: "읽음 상태로 변경하시겠습니까?",
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
		        '메일을 읽음처리 하였습니다.'
		      ).then(function(){
		    	  $("input[type='checkbox']:checked").each(function(index){
						var mailNo = $(this).next().val();
						location.href='mtoCheck.do?mailNo='+mailNo+'&eno='+ ${loginUser.eno} +'&mCode='+'${menu.mcode}' +'&move=main';
					});
		      })
		    }
		 })
	}
	else{
		Swal.fire({
		      icon: 'warning',
		      title: '메일을 선택해주세요',
		      confirmButtonColor: '#3085d6',
		    });
	}
}


// <c:if test="${from eq 'remove'}" >
// 	alert("휴지통으로 이동되었습니다.");
// 	window.close();
// 	window.opener.location.reload();
// </c:if>

// <c:if test="${from eq 'mtoCheck'}" >
// 	alert("메일을 읽음처리 하였습니다.");
// 	window.close();
// 	window.opener.location.reload();
// </c:if>

</script>

</body>













