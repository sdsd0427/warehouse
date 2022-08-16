<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
var hrType = "${hrType }";
console.log(hrType);

if(hrType==""){
	Swal.fire({
	      icon: 'warning',
	      title: '근무유형이 선택되지 않았습니다.',
	      confirmButtonColor: '#3085d6',
	    });
}
</script>

<script>
//출퇴근 버튼 토글
//
function changeWorkBtn(){
	var onTime = $('.onTimeRemove').text().trim();
	console.log("ddd",onTime);

	if(onTime == "미등록"){
		$('.goToWork').css('display','block');
		$('.leaveWork').css('display','none');
	} else {
		$('.goToWork').css('display','none');
		$('.leaveWork').css('display','block');
	}
}
</script>

<script type="text/javascript">
//엑셀 다운로드
function excel(){


	if(hrDate == null){
		hrDate = '<fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>';
	}
// 	console.log("beforeExcel",hrDate);

	var calendar = $('#month').text().trim();
	var calendarSplit = calendar.split('-');
// 	console.log(calendarSplit);

	var year = parseInt(calendarSplit[0]);
	var month = calendarSplit[1]-1;

	if(month>11){
		month = 0;
		year += 1;
	}
	if(month<0){
		month = 11;
		year -= 1;
	}


	if((month+1)<10){
		month = '0'+(month+1);
	} else {
		month = month+1
	}

	var hrDate = year+"-"+month+"-07";
// 	console.log(hrDate);

	location.href='<%=request.getContextPath()%>/ehr/excel.do?hrDate=' +hrDate + '&eno=${employee.eno }';

}

