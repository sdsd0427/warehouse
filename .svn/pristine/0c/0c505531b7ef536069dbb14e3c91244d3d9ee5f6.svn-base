<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

menteePage = 1;
workPage=1;
docPage=1;

function myMenteeListGo(startPage){
	menteePage = startPage;
	var data = {
			'page' : menteePage,
			'eno' : ${loginUser.eno}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/main/myMenteeList.do',
		data : data,
		type : 'post',
		success: function(res){
			console.log("mento",res);
			if(res.menteeList.length > 0){
				printWorkData(res.menteeList, $('.myMenteeList'), $('#myMenteeList-template'));
			}else{
				var str = `
					<tr style="height: 45px;">
						<td colspan="6" style="text-align:center">
							<strong>해당 내용이 없습니다.</strong>
						</td>
					</tr>
				`;

				$('.myMenteeList').html(str);
			}

			var lPage = menteePage - 1;
			if(lPage < 1){lPage = 1;}
			var rPage = menteePage + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					target : 'myMenteeListGo',
					left : "javascript:myMenteeListGo("+lPage+")",
					right : "javascript:myMenteeListGo("+rPage+")",
					doubleLeft : "javascript:myMenteeListGo("+1+")",
					doubleRight :"javascript:myMenteeListGo("+(res.pageMaker.realEndPage)+")"
			}
			printPageMaker(pageMakerData ,$('.myMenteePage'), $('#pageMaker-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function myMenteeWorkListGo(startPage){
	workPage = startPage;
	var data = {
			'page' : workPage,
			'eno' : ${loginUser.eno}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/mentee/myMenteeWorkList.do',
		data : data,
		type : 'post',
		success: function(res){
			if(res.myMenteeWorkList.length > 0){
				printWorkData(res.myMenteeWorkList, $('.myMenteeWorkList'), $('#myMenteeWorkList-template'));
			}else{
				var str = `
					<tr style="height: 45px;">
						<td colspan="6" style="text-align:center">
							<strong>해당 내용이 없습니다.</strong>
						</td>
					</tr>
				`;

				$('.myMenteeWorkList').html(str);
			}

			lPage = workPage - 1;
			if(lPage < 1){lPage = 1;}
			rPage = workPage + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					target : 'myMenteeWorkListGo',
					left : "javascript:myMenteeWorkListGo("+lPage+")",
					right : "javascript:myMenteeWorkListGo("+rPage+")",
					doubleLeft : "javascript:myMenteeWorkListGo("+1+")",
					doubleRight :"javascript:myMenteeWorkListGo("+(res.pageMaker.realEndPage)+")"
			}
			printPageMaker(pageMakerData ,$('.myMenteeWorkPage'), $('#pageMaker-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function myMenteeDocListGo(startPage){
	docPage = startPage;
	var data = {
			'page' : docPage,
			'eno' : ${loginUser.eno}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/mentee/myMenteeDocList.do',
		data : data,
		type : 'post',
		success: function(res){
			if(res.myMenteeDocList.length > 0){
				printWorkData(res.myMenteeDocList, $('.myMenteeDocList'), $('#myMenteeDocList-template'));
			}else{
				var str = `
					<tr style="height: 45px;">
						<td colspan="6" style="text-align:center">
							<strong>해당 내용이 없습니다.</strong>
						</td>
					</tr>
				`;

				$('.myMenteeDocList').html(str);
			}

			lPage = docPage - 1;
			if(lPage < 1){lPage = 1;}
			rPage = docPage + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					target : 'myMenteeDocListGo',
					left : "javascript:myMenteeDocListGo("+lPage+")",
					right : "javascript:myMenteeDocListGo("+rPage+")",
					doubleLeft : "javascript:myMenteeDocListGo("+1+")",
					doubleRight :"javascript:myMenteeDocListGo("+(res.pageMaker.realEndPage)+")"
			}
			printPageMaker(pageMakerData ,$('.myMenteeDocPage'), $('#pageMaker-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function printWorkData(dataList, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(dataList);
	target.html(html);
}

function printPageMaker(data, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(data);
	target.html(html);
}

function detail_go(wstatus,wcode){
	if(wstatus == "대기"){
		OpenWindow('<%=request.getContextPath()%>/work/waitDetail.do?wcode=' + wcode, '업무상세', '1000', '800');
	}else{
		OpenWindow('<%=request.getContextPath()%>/work/workDetail.do?wcode=' + wcode, '업무상세', '1000', '800');
	}
}

function remove_go(smno){
 	console.log("smno",smno);

 	Swal.fire({
	    title: '멘토링 종료',
	    text: "멘토링을 정말 종료하시겠습니까?",
	    icon: 'question',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: '확인',
	    cancelButtonText: '취소',
	    reverseButtons: true, // 버튼 순서 거꾸로
	  }).then((result) => {
	    if (result.isConfirmed) {
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/mentoring/removeMentoring.do?smno="+smno,
	    		type:"POST",
	    		success:function(res){
	    			console.log("smnores",res);
	    			if(res=="OK"){
	    				Swal.fire({
	    				    icon: 'success',
	    				    title: '멘토링이 종료되었습니다.',
	    				    confirmButtonColor: '#3085d6',
	    				  }).then(function(){
	    					myMenteeListGo(1);
	    					window.location.reload();
	    				  });
	    			}
	    		},
	    		error:function(error){
	    			AjaxErrorSecurityRedirectHandler(error.status);
	    		}
	    	})
	    }
	 })
}

</script>

<script type="text/x-handlebars-template"  id="myMenteeList-template">
{{#each .}}
	<tr>
		<td><img class="table-avatar emp_profile" src="{{photo}}" data-name="최민규 팀장">&nbsp;&nbsp;{{name }} {{ppsName }}</td>
		<td>{{dname}}</td>
		<td>{{job}}</td>
		<td>{{formatSDate startDate}} ~ {{formatEDate endDate}}</td>
		<td><button class="btn btn-xs btn-secondary" type="button" onclick="remove_go('{{smno}}');">멘토링 종료</button></td>
	</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="pageMaker-template">
	<li class="page-item">
		<a class="page-link" href="{{doubleLeft}}">
			<i class="fas fa-angle-double-left"></i>
		</a>
	</li>
	<li class="page-item">
		<a class="page-link" href="{{left}}">
			<i class="fas fa-angle-left"></i>
		</a>
	</li>

		{{printPage this}}

	<li class="page-item">
		<a class="page-link" href="{{right}}">
			<i class="fas fa-angle-right"></i>
		</a>
	</li>
	<li class="page-item">
		<a class="page-link" href="{{doubleRight}}">
			<i class="fas fa-angle-double-right"></i>
		</a>
	</li>
</script>

<script type="text/x-handlebars-template"  id="myMenteeWorkList-template">
{{#each .}}
	<tr onclick="detail_go('{{wstatus}}', '{{wcode }}')" style="cursor: pointer;">
		<td style="text-align: left; max-width: 190px; text-overflow:ellipsis; white-space:nowrap; overflow:hidden">{{wtitle}}</td>
		<td style="width: 20%;">
		<div style="align-items: center; display: flex;">
			<div>
				<img class="table-avatar emp_profile" src="{{photo}}" data-name="최민규 팀장">
			</div>&nbsp;
			<div>
				<span style="font-size:14px; font-weight:bold">{{name}} {{ppsName}}</span>
				<div style="font-size:12px;">
					<p>{{dname}}</p>
				</div>
			</div>
		</div>
		</td>
		<td>{{formatDate wend}}</td>
		<td class="project-state">
			<span class="badge {{statusColor wstatus}}">{{wstatus}}</span>
		</td>
	</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="myMenteeDocList-template">
{{#each .}}
	<tr style="cursor: pointer;" onclick="OpenWindow('<%=request.getContextPath()%>/approval/detail.do?signNo={{signNo}}', '결재상세', '1100', '800')">
		<td style="text-align: left;max-width: 190px; text-overflow:ellipsis; white-space:nowrap; overflow:hidden">{{title}}</td>
		<td style="width: 20%;">
			<div style="align-items: center; display: flex;">
				<div>
					<img class="table-avatar emp_profile" src="{{photo}}" data-name="최민규 팀장">
				</div>&nbsp;
				<div>
					<span style="font-size:14px; font-weight:bold">{{name}} {{ppsName}}</span>
					<div style="font-size:12px;">
						<p>{{dname}}</p>
					</div>
				</div>
			</div>
		</td>
		<td>{{formclass}}</td>
		<td>{{formatDDate ddate}}</td>
		<td class="project-state">
		<span class="badge {{docStateColor state}}">{{docState state}}</span>
		</td>
	</tr>
{{/each}}
</script>

<script>
	Handlebars.registerHelper({
		"formatSDate" : function(startDate){
			var dateObj = new Date(startDate);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "-" + month + "-" + date;
		},
		"formatEDate" : function(endDate){
			var dateObj = new Date(endDate);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "-" + month + "-" + date;
		},
		"formatDate" : function(wend){
			var dateObj = new Date(wend);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "-" + month + "-" + date;
		},
		"formatDDate" : function(ddate){
			var dateObj = new Date(ddate);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "-" + month + "-" + date;
		},
		"statusColor":function(wstatus){
			var str = "";
			if(wstatus == "대기"){
				str = "bg-secondary";
			}else if(wstatus == "진행"){
				str = "bg-info";
			}else if(wstatus == "완료"){
				str = "bg-success";
			}else if(wstatus == "이의신청"){
				str = "bg-danger";
			}else if(wstatus == "협업요청"){
				str = "bg-primary";
			}else{
				str = "bg-warning";
			}
			return str;
		},
		"docState":function(state){
			var str = "";
			if(state == 1){
				str = "대기";
			}else if(state == 2){
				str = "보류";
			}else if(state == 3){
				str = "진행";
			}else if(state == 4){
				str = "반려"
			}else{
				str = "완료";
			}
			return str;
		},
		"docStateColor":function(state){
			var str = "";
			if(state == 1){
				str = "bg-secondary";
			}else if(state == 2){
				str = "bg-info";
			}else if(state == 3){
				str = "bg-primary";
			}else if(state == 4){
				str = "bg-warning";
			}else{
				str = "bg-success";
			}
			return str;
		},
		"printPage" : function(pageMakerData){
			var pageMaker = pageMakerData.pageMaker;
			var target;

			if(pageMakerData.target == "myMenteeListGo"){
				target = "myMenteeListGo";
			}
			if(pageMakerData.target == "myMenteeWorkListGo"){
				target = "myMenteeWorkListGo";
			}
			if(pageMakerData.target == "myMenteeDocListGo"){
				target = "myMenteeDocListGo";
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
		}
	});
</script>
