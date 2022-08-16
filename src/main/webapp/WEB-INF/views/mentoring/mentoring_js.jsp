<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

page = 1;
endPage = 1;
sysdateAllPage=1;
sysdateMenteePage=1;
sysdateMentoPage=1;

function subMentoringListGo(startPage){
	page = startPage
	var data = {
			'page' : page,
			'eno' : ${loginUser.eno}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/main/subMentoring.do',
		data : data,
		type : 'post',
		success: function(res){
			console.log(res);
			if(res.subMentoringList.length > 0){
				printWorkData(res.subMentoringList, $('.subMentoringList'), $('#subMentoringList-template'));
			}else{
				var str = `
					<tr style="height: 45px;">
						<td colspan="6" style="text-align:center">
							<strong>해당 내용이 없습니다.</strong>
						</td>
					</tr>
				`;

				$('.subMentoringList').html(str);
			}

			lPage = page - 1;
			if(lPage < 1){lPage = 1;}
			rPage = page + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					target : 'subMentoringListGo',
					left : "javascript:subMentoringListGo("+lPage+")",
					right : "javascript:subMentoringListGo("+rPage+")",
					doubleLeft : "javascript:subMentoringListGo("+1+")",
					doubleRight :"javascript:subMentoringListGo("+(res.pageMaker.realEndPage)+")"
			}
			printPageMaker(pageMakerData ,$('.subMentoringPage'), $('#pageMaker-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
// function endDateMentoringGo(){
// 	//alert("alert");
// 	$.ajax({
<%-- 		url : '<%=request.getContextPath()%>/mentoring/deleteEndDateMentoring.do', --%>
// 		type : 'POST',
// 		success : function(res){
// 			//console.log("delete", res);
// 			if(res=="OK"){
// 				endMentoringListGo(1);
// 			}
// 		},
// 		error:function(error){
// 			AjaxErrorSecurityRedirectHandler(error.status);
// 		}
// 	});
// }
function endMentoringListGo(startPage){
	endPage = startPage
	var data = {
			'page' : endPage,
			'eno' : ${loginUser.eno}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/main/endMentoring.do',
		data : data,
		type : 'post',
		success: function(res){
			console.log("end:",res)
			if(res.endMentoringList.length > 0){
				console.log("res",res);
				printWorkData(res.endMentoringList, $('.endMentoringList'), $('#endMentoringList-template'));
			}else{
				var str = `
					<tr style="height: 45px;">
						<td colspan="6" style="text-align:center">
							<strong>해당 내용이 없습니다.</strong>
						</td>
					</tr>
				`;

				$('.endMentoringList').html(str);
			}

			lPage = endPage - 1;
			if(lPage < 1){lPage = 1;}
			rPage = endPage + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					target : 'endMentoringListGo',
					left : "javascript:endMentoringListGo("+lPage+")",
					right : "javascript:endMentoringListGo("+rPage+")",
					doubleLeft : "javascript:endMentoringListGo("+1+")",
					doubleRight :"javascript:endMentoringListGo("+(res.pageMaker.realEndPage)+")"
			}
			printPageMaker(pageMakerData ,$('.endMentoringPage'), $('#pageMaker-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function sysdateMentoWorkGo(startPage){
	sysdateMentoPage = startPage
	var data = {
			'page' : sysdateMentoPage,
			'eno' : ${loginUser.eno}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/main/sysdateMentoWork.do',
		data : data,
		type : 'post',
		success: function(res){
			if(res.sysdateMentoWork.length> 0){
				console.log("dd",res);
				//$('.removeTr').remove();
				printWorkData(res.sysdateMentoWork, $('#custom-tabs-three-home'), $('#sysdateMentoWork-template'));
			}else{
				var str = `
					<tr style="height: 45px;">
						<td colspan="6" style="text-align:center">
							<strong>진행중인 업무가 없습니다.</strong>
						</td>
					</tr>
				`;

				$('#custom-tabs-three-home').html(str);
			}

			lPage = sysdateMentoPage - 1;
			if(lPage < 1){lPage = 1;}
			rPage = sysdateMentoPage + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					target : 'sysdateMentoWorkGo',
					left : "javascript:sysdateMentoWorkGo("+lPage+")",
					right : "javascript:sysdateMentoWorkGo("+rPage+")",
					doubleLeft : "javascript:sysdateMentoWorkGo("+1+")",
					doubleRight :"javascript:sysdateMentoWorkGo("+(res.pageMaker.realEndPage)+")"
			}
			printPageMaker(pageMakerData ,$('.sysdateMentoWorkPage'), $('#pageMaker-template'));

		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}

function sysdateMenteeWorkGo(startPage){
	sysdateMenteePage = startPage
	var data = {
			'page' : sysdateMenteePage,
			'eno' : ${loginUser.eno}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/main/sysdateMenteeWork.do',
		data : data,
		type : 'post',
		success: function(res){
				console.log("dd",res);
			if(res.sysdateMenteeWork.length> 0){
				//$('.removeTr').remove();
				printWorkData(res.sysdateMenteeWork, $('#custom-tabs-three-home'), $('#sysdateMentoWork-template'));
			}else{
				var str = `
					<tr style="height: 45px;">
						<td colspan="6" style="text-align:center">
							<strong>진행중인 업무가 없습니다.</strong>
						</td>
					</tr>
				`;

				$('#custom-tabs-three-home').html(str);
			}

			lPage = sysdateMenteePage - 1;
			if(lPage < 1){lPage = 1;}
			rPage = sysdateMenteePage + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					target : 'sysdateMenteeWorkGo',
					left : "javascript:sysdateMenteeWorkGo("+lPage+")",
					right : "javascript:sysdateMenteeWorkGo("+rPage+")",
					doubleLeft : "javascript:sysdateMenteeWorkGo("+1+")",
					doubleRight :"javascript:sysdateMenteeWorkGo("+(res.pageMaker.realEndPage)+")"
			}
			printPageMaker(pageMakerData ,$('.sysdateMentoWorkPage'), $('#pageMaker-template'));

		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}

function sysdateAllWorkGo(startPage){
	sysdateAllPage = startPage
	var data = {
			'page' : sysdateAllPage,
			'eno' : ${loginUser.eno}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/main/sysdateAllWork.do',
		data : data,
		type : 'post',
		success: function(res){
				console.log("all",res);
			if(res.sysdateAllWork.length> 0){
				printWorkData(res.sysdateAllWork, $('#custom-tabs-three-home'), $('#sysdateMentoWork-template'));
			}else{
				var str = `
					<tr style="height: 45px;">
						<td colspan="6" style="text-align:center">
							<strong>진행중인 업무가 없습니다.</strong>
						</td>
					</tr>
				`;

				$('#custom-tabs-three-home').html(str);
			}

			lPage = sysdateAllPage - 1;
			if(lPage < 1){lPage = 1;}
			rPage = sysdateAllPage + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					target : 'sysdateAllWorkGo',
					left : "javascript:sysdateAllWorkGo("+lPage+")",
					right : "javascript:sysdateAllWorkGo("+rPage+")",
					doubleLeft : "javascript:sysdateAllWorkGo("+1+")",
					doubleRight :"javascript:sysdateAllWorkGo("+(res.pageMaker.realEndPage)+")"
			}
			printPageMaker(pageMakerData ,$('.sysdateMentoWorkPage'), $('#pageMaker-template'));

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

function applyModal_Go(mento){
	//alert(mento);
	$('div#modal div.modal-body div.row input:radio[name=radioName]:checked').val();
	$('div#modal div.modal-header h4.modal-title').val(mento);
}
function exdateApply_Go(){
	var mento=$('div#modal h4.modal-title').val();
	var period=$('div#modal input:radio[name=radioName]:checked').val();
	console.log(mento);

	var sendData={
			"mento":mento,
			"period":period
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/mentoring/exdateApply.do",
		type:"GET",
		data:sendData,
		success:function(result){
			if(result){
				Swal.fire({
				    icon: 'success',
				    title: '연장신청이 완료되었습니다.',
				    confirmButtonColor: '#3085d6',
				  }).then(function(){
					  endMentoringListGo(1);
				  });
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

</script>

<script type="text/x-handlebars-template" id="sysdateMentoWork-template">
{{#each .}}
		<tr style='font-size: 0.9em;' onclick="">
			<td>
				<div class="row">
					<div class="col-1">
						<span class="info-box-icon">
							<img class="direct-chat-img" data-cfsrc="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image"
								src="{{photo}}">
						</span>
					</div>
					<div class="col-10" style=" max-width: 600px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
						<span><b>{{name }} {{ppsName }}이(가) 새로운 업무 '{{wtitle}}'을(를) 시작했습니다.</b></span>&nbsp;<br>
						<span class="text-muted">{{formatWDate wdate }}</span>
					</div>
					<div class="col-1" style="padding-left:0;padding-right:0;">
						<span style="{{sysdateNewButton wdate}}" class="right badge badge-danger">New</span>
					</div>
				</div>
			</td>
		</tr>
{{/each}}

</script>
<script>
function read(smno){
	location.reload();
	OpenWindow('menteeDetail.do?smno='+smno, '멘토링 승낙', '600', '700');
}
</script>
<script type="text/x-handlebars-template"  id="subMentoringList-template">
{{#each .}}
	<tr style='font-size: 0.9em; cursor: pointer;' onclick="read('{{smno}}')">

		<td>
		<div class="row">
			<div class="col-1 pl-0">
				<span class="info-box-icon">
					<img src="{{photo}}" alt="User" width="40" height="40" class="rounded-circle" loading="lazy">&nbsp;&nbsp;
				</span>
			</div>
			<div class="col-11" style="padding-left:15px;">
				<span style="color:{{readCheckColor readCheck}}"><b>{{name }} {{ppsName }}이(가) 나를 멘토로 등록하고자 합니다.</b></span>&nbsp;<span style="{{readCheckButton readCheck}}" class="right badge badge-danger">New</span><br>
				<span class="text-muted">{{formatDate regDate }}</span>
			</div>
		</div>
		</td>

	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="endMentoringList-template">
{{#each .}}
	<tr style='font-size: 0.9em;' onclick="">

		<td style="width: 30%">
			<img src="{{photo}}" alt="User" width="40" height="40" class="rounded-circle" loading="lazy">&nbsp;&nbsp;
				<span><b>{{name }} {{ppsName }}</b></span>
		</td>
		<td style="width: 50%">
			<span>만료일 : {{formatEDate endDate}}</span>&nbsp;&nbsp;&nbsp;<span class="right badge badge-danger">D-{{dDay}}</span><br>
			<span class="text-muted">(시작일 : {{formatSDate startDate }})</span>
		</td>
		<td style="width: 20%">
			<button type="button" style="{{buttonHidden mento}}" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modal" onclick="applyModal_Go('{{mento}}');">연장신청</button>
		</td>

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

<script>
	Handlebars.registerHelper({
		"formatWDate" : function(wdate){
			var dateObj = new Date(wdate);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "-" + month + "-" + date;
		},
		"formatDate" : function(regDate){
			var dateObj = new Date(regDate);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "-" + month + "-" + date;
		},
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
		"buttonHidden" : function(mento){
			var str = "";
			if(mento == ${loginUser.eno}){
				str = "display : none";
			}
			return str;
		},
		"readCheckColor" : function(readCheck){
			console.log("readCheck!!",readCheck);
			var str = "";
			if(readCheck == 1){
				str = "gray";
			}
			return str;
		},
		"readCheckButton" : function(readCheck){
			var str = "";
			if(readCheck == 1){
				str = "display : none";
			}
			return str;
		},
		"sysdateNewButton" : function(wdate){
			var today = new Date();
			var date =today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
			var wdate = new Date(wdate);
			var wdateParse = wdate.getFullYear() + "-" + (wdate.getMonth() + 1) + "-" + wdate.getDate();
			var str = "";

			if(date != wdateParse){
				str = "display : none";
			}
			return str;
		},
		"printPage" : function(pageMakerData){
			var pageMaker = pageMakerData.pageMaker;
			var target;

			if(pageMakerData.target == "subMentoringListGo"){
				target = "subMentoringListGo";
			}
			if(pageMakerData.target == "endMentoringListGo"){
				target = "endMentoringListGo";
			}
			if(pageMakerData.target == "sysdateMentoWorkGo"){
				target = "sysdateMentoWorkGo";
			}
			if(pageMakerData.target == "sysdateMenteeWorkGo"){
				target = "sysdateMenteeWorkGo";
			}
			if(pageMakerData.target == "sysdateAllWorkGo"){
				target = "sysdateAllWorkGo";
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
