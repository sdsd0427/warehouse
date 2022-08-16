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

<title>근무계획표</title>

<body>
	<!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h3>근무계획표</h3>  				
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
							<button type="button" class="btn btn-sm btn-outline-primary " id="registBtn" onclick="regist_go();">제 출</button>
							<button type="button" class="btn btn-sm btn-outline-dark " id="cancelBtn" onclick="CloseWindow();" >취 소</button>
						</div>
						<form role="form" method="post" action="hrTypeModify.do" name="registForm">
							<table class="table" style="width: 100%; font-size: 0.9em; vertical-align: middle;">
								<tr style="">
									<th style="width: 25%; height:40px; vertical-align: middle;">
										요청자
									</th>
									<td style="width: 75%;vertical-align: middle; text-align: center;">
										<div> (${loginUser.dname}) ${loginUser.name} ${loginUser.ppsname}
										</div>
										<input type="hidden" name="eno" value="${loginUser.eno }">
									</td>
								</tr>
								<tr>
									<th style="width: 25%;vertical-align: middle;">근무유형 선택</th>
									<td style="">
										<select onchange="changeType();" class="form-control form-control-sm" name="hrType" id="hrType" style="text-align: center; ">
									  		<option value="기본근무" style="background: none;" >기본근무</option>
									  		<option value="유연근무" style="background: none;" >유연근무</option>
									  		<option value="재택근무" style="background: none;" >재택근무</option>
									  	</select>
									</td>
								</tr>
<!-- 								<tr> -->
<!-- 									<th style="width: 25%;vertical-align: middle;">적용기간</th> -->
<!-- 									<td> -->
<!-- 										<div class="row text-center pl-2" style="vertical-align: middle;"> -->
<%-- 											<input style="width :44%;" type="date" name="wend" class="form-control form-control-sm" value="<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>"> --%>
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 											<input style="width :44%;" type="date" name="wend" class="form-control form-control-sm" value=""> -->
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 								</tr> -->
								<tr>
									<th style="width: 25%;vertical-align: middle;">세부 계획표</th>
									<td style="display: flex; justify-content: center" class="innerTarget">
										<table id="innerTable" style="width: 100%; font-size: 0.85em;">
											<tr>
												<th style="width: 25%;"><span>근무요일</span></th>
												<td>
													<fieldset data-role="controlgroup" data-type="horizontal">
														<input type="checkbox" name="hrDay" id="checkbox-1" class="hrDay" value="월" checked="checked" onClick="return false;" /> 
														<label for="checkbox-1">월</label> 
														<input type="checkbox" name="hrDay" id="checkbox-2" class="hrDay" value="화" checked="checked" onClick="return false;" /> 
														<label for="checkbox-2">화</label>
														<input type="checkbox" name="hrDay" id="checkbox-3" class="hrDay" value="수" checked="checked" onClick="return false;" /> 
														<label for="checkbox-3">수</label> 
														<input type="checkbox" name="hrDay" id="checkbox-4" class="hrDay" value="목" checked="checked" onClick="return false;" /> 
														<label for="checkbox-4">목</label>
														<input type="checkbox" name="hrDay" id="checkbox-5" class="hrDay" value="금" checked="checked" onClick="return false;" /> 
														<label for="checkbox-5">금</label> 
														<input type="checkbox" name="hrDay" id="checkbox-6" class="hrDay" value="토" readonly="readonly" onClick="return false;"/> 
														<label for="checkbox-6">토</label>
														<input type="checkbox" name="hrDay" id="checkbox-7" class="hrDay" value="일" readonly="readonly" onClick="return false;"/> 
														<label for="checkbox-7">일</label> 
													</fieldset>
												</td>
											</tr>
											<tr>
												<th><span>출근시간</span></th>
												<td>
													<input type="time" name="onTime" class="form-control form-control-sm" value="09:00" readonly>
												</td>
											</tr>
											<tr>
												<th><span>퇴근시간</span></th>
												<td>
													<input type="time" name="offTime" class="form-control form-control-sm" value="18:00" readonly>
												</td>
											</tr>
											<tr>
												<th><span>휴게시간</span></th>
												<td>
													<input type="text" name="restTime" class="form-control form-control-sm" value="1" disabled="disabled">
												</td>
											</tr>
											<tr>
												<th><span>주간근로</span></th>
												<td>
													<div class="row pl-2 pr-2">
														<input type="text" name="weekTimeStr" class="form-control form-control-sm col-9" readonly value="40시간">
														<button type="button" class="btn btn-sm btn-outline-dark col-3" id="registBtn" onclick="calcWeekTime();">계산</button>
														<input type="hidden" id="calcOk" value="1">
													</div>
												</td>
											</tr>
										</table>
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

