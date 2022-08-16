<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/ehr.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
	select#searchType {
	    list-style-type: none;
	    width: 140px;
	    float: left;
	}
	.info-box-number{
		font-size: 1.3em;
		color: #3399FF;
	}
	td{
		text-align: center !important;
	}
	.table td,.card-footer{
		padding: 6px 0.75rem;
	}
	.card-header, .table th{
		padding: 8px 0.75rem;
	}
	</style>
</head>
<body>
<c:set var="today" value="<%=new java.util.Date() %>"/>
<div class="wrapper">
	<section class="content-header p-0">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3 class="title" style="padding-left: 10px;">내 연차 관리</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 25px;">
					<span  class="text-muted">근태 > 내 연차관리 </span>
				</div>
			</div>
		</div>
	</section>

	<section class="top">
<!-- 		<div class="card"> -->
			<div class="row">
   				<div class="card-body" style="text-align:left; padding: 7px;">
					<div class="col-12">
						<div class="info-box card-navy card-outline" style="padding: 0px; margin-bottom: 0px;">
							<span class="info-box-icon" style="width: 60; height: 60;">
								<img data-cfsrc="" width="60px" height="60px" class="rounded-circle ml-2" alt="img" src="${employee.photo }">
							</span>
							<div class="info-box-content">
								<div class="row text-center">
									<div class="col-md-3" style="padding-top: 9px;">
										<span class="info-box-text text-left"><b>${employee.name }&nbsp;&nbsp;${employee.ppsname }</b></span>
										<span class="info-box-text text-left" style="font-size: 0.8em;">${employee.dname }</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">발생 연차</span>
										<span class="info-box-number">${vacation.generVac }</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">총 연차</span>
										<span class="info-box-number">${vacation.totalVac }</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">사용 연차</span>
										<span class="info-box-number">${vacation.useVac }</span>
									</div>
									<div class="col-md-2">
										<span class="info-box-text">잔여 연차</span>
										<span class="info-box-number">${vacation.remainVac }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
    		</div>
<!-- 	     </div> -->
   	</section>

	<section class="month" style="padding-top: 10px;">
		<div class="row">
			<div class="input-group col-12 " style="margin-bottom: 10px;">
				<span style="font-size: 1.1em; margin-left: 20px; margin-top: 5px;">연차 사용기간  : </span>
				<div class="col-3 ml-3">
					<select id="inputState" class="form-control" onchange="vacation();">
					<c:forEach items="${vacationPeriod }" var="vp">
						<option value="<fmt:formatDate value="${vp.STARTDATE }" pattern="yyyy"/>" ><fmt:formatDate value="${vp.STARTDATE }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${vp.ENDDATE }" pattern="yyyy-MM-dd"/></option>

					</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</section>


	<div class="row">
		<div class="col-12" style="margin-bottom: 5px;">
			<div class="card card-navy">
				<div class="card-header">
					<h3 class="card-title" style="font-size: medium;">사용내역</h3>
				</div>

				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<th style="width: 30%" >사용 기간</th>
								<th style="width: 20%" >사용 연차 일수</th>
								<th style="width: 30%" >휴가 내용</th>
								<th style="width: 20%" >잔여 연차 일수</th>
							</tr>
						</thead>
						<tbody id="usageHistory">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-12">
			<div class="card card-navy">
				<div class="card-header">
					<h3 class="card-title" style="font-size: medium;">생성내역</h3>
				</div>
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<th>등록일</th>
								<th>사용 기한</th>
								<th>발생일수</th>
								<th>내용</th>
							</tr>
						</thead>
						<tbody id="produceHistory">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
//
$(function(){
	vacationUsageHistory();
	vacationProduceHistory();
})


function vacation(){
	vacationUsageHistory();
	vacationProduceHistory();
}
</script>
<%@ include file="./vacation_js.jsp" %>
</body>
