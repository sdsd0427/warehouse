<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="classInit" value="${cri.classInit }" />
<c:set var="signalList" value="${dataMap.signalList }" />
<c:set var="today" value="java.util.Date" />

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/ehr.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		.table th,.table td{
			padding: 4px 0.75rem;
		}

		.card-header{
			padding: 4px 1.25rem;
		}
		.card-footer{
			padding: 6px 0.75rem;
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
 		    color: #001f3f;
 		}
 		.page-item.active .page-link {
 		    color: #fff;
 		    background-color: #001f3f;
 		    border-color: #001f3f;
 		}
 		.content-header {
		    padding: 0;
		    padding-left: 10px;
		}
	</style>
</head>

<body>
<div class="wrapper">
<!-- 					<h3 class="title">알림 상세</h3> -->

	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3 class="title">알림 상세</h3>
				</div>
<!-- 				<div style="display: inline; margin-left: 10px; margin-top: 25px;"> 	 -->
<!-- 					<span  class="text-muted"  style="">근태 > 내 근태관리</span> -->
<!-- 				</div> -->
			</div>
		</div>
	</section>
<!-- 				<button class="btn btn-primary socketTest" type="button" onclick="testSignal()"> -->
<!-- 			       <span class="navbar-toggler-icon">test</span> -->
<!-- 			     </button> -->

	<section class="content">
			<div class="container-fluid">
				<div class="row md-2 ml-3">
					<div class="col-md-12">

						<div class="card card-navy card-outline">
							<div class="card-header with-border">
								<button type="button" class="btn allCheckBtn" style="display: inline;" onclick="allChecked()">
									<i class="far fa-check-square">&nbsp;</i><b>전체선택</b>
								</button>
								<button type="button" class="btn allUnCheckBtn" style="display: none;" onclick="allChecked()">
									<i class="far fa-square">&nbsp;</i><b>선택해제</b>
								</button>
								<button type="button" class="btn allBtn" style="display: inline;" onclick="allRead()">
									<i class="fas fa-check">&nbsp;</i><b>전체읽음</b>
								</button>
								<button type="button" class="btn allBtn" style="display: inline;" onclick="allRemove()">
									<i class="fas fa-trash-alt">&nbsp;</i><b>전체삭제</b>
								</button>
								<button type="button" class="btn checkedBtn" style="display: none;" onclick="checkedRead()">
									<i class="fas fa-check">&nbsp;</i><b>선택읽음</b>
								</button>
								<button type="button" class="btn checkedBtn" style="display: none;" onclick="checkedRemove()">
									<i class="fas fa-trash-alt">&nbsp;</i><b>선택삭제</b>
								</button>
								<div id="" class="card-tools" style="width: 450px;">
									<div class="input-group input-group-sm mt-1 row">
										<select class="form-control" style="width: 40px;" name="perPageNum" id="searchNum" onchange="list_go(1);">
											<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>정렬개수</option>
											<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20</option>
											<option value="30" ${cri.perPageNum == 30 ? 'selected':''}>30</option>
										</select>
										<select class="form-control" style="width: 40px;" name="classInit" onchange="list_go(1);"
											id="classInit">
											<option value="X">카테고리</option>
											<option value="B" ${classInit == 'B' ? 'selected':''}>업무</option>
											<option value="C" ${classInit == 'C' ? 'selected':''}>전자결재</option>
											<option value="D" ${classInit == 'D' ? 'selected':''}>커뮤니티</option>
											<option value="Z" ${classInit == 'Z' ? 'selected':''}>기타</option>
										</select>
										<select class="form-control" name="searchType"
											id="searchType">
											<option value="tw">전체</option>
											<option value="t">내용</option>
											<option value="w">발신자</option>
										</select>
										<input class="form-control" type="text" name="keyword"
											placeholder="검색어를 입력하세요" style="width: 100px;" value="${param.keyword }" />
										<span class="input-group-append">
											<button class="btn btn-dark" type="button" onclick="list_go(1);" data-card-widget="search">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>

							<div class="card-body">
								<table class="table table-hover text-center">

									<c:if test="${empty signalList }" >
										<tr style="text-align: center;">
											<td colspan="6" style="padding-top: 10px;">
												<strong>해당 내용이 없습니다.</strong>
											</td>
										</tr>
									</c:if>

									<c:forEach items="${signalList }" var="signal">
										<tr style='font-size: 0.9em;' data-signalNo="${signal.signalNo}">
											<td style="width: 5px;padding-top: 12px;padding-right: 0px;">
												<div class="form-check">
													<input type="checkbox" class="form-check-input chk" name="chk" onchange="changeBtn()">
													<input type="hidden" name="signalNo" value="${signal.signalNo}">
												</div>
											</td>
											<td style="width: 5%;">
												<span class="info-box-icon">
													<img class="direct-chat-img" data-cfsrc="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="Image"
													src="${signal.photo }">
												</span>
											</td>
											<td class="text-left" style="width: 75%;  cursor:pointer;" onclick="doubleFn('${signal.moveUrl}','${signal.sigMcode}','${signal.signalNo}')">