<c:if test="${from eq 'modifyHrType'}" >
	<script>
		Swal.fire({
	      icon: 'success',
	      title: '근무 유형이 변경되었습니다.',
	      confirmButtonColor: '#3085d6',
	    	}).then(function(){
			window.close();
	 		window.opener.location.href="<%=request.getContextPath()%>/ehr/main.do?mCode=M140000";
	      });
// 		var enoList = ${retWorkManagerEno};

// 		for(var eno of enoList){
// 			console.log(eno);
// 			opener.parent.sendSignal(eno, "${retWorkTitle}", "B101", "work/myWorkList.do", 'M113000');
// 		}

	</script>
</c:if>
	
<script>
$(function(){
	summernote_go($('textarea[name="wcontent"]'), '<%=request.getContextPath()%>');
});
</script>	

<script>
function regist_go() {
	if($('#calcOk').val() != 1){
		Swal.fire({
		      icon: 'warning',
		      title: '주간근로 시간을 계산하세요.',
		      confirmButtonColor: '#3085d6',
		    	}).then(function(){
					$('input[name="weekTime"]').focus();
		      });
		return;
	}
	
	var form = document.registForm;
	form.submit();
}
</script>	

<script>
function changeType() {
	var hrType = $('#hrType').val();
	console.log(hrType);
	if("기본근무" == hrType){
		printTypeForm(hrType, $('.innerTarget'), $('#table-template1'), $('#innerTable'));
	} else if("유연근무" == hrType){
		printTypeForm(hrType, $('.innerTarget'), $('#table-template2'), $('#innerTable'));
	} else if("재택근무" == hrType){
		printTypeForm(hrType, $('.innerTarget'), $('#table-template3'), $('#innerTable'));
	}
	
}
</script>	

<script>
function calcWeekTime() {
	var checkNum = $('input[type="checkbox"]:checked').length;
	var cheked =[];
	$('input[type="checkbox"]:checked').each(function(i, iVal) {
		cheked.push($(iVal).val());
	});
// 	console.log(checkNum);
// 	console.log(cheked);
	
	if(checkNum < 1){
		Swal.fire({
		      icon: 'warning',
		      title: '근무요일을 선택해 주세요.',
		      confirmButtonColor: '#3085d6',
		    	}).then(function(){
		    		$('input[type="checkbox"]').focus();
		      });
		return;
	}
	if($('input[name="onTime"]').val()==""){
		Swal.fire({
		      icon: 'warning',
		      title: '출근시간을 선택해 주세요.',
		      confirmButtonColor: '#3085d6',
		    	}).then(function(){
		    		$('input[name="onTime"]').focus();
		      });
		return;
	}
	if($('input[name="offTime"]').val()==""){
		Swal.fire({
		      icon: 'warning',
		      title: '퇴근시간을 선택해 주세요.',
		      confirmButtonColor: '#3085d6',
		    	}).then(function(){
		    		$('input[name="offTime"]').focus();
		      });
		return;
	}
	
	
	var onTime = $('input[name="onTime"]').val();
	var offTime = $('input[name="offTime"]').val();
// 	console.log(onTime);
// 	console.log(offTime);
	
	const date1 = new Date(2020, 6, 1, onTime.split(":")[0], onTime.split(":")[1]);
	const date2 = new Date(2020, 6, 1, offTime.split(":")[0], offTime.split(":")[1]);
	// 2020년 7월 1일 2시 30분 4초

	var elapsedMSec = date2.getTime() - date1.getTime(); // 9004000
	var elapsedSec = elapsedMSec / 1000; // 9004
	var elapsedMin = elapsedMSec / 1000 / 60; // 150.0666...
	var elapsedHour = elapsedMSec / 1000 / 60 / 60; // 2.501111...
	elapsedHour = Math.floor(elapsedHour);
	
	console.log("결과",elapsedHour);
	
	if(elapsedHour > 7){
		if($('input[name="restTime"]').val() == ""){
			Swal.fire({
			      icon: 'warning',
			      title: '일일 8시간 이상 근무시 휴게시간 1시간은 필수입니다.',
			      confirmButtonColor: '#3085d6',
			    	}).then(function(){
			    		$('input[name="restTime"]').focus();
			      });
			return;
		}
	}
	
	
	var restTime = $('input[name="restTime"]').val().trim();
	var result = (elapsedHour-restTime)*checkNum;
	console.log("결과",result);
	
	$('input[name="weekTimeStr"]').val(result+"시간");
	$('#calcOk').val(1);
	
}
</script>	

