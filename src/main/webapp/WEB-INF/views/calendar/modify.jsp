<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/resources/js/jquery.datetimepicker.full.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style>
.row {
	flex-wrap: inherit !important;
}

label {
	display: inline-block;
	margin-bottom: 0.5rem;
}

input[type=text], .textarea {
	border: 1px solid darkgray;
	border-radius: 3px;
}

.datetimepicker {
	width: 130px;
	padding-left: 7px;
}

input[type=text] {
	height: 38px;
}

.nemo {
	margin-bottom: 4px;
	margin-top: 10px;
	margin-left: 128px;
	display: flex;
}

.rBtn {
	margin-left: 10px;
}

.div1, .div2 {
	width: 130px;
}

.close3:after {
	content: "\00d7";
	font-size: 40pt;
	line-height: 25px;
}

img {
	width: 35px;
}
</style>
</head>

<body>
<div class="wrapper" style="padding: 0px 5px;">
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h3>일정수정</h3>  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="card card-outline card-navy">
					<div class="card-header">
						<h3 class="card-title p-1">일정 수정</h3>
						<div class ="card-tools">
							<button type="button" class="btn btn-sm btn-outline-primary" id="modifyBtn" onclick="modify_go();">완료</button>
							<button type="button" class="btn btn-sm btn-outline-dark" id="cancelBtn" onclick="CloseWindow();">취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="modify.do" name="modifyForm">
							<input type="hidden" name="ccode" value="${calendar.ccode }">
							<div class="form-group row">
<%-- 								<input type="hidden" value="${loginUser.eno }" name="eno"> --%>
								<label for="title" class="col-2">제목</label>
								<input type="text" id="title" name="title" class="form-control col-10" value="${calendar.title }">
							</div>							
							<div class="form-group row">
								<label for="" class="col-2">기간</label>
								<div class="col-10" style="float: right; padding-left: 0px; margin-left: -9px;">
									<div class="col-6" style="float: left; display: flex;">
										<input class="datetimepicker" type="text" name="sdate"  id="sdate" value="${calendar.start }" >
										<div id="edateHide">
											&nbsp;&nbsp;~&nbsp;&nbsp;
											<input class="datetimepicker" type="text" name="edate"  id="edate" value="${calendar.end }" onchange="dateSetting();">
										</div>
									</div>
									<div class="form-group col-6" style="float:right; padding-left: 30px; margin-top: 5px;">
										<label for="allday">종일</label>
										<div class="form-check-label" style="margin-top: -30px;">
											<input type="checkbox" class="form-check-input" name="allday" id="allday" ${calendar.allday eq 'true' ? 'checked' : ''} onchange="allDayEvent();">
										</div>
									</div>
								</div>
							</div>							
							<div class="form-group row">
								<label for="catecode" class="col-2">일정 분류</label> 
								<select class="col-2" name="catecode" id="catecode" disabled style="height: 38px;" onclick="addSelect();">
                       				<option value="0" ${calendar.catecode eq '0' ? 'selected':'' }>선택</option>
                       				<option value="1" ${calendar.catecode eq '1' ? 'selected':'' }>개인일정</option>
                       				<option value="2" ${calendar.catecode eq '2' ? 'selected':'' }>부서일정</option>
                       				<option value="3" ${calendar.catecode eq '3' ? 'selected':'' }>회사일정</option>
                    			</select>

<%-- 								<c:if test="${calendar.catecode eq '1'}"> --%>
<!-- 									<label for="catedetail"></label> -->
<!-- 									 <select name="catedetail" id="catedetail" disabled="disabled" style="height: 38px; width: 125px; margin-left: 10px;"> -->
<%-- 										<option value="1" ${calendar.catedetail eq '1' ? 'selected':'' }>재택근무</option> --%>
<%-- 										<option value="2" ${calendar.catedetail eq '2' ? 'selected':'' }>세미나</option> --%>
<%-- 										<option value="3" ${calendar.catedetail eq '3' ? 'selected':'' }>특강</option> --%>
<!-- 									</select> -->
<%-- 								</c:if> --%>
							</div>