<%-- 											<td class="text-left" style="width: 75%;  cursor:pointer;" onclick="goPage('${signal.moveUrl}','${signal.sigMcode}');"> --%>
												<span style="font-weight: ${signal.signalCheck eq 0 ?'bold':''}">[${signal.groupName}]&nbsp;&nbsp;${signal.name } ${signal.ppsName}이(가) '${signal.signalContent}'${signal.explanation}</span>&nbsp;
													<c:if test="${signal.signalCheck eq 0}" >
														<c:if test="${signal.signalDate < today}" >
															<span class="right badge badge-danger">New</span>
														</c:if>
													</c:if>
												<br>
												<span class="text-muted"><fmt:formatDate value="${signal.signalDate }" pattern="yyyy-MM-dd HH:mm"/></span>&nbsp;&nbsp;
												<span>${signal.name } ${signal.ppsName}</span>
											</td>
											<td style="width: 10%;">
												<c:if test="${signal.signalCheck eq 0}" >
													<button type="button" onclick="read('${signal.signalNo}')" class="btn btn-block btn-outline-dark btn-sm mt-2">읽음</button>
												</c:if>
											</td>
											<td style="width: 10%;">
												<button type="button" onclick="remove('${signal.signalNo}')" class="btn btn-block btn-outline-danger btn-sm mt-2">삭제</button>
											</td>
										</tr>
									</c:forEach>

								</table>
							</div>

							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
							</div>

						</div>



					</div>
				</div>
			</div>
		</section>

</div>

<!-- <div id="testDiv" style="visibility: hidden;"> -->
<!-- 	<div class="length-target" style="background: none; border: none!important;"> -->
<!-- 		<div class="card-body pt-1 text-white length-remove"> -->
<!-- 			<h6 class="mb-2">뭘 넣어볼까?</h6> -->
<!-- 		</div> -->
<!-- 		<div class="card-body pt-1 text-white length-remove"> -->
<!-- 			<h6 class="mb-2">뭘 넣어볼까?</h6> -->
<!-- 		</div> -->
<!-- 		<div class="card-body pt-1 text-white length-remove"> -->
<!-- 			<h6 class="mb-2">뭘 넣어볼까?</h6> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<script type="text/javascript">
// $('body > aside > div > ul > li:nth-child(2) > a').ready(function(){
// 	var testDiv = $('#testDiv');
// 	$('body > aside > div > ul').after(testDiv);
// 	testDiv.css('visibility','visible');
// })
</script>

<script>
//pagination
function list_go(page,url){
// 	alert(page);
	if(!url) url="signaldetail.do";

	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	jobForm.find("[name='classInit']").val($('select[name="classInit"]').val());

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();

// 	countSignal();
}
</script>

