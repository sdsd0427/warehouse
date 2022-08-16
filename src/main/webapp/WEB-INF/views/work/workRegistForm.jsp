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
				<h2 class="title" >새 업무</h2>
<!-- 				<div class="col-2"> -->
<!-- 				</div> -->
			</div>
			<div class="card card-outline card-navy ml-2 mr-2 p-2">
				<div class="card-body pt-0">
							<div class ="mb-2 text-right">
								<button type="button" class="btn btn-sm btn-outline-primary" onclick="registGo()">등록</button>
<!-- 								<button type="button" class="btn btn-sm btn-outline-dark " id="registBtn" onclick="regist_go();">제 출</button> -->
								<button type="button" class="btn btn-sm btn-outline-dark " id="cancelBtn" onclick="CloseWindow();" >취 소</button>
							</div>
					<form role="form" action="workRegist.do" method="post" enctype="multipart/form-data" name="registForm">
					<table class="table projects " style="width: 100%; table-layout: fixed; font-size: 14px; text-align: center; ">
						<tr>
							<th style="width: 30%;">
								요청자
							</th>
							<td style="width: 60%;">
								<input type="hidden" name="eno" value="${emp.eno }">
								<input type="hidden" name="dno" value="${emp.dno }">
								<div style="align-items: center; display: flex; justify-content: center;">
									<div>
										<img class="table-avatar emp_profile" src="${emp.photo }">
									</div>
									<div>
										<span style="font-size:12px; font-weight:bold">${emp.name } ${emp.ppsname }</span>
										<div style="font-size:8px;">
											<p>${emp.dname }</p>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th style="width: 20%">제목</th>
							<td style="word-break:break-all">
								<input type="text" name="wtitle" class="form-control form-control-sm">
							</td>
						</tr>
						<tr>
							<th style="width: 20%; min-height: 40px;">담당자</th>
							<td>
								<div class="row col-12 emp_List" style="align-items: center; display: flex; justify-content: center; position: relative; min-height: 35px;">
								</div>
							</td>
						</tr>
						<tr>
							<th style="width: 20%">기한</th>
							<td>
								<input type="date" name="wend" class="form-control form-control-sm" value="<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>">
							</td>
						</tr>
						<tr>
							<th style="width: 20%">해시태그</th>
							<td style=" word-break:break-all;">
								<input type="text" name="hashTag" class="form-control form-control-sm" value="#${emp.dname }">
							</td>
						</tr>
		<!-- 				<tr> -->
		<!-- 					<th>첨부파일</th> -->
		<!-- 					<td> -->
		<!-- 						<div class="custom-file" style="height: 31px;"> -->
		<!-- 							<input type="file" class="custom-file-input" id="customFile" style="height: 30px;" value="dd"> -->
		<!-- 							<label class="custom-file-label" for="customFile" style="color: gray; height: 30px; padding-top: 4px;"> -->
		<!-- 								첨부파일을 등록해주세요. -->
		<!-- 							</label> -->
		<!-- 						</div> -->
		<!-- 					</td> -->
		<!-- 				</tr> -->
						<tr>
							<th>공개여부</th>
							<td style="display: flex; justify-content: center; min-height: 40px;">
								<div class="custom-control custom-radio" style="margin: 0 10px;">
									<input class="custom-control-input" type="radio" id="open" name="wopen" value="1" checked="checked">
									<label for="open" class="custom-control-label">공개</label>
								</div>
								<div class="custom-control custom-radio">
									<input class="custom-control-input" type="radio" id="close" name="wopen" value="0">
									<label for="close" class="custom-control-label">비공개</label>
								</div>
							</td>
						</tr>
					</table>
					<div>
						<textarea class="textarea" name="wcontent" id="content" rows="20"
									cols="90" placeholder="1000자 내외로 작성하세요." ></textarea>
					</div>
					<div class="card card-light card-outline">
						<div class="card-header">
						<h5 class="card-title" style="font-size: medium;"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
						&nbsp;&nbsp;&nbsp;<button class="btn btn-xs btn-dark"
										onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
						</div>
						<div class="card-footer fileInput"></div>
					</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-4" style="padding:20px; border-left: 1px solid gray; margin-top: 33px;">
			<div>
				<p style="font-weight: bold; padding-bottom: 10px">담당자 추가</p>

					<div>
						<div class="card card-outline card-navy">
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
					<input class="form-control" name="search" class="search" type="search" placeholder="해시태그 검색">
					<button type="button" class="btn btn-dark" style="height: 38px;" onclick="getAllKnowhowList(1,'h')">
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div style="height: 40vh">
					<table class="table table-hover" style="margin-top: 10px; font-size: 12px; text-align: center;">
						<thead>
							<tr>
								<th style="width: 70%">제목</th>
								<th style="width: 30%">조회수</th>
							</tr>
						</thead>
						<tbody class="knowhowList">
						</tbody>
					</table>
				</div>
				<div class="text-center">
					<ul class="pagination justify-content-center m-0" id="relationKnowhowPagination">
					</ul>
				</div>
			</div>
		</div>
	</div>