<!-- 							<div class="form-group row" data-toggle="modal" data-target="#modal-default" style="display: contents;"> -->
<!-- 								<label for="" class="col-2" style="margin-left: -9px;">참조자</label>  -->
<!-- 								<button type="button" class=" btn btn-sm btn-outline-dark col-2" onclick="referSelect();" style="height: 38px;">참조자 선택</button><br> -->
<!-- 								<div class="manager-list col-12" id="emp_List" style="align-items: center; display: flex; position: relative; padding-left: 126px;"> -->
<%-- 									<c:forEach items="${employee }" var="emp"> --%>
										
<%-- 										<div class="emp_select_card col-4" data-eno="${emp.eno }" style="align-items: center; display: flex; justify-content: center; flex: 0% !important;"> --%>
<!-- 											<div style="padding: 5px; position: relative;"> -->
<%-- 												<input type="hidden" name="calRefEno" value="${emp.eno }">		 --%>
<%-- 												<label for="${emp.eno }"><img class="table-avatar emp_profile" src="${emp.photo }"></label> --%>
<!-- 											</div> -->
<!-- 											<div class="text-left"  style="position: relative;"> -->
<!-- 												<div style="display: flex; align-items: center"> -->
<%-- 													<p style="font-size: 12px; font-weight: bold">${emp.name} </p>&nbsp;&nbsp; --%>
<%-- 													<i class="fas fa-times removeBtn text-danger" onclick="removeManager('${emp.eno}')" style="cursor:pointer;"></i> --%>
<!-- 												</div> -->
<!-- 												<div style="font-size: 8px;"> -->
<%-- 													<p>${emp.ppsname}</p> --%>
<%-- 													<p>${emp.dname}</p> --%>
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
										
<%-- 									</c:forEach> --%>
<!-- 								</div> -->
<%-- 								<input type="hidden" value="${loginUser.eno }" name="eno"> --%>
<!-- 							</div> -->
							<div class="form-group row">
								<label for="space" class="col-2">장 소</label>
								<input type="text" id="space" name="space" class="col-10" value="${calendar.space }">
							</div>
							<div class="form-group row">
								<label for="content" class="col-2">내 용</label>
								<textarea class="textarea col-10" name="content" id="content" cols="80" rows="5" placeholder="일정 상세 내용을 작성하세요.">${calendar.content }</textarea>
							</div>
<!-- 							<div class="form-group row"> -->
<!-- 								<label for="" class="col-2">알 림</label> -->
<!-- 								<div class="col-10 calmethod" > -->
<!-- 									<select class=""id="calarmtime" name="calarmtime" style="margin-left: -8px; height: 38px; width: 90px !important;" onchange="time();"> -->
<%-- 	                       				<option value="5" ${calendar.calAlarm.calarmtime eq '5' ? 'selected':'' }>없음</option> --%>
<%-- 	                       				<option value="1" ${calendar.calAlarm.calarmtime eq '1' ? 'selected':'' }>1시간전</option> --%>
<%-- 	                       				<option value="2" ${calendar.calAlarm.calarmtime eq '2' ? 'selected':'' }>1일전</option> --%>
<%-- 	                       				<option value="3" ${calendar.calAlarm.calarmtime eq '3' ? 'selected':'' }>2일전</option> --%>
<%-- 	                       				<option value="4" ${calendar.calAlarm.calarmtime eq '4' ? 'selected':'' }>1주일전</option> --%>
<!-- 	                    			</select>&nbsp;&nbsp; -->
<!--                     			</div> -->
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
    
    
    <div class="modal fade" id="modal-default" role="dialog" style="display:none; border-radius: 0.2rem;">
		<div class="modal-dialog modal-mg" style="width: 350px">
			<div class="modal-content">
				<div class="modal-header" style="background: #17A2B8; color: white;">
					<h4 class="modal-title">참조자 선택</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card card-navy">
						<form class="form-horizontal">
							<div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab" style="margin: 20px">
								<span class="material-symbols-outlined">
									corporate_fare
								</span>
							  	<span >PoJo기업</span>
								<div id="organization" ></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		
<script>
// window.onload=function(){
<%-- 	summernote_go($('#content'),'<%=request.getContextPath()%>');  --%>
// }
console.log('${calendar}')

// 일정 수정
function modify_go(){
	var form = $('form[name="modifyForm"]');

	//유효성 체크
	if($("input[name='title']").val()==""){
		Swal.fire({
		      icon: 'warning',
		      title: '제목은 필수입니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				$("input[name='title']").focus();
		    });
		return;
	}
	
	form.submit()
}

