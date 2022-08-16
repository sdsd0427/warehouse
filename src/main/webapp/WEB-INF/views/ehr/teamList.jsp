<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="teamList" value="${dataMap.teamList }" />
<c:set var="weekFullDate" value="${dataMap.weekFullDate }" />
<c:set var="allCount" value="${dataMap.allCount }" />
<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/ehr.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		.list-group-item{
			padding: 6px 0.75rem;
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
		.small-box{
			margin: 0;
		}
		.table{
			margin: 0;
		}
 		.card-footer{
			padding: 6px 0.75rem;
		}
		/**/
	</style>
</head>

<body>

<div class="wrapper">
	<section class="content-header p-0">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3 class="title" style="padding-left: 10px;">부서 근태관리</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 25px;">
					<span  class="text-muted"  style="">근태 > 부서 근태관리 > ${loginUser.dname }</span>
				</div>
			</div>
		</div>
	</section>


<!-- 	<button class="btn btn-primary socketTest" type="button" onclick="hrLogToDataBase()"> -->
<!--        <span class="navbar-toggler-icon">test</span> -->
<!--      </button> -->
<!-- 	<span style="margin-left: 7px;">전체인원 22명</span> -->
	<section class="week">
		<div class="row text-center" style="display: flex;">
			<div class="col-md-12" style="font-size: 1.5em;">
				<a class="btn btn-default btn-sm" href="javascript:changeWeek(-1, '${weekStart}');">&lt;</a>
				<span>&nbsp;&nbsp;${weekStart} - ${weekEnd }&nbsp;&nbsp;</span>
				<a class="btn btn-default btn-sm" href="javascript:changeWeek(1, '${weekStart}');">&gt;</a>
				<a class="" style="font-size: 0.6em;" href="javascript:location.href='teamList.do?mCode=M144000'">Today</a>
			</div>
		</div>
	</section>

	<section class="content">
			<div class="row col-md-2">
				<span style="padding-left: 10px;padding-bottom: 10px;">전체인원 ${allCount }명</span>
			</div>
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-md-12">

						<div class="card card-navy card-outline">
							<div class="card-header with-border" >
								<button type="button" class="btn btn-sm" style="cursor:default;">
									<span class="badge rounded-circle bg-black mt-1 mr-2" style="width:10px; height: 10px;">
										<span class="visually-hidden"></span>
									</span>정상
								</button>
								<button type="button" class="btn btn-sm" style="cursor:default;">
									<span class="badge rounded-circle bg-danger mt-1 mr-2" style="width:10px; height: 10px;">
										<span class="visually-hidden"></span>
									</span>지각
								</button>
								<button type="button" class="btn btn-sm" style="cursor:default;">
									<span class="badge rounded-circle bg-primary mt-1 mr-2" style="width:10px; height: 10px;">
										<span class="visually-hidden"></span>
									</span>수정
								</button>
<!-- 								<div class="row p-0"> -->
<!-- 									<div id="marker" class="col-5"> -->
<!-- 						                <ul style="display: flex; list-style: disc; padding-left: 30px; width: 230px; float: left; margin-bottom: 0px;"> -->
<!-- 						                    <li style="width: 50px;"><span><small>정상</small></span></li> -->
<!-- 						                    <li style="width: 50px; color: red;"><span style="color: black;"><small>지각</small></span></li> -->
<!-- 						                    <li style="width: 100px; color: #007bff;"><span style="color: black;"><small>수정(수정신청 1건)</small></span></li> -->
<!-- 						                </ul> -->
<!-- 						            </div> -->
<!-- 									<span style="float: left;">전체인원 22명</span> -->
									<div id="" class="card-tools" style="width: 450px;">
										<div class="input-group input-group-sm row" style="margin-top: 0;}">
											<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);">
												<option value="10">정렬개수</option>
												<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개</option>
												<option value="30" ${cri.perPageNum == 30 ? 'selected':''}>30개</option>
												<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개</option>
											</select>
											<select class="form-control col-md-3" name="searchType" id="searchType">
												<option value="np" ${cri.searchType eq 'np' ? 'selected':'' }>전체</option>
												<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>이름</option>
												<option value="p" ${cri.searchType eq 'p' ? 'selected':'' }>직위</option>
											</select>
											<input class="form-control" type="text" name="keyword"
												placeholder="검색어를 입력하세요" value="${param.keyword }" />
											<span class="input-group-append">
												<button class="btn btn-dark" type="button"
													onclick="list_go(1);" data-card-widget="search">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>
									</div>