<script>
function doubleFn(url, mCode, signalNo) {

	console.log(url);
	console.log(mCode);
	console.log(signalNo);

	$.ajax({
		url : '<%=request.getContextPath()%>/signal/readNoSync.do?signalNo='+signalNo,
		type : 'get',
		success: function(res){
			console.log(res);
			if(res!="OK"){
				return;
			}
			parent.countSignal();
			parent.goPage(url,mCode);
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}


function testSignal(){
	//parameter : 수신자(eno_int), signalContent(title_String), classCode(common table 참조),
	//				moveUrl(이동할 페이지의 url), sigMcode(이동할 페이지의 mCode)
// 	parent.sendSignal(14310056, "test", "D101", "signal/script.do", '${menu.mcode}');
	parent.sendSignal(14310056, "test", "D101", "signal/scriptForm.do", '${menu.mcode}');
}

//개별 읽음
function read(signalNo){
// 	alert(signalNo);
	location.href='read.do?signalNo='+signalNo+'&classInit='+'${classInit}'+'&mCode='+'${menu.mcode}';
	parent.countSignal();
}

//개별 삭제
function remove(signalNo){
	Swal.fire({
	    title: '삭제',
	    text: '알림을 삭제하시겠습니까?',
	    icon: 'question',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: '확인',
	    cancelButtonText: '취소',
	    reverseButtons: true, // 버튼 순서 거꾸로
	  }).then((result) => {
	    if (result.isConfirmed) {
	    	location.href='remove.do?signalNo='+signalNo+'&classInit='+'${classInit}'+'&mCode='+'${menu.mcode}';
			parent.countSignal();
	    }
	 })
	
}

//선택 읽음
function checkedRead(){
	var cheked = [];

	$('input[type="checkbox"]:checked').each(function (index) {
		cheked.push($(this).next().val());
	});
	if(cheked.length==0) return;
	for(var signalNo of cheked){
		console.log(signalNo);
		location.href='read.do?signalNo='+signalNo+'&classInit='+'${classInit}'+'&mCode='+'${menu.mcode}';

	}
	parent.countSignal();
}

//선택 삭제
function checkedRemove(){
	var cheked = [];
	
	Swal.fire({
	    title: '삭제',
	    text: '선택한 알림을 삭제하시겠습니까?',
	    icon: 'question',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: '확인',
	    cancelButtonText: '취소',
	    reverseButtons: true, // 버튼 순서 거꾸로
	  }).then((result) => {
	    if (result.isConfirmed) {
	    	$('input[type="checkbox"]:checked').each(function (index) {
				cheked.push($(this).next().val());
			});
			if(cheked.length==0) return;
			for(var signalNo of cheked){
				console.log(signalNo);
				location.href='remove.do?signalNo='+signalNo+'&classInit='+'${classInit}'+'&mCode='+'${menu.mcode}';

			}
			parent.countSignal();
	    }
	 })
	
	
}

//전체 읽음
function allRead(){
	var cheked = [];

	$('input[type="checkbox"]').each(function (index) {
		cheked.push($(this).next().val());
	});
	if(cheked.length==0) return;
	for(var signalNo of cheked){
		console.log(signalNo);
		location.href='read.do?signalNo='+signalNo+'&classInit='+'${classInit}'+'&mCode='+'${menu.mcode}';

	}
	parent.countSignal();
}

//전체 삭제
function allRemove(){
	var cheked = [];
	
	Swal.fire({
	    title: '삭제',
	    text: '모든 알림을 삭제하시겠습니까?',
	    icon: 'question',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: '확인',
	    cancelButtonText: '취소',
	    reverseButtons: true, // 버튼 순서 거꾸로
	  }).then((result) => {
	    if (result.isConfirmed) {
	    	$('input[type="checkbox"]').each(function (index) {
				cheked.push($(this).next().val());
			});
			if(cheked.length==0) return;
			for(var signalNo of cheked){
				console.log(signalNo);
				location.href='remove.do?signalNo='+signalNo+'&classInit='+'${classInit}'+'&mCode='+'${menu.mcode}';

			}
			parent.countSignal();
	    }
	 })
}


//버튼 변경
function changeBtn(){
//	var allBtn = document.querySelectorAll(".all");
	var allBtn = $('.allBtn');
	var checkedBtn = $('.checkedBtn');

	if($('input[type="checkbox"]:checked').length > 0){
		allBtn.css("display", "none");
		checkedBtn.css("display", "inline");
	}

	if($('input[type="checkbox"]:checked').length < 1){
		allBtn.css("display", "inline");
		checkedBtn.css("display", "none");
	}

}

//전체 선택, 해제
function allChecked(){
	var allCheckBtn = $('.allCheckBtn');
	var allUnCheckBtn = $('.allUnCheckBtn');
	console.log(allCheckBtn.css("display"));
	if(allCheckBtn.css("display")=="inline-block"){
		allCheckBtn.css("display", "none");
		allUnCheckBtn.css("display", "inline");

		$('input[type="checkbox"]').prop("checked", true);
		changeBtn();
		return;
	}

	if(allUnCheckBtn.css("display")=="inline-block"){
		allUnCheckBtn.css("display", "none");
		allCheckBtn.css("display", "inline");

		$('input[type="checkbox"]').prop("checked", false);
		changeBtn();
		return;
	}

}
</script>

<script>
changeBtn();
</script>
</body>