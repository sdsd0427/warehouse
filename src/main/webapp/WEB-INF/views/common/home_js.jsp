<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>


	$('.datetimepicker').datetimepicker({
		'minTime' : '07:00',
		'maxTime' : '23:00'
	});

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
		getNoticeList(1);
		getMyWorkList('wait');
		getToReqWork('objection');
		getMentoWorkList();
		getMenteeWorkList();
		getDraftList(2);
	}

	init();

	function goToWork(){

		var onTime = $('.js-time').text();
		var hrDate = $('#today').text().split('(')[0];
		console.log(onTime);
		console.log(hrDate);
		var data = {
				'eno' : ${loginUser.eno },
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
				      icon: 'warning',
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
				'eno' : ${loginUser.eno },
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
				      icon: 'warning',
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

	function getOnTime(){
		var data = {
				'eno' : ${loginUser.eno }
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/ehr/getOnTime.do',
			data  : data,
			type : 'post',
			success: function(res){
				if(res.length<1){
					return;
				}
				printHomeData(res, $('.onTime'), $('#onTime-template'));
				changeWorkBtn();
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

 	getOnTime();

	function getOffTime(){
		var data = {
				'eno' : ${loginUser.eno }
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/ehr/getOffTime.do',
			data  : data,
			type : 'post',
			success: function(res){
				if(res.length<1){
					return;
				}
				printHomeData(res, $('.offTime'), $('#offTime-template'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

 	getOffTime();

	function printHomeData(dataArr,target,templateObject){
		var template=Handlebars.compile(templateObject.html());

		var html = template(dataArr);

		target.html(html);
	}

	function changeCondition(condition){
		if(condition == null){
			condition = $("#condition option:selected").val();
		}
		console.log(condition);
		var data ={
				'eno' : ${loginUser.eno },
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

	function openTodoModal(){
		$('#modal_todo').show();
	}
	function closeTodoModal(){
		modal.hide();
		$('.todo_modalTitle').text("TO DO 등록");
		modal.find("[name='todoTitle']").val("");
		modal.find("[name='todoContent']").val("");
		modal.find("[name='todoTime']").val("");
		modal.find("[name='todoSignal']").prop("checked", false).attr("checked", false).removeAttr("checked");

		var str = `
			<button type="button" class="btn btn-outline-primary" onclick="todoSubmit()">등록</button>
			<button type="button" class="btn btn-outline-dark" onclick="closeTodoModal()">닫기</button>
		`

		$('#todo_footer').html(str);

	}

	function todoSubmit(){
		if($('input[name="todoTitle"]').val() == ""){
			Swal.fire({
			      icon: 'warning',
			      title: '제목을 입력해주세요.',
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}

		if($('textarea[name="todoContent"]').val() == ""){
			Swal.fire({
			      icon: 'warning',
			      title: '내용을 입력해주세요.',
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}

		var form = $('#todoForm');
		if($('input[name="todoSignal"]').is(":checked")){
			$('input[name="todoSignal"]').val(1);
		}else{
			$('input[name="todoSignal"]').val(0);
		}
		var formData = new FormData(form[0]);

		$.ajax({
			url : "<%=request.getContextPath()%>/home/addTodo.do",
			type : 'post',
			data : formData,
			contentType : false,
			processData:false,
			success : function(res){
				Swal.fire({
				      icon: 'success',
				      title: '등록되었습니다.',
				      confirmButtonColor: '#3085d6',
				    }).then(function(){
						location.reload();
				      });
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	var modal = $('#modal_todo');
	function todoDetail(todoNo){

		$.ajax({
			url : "<%=request.getContextPath()%>/home/getTodoDetail.do?todoNo=" + todoNo,
			type:'get',
			success:function(res){
				$('.todo_modalTitle').text("TO DO")
				modal.find("[name=todoTitle]").val(res.todoTitle);
				modal.find("[name='todoContent']").val(res.todoContent);
				var todoTime = dateFormat(new Date(res.todoTime));

				modal.find("[name='todoTime']").val(todoTime);

				if(res.todoSignal == 1){
					modal.find("[name='todoSignal']").prop("checked", true).attr("checked", true);
				}
				var str = ""
					str += '<button type="button" class="btn btn-outline-primary" onclick="todoModifyGo(' + todoNo + ')">수정</button>'
					str += '<button type="button" class="btn btn-outline-danger" onclick="todoRemove(' + todoNo + ')">삭제</button>'
					str += '<button type="button" class="btn btn-outline-dark" onclick="closeTodoModal()">닫기</button>'


				$('#todo_footer').html(str);

				modal.show();
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});

	}


	function todoModifyGo(todoNo){
		var form = $('#todoForm');
		form.find("[name='todoNo']").val(todoNo);
		if($('input[name="todoSignal"]').is(":checked")){
			$('input[name="todoSignal"]').val(1);
		}else{
			$('input[name="todoSignal"]').val(0);
		}
		var formData = new FormData(form[0]);

		$.ajax({
			url : "<%=request.getContextPath()%>/home/todoModifyGo.do",
			type : 'post',
			data : formData,
			contentType : false,
			processData:false,
			success : function(res){
				Swal.fire({
				      icon: 'success',
				      title: '수정되었습니다.',
				      confirmButtonColor: '#3085d6',
				    }).then(function(){
						location.reload();
				      });
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function todoRemove(todoNo){
		$.ajax({
			url : "<%=request.getContextPath()%>/home/todoRemove.do?todoNo=" + todoNo,
			type : 'get',
			success : function(res){
				Swal.fire({
				      icon: 'success',
				      title: '삭제되었습니다.',
				      confirmButtonColor: '#3085d6',
				    }).then(function(){
				    	modal.hide();
						location.reload();
				      });
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '/' + month + '/' + day + ' ' + hour + ':' + minute + ':' + second;
	}

	function getNoticeList(page){
		$('#board li').removeClass("active");
		$('.notice').addClass("active");
		$.ajax({
			url : "<%=request.getContextPath()%>/home/getNoticeList.do?page=" + page,
			type:'get',
			success : function(res){
				if(res.boardList.length == 0){
					var str = `
					<tr style="text-align:center;font-size:small;">
						<td colspan="4">
							등록된 공지사항이 존재하지 않습니다.
						</td>
					</tr>
					`;

					$('.boardList').html(str);
				}else{
					printHomeData(res.boardList, $('.boardList'), $('#noticeList-template'))
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getEventList(page){
		$('#board li').removeClass("active");
		$('.event').addClass("active");
		$.ajax({
			url : "<%=request.getContextPath()%>/home/getEventList.do?page=" + page,
			type:'get',
			success : function(res){
				if(res.boardList.length == 0){
					var str = `
					<tr style="text-align:center;font-size:small;">
						<td colspan="4">
							등록된 경조사가 존재하지 않습니다.
						</td>
					</tr>
					`;

					$('.boardList').html(str);
				}else{
					printHomeData(res.boardList, $('.boardList'), $('#eventList-template'))
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getMyWorkList(tab){
		$('#myWorkTab li').removeClass("active");
		if(tab == 'wait'){
			$('.wait').addClass("active");
		}else if(tab == 'cooper'){
			$('.cooper').addClass("active");
		}else{
			$('.proxy').addClass("active");
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/home/getMyWorkList.do?tab=" + tab,
			type:"get",
			success : function(res){
				if(res.length == 0){
					var str = `
						<tr style="text-align:center;font-size:small;">
							<td colspan="4">
								해당 업무가 존재하지 않습니다.
							</td>
						</tr>
						`;
					$('.myWorkList').html(str);
				}else{
					printHomeData(res, $('.myWorkList'), $('#myWorkList-template'));
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getToReqWork(tab){
		$('#toReqTab li').removeClass("active");
		if(tab == 'objection'){
			$('.objection').addClass("active");
		}else if(tab == 'cooperReq'){
			$('.cooperReq').addClass("active");
		}else{
			$('.proxyReq').addClass("active");
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/home/getToReqList.do?tab=" + tab,
			type:"get",
			success : function(res){
				if(res.length == 0){
					var str = `
						<tr style="text-align:center;font-size:small;">
							<td colspan="4">
								해당 업무가 존재하지 않습니다.
							</td>
						</tr>
						`;
					$('.toReqWorkList').html(str);
				}else{
					printHomeData(res, $('.toReqWorkList'), $('#toReqList-template'));
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getMentoWorkList(){
		$('#mentoTab li').removeClass("active");
		$('.mentoWork').addClass("active");

		$.ajax({
			url : "<%=request.getContextPath()%>/home/getMentoWorkList.do",
			type : 'get',
			success : function(res){
				if(res.length == 0){
					var str = `
						<tr style="text-align:center;font-size:small;">
							<td colspan="4">
								멘토의 업무가 존재하지 않습니다.
							</td>
						</tr>
					`

					$('.mento').html(str);
				}else{
					printHomeData(res, $('.mento'), $('#mentoringWork-template'));
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getMenteeWorkList(){
		$('#menteeTab li').removeClass("active");
		$('.menteeWork').addClass("active");

		$.ajax({
			url : "<%=request.getContextPath()%>/home/getMenteeWorkList.do",
			type : 'get',
			success : function(res){
				console.log(res);
				if(res.length == 0){
					var str = `
						<tr style="text-align:center;font-size:small;">
							<td colspan="4">
								멘티의 업무가 존재하지 않습니다.
							</td>
						</tr>
					`

					$('.mentee').html(str);
				}else{
					printHomeData(res, $('.mentee'), $('#mentoringWork-template'));
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getDraftList(state){
		$('#signdocTab li').removeClass("active");
		if(state == 2){
			$('.hold').addClass("active");
		}else{
			$('.refuse').addClass("active")
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/home/getDraftList.do?state=" + state,
			type : 'get',
			success : function(res){
				if(res.length == 0){
					var str = `
						<tr style="text-align:center;font-size:small;">
							<td colspan="4">
								해당 문서가 존재하지 않습니다.
							</td>
						</tr>
					`

					$('.signDocList').html(str);
				}else{
					printHomeData(res, $('.signDocList'), $('#signDoc-template'));
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getApproveList(state){
		$('#signdocTab li').removeClass("active");
		$('.new').addClass("active")

		$.ajax({
			url : "<%=request.getContextPath()%>/home/getApproveList.do?state=" + state,
			type : 'get',
			success : function(res){
				if(res.length == 0){
					var str = `
						<tr style="text-align:center;font-size:small;">
							<td colspan="4">
								해당 문서가 존재하지 않습니다.
							</td>
						</tr>
					`

					$('.signDocList').html(str);
				}else{
					printHomeData(res, $('.signDocList'), $('#signDoc-template'));
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getMentoringDocList(tab){
		if(tab == 'mento'){
			$('#mentoTab li').removeClass("active");
			$('.mentoDoc').addClass("active");
		}else{
			$('#menteeTab li').removeClass("active");
			$('.menteeDoc').addClass("active");
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/home/getMentoringDocList.do?tab=" + tab,
			type : 'get',
			success : function(res){
				if(res.length == 0){
					var str = `
						<tr style="text-align:center;font-size:small;">
							<td colspan="4">
								해당 문서가 존재하지 않습니다.
							</td>
						</tr>
					`
					if(tab == 'mento'){
						$('.mento').html(str);
					}else{
						$('.mentee').html(str);
					}
				}else{
					if(tab == 'mento'){
						printHomeData(res, $('.mento'), $('#mentoringDoc-template'))
					}else{
						printHomeData(res, $('.mentee'), $('#mentoringDoc-template'))
					}
				}
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});

	}

	function detail_go(wstatus,wcode){
		if(wstatus == "대기" || wstatus == "이의신청"){
			OpenWindow('<%=request.getContextPath()%>/work/waitDetail.do?wcode=' + wcode + '&mCode=${menu.mcode}', '업무상세', '1100', '800');
		}else{
			OpenWindow('<%=request.getContextPath()%>/work/workDetail.do?wcode=' + wcode + '&mCode=${menu.mcode}', '업무상세', '1100', '800');
		}
	}

	Handlebars.registerHelper({
		"dateFormat" : function(regDate){
			var d = new Date(regDate),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2)
	        month = '0' + month;
	    if (day.length < 2)
	        day = '0' + day;

	    return [year, month, day].join('-');
		},
		"fixCheck" : function(fix, boardNo){
			var str;
			if(fix == 1){
				str = `
					<i class="fas fa-bullhorn" style="color:red;"></i>
				`;
			}else{
				str = boardNo.substring(5,8);
			}

			return new Handlebars.SafeString(str);
		},
		"printPage" : function(pageMakerData){
			var pageMaker = pageMakerData.pageMaker;
			var target;

			if(pageMakerData.target == "getNoticeList"){
				target = "getNoticeList";
			}



			var str = '';
			for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
				var active = i == pageMaker.cri.page ? 'active' : '';
				str += '<li class="page-item ' + active + '">';
				str += '<a class="page-link" href="javascript:'+target+'(' + i + ')">';
				str += i
				str += '</a>';
				str += '</li>';
			}
			return new Handlebars.SafeString(str);
		},
		"workStatus" : function(wstatus){
			var str = wstatus == '대기' ? "bg-secondary" : wstatus == '진행' ? "bg-info" : wstatus == '완료' ? "bg-success" : wstatus == '협업요청' ? "bg-primary"
					: "bg-warning";

			return new Handlebars.SafeString(str);

		},
		"managerCntCheck":function(managerCnt){
			var str = "";

			if(managerCnt > 0){
				str += '<div style="font-size: 12px; ">'
				str += '<span style="font-size: 8px; margin-left: 5px">외 ' + managerCnt + '명</span>'
				str += '</div>'
			}

			return new Handlebars.SafeString(str);
		},
		"docState" : function(state){
			var str = state == 1 ? "대기" : state == 2 ? "보류" : state == 3 ? "진행" : state == 4 ? "반려"
					: "완료";

			return new Handlebars.SafeString(str);
		},
		"docBadgeColor" : function(state){
			var str = state == 1 ? "bg-secondary" : state == 2 ? "bg-warning" : state == 3 ? "bg-info" : state == 4 ? "bg-danger"
					: "bg-success";

			return new Handlebars.SafeString(str);
		}
	});

	</script>
	<script type="text/x-handlebars-template"  id="onTime-template" >
	<a class="float-right onTimeRemove">{{""}}</a>
	</script>

	<script type="text/x-handlebars-template"  id="offTime-template" >
	<a class="float-right offTimeRemove">{{""}}</a>
	</script>

	<script type="text/x-handlebars-template"  id="noticeList-template" >
	{{#each .}}
		<tr onclick="OpenWindow('<%=request.getContextPath()%>/board/notice/detail.do?boardNo={{boardNo}}','공지사항', '800', '600')" style="cursor: pointer; font-size:12px;">
			<td>{{fixCheck fix boardNo}}</td>
			<td style="text-align:left">
				<span class="col-sm-12" >{{boardTitle }}
				</span>
			</td>
			<td>{{name }}</td>
			<td>
				{{dateFormat regDate}}
			</td>
		</tr>
	{{/each}}
	</script>
	<script type="text/x-handlebars-template"  id="eventList-template" >
	{{#each .}}
		<tr onclick="OpenWindow('<%=request.getContextPath()%>/board/event/detail.do?boardNo={{boardNo}}','경조사', '800', '600')" style="cursor: pointer; font-size:12px;">
			<td>{{fixCheck fix boardNo}}</td>
			<td style="text-align:left">
				<span class="col-sm-12">{{boardTitle }}
				</span>
			</td>
			<td>{{name }}</td>
			<td>
				{{dateFormat regDate}}
			</td>
		</tr>
	{{/each}}
	</script>

	<script type="text/x-handlebars-template"  id="myWorkList-template">
		{{#each .}}
			<tr  onclick="detail_go('{{wstatus}}', '{{wcode}}')" style="font-size:12px; cursor:pointer">
				<td style="text-overflow:ellipsis; overflow:hidden; width:35%; white-space:nowrap; text-align:left">{{wtitle }}
				</td>
				<td>
					<div style="align-items: center; display: flex;">
						<div>
							<span style="font-size:12px; font-weight:bold">{{requester }}</span>
						</div>
					</div>
				</td>
				<td>
					{{dateFormat wend}}
				</td>

			</tr>
		{{/each}}
	</script>
	<script type="text/x-handlebars-template"  id="toReqList-template">
		{{#each .}}
			<tr  onclick="detail_go('{{wstatus}}', '{{wcode}}')" style="font-size:12px; cursor:pointer">
				<td style="text-overflow:ellipsis; overflow:hidden; width:40%; white-space:nowrap; text-align:left">{{wtitle }}
				</td>
				<td>
					<div style="align-items: center; display: flex;">
						<div>
							<span style="font-size:12px; font-weight:bold">{{manager }}</span>
						</div>
						{{managerCntCheck managerCnt}}

					</div>
				</td>
				<td>
					{{dateFormat wend}}
				</td>

			</tr>
		{{/each}}
	</script>
	<script type="text/x-handlebars-template"  id="mentoringWork-template">
		{{#each .}}
			<tr  onclick="detail_go('{{wstatus}}', '{{wcode}}')" style="font-size:12px; cursor:pointer">
				<td>{{requester}}</td>
				<td style="text-overflow:ellipsis; overflow:hidden; width:28%; white-space:nowrap; text-align:left">{{wtitle }}
				</td>
				<td style="text-overflow:ellipsis; overflow:hidden; width:40%; white-space:nowrap; text-align:left">
					{{hashTag}}
				</td>
				<td>
					<span class="badge {{workStatus wstatus}}">{{wstatus}}</span>
				</td>
			</tr>
		{{/each}}
	</script>
	<script type="text/x-handlebars-template"  id="mentoringDoc-template">
		{{#each .}}
			<tr  onclick="OpenWindow('<%=request.getContextPath()%>/approval/detail.do?signNo={{signNo}}', '결재상세', '1100', '800')" style="font-size:12px; cursor:pointer">
				<td>{{name}}</td>
				<td style="text-overflow:ellipsis; overflow:hidden; width:28%; white-space:nowrap; text-align:left">{{title }}
				</td>
				<td style="text-overflow:ellipsis; overflow:hidden; width:40%; white-space:nowrap; text-align:left">
					{{hashTag}}
				</td>
				<td>
					<span class="badge {{docBadgeColor state}}">{{docState state}}</span>
				</td>
			</tr>
		{{/each}}
	</script>
	<script type="text/x-handlebars-template"  id="signDoc-template">
		{{#each .}}
			<tr  onclick="OpenWindow('<%=request.getContextPath()%>/approval/detail.do?signNo={{signNo}}', '결재상세', '1100', '800')" style="font-size:12px; cursor:pointer">
				<td>{{formText}}</td>
				<td style="text-align:left">
					{{title}}
				</td>
			</tr>
		{{/each}}
	</script>