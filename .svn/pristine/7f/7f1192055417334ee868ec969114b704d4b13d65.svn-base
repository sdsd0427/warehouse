<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
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
		#innerTable th, #innerTable td{
			border: none;
			vertical-align: middle;
		}
/* 		.page-link { */
/* 		    line-height: 1; */
/* 		    color: #0c4b8d; */
/* 		    background-color: #fff; */
/* 		    border: 1px solid #0c4b8d; */
/* 		} */
/* 		.page-item.active .page-link { */
/* 		    z-index: 3; */
/* 		    color: #fff; */
/* 		    background-color: #0c4b8d; */
/* 		    border-color: #0c4b8d; */
/* 		} */
/**/
	</style>
</head>

<title>근무시간 상세</title>

<body>
	<!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h3>근무시간 상세</h3>
	  			</div>
	  		</div>
	  	</div>
	</section>
	<!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="card card-outline card-navy ml-2 mr-2">

<!-- 					<div class="card-header"> -->
<!-- 						<div class ="card-tools"> -->
<!-- 							<button type="button" class="btn btn-sm btn-outline-dark " id="registBtn" onclick="regist_go();">수 정</button> -->
<!-- 							<button type="button" class="btn btn-sm btn-outline-danger " id="cancelBtn" onclick="CloseWindow();" >취 소</button> -->
<!-- 						</div> -->
<!-- 					</div>end card-header  -->

					<div class="card-body pt-1">
						<div class ="mb-1 text-right">
							<button type="button" class="btn btn-sm btn-outline-primary " id="registBtn" onclick="">변 경</button>
							<button type="button" class="btn btn-sm btn-outline-dark " id="cancelBtn" onclick="CloseWindow();" >취 소</button>
						</div>
						<form role="form" method="post" action="hrTypeModify.do" name="registForm">
							<table class="table" style="width: 100%; font-size: 0.9em; vertical-align: middle;">
								<fmt:parseDate value="1990-04-28" pattern="yyyy-MM-dd" var="noDate" />
								<fmt:parseDate value="1970-02-08" pattern="yyyy-MM-dd" var="goDate" />
								<fmt:parseDate value="1991-09-08" pattern="yyyy-MM-dd" var="huDate" />
								<tr style="">
									<th style="width: 25%; height:40px; vertical-align: middle;">
										시작일시
									</th>
									<td style="width: 75%;vertical-align: middle; text-align: center;">
									<div class="row">
									<div class="col-6">
										<c:if test="${hrTime.onTime < noDate && hrTime.onTime > goDate}">
											<input type="date" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime < goDate}">
											<input type="date" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime < huDate && hrTime.onTime > noDate}">
											<input type="date" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime > huDate}">
											<input type="date" name="offTime" class="form-control form-control-sm" value="${onDate }">
										</c:if>
									</div>
									<div class="col-6">
										<c:if test="${hrTime.onTime < noDate && hrTime.onTime > goDate}">
											<input type="time" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime < goDate}">
											<input type="time" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime < huDate && hrTime.onTime > noDate}">
											<input type="time" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime > huDate}">
											<input type="time" name="offTime" class="form-control form-control-sm" value="${onTime }">
										</c:if>
									</div>
									</div>
									</td>
								</tr>
								<tr style="">
									<th style="width: 25%; height:40px; vertical-align: middle;">
										종료일시
									</th>
									<td style="width: 75%;vertical-align: middle; text-align: center;">
									<div class="row">
									<div class="col-6">
										<c:if test="${hrTime.onTime < noDate && hrTime.onTime > goDate}">
											<input type="date" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime < goDate}">
											<input type="date" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime < huDate && hrTime.onTime > noDate}">
											<input type="date" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime > huDate}">
											<input type="date" name="offTime" class="form-control form-control-sm" value="${offDate }">
										</c:if>
									</div>
									<div class="col-6">
										<c:if test="${hrTime.onTime < noDate && hrTime.onTime > goDate}">
											<input type="time" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime < goDate}">
											<input type="time" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime < huDate && hrTime.onTime > noDate}">
											<input type="time" name="offTime" class="form-control form-control-sm" value="">
										</c:if>
										<c:if test="${hrTime.onTime > huDate}">
											<input type="time" name="offTime" class="form-control form-control-sm" value="${offTime }">
										</c:if>
									</div>
									</div>
									</td>
								</tr>
								<tr>
									<th style="width: 25%;vertical-align: middle;">근무상태</th>
									<td style="">
										<select  class="form-control form-control-sm" name="hrType" id="hrType" >
									  		<option value="1" ${hrTime.state eq 1 ? 'selected':'' } style="background: none;" >정상</option>
									  		<option value="2" ${hrTime.state eq 2 ? 'selected':'' } style="background: none;" >지각</option>
									  		<option value="3" ${hrTime.state eq 3 ? 'selected':'' } style="background: none;" >휴가</option>
									  		<option value="0" ${hrTime.state eq 0 ? 'selected':'' } style="background: none;" >결근</option>
									  	</select>
									</td>
								</tr>
								<tr>
									<th style="width: 25%;vertical-align: middle;">변경사유</th>
									<td style="">
										<textarea rows="5" cols="55" name="text" id="text" placeholder="변경사유를 작성하세요"></textarea>
									</td>
								</tr>

							</table>
<!-- 							<div> -->
<!-- 								<textarea class="textarea" name="wcontent" id="content" rows="20" -->
<!-- 											cols="90" placeholder="1000자 내외로 작성하세요." ></textarea> -->
<!-- 							</div> -->
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->





</body>