<script type="text/x-handlebars-template"  id="table-template1" >
<table id="innerTable" style="width: 100%; font-size: 0.85em;">
	<tr>
		<th style="width: 25%;"><span>근무요일</span></th>
		<td>
			<fieldset data-role="controlgroup" data-type="horizontal">
				<input type="checkbox" name="hrDay" id="checkbox-1" class="hrDay" value="월" checked="checked" onClick="return false;"/> 
				<label for="checkbox-1">월</label> 
				<input type="checkbox" name="hrDay" id="checkbox-2" class="hrDay" value="화" checked="checked" onClick="return false;"/> 
				<label for="checkbox-2">화</label>
				<input type="checkbox" name="hrDay" id="checkbox-3" class="hrDay" value="수" checked="checked" onClick="return false;"/> 
				<label for="checkbox-3">수</label> 
				<input type="checkbox" name="hrDay" id="checkbox-4" class="hrDay" value="목" checked="checked" onClick="return false;"/> 
				<label for="checkbox-4">목</label>
				<input type="checkbox" name="hrDay" id="checkbox-5" class="hrDay" value="금" checked="checked" onClick="return false;"/> 
				<label for="checkbox-5">금</label> 
				<input type="checkbox" name="hrDay" id="checkbox-6" class="hrDay" value="토" onClick="return false;"/> 
				<label for="checkbox-6">토</label>
				<input type="checkbox" name="hrDay" id="checkbox-7" class="hrDay" value="일" onClick="return false;"/> 
				<label for="checkbox-7">일</label> 
			</fieldset>
		</td>
	</tr>
	<tr>
		<th><span>출근시간</span></th>
		<td>
			<input type="time" name="onTime" class="form-control form-control-sm" value="09:00" readonly>
		</td>
	</tr>
	<tr>
		<th><span>퇴근시간</span></th>
		<td>
			<input type="time" name="offTime" class="form-control form-control-sm" value="18:00" readonly>
		</td>
	</tr>
	<tr>
		<th><span>휴게시간</span></th>
		<td>
			<input type="text" name="restTime" class="form-control form-control-sm" value="1" disabled="disabled">
		</td>
	</tr>
	<tr>
		<th><span>주간근로</span></th>
		<td>
			<div class="row pl-2 pr-2">
				<input type="text" name="weekTimeStr" class="form-control form-control-sm col-9" readonly value="40시간">
				<button type="button" class="btn btn-sm btn-outline-dark col-3" id="registBtn" onclick="calcWeekTime();">계산</button>
				<input type="hidden" id="calcOk" value="1">
			</div>
		</td>
	</tr>
</table>
</script>

