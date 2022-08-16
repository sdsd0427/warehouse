<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		th{
			vertical-align: middle !important;
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
		.page-link {
		    line-height: 1;
		    color: #0c4b8d;
		    background-color: #fff;
		    border: 1px solid #0c4b8d;
		}
		.page-item.active .page-link {
		    z-index: 3;
		    color: #fff;
		    background-color: #0c4b8d;
		    border-color: #0c4b8d;
		}
		a.nav-link{
			color: white;
		}

/* 		.emp_profile{ */
/* 		    border-radius: 50%; */
/* 		    float: left; */
/* 		    height: 40px; */
/* 		    width: 40px; */
/* 		} */

	</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
</head>
<body>
	<div class="row ml-2" style="margin: 0">
		<div class="col-8" style="padding: 20px;">
			<div class="row" style="justify-content: space-between;">
				<h2 class="title" >업무 수정</h2>
				<div class="row col-4">
					<div class="col-6">
						<button type="button" class="btn btn-block btn-outline-dark" onclick="toReqModify('${objection.eno}')">저장</button>
					</div>
					<div class="col-6">
						<button type="button" class="btn btn-block btn-outline-dark" onclick="history.back()">취소</button>
					</div>
				</div>
			</div>
			<form role="form" action="workRegist.do" method="post" enctype="multipart/form-data" name="registForm">
			<table class="table projects " style="width: 100%; table-layout: fixed; font-size: 14px; margin-top: 20px; text-align: center; ">
				<tr>
					<th style="width: 30%;">
						요청자
					</th>
					<td style="width: 60%;">
						<input type="hidden" name="eno" value="${work.requestBy.eno }">
						<input type="hidden" name="dno" value="${work.requestBy.eno }">
						<div style="align-items: center; display: flex; justify-content: center;">
							<div>
								<img class="table-avatar emp_profile" src="${work.requestBy.photo }">
							</div>
							<div>
								<span style="font-size:12px; font-weight:bold">${work.requestBy.name } ${work.requestBy.ppsname }</span>
								<div style="font-size:8px;">
									<p>${work.requestBy.dname }</p>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th style="width: 20%">제목</th>
					<td style="word-break:break-all">
						<input type="text" name="wtitle" class="form-control form-control-sm" value="${work.wtitle }">
					</td>
				</tr>
				<tr>
					<th style="width: 20%">담당자</th>
					<td>
							<div class="row col-12 emp_List" style="align-items: center; display: flex; justify-content: center; position: relative;">
							<c:forEach items="${work.workManagerList}" var="manager">
								<div class="emp_select_card col-6" data-eno="${manager.eno }" style="align-items: center; display: flex; justify-content: center;">
									<div style="padding: 5px; position: relative;">
										<input type="hidden" name="workManagerEno" value="${manager.eno }">
										<span class="badge bg-success wmstepBtn" style="display:${manager.wmstep eq 1 ? 'block' : 'none'}; position:absolute; top: 0; left: 0">책임</span>
										<input type="radio" style="display: none;" name="wmstep" value="${manager.eno }" id="${manager.eno }"
											onclick="wmstepCheck(this)" ${manager.wmstep eq 1 ? 'checked' : '' }>
										<label for="${manager.eno }"><img class="table-avatar emp_profile" src="${manager.photo }"></label>
									</div>
									<div class="text-left"  style="position: relative;">
										<div style="display: flex; align-items: center">
											<p style="font-size: 12px; font-weight: bold">${manager.name } </p>&nbsp;&nbsp;
											<c:if test="${objection.result == 0 and objection.eno eq manager.eno}">
											<i class="fas fa-times removeBtn text-danger" onclick="removeManager('${manager.eno}')" style="cursor:pointer;"></i>
											</c:if>
										</div>
										<div style="font-size: 8px;">
											<p>${manager.ppsname }</p>
											<p>${manager.dname }</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<th style="width: 20%">기한</th>
					<td>
						<input type="date" name="wend" class="form-control form-control-sm" value="<fmt:formatDate value="${work.wend }" pattern="yyyy-MM-dd"/>">
					</td>
				</tr>
				<tr>
					<th style="width: 20%">해시태그</th>
					<td style=" word-break:break-all;">
						<input type="text" name="hashTag" class="form-control form-control-sm" value="${work.hashTag }">
					</td>
				</tr>
				<tr>
					<th>공개여부</th>
					<td style="display: flex; justify-content: center">
						<div class="custom-control custom-radio" style="margin: 0 10px;">
							<input class="custom-control-input" type="radio" id="open" name="wopen" value="1" ${work.wopen eq 1 ? 'checked' : '' }>
							<label for="open" class="custom-control-label">공개</label>
						</div>
						<div class="custom-control custom-radio">
							<input class="custom-control-input" type="radio" id="close" name="wopen" value="0" ${work.wopen eq 0 ? 'checked' : '' }>
							<label for="close" class="custom-control-label">비공개</label>
						</div>
					</td>
				</tr>
			</table>
			<div>
				<textarea class="textarea" name="wcontent" id="content" rows="20"
							cols="90" placeholder="1000자 내외로 작성하세요.">${work.wcontent }</textarea>
			</div>
			<div class="card card-light card-outline">
				<div class="card-header">
				<h5 class="card-title" style="font-size: medium;"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
				&nbsp;&nbsp;&nbsp;<button class="btn btn-xs btn-info"
								onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
				</div>
				<div class="card-footer fileInput">
				<div class="form-group">
					<ul class="mailbox-attachments d-flex align-items-stretch clearfix">

						<c:if test="${!empty work.attachList }">
							<c:forEach items="${work.attachList }" var="attach" >
								<li class="attach-item thumb${attach.refNo }" file-name="${attach.fileName }" target-ano="${attach.refNo }">
									<div class="mailbox-attachment-info ">
										<a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${attach.fileName }" attach-no="${attach.refNo }" href=""  >
											<i class="fas fa-paperclip"></i>
											${attach.fileName }&nbsp;&nbsp;
											<button type="button" onclick="removeFile_go('thumb${attach.refNo}');return false;" style="border:0;outline:0;"
													class="badge bg-red">X</button>
										</a>
									</div>
								</li>
							</c:forEach>
						</c:if>
					</ul>
					<br/>
				</div>
			</div>
			</div>
			</form>
		</div>
		<div class="col-4" style="padding:20px; border-left: 1px solid gray">
			<div>
				<p style="font-weight: bold; padding-bottom: 10px">담당자 추가</p>

					<div>
						<div class="card">
							<div id="inAll" style="margin: 30px">
								<div id="wrap">
									<span class="material-symbols-outlined">
										corporate_fare
									</span>
								  	<span >PoJo기업</span>
									<div id="organization" >

									</div>
								</div>
							</div>
						</div>
					</div>

			</div>
			<div>
				<p style="font-weight: bold; margin-top: 20px;">관련 업무 검색</p>
				<div style="display: flex;">
					<input class="form-control" type="search" placeholder="해시태그 검색">
					<button type="submit" class="btn btn-default" style="height: 38px;">
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div style="overflow: scroll; height: 40vh">
					<table class="table table-hover" style="margin-top: 10px; font-size: 12px; text-align: center;">
						<thead>
							<tr>
								<th style="width: 70%">제목</th>
								<th style="width: 30%">상태</th>
							</tr>
						</thead>
						<tr>
							<td colspan="2">검색결과가 없습니다.</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

<script>
$(function(){
	summernote_go($('textarea[name="wcontent"]'), '<%=request.getContextPath()%>');
});
</script>

<script>
var workManagerList = [];
</script>

<script>
var dataNum=0;
function addFile_go(){
	if($('input[name="uploadFile"]').length>=5){
		Swal.fire({
		      icon: 'warning',
		      title: '파일첨부는 5개까지만 가능합니다.',
		      confirmButtonColor: '#3085d6',
		    });
		return;
	}

	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");

	$('.fileInput').append(div);
	dataNum++;
}

function remove_go(dataNum){
	$('div[data-no="'+dataNum+'"]').remove();
}

function registGo(){
// 	var form = $('form[role="form"]');
	var form = document.registForm;
// 	console.log("form",form[0]);

	if($('input[name="wtitle"]').val() == ""){
		Swal.fire({
		      icon: 'warning',
		      title: '제목은 필수입력입니다.',
		      confirmButtonColor: '#3085d6',
		    });
		$('input[name="wtitle"]').focus();
		return;
	}

	if(newWorkManager.length == 0){
		Swal.fire({
		      icon: 'warning',
		      title: '담당자를 추가해주세요.',
		      confirmButtonColor: '#3085d6',
		    });
		return;
	}

	var files=$('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name+" : "+file.value);
		if(file.value==""){
			Swal.fire({
			      icon: 'warning',
			      title: '파일을 선택하세요.',
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
			    	file.focus();
					file.click();
			      });
				return;
		}
	}

	form.submit();
}
</script>

<script>
$('#organization').jstree({
	core : {
		data :${organizationNode}
	},
	types : {
		'default' : {'icon': 'jstree-folder'}
	},
	 plugins: ['wholerow', 'types']
})
</script>
<script>
$('#organization').on("changed.jstree", function (e, data) {
	console.log("data",data);
    if(data.node.id.length > 3){
		console.log("data.node.id.length",data.node.id.length);
    	$.ajax({
    		url : "<%=request.getContextPath()%>/work/getEmpByNodeId.do?eno=" + data.node.id,
    		type:'get',
    		success:function(res){
    			console.log(res);
    			if(res.eno == ${work.eno}){
    				Swal.fire({
  				      icon: 'warning',
  				      title: '업무 요청자는 담당자로 추가할 수 없습니다.',
  				      confirmButtonColor: '#3085d6',
  				    });
    				return;
    			}

    			if($('div[data-eno="' + res.eno + '"]').length == 0){
	    			addEmp(res, $('.emp_List'), $('#addEmp-template'))
	    			if($('.emp_select_card').length == 1){
	    				alert("test");
	    				$('.wmstepBtn').css("display", "block");
	    				$('input[name=wmstep]').prop('checked', true);
	    			}


    				var hashTag = $('input[name=hashTag]').val();

    				var tagList = hashTag.split(" ");
    				console.log(tagList);
    				var hashCodeSet = new Set(tagList);
    				hashCodeSet.add("#" + res.year + "년차");
    				console.log(hashCodeSet);

    				var result = "";
    				for(var code of hashCodeSet){
    					result += code+" ";
    				}

    				$('input[name=hashTag]').val(result.trim());

	    			addWorkManager(res.eno);
    			}else{
    				Swal.fire({
  				      icon: 'warning',
  				      title: '이미 등록된 담당자는 추가할 수 없습니다.',
  				      confirmButtonColor: '#3085d6',
  				    });
    			}

    		},
    		error:function(error){
    			Swal.fire({
				      icon: 'error',
				      title: error,
				      confirmButtonColor: '#3085d6',
				    });
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
<script>
function wmstepCheck(radio){
	console.log(radio);
	$('.wmstepBtn').css("display", "none");
	$(radio).prev().css("display", "block");
}
</script>

<%@ include file="./work_js.jsp" %>
</body>