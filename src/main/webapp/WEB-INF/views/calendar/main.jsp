<%@page import="java.util.List"%>
<%@page import="kr.or.warehouse.dto.CalendarVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="calendarList" value="${calendarList}" />

<head>
	<link href='/warehouse/resources/lib/main.css' rel='stylesheet' />
	<script src='/warehouse/resources/lib/main.js'></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@5.5.0/main.global.min.js'></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/calendar.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style>
.ko_event{
	background: red !important;
	border: none !important;
}

/* .fc-event-time{ */
/* 	display: none; */
/* } */

.fc-day-sat a{
	color: blue !important;
}

.fc-day-sun a{
	color: red !important;
}
</style>

<script>


	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
            googleCalendarApiKey : 'AIzaSyAKpAiy1cDozwlaTgRSaWsrEUOoqFgxYpI',

	    	expandRows: true, // 화면에 맞게 높이 재설정
	    	slotMinTime: '00:00', // Day 캘린더에서 시작 시간
	    	slotMaxTime: '23:00', // Day 캘린더에서 종료 시간
// 	      	customButtons: {
// 	            myCustomButton: {
// 	                text: '',
// 	                click: function(event) {
// 	                  onSelectEvent(event);
// 	                }
// 	            }
// 	    	},
	      	headerToolbar: { // 헤더에 표시할 툴바
				start: 'dayGridMonth,timeGridWeek,timeGridDay,today',
		        center: 'prev,title,next',
 		    	end: 'myCustomButton'
	      	},
	      	buttonText: { // 버튼 글자 커스텀
	      		month : '월간',
	      		week : '주간',
	      		day : '일간'
	      	},
// 	      	locale : 'ko', // 한국어 설정
// 			displayEventTime:false,//제목에 시간 같이 display 안되게 설정하는
	      	initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	      	//initialDate: '2022-07-01', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
	      	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	      	selectable: true, // 달력 일자 드래그 설정 가능
	      	dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	      	nowIndicator: true, // 현재 시간 마크
	      	droppable : true,
			editable : false, // 마우스 드래그로 일정 이동
	      	selectMirror: true, // timeGrid view에서만 작동
	      	titleFormat: 'YYYY - MM',
	      	allDaySlot: true,
	      	allDayText: '종일',
	      	eventOrder: 'title',

	      	select: function(arg) { // 캘린더에서 드래그로 이벤트 생성
	      		// 날짜 가져오기
	      		var sdate = new Date(arg.start);
	      		console.log(sdate);
	      		var formatted_date = sdate.getFullYear() + "/" + (sdate.getMonth() + 1) + "/" + sdate.getDate() + " " + sdate.getHours() + ":" + sdate.getMinutes();

	      		var year = sdate.getFullYear();
	      		var month = sdate.getMonth() + 1;
	      		if(month < 10){
	      			month = '0' + month;
	      		}
	      		var date = sdate.getDate();
	      		if(date < 10){
	      			date = '0' + date;
	      		}
	      		var hour = sdate.getHours();
	      		if(hour < 10){
	      			hour = '0' + hour;
	      		}
	      		var minute = sdate.getMinutes();
	      		if(minute < 10){
	      			minute = '0' + minute;
	      		}

	      		var result = year + "/" + month + "/" + date + " " + hour + ":" + minute;
	      		console.log(result);


	      		window.open('registForm.do?sdate='+result, '일정 등록',"scrollbars=yes,width=940, height=550, top=100, left=400, resizable=1, status=yes" );
	      	},

// 			eventDrop : function(info) { // 이벤트를 드래그를 해 손을 놓았을 때
// 				if (confirm("수정하시겠습니까?")) {
// 					var msg = updateFunc(info);
// 					alert(msg);
// 				} else {
// 					info.revert(); // 취소 시키기(없을 경우 무조건 이동이 이뤄진다.)
// 				}
// 			},

 	      	eventClick: function(arg) {
 	      		var ccode = arg.event.id;
 	      		window.open('detail.do?ccode=' + ccode,'일정 수정',"scrollbars=yes,width=940, height=550, top=100, left=400, resizable=1, status=yes" );
	      	},

	      	events: [
	      		$.ajax({
	        		url: '<%=request.getContextPath()%>/calendar/getCalendar?eno=${loginUser.eno}&catecode1=' + 1 + '&catecode2=' + 2 + '&catecode3=' + 3,
	        		type: "GET",
	        		success: function(list){
	        			console.log(ccode1);
	        			console.log(ccode2);
	        			console.log(ccode3);
	        			for(var i = 0; i < list.length; i++){
	        				calendar.addEvent({
	        					id : list[i].ccode,
	        					title : list[i].title,
	        					start : list[i].start,
	        					end : list[i].end,
	        					color : list[i].catecode == 2 ? '#ffc107' : list[i].catecode == 3 ? '#28a745' : '#007bff'
	        				});
	        			}
	        			var event = calendar.getEvents();
	        		}
        	    })
	      	],

            eventSources : [ // 한국 기념일 ko.south_korea 추가
                 { googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com'
                , className : 'ko_event' }
            ],

            eventTimeFormat: { // like '14:30:00'
                hour: '2-digit',
                minute: '2-digit',
                meridiem: false
            },
	    });
	    calendar.render();
	  });