<script type="text/x-handlebars-template"  id="table-template2" >
<table id="innerTable" style="width: 100%; font-size: 0.85em;">
	<tr>
		<th style="width: 25%;"><span>근무요일</span></th>
		<td>
			<fieldset data-role="controlgroup" data-type="horizontal">
				<input type="checkbox" name="hrDay" id="checkbox-1" class="hrDay" value="월"/> 
				<label for="checkbox-1">월</label> 
				<input type="checkbox" name="hrDay" id="checkbox-2" class="hrDay" value="화"/> 
				<label for="checkbox-2">화</label>
				<input type="checkbox" name="hrDay" id="checkbox-3" class="hrDay" value="수"/> 
				<label for="checkbox-3">수</label> 
				<input type="checkbox" name="hrDay" id="checkbox-4" class="hrDay" value="목"/> 
				<label for="checkbox-4">목</label>
				<input type="checkbox" name="hrDay" id="checkbox-5" class="hrDay" value="금"/> 
				<label for="checkbox-5">금</label> 
				<input type="checkbox" name="hrDay" id="checkbox-6" class="hrDay" value="토"/> 
				<label for="checkbox-6">토</label>
				<input type="checkbox" name="hrDay" id="checkbox-7" class="hrDay" value="일"/> 
				<label for="checkbox-7">일</label> 
			</fieldset>
		</td>
	</tr>
	<tr>
		<th><span>출근시간</span></th>
		<td>
			<input type="time" name="onTime" class="form-control form-control-sm" value="">
		</td>
	</tr>
	<tr>
		<th><span>퇴근시간</span></th>
		<td>
			<input type="time" name="offTime" class="form-control form-control-sm" value="">
		</td>
	</tr>
	<tr>
		<th><span>휴게시간</span></th>
		<td>
			<input type="text" name="restTime" class="form-control form-control-sm" value="" placeholder="숫자만 입력하세요.">
		</td>
	</tr>
	<tr>
		<th><span>주간근로</span></th>
		<td>
			<div class="row pl-2 pr-2">
				<input type="text" name="weekTimeStr" class="form-control form-control-sm col-9" readonly value="">
				<button type="button" class="btn btn-sm btn-outline-dark col-3" id="registBtn" onclick="calcWeekTime();">계산</button>
				<input type="hidden" id="calcOk" value="0">
			</div>
		</td>
	</tr>
</table>
</script>

<script type="text/x-handlebars-template"  id="table-template3" >
<table id="innerTable" style="width: 100%; font-size: 0.85em;">
	<tr>
		<th style="width: 25%;"><span>근무요일</span></th>
		<td>
			<fieldset data-role="controlgroup" data-type="horizontal">
				<input type="checkbox" name="hrDay" id="checkbox-1" class="hrDay" value="월"/> 
				<label for="checkbox-1">월</label> 
				<input type="checkbox" name="hrDay" id="checkbox-2" class="hrDay" value="화"/> 
				<label for="checkbox-2">화</label>
				<input type="checkbox" name="hrDay" id="checkbox-3" class="hrDay" value="수"/> 
				<label for="checkbox-3">수</label> 
				<input type="checkbox" name="hrDay" id="checkbox-4" class="hrDay" value="목"/> 
				<label for="checkbox-4">목</label>
				<input type="checkbox" name="hrDay" id="checkbox-5" class="hrDay" value="금"/> 
				<label for="checkbox-5">금</label> 
				<input type="checkbox" name="hrDay" id="checkbox-6" class="hrDay" value="토"/> 
				<label for="checkbox-6">토</label>
				<input type="checkbox" name="hrDay" id="checkbox-7" class="hrDay" value="일"/> 
				<label for="checkbox-7">일</label> 
			</fieldset>
		</td>
	</tr>
	<tr>
		<th><span>출근시간</span></th>
		<td>
			<input type="time" name="onTime" class="form-control form-control-sm" value="">
		</td>
	</tr>
	<tr>
		<th><span>퇴근시간</span></th>
		<td>
			<input type="time" name="offTime" class="form-control form-control-sm" value="">
		</td>
	</tr>
	<tr>
		<th><span>휴게시간</span></th>
		<td>
			<input type="text" name="restTime" class="form-control form-control-sm" value="" placeholder="숫자만 입력하세요.">
		</td>
	</tr>
	<tr>
		<th><span>전용IP</span></th>
		<td>
			<input type="text" name="ipAddress" class="form-control form-control-sm" value="" placeholder="192.168.34.63">
		</td>
	</tr>
	<tr>
		<th><span>주간근로</span></th>
		<td>
			<div class="row pl-2 pr-2">
				<input type="text" name="weekTimeStr" class="form-control form-control-sm col-9" readonly value="">
				<button type="button" class="btn btn-sm btn-outline-dark col-3" id="registBtn" onclick="calcWeekTime();">계산</button>
				<input type="hidden" id="calcOk" value="0">
			</div>
		</td>
	</tr>
</table>
</script>

<script>
function printTypeForm(dataArr,target,templateObject, removeClass){
	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	removeClass.remove();

	target.append(html);
}
</script>	



</body>