//주간 섬네일 구하기
function weekCalc(hrDate, eno){
// 	console.log("ouput",hrDate);
	if(hrDate == null){
		hrDate = '<fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>';
	}

	if(eno == null){
		eno = '${employee.eno }';
	}

	var data = {
			'eno' : eno,
			'hrDate' : hrDate
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/ehr/weekCalc.do',
		data  : data,
		type : 'post',
		success: function(res){
			for(var i in res){
// 				console.log("여기",res[i].WEEKSTART);
				$('.weekStart').eq(i).val(res[i].WEEKSTART);
			}
			printOnTime(res, $('.weekCalc'), $('#weekCalc-template'), $('.removeWeekCalc'));
			MonthCalc();
			firstClick();
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
// weekCalc();
weekCalc(null, '${employee.eno }');

//월간 대쉬보드 계산
function MonthCalc(){
	var mHrTime = 0;
	var mStdTime = 0;
	var mOverTime = 0;
	var mTardy = 0;
	var mModify = 0;

	var hrTimes = $('.hrTime').text();

	for(var i=0; i < 5; i++){
		if($('.hrTime').eq(i).text() != " - " ){
			mHrTime += parseInt($('.hrTime').eq(i).text().replace("시간",""));
		}
		if($('.stdTime').eq(i).text() != " - " ){
			mStdTime += parseInt($('.stdTime').eq(i).text().replace("시간",""));
		}
		if($('.overTime').eq(i).text() != " - " ){
			mOverTime += parseInt($('.overTime').eq(i).text().replace("시간",""));
		}
		mTardy += parseInt($('.tardy').eq(i).val());
		mModify += parseInt($('.reqCount').eq(i).val());
	}
// 	console.log(mHrTime);
	$('.mHrTime').text(mHrTime+"시간");
	$('.mStdTime').text(mStdTime+"시간");
	$('.mOverTime').text(mOverTime+"시간");
	$('.mTardy').text(mTardy+"건");
	$('.mModify').text(mModify+"건");

}

</script>

<script>
//주간 근태테이블
function weekTable(weekStart, index, eno){
	if(weekStart==null){
		var weekStart = $(index).find('.weekStart').val();
	}

	if(eno == null){
		eno = '${employee.eno }';
	}

	var data = {
			'eno' : eno,
			'weekStart' : weekStart
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/ehr/weekTable.do',
		data  : data,
		type : 'post',
		success: function(res){
			console.log(res);
// 			printOnTime(res, $('.table-target'), $('#table-template'), $('.tableOn'));
			printOnTime(res, $('.table-target2'), $('#table-template2'), $('.tableOn'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

//클릭 연쇄 이벤트
function clickChain(index){
// 	console.log("dd",$(index).find('.weekIndex').attr('data-index')-1);
	var index = $(index).find('.weekIndex').attr('data-index')-1;
	$('.clickLi').eq(index).find('a').click();
}

//페이지 로딩 후 첫 클릭 강제
function firstClick(){
	var weekInt = '${weekInt}';
	console.log("weekInt",weekInt);
	var weekStart = $('.weekStart').eq(weekInt-1).val();
	$('.clickLi').eq(weekInt-1).find('a').click();
	weekTable(weekStart);

}

</script>

<script type="text/javascript">
//csv에서 출근시간 가져오기
function getOnTime(){
	var data = {
			'eno' : '${loginUser.eno }'
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/ehr/getOnTime.do',
		data  : data,
		type : 'post',
		success: function(res){
			if(res.length<1){
				return;
			}
			printOnTime(res, $('.onTime-target'), $('#onTime-template'), $('.onTimeRemove'));
			changeWorkBtn();
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

getOnTime();
</script>

<script type="text/javascript">
//csv에서 퇴근시간 가져오기
function getOffTime(){
	var data = {
			'eno' : '${loginUser.eno }'
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/ehr/getOffTime.do',
		data  : data,
		type : 'post',
		success: function(res){
			if(res.length<1){
				return;
			}
			printOffTime(res, $('.offTime-target'), $('#offTime-template'), $('.offTimeRemove'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

getOffTime();
</script>

<script type="text/javascript">
//퇴근하기
function leaveWork(){
	var onTime = $('.onTimeRemove').text();
	if(onTime == "미등록"){
		Swal.fire({
	      icon: 'warning',
	      title: '출근 정보가 없습니다.',
	      confirmButtonColor: '#3085d6',
	    });
		return;
	}
	var offTime = $('.js-time').text();
	var hrDate = $('#today').text().split('(')[0];
	console.log(offTime);
	console.log(hrDate);
	var data = {
			'eno' : '${loginUser.eno }',
			'offTime' : hrDate + " " + offTime,
			'hrDate' : hrDate
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/ehr/leaveWork.do',
		data  : data,
		type : 'post',
		success: function(res){
			if(res == "false"){
				Swal.fire({
				      icon: 'warning',
				      title: '허가된 ip에서만 가능합니다.',
				      confirmButtonColor: '#3085d6',
				    });
				return;
			}
			Swal.fire({
			      icon: 'success',
			      title: res + " 퇴근",
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
					changeCondition("업무종료");
					$("#condition").val("업무종료").prop("selected", true);
					getOffTime();
			     });
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}
</script>

<script type="text/javascript">
//출근하기
function goToWork(){
	var onTime = $('.js-time').text();
	var hrDate = $('#today').text().split('(')[0];
// 	console.log(onTime);
// 	console.log(hrDate);

// 	var dateObj = new Date(hrDate + " " + onTime);
// 	console.log(dateObj);

	var data = {
			'eno' : '${loginUser.eno }',
			'onTime' : hrDate + " " + onTime,
			'hrDate' : hrDate
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/ehr/goToWork.do',
		data  : data,
		type : 'post',
		success: function(res){
			console.log(res);
			if(res == "false"){
				Swal.fire({
				      icon: 'warning',
				      title: '허가된 ip에서만 가능합니다.',
				      confirmButtonColor: '#3085d6',
				    });
				return;
			}
			Swal.fire({
			      icon: 'success',
			      title: res + " 출근",
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
					changeCondition("업무중");
					$("#condition").val("업무중").prop("selected", true);
					getOnTime();
			     });
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}
</script>

<script type="text/javascript">
//근무상태 변경
function changeCondition(condition){
	if(condition == null){
		condition = $("#condition option:selected").val();
	}
	console.log(condition);
	var data ={
			'eno' : '${loginUser.eno }',
			'condition' : condition
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/ehr/changeCondition.do',
		data  : data,
		type : 'post',
		success: function(res){
			if(res == "OK"){
				Swal.fire({
				      icon: 'success',
				      title: '근무상태가 '+condition+'으로 변경되었습니다.',
				      confirmButtonColor: '#3085d6',
				    });
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>

<script type="text/javascript">
//현재시간 출력
function getTime() {
	var date = new Date();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();
	hours = hours < 10 ? '0'+hours : hours;
	minutes = minutes < 10 ? '0'+minutes : minutes;
	seconds = seconds < 10 ? '0'+seconds : seconds;

	$('.js-time').text(hours  + ':' + minutes + ':' + seconds);
}

function init() {
	getTime();
	setInterval(getTime, 1000);
}

init();

</script>

<script type="text/javascript">
//다른 달 데이터 조회
function changeMonth(num) {
	console.log(num);
	var calendar = $('#month').text().trim();
	var calendarSplit = calendar.split('-');
	console.log(calendarSplit);

	var year = parseInt(calendarSplit[0]);
	var month = calendarSplit[1]-1 + parseInt(num);

	if(month>11){
		month = 0;
		year += 1;
	}
	if(month<0){
		month = 11;
		year -= 1;
	}


	if((month+1)<10){
		month = '0'+(month+1);
	} else {
		month = month+1
	}

	$('#month').text('');
	$('#month').html('&nbsp;&nbsp;'+year+'-'+month+'&nbsp;&nbsp;');
	var hrDate = year+"-"+month+"-07";
	console.log(hrDate);
	weekCalc(hrDate);
}
</script>

<script type="text/x-handlebars-template"  id="weekCalc-template" >
{{#each .}}
	<div class="col-md-2 p-0 card card-navy removeWeekCalc" onclick="clickChain(this)" style="cursor:pointer">
		<div class="card-header">
					<div class="weekIndex text-center" data-index="{{indexUp @index}}" style="font-weight: bold;">
						{{indexUp @index}}주차&nbsp;요약
					</div>
		</div>
		<div class="card-body text-left p-0">
			<table class="table table-hover text-center" style="font-size: 0.8em; padding:0px;">
				<tr>
					<td style="width:50%; padding-right: 0px; padding-left: 0px;"><b>지각</b> {{tardy}}건</td>
					<td style="width:50%; padding-right: 0px; padding-left: 0px;"><b>수정</b> {{reqCount}}건</td>
				</tr>
				<tr>
					<td style="width:50%; padding-right: 0px; padding-left: 0px; font-weight:bold;">누적근무</td>
					<td style="width:50%; padding-right: 0px; padding-left: 0px;"><span class="hrTime">{{noTime HRTIME}}</span></td>
				</tr>
				<tr>
					<td style="width:50%; padding-right: 0px; padding-left: 0px; font-weight:bold;">기본근무</td>
					<td style="width:50%; padding-right: 0px; padding-left: 0px;"><span class="stdTime">{{noTime STDTIME}}</span></td>
				</tr>
				<tr>
					<td style="width:50%; padding-right: 0px; padding-left: 0px; font-weight:bold;">연장근무</span></td>
					<td style="width:50%; padding-right: 0px; padding-left: 0px;"><span class="overTime">{{noTime OVERTIME}}</span></td>
				</tr>
			</table>
			<input type="hidden" class="weekEnd" value="{{WEEKEND}}">
			<input type="hidden" class="tardy" value="{{tardy}}">
			<input type="hidden" class="reqCount" value="{{reqCount}}">
		</div>
	</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="onTime-template" >
		<a class="float-right onTimeRemove">{{""}}</a>
</script>

<script type="text/x-handlebars-template"  id="offTime-template" >
	<a class="float-right offTimeRemove">{{""}}</a>
</script>

<script type="text/x-handlebars-template"  id="weekHr-template" >
	<span class="removeWeekHr" style="text-align:left;">{{""}}</span>
</script>

<script type="text/x-handlebars-template"  id="table-template" >
{{#each .}}
	<tr class="tableOn">
		<td style="color: {{formatDateColor weekDate}};">{{formatDate weekDate}}</td>
		<td style="color: {{formatTimeColor state}};">{{formatTime onTime}}</td>
		<td>{{formatTime offTime}}</td>
		<td>{{plusTime hrTime}}</td>
		<td><small>기본&nbsp;&nbsp;{{plusTime stdTime}}&nbsp;&nbsp;/&nbsp;&nbsp;연장&nbsp;&nbsp;{{plusTime overTime}} </small></td>
		<td style="color : #007bff;">{{reqChange reqChange}}</td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="table-template2" >
	<thead class="tableOn">
		<tr>
			<th style="width: 12%">일자</th>
			<th style="width: 15%">업무시작</th>
			<th style="width: 15%">업무종료</th>
			<th style="width: 15%">총 근무시간</th>
			<th style="width: 23%">근무시간 상세</th>
			<th style="width: 20%">승인요청내역</th>
		</tr>
	</thead>
{{#each .}}
	<tbody class="table-target">
		<tr class="tableOn" data-hrCode="{{hrcode}}" onclick="OpenWindow('hrTimeModifyForm.do?hrcode='+'{{hrcode}}','근무시간 상세','600','550')" style="cursor:pointer;">
			<td style="color: {{formatDateColor weekDate}};">{{formatDate weekDate}}</td>
			<td style="color: {{formatTimeColor state}};">{{formatTime onTime}}</td>
			<td style="color: {{formatTimeColor state}};">{{formatTime offTime}}</td>
			<td>{{plusTime hrTime}}</td>
			<td><small>기본&nbsp;&nbsp;{{plusTime stdTime}}&nbsp;&nbsp;/&nbsp;&nbsp;연장&nbsp;&nbsp;{{plusTime overTime}} </small></td>
			<td style="color : #007bff;">{{reqChange reqChange}}</td>
		</tr>
	</tbody>
{{/each}}
</script>

<script>
function printOffTime(dataArr,target,templateObject, removeClass){
	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	removeClass.remove();

	target.append(html);
}

function printOnTime(dataArr,target,templateObject, removeClass){
	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	removeClass.remove();

	target.append(html);
}

function printHrTable(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	target.append(html);
}

function printWeekHr(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);
	target.append(html);
}
</script>

<script type="text/javascript">
Handlebars.registerHelper({
	"formatDate" : function(strDate){
		var dateObj = new Date(strDate);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		var day = dateObj.getDay();
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
		return date+"("+ week[dateObj.getDay()] +")";
	},
	"formatTime" : function(strDate){
		var timeString = "";
		if(strDate != null){
			var dateObj = new Date(strDate);

			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();

			var hours = ('0' + dateObj.getHours()).slice(-2);
			var minutes = ('0' + dateObj.getMinutes()).slice(-2);
			var seconds = ('0' + dateObj.getSeconds()).slice(-2);

			timeString = hours + ':' + minutes  + ':' + seconds;


			if(year+"-"+month+"-"+date == "1990-4-27"){
				timeString ="결근";
			}
			if(year+"-"+month+"-"+date == "1991-9-7"){
				timeString ="휴가";
			}
			if(year+"-"+month+"-"+date == "1970-2-7"){
				timeString ="출장";
			}
		}
		return timeString;
	},
	"formatDateColor" : function(strDate){
// 		console.log(strDate);
		var color = "";
		var dateObj = new Date(strDate);
		var day = dateObj.getDay();
		if(day==0){
			color = "red";
		} else if(day==6){
			color = "#007bff";
		} else if(strDate == "2022-08-15"){
			color = "red";
		}
		return color;
	},
	"formatTimeColor" : function(state){
		var color = "";
		if(state==2 || state==0){
			color = "red";
		}else if(state==3){
			color = "gray";
		}else{
			color = "black";
		}
		return color;
	},
	"reqChange" : function(reqChange){
		var result = "";
		if(reqChange==1){
			result = "변경 신청";
		} else if(reqChange==2){
			result = "변경 승인";
		}
		return result;
	},
	"indexUp" : function(index){
		return index+1;
	},
	"noTime" : function(time){
		var result = " - ";
		if(time != null){
			result = time+"시간";
		}
		return result;
	},
	"plusTime" : function(time){
		if(time != null){
			time = time+"시간";
		}
		return time;
	}
})
</script>