</script>


</head>
<body>
<div class="wrapper" >
	 <section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h3>내 일정</h3>
				</div>
			</div>
		</div>
	</section>

  	<!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12" >
				<div class="card card-navy card-outline">
					<div class="card-header">
						<div class ="card-tools">
							<div class="input-group input-group-sm" style="width: 200px; float: right;">
								<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요" value="">
								<span class="input-group-append">
									<button class=" btn bg-navy" type="button" onclick="search()" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div><!--end card-header  -->

					<div class="card-body pad">
						<div id='calendar'></div>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">

					</div><!--end card-footer  -->
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->



</div>

<form name="searchForm" id="searchForm" action="search.do">
	<input type="hidden" name="catecode1" value="1">
	<input type="hidden" name="catecode2" value="2">
	<input type="hidden" name="catecode3" value="3">
	<input type="hidden" name="keyword" value="">
	<input type="hidden" name="eno" value="${loginUser.eno }">
</form>


<script type="text/javascript">
	function search() {
		
// 		var form = $('#searchForm');
// 		form.find($('input[name="keyword"]').val($('input[name="keyword"]').val()))
// 		console.log(form);
		
// 		form.submit();

	var keyword = $('input[name="keyword"]').val();
	goDetail('calendar/search.do?keyword='+keyword,'${menu.upcode }');
	}
	
	
</script>