// 팝업창 닫기
function CloseWindow(){
	window.opener.location.reload(true);		
	window.close();
}

// datetimepicker 사용
$('.datetimepicker').datetimepicker({
	'minTime' : '00:00',
	'maxTime' : '24:00'
});


// 개인일정 옵션 
// function addSelect(){
// 	var cate = $('#catecode option:selected').val();
	
// 	if(cate == "1"){
// 		$("#catedetail").show();
// 	}else{
// 		$("#catedetail").hide();
// 	}
// }

//시작시간보다 끝시간을 나중으로 설정
function dateSetting() {
	if($('#edate').val() < $('#sdate').val()){
		Swal.fire({
	      icon: 'warning',
	      title: '종료시간을 시작시간보다 나중으로 선택해주세요.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			$('#sdate').val('');
			$('#edate').val('');
			$('#edate').focus();
	      });
		return;
	}
}


//하루종일 체크 여부
function allDayEvent(){
	if($('#allday').is(":checked") == true){
		var sdate = $('#sdate').val();
		var scut = sdate.substring(0,10);
		scut = scut + ' 00:00'
		
		$('#sdate').val(scut);
		$('#edate').val(scut);
		$("#edateHide").hide();
		
	}else{
		$('#edate').val('');
		$("#edateHide").show();
	}
}

//알림 없음일 경우
function time(){
	$('#calarmmethod').remove();
	val = $("#calarmtime").val();
	str = "";
	if(val != 5){
		str += '<select class="" id="calarmmethod" name="calarmmethod" style="height: 38px; width: 90px !important;">';
		str += '<option value="0" >선택</option>';
		str += '<option value="4" >없음</option>';
		str += '<option value="1" >푸시알림</option>';
		str += '<option value="2" >메일알림</option>';
		str += '<option value="3" >문자알림</option>';
		str += '</select>';
	}else if(val == 5){
		$('#calarmmethod').remove();
	}
	
	$('.calmethod').append(str);
}
</script>


<script>
//조직도
$('#organization').jstree({
	core : {
		data :${organizationNode}
	},
	types : {
		'default' : {'icon': 'jstree-folder'}
	},
	 plugins: ['wholerow', 'types']
});

$('#organization').on("changed.jstree", function (e, data) {
	console.log("data",data);
    if(data.node.id.length > 3){
		console.log("data.node.id.length",data.node.id.length);
    	$.ajax({
    		url : "<%=request.getContextPath()%>/work/getEmpByNodeId.do?eno=" + data.node.id,
    		type:'get',
    		success:function(res){
    			console.log(res);
    			if($('div[data-eno="' + res.eno + '"]').length == 0){
	    			addEmp(res, $('#emp_List'), $('#addEmp-template'))
	    			if($('.emp_select_card').length == 1){
	    				$('.wmstepBtn').css("display", "block");
	    				$('input[name=wmstep]').prop('checked', true); 
	    			}
	    			addWorkManager(res.eno);
    			}else{
    				alert("이미 등록된 참조자는 추가할 수 없습니다.");
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

<script type="text/x-handlebars-template"  id="addEmp-template">
	<div class="emp_select_card col-4" data-eno="{{eno}}" style="align-items: center; display: flex; justify-content: center; flex: 0% !important;">
		<div style="padding: 5px; position: relative;">
			<input type="hidden" name="calRefEno" value="{{eno}}">		
			<label for="{{eno}}"><img class="table-avatar emp_profile" src="{{photo}}"></label>
		</div>
		<div class="text-left" style="position: relative;">
			<div style="display: flex; align-items: center">
				<p style="font-size: 12px; font-weight: bold">{{name}} </p>&nbsp;&nbsp;
				<i class="fas fa-times removeBtn text-danger" onclick="removeManager('{{eno}}')" style="cursor:pointer;"></i>
			</div>
			<div style="font-size: 8px;">
				<p>{{ppsname}}</p>
				<p>{{dname}}</p>
			</div>
		</div>
	</div>
</script>
	
<script>
function removeManager(eno){
	var removeItem = $('div[data-eno="' + eno + '"]');
	removeItem.remove();
	removeWorkManager.push(eno);
	console.log(removeWorkManager);
}
</script>

</div>
</body>