<c:if test="${from eq 'regist'}" >
	<script>
	Swal.fire({
	      icon: 'success',
	      title: '새 업무가 요청되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
	    	var enoList = ${retWorkManagerEno};

			for(var eno of enoList){
				console.log(eno);
				opener.parent.sendSignal(eno, "${retWorkTitle}", "B101", "work/myWorkList.do", 'M113000');
			}

			window.close();
	 		window.opener.location.href="<%=request.getContextPath()%>/work/toReqList.do?mCode=M114000";
	      });
	</script>
</c:if>

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
		      title: '제목은 필수입니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				$('input[name="wtitle"]').focus();
		      });
			return;
	}

	if(newWorkManager.length == 0){
		Swal.fire({
		      icon: 'warning',
		      title: '담당자를 추가해주세요.',
		      confirmButtonColor: '#3085d6',
		    })
		return;
	}

	if($('input[name=wmstep]:checked').length == 0){
		Swal.fire({
		      icon: 'warning',
		      title: '책임자를 선택해주세요.',
		      confirmButtonColor: '#3085d6',
		    })
		return;
	}

	var text = $('.note-editable').text();
	if(text.length < 1){
		Swal.fire({
		      icon: 'warning',
		      title: '내용을 작성해주세요.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				$('.note-editable').focus();
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
    			if(res.eno == '${work.eno}'){
    				Swal.fire({
    				      icon: 'warning',
    				      title: '업무 요청자는 담당자로 추가할 수 없습니다.',
    				      confirmButtonColor: '#3085d6',
    				    })
    				return;
    			}

    			if($('div[data-eno="' + res.eno + '"]').length == 0){
	    			addEmp(res, $('.emp_List'), $('#addEmp-template'))
	    			if($('.emp_select_card').length == 1){
	    				$('.wmstepBtn').css("display", "block");
	    				$('input[name=wmstep]').prop('checked', true);
	    			}


//     				var hashTag = $('input[name=hashTag]').val();

//     				var tagList = hashTag.split(" ");
//     				console.log(tagList);
//     				var hashCodeSet = new Set(tagList);
//     				hashCodeSet.add("#" + res.year + "년차");
//     				console.log(hashCodeSet);

//     				var result = "";
//     				for(var code of hashCodeSet){
//     					result += code+" ";
//     				}

//     				$('input[name=hashTag]').val(result.trim());

	    			addWorkManager(res.eno);
    			}else{
    				Swal.fire({
  				      icon: 'warning',
  				      title: '이미 등록된 담당자는 추가할 수 없습니다.',
  				      confirmButtonColor: '#3085d6',
  				    })
    			}

    		},
    		error:function(error){
    			AjaxErrorSecurityRedirectHandler(error.status);
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
function getAllKnowhowList(page, type){
// 	alert("d");

	var allKnowHowPage = page;
	var searchType = type;
	var keyword = $('input[name="search"]').val();

	console.log(allKnowHowPage);
	console.log(searchType);
	console.log(keyword);

	$.ajax({
		url : '<%=request.getContextPath()%>/kw/knowhow/getAllKnowHowList.do',
		type : 'get',
		data : {
			page : page,
			searchType : searchType,
			keyword: keyword
		},
		success:function(res){
			console.log("res",res);
			if(res.knowhowList.length == 0){
				var str = `
					<tr>
						<td colspan="2">
							노하우가 존재하지 않습니다.
						</td>
					</tr>
				`;

				$('.knowhowList').html(str);
			}else{
				printList(res.knowhowList, $('.knowhowList'), $('#relation-template'));
				relationKnowhowPage = page;
				var pageMakerMap = {
						pageMaker : res.pageMaker,
						target : "javascript:getAllKnowhowList"
				}
				printPageMaker(pageMakerMap, $('#relationKnowhowPagination'), $('#detail-pagination-template'));
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>

<script>
function wmstepCheck(radio){
	console.log(radio);
	$('.wmstepBtn').css("display", "none");
	$(radio).prev().css("display", "block");
}
</script>
<script type="text/x-handlebars-template"  id="addEmp-template">
	<div class="emp_select_card col-6" data-eno="{{eno}}" style="align-items: center; display: flex; justify-content: center;">
		<div style="padding: 5px; position: relative;">
			<input type="hidden" name="workManagerEno" value="{{eno}}">
			<span class="badge bg-success wmstepBtn" style="display:none; position:absolute; top: 0; left: 0">책임</span>
			<input type="radio" style="display: none;" name="wmstep" value="{{eno}}" id="{{eno}}"
				onclick="wmstepCheck(this)">
			<label for="{{eno}}"><img class="table-avatar emp_profile" src="{{photo}}"></label>
		</div>
		<div class="text-left"  style="position: relative;">
			<div style="display: flex; align-items: center">
				<p style="font-size: 12px; font-weight: bold">{{name}} </p>&nbsp;&nbsp;
				<i class="fas fa-times removeBtn text-danger" onclick="removeManager('{{eno}}')" style="cursor:pointer;"></i>
			</div>
			</span>
			<div style="font-size: 8px;">
				<p>{{ppsname}}</p>
				<p>{{dname}}</p>
			</div>
		</div>
	</div>
</script>
<%@ include file="./work_js.jsp" %>
</body>