<!-- 								</div> -->
							</div>

							<div class="card-body">
								<table class="table table-hover text-center">
									<tr style="font-size: 0.95em;">
										<th style="width: 15%;">이름</th>
										<th style="width: 15%;">근무시간</th>
										<th style="width: 10%; color: ${weekFullDate.D1 eq '2022-08-15' ?'red' :''}">
											<fmt:parseDate var="date1" value="${weekFullDate.D1 }" pattern="yyyy-MM-dd">
											</fmt:parseDate><fmt:formatDate value="${date1 }" pattern="MM-dd(E)"/>
										</th>
										<th style="width: 10%;">
											<fmt:parseDate var="date2" value="${weekFullDate.D2 }" pattern="yyyy-MM-dd">
											</fmt:parseDate><fmt:formatDate value="${date2 }" pattern="MM-dd(E)"/>
										</th>
										<th style="width: 10%;">
											<fmt:parseDate var="date3" value="${weekFullDate.D3 }" pattern="yyyy-MM-dd">
											</fmt:parseDate><fmt:formatDate value="${date3 }" pattern="MM-dd(E)"/>
										</th>
										<th style="width: 10%;">
											<fmt:parseDate var="date4" value="${weekFullDate.D4 }" pattern="yyyy-MM-dd">
											</fmt:parseDate><fmt:formatDate value="${date4 }" pattern="MM-dd(E)"/>
										</th>
										<th style="width: 10%;">
											<fmt:parseDate var="date5" value="${weekFullDate.D5 }" pattern="yyyy-MM-dd">
											</fmt:parseDate><fmt:formatDate value="${date5 }" pattern="MM-dd(E)"/>
										</th>
										<th style="width: 10%; color: #007bff;">
											<fmt:parseDate var="date6" value="${weekFullDate.D6 }" pattern="yyyy-MM-dd">
											</fmt:parseDate><fmt:formatDate value="${date6 }" pattern="MM-dd(E)"/>
										</th>
										<th style="width: 10%; color: red;">
											<fmt:parseDate var="date7" value="${weekFullDate.D7 }" pattern="yyyy-MM-dd">
											</fmt:parseDate><fmt:formatDate value="${date7 }" pattern="MM-dd(E)"/>
										</th>
									</tr>

									<c:if test="${empty teamList }" >
										<tr style="text-align: center;">
											<td colspan="9" style="padding-top: 10px;">
												<strong>해당 내용이 없습니다.</strong>
											</td>
										</tr>
									</c:if>

									<c:forEach items="${teamList }" var="teamOne">
										<tr style='font-size: 0.85em; text-align: left;' onclick="OpenWindow('empdetail.do?eno=${teamOne.emp.eno}','상세보기',800,800);">
											<td>
												<div style="align-items: center; display: flex; justify-content: center;">
													<div>
														<img class="rounded-circle emp_profile mr-2" src="${teamOne.emp.photo}">
													</div>
													<div>
														<span style="font-weight:bold; text-align: left; font-size: 0.98em;">${teamOne.emp.name} ${teamOne.emp.ppsname}</span>
														<div style="font-size:12px; text-align: left;"><p>${teamOne.emp.dname}</p></div>
													</div>
												</div>
											</td>
											<td>
												<c:set var="hrTimeSum" value="0" />
												<c:set var="stdTimeSum" value="0" />
												<c:set var="overTimeSum" value="0" />
												<c:forEach items="${teamOne.hrTable }" var="hrTable">
													<c:set var="hrTimeSum" value="${hrTimeSum + hrTable.hrTime}" />
													<c:set var="stdTimeSum" value="${stdTimeSum + hrTable.stdTime}" />
													<c:set var="overTimeSum" value="${overTimeSum + hrTable.overTime}" />
												</c:forEach>
												<span><b>주간누적 ${hrTimeSum }시간</b></span><br>
												기본 ${stdTimeSum} / 연장 ${overTimeSum}
											</td>
											<c:forEach items="${teamOne.hrTable }" var="hrTable">
												<td>
													<c:if test="${empty hrTable.onTime}">
														<span> - </span><br>
														<span> - </span>
													</c:if>
													<c:if test="${not empty hrTable.onTime}">
														<c:set var="onTime" value="${hrTable.onTime}"/>
														<fmt:parseDate value="1990-04-28" pattern="yyyy-MM-dd" var="noDate" />
														<fmt:parseDate value="1970-02-08" pattern="yyyy-MM-dd" var="goDate" />
														<fmt:parseDate value="1991-09-08" pattern="yyyy-MM-dd" var="huDate" />
