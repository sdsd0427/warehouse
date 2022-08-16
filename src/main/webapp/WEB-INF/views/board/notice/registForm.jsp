<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<body>

<div class="wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3>공지사항</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;"> 	
					<span  class="text-muted"  style="padding-right: 620px;">게시판 > 공지사항</span>
				</div>
			</div>
		</div>
	</section>

	<section class="content container-fluid">
		<div class="card card-navy card-outline">
			<div class="card-header">
				<h3 class="card-title" style="padding-top: 8px;">공지사항 등록</h3>
				<div class="col-lg-12">
					<button class="btn btn-outline-dark float-right" style="margin-left:20px;" type="button" onclick="javascript:history.back();">취소</button>
					<button class="btn btn-outline-primary float-right"  type="button" onclick="regist_go();">등록</button>
				</div>
			</div>

			<div class="card-body">
			<form enctype="multipart/form-data" role="form" action="noticeRegist.do" method="post" name="registForm">
				<div class="form-group row">
				<label class="col-2 mt-3">상단 고정</label>
					<div class="row">
						<div class="custom-control col-12 mt-3" style="padding-left:30px;">
							<div class="custom-checkbox">
								<input class="form-check-input" type="checkbox" id="fix" name="fix" value="">
								<label>고정</label>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-2">제목</label>
					<input class="form-control col-10" type="text" id="boardTitle" name="boardTitle" placeholder="제목을 작성하세요">
					<input type="hidden" name="classCode" value="A101">
				</div>
				<div class="form-group row">
					<label class="col-2">작성자</label>
					<input class="form-control col-10" type="text" id="name" name="name" value="${loginUser.name }" readonly>
				</div>
				<div class="form-group row">
					<label class="col-2" for="content">내용</label>
						<textarea class="form-control" name="boardContent" id="boardContent" rows="5" cols=""
						placeholder="" ></textarea>
				</div>
				<div class="card card-light card-outline">
					<div class="card-header" style="font-size: medium;">
					<h5 class="card-title" style="font-size: medium;"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
					&nbsp;&nbsp;&nbsp;<button class="btn btn-xs btn-info"
									onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
					</div>
					<div class="card-footer fileInput"></div>
				</div>
			</form>
			</div>

		</div>
	</section>

</div>

<script>
$(function(){
   summernote_go($('textarea[name="boardContent"]'),'<%=request.getContextPath()%>');
});
var dataNum=0;
function addFile_go(){
	if($('input[name="uploadFile"]').length>=5){
		Swal.fire({
		      icon: 'warning',
		      title: '파일추가는 5개까지만 가능합니다.',
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

function regist_go(){
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

	var form = document.registForm;

	if($("#fix").is(":checked")){
		if(parseInt('${fixBoardListSize}') == 5){
			Swal.fire({
			      icon: 'warning',
			      title: '상단 고정은 5개까지 가능합니다.',
			      confirmButtonColor: '#3085d6',
			    })
			return;
		}
		$("#fix").attr("value","1");
		Swal.fire({
		      icon: 'success',
		      title: '상단 고정 공지로 등록합니다.',
		      confirmButtonColor: '#3085d6',
		    })
	}

	if(form.boardTitle.value==""){
		Swal.fire({
		      icon: 'warning',
		      title: '제폭은 필수입니다.',
		      confirmButtonColor: '#3085d6',
		    })
		return;
	}
	form.submit();
}
</script>

</body>