<script type="text/javascript">

	var ccode1 = 0;
	var ccode2 = 0;
	var ccode3 = 0;
	

	$(document).on('click', 'body > aside > div > ul > li:nth-child(2) > a', function(){
		$(this).attr("href", "#");
		regist();
	})

	$('click', 'body > aside > div > ul > li:nth-child(2) > a').ready(function(){
		var tmp = "";
		tmp += "<div class='subCalendar'>";
		tmp += "	<ul class='checkCalendar' data-widget='treeview' role='menu' data-accordion='false'>";        
		tmp += "		<li style='margin-bottom: 10px;'>";        
		tmp += "			<input class='form-check-input' type='checkbox' name='catecode3' id='catecode3' value='3' checked onchange='cateCheck();'>회사일정";        
		tmp += "			<span class='bottom-0 end-0 badge rounded-circle bg-success p-1 ml-1' style='width:15px; height: 15px;'>";  
		tmp += "				<span class='visually-hidden'></span>";
		tmp += "			</span>";  
		tmp += "		</li>";  
		tmp += "		<li style='margin-bottom: 10px;'>"; 
		tmp += "			<input class='form-check-input' type='checkbox' name='catecode2' id='catecode2' value='2' checked onchange='cateCheck();'>부서일정"; 
		tmp += "			<span class='bottom-0 end-0 badge rounded-circle bg-warning p-1 ml-1' style='width:15px; height: 15px;'>";  
		tmp += "				<span class='visually-hidden'></span>";  
		tmp += "			</span>";  
		tmp += "		</li>";  
		tmp += "		<li style='margin-bottom: 10px;'>"; 
		tmp += "			<input class='form-check-input' type='checkbox' name='catecode1' id='catecode1' value='1' checked onchange='cateCheck();'>개인일정"; 
		tmp += "			<span class='bottom-0 end-0 badge rounded-circle bg-primary p-1 ml-1' style='width:15px; height: 15px;'>";  
		tmp += "				<span class='visually-hidden'></span>";  
		tmp += "			</span>";  
		tmp += "		</li>";  
		tmp += "	</ul>"; 
		tmp += "</div>";        
		        
		$('body > aside > div > ul ').after(tmp);

	})
	
	function cateCheck(){
		ccode1 = typeof $('#catecode1:checked').val() == 'undefined' ? 0 : $('#catecode1:checked').val()
		ccode2 = typeof $('#catecode2:checked').val() == 'undefined' ? 0 : $('#catecode2:checked').val()
		ccode3 = typeof $('#catecode3:checked').val() == 'undefined' ? 0 : $('#catecode3:checked').val()
		console.log(ccode1);
		console.log(ccode2);
		console.log(ccode3);
		
		if(ccode1 == 0 && ccode2 == 0 && ccode3 == 0){
			ccode1 = 4;
			ccode2 = 4;
			ccode3 = 4;
		}
		
		inputCal(ccode1,ccode2,ccode3);
		
		
	}
	
	function inputCal(ccode1,ccode2,ccode3) {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
            googleCalendarApiKey : 'AIzaSyAKpAiy1cDozwlaTgRSaWsrEUOoqFgxYpI',

	    	expandRows: true, // 화면에 맞게 높이 재설정
	    	slotMinTime: '00:00', // Day 캘린더에서 시작 시간
	    	slotMaxTime: '23:00', // Day 캘린더에서 종료 시간
// 	      	customButtons: {
// 	            myCustomButton: {
// 	                text: '',
// 	                click: function(event) {
// 	                  onSelectEvent(event);
// 	                }
// 	            }
// 	    	},
	      	headerToolbar: { // 헤더에 표시할 툴바
				start: 'dayGridMonth,timeGridWeek,timeGridDay,today',
		        center: 'prev,title,next',
 		    	end: 'myCustomButton'
	      	},
	      	buttonText: { // 버튼 글자 커스텀
	      		month : '월간',
	      		week : '주간',
	      		day : '일간'
	      	},
// 	      	locale : 'ko', // 한국어 설정
// 			displayEventTime:false,//제목에 시간 같이 display 안되게 설정하는
	      	initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	      	//initialDate: '2022-07-01', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
	      	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	      	selectable: true, // 달력 일자 드래그 설정 가능
	      	dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	      	nowIndicator: true, // 현재 시간 마크
	      	droppable : true,
			editable : false, // 마우스 드래그로 일정 이동
	      	selectMirror: true, // timeGrid view에서만 작동
	      	titleFormat: 'YYYY - MM',
	      	allDaySlot: true,
	      	allDayText: '종일',
	      	eventOrder: 'title',

	      	select: function(arg) { // 캘린더에서 드래그로 이벤트 생성
	      		// 날짜 가져오기
	      		var sdate = new Date(arg.start);
	      		console.log(sdate);
	      		var formatted_date = sdate.getFullYear() + "/" + (sdate.getMonth() + 1) + "/" + sdate.getDate() + " " + sdate.getHours() + ":" + sdate.getMinutes();

	      		var year = sdate.getFullYear();
	      		var month = sdate.getMonth() + 1;
	      		if(month < 10){
	      			month = '0' + month;
	      		}
	      		var date = sdate.getDate();
	      		if(date < 10){
	      			date = '0' + date;
	      		}
	      		var hour = sdate.getHours();
	      		if(hour < 10){
	      			hour = '0' + hour;
	      		}
	      		var minute = sdate.getMinutes();
	      		if(minute < 10){
	      			minute = '0' + minute;
	      		}

	      		var result = year + "/" + month + "/" + date + " " + hour + ":" + minute;
	      		console.log(result);


	      		window.open('registForm.do?sdate='+result, '일정 등록',"scrollbars=yes,width=940, height=550, top=100, left=400, resizable=1, status=yes" );
	      	},

// 			eventDrop : function(info) { // 이벤트를 드래그를 해 손을 놓았을 때
// 				if (confirm("수정하시겠습니까?")) {
// 					var msg = updateFunc(info);
// 					alert(msg);
// 				} else {
// 					info.revert(); // 취소 시키기(없을 경우 무조건 이동이 이뤄진다.)
// 				}
// 			},

 	      	eventClick: function(arg) {
 	      		var ccode = arg.event.id;
 	      		window.open('detail.do?ccode=' + ccode,'일정 수정',"scrollbars=yes,width=940, height=510, top=100, left=400, resizable=1, status=yes" );
	      	},

	      	events: [
	      		$.ajax({
	        		url: '<%=request.getContextPath()%>/calendar/getCalendar?eno=${loginUser.eno}&catecode1=' + ccode1 + '&catecode2=' + ccode2 + '&catecode3=' + ccode3,
	        		type: "GET",
	        		success: function(list){
	        			console.log("");		        			
	        			
	        			for(var i = 0; i < list.length; i++){
	        				calendar.addEvent({
	        					id : list[i].ccode,
	        					title : list[i].title,
	        					start : list[i].start,
	        					end : list[i].end,
	        					color : list[i].catecode == 2 ? '#ffc107' : list[i].catecode == 3 ? '#28a745' : '#007bff'
	        				});
	        			}
	        			var event = calendar.getEvents();
	        		}
        	    })
	      	],

            eventSources : [ // 한국 기념일 ko.south_korea 추가
                 { googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com'
                , className : 'ko_event' }
            ],

            eventTimeFormat: { // like '14:30:00'
                hour: '2-digit',
                minute: '2-digit',
                meridiem: false
            },
	    });
	    calendar.render();
	  }
	// 좌측 체크박스
	


	function regist() {
		window.open('registForm.do','일정 등록',"scrollbars=yes,width=940, height=550, top=100, left=400, resizable=1, status=yes" );
	}

//  	var cateList = [];
//  	$(".form-check-input").change(function(){
//  		if($("input[type='checkbox']:checked").each(function(index){
//  			console.log("aa");
//  			var cate = $(".catecode").val();
//  			cateList.append(cate);
//  			console.log(cateList);
//  			})
//  		)
//  	})

</script>

<c:if test="${from eq 'regist'}" >
	<script>
		Swal.fire({
		      icon: 'success',
		      title: '등록되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				window.close();
		 		window.opener.location.reload();
		    });
	</script>
</c:if>

</body>