<%-- 														<fmt:formatDate var="onTimeChek" value='${onTime}' pattern='yyyy-MM-dd'/> --%>
<%-- 														${onTimeChek} --%>
														<c:if test="${onTime < noDate && onTime > goDate}">
															<span style="color: red">결 근</span><br>
															<span style="color: red">결 근</span>
														</c:if>
														<c:if test="${onTime < goDate}">
															<span>출 장</span><br>
															<span>출 장</span>
														</c:if>
														<c:if test="${onTime < huDate && onTime > noDate}">
															<span style="color: gray">휴 가</span><br>
															<span style="color: gray">휴 가</span>
														</c:if>
														<c:if test="${onTime > huDate}">
															<c:if test="${hrTable.state eq 2}">
																<span style="color: red;">출 <fmt:formatDate value="${hrTable.onTime}" pattern="HH:mm:ss"/></span><br>
															</c:if>
															<c:if test="${hrTable.state eq 2}">
																<span style="color: red;">출 <fmt:formatDate value="${hrTable.onTime}" pattern="HH:mm:ss"/></span><br>
															</c:if>
															<c:if test="${hrTable.reqChange ne 1}">
																<span style="color: black;">출 <fmt:formatDate value="${hrTable.onTime}" pattern="HH:mm:ss"/></span><br>
															</c:if>
															<c:if test="${hrTable.state eq 1 and hrTable.reqChange eq 1}">
																<span style="color: black;">출 <fmt:formatDate value="${hrTable.onTime}" pattern="HH:mm:ss"/></span><br>
															</c:if>
															<span>퇴 <fmt:formatDate value="${hrTable.offTime}" pattern="HH:mm:ss"/></span>
														</c:if>
													</c:if>
												</td>
											</c:forEach>
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

<c:if test="${from eq 'hrLogToDataBase'}" >
	<script>
	Swal.fire({
	      icon: 'success',
	      title: '근태정보가 DB에 저장되었습니다.',
	      confirmButtonColor: '#3085d6',
	    });
	</script>
</c:if>

<script type="text/javascript">

//pagination
function list_go(page,url){
// 	alert(page);
	if(!url) url="teamList.do";

	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

	jobForm.find("[name='weekStart']").val('${weekStart}');

	console.log(url);

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}

function modify() {
	Swal.fire({
	      icon: 'success',
	      title: '변경내용띄울거야~',
	      confirmButtonColor: '#3085d6',
	    });
}

function hrLogToDataBase() {
	location.href='hrLogToDataBase.do?mCode='+'${menu.mcode}';
}
</script>

<script type="text/javascript">
//다른 달 데이터 조회
function changeWeek(num, weekStart) {
	console.log(num);

// 	var weekStart = ${weekStart};
	console.log(weekStart);

// 	var weekStartSplit = weekStart.split('-');

// 	var year = parseInt(weekStartSplit[0]);
// 	var month = weekStartSplit[1]-1;
// 	var date = weekStartSplit[2] + parseInt(num)*7;

	var date = new Date(weekStart);
// 	console.log(date);

	date.toLocaleString()
	date.setDate(date.getDate() + parseInt(num)*7);
	var parseDate = date.toISOString().split('T')[0];
	console.log(parseDate);


	var url="teamList.do";

	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(1);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

	jobForm.find("[name='weekStart']").val(parseDate);

	console.log(url);

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();


<%-- 	location.href='<%=request.getContextPath()%>/ehr/teamList.do?weekStart='+parseDate+'&mCode='+'${menu.mcode}'; --%>
}
</script>

</body>


