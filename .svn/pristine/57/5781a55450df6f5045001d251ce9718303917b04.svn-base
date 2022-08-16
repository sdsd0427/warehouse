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
					<h3>경조사게시판</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;"> 	
					<span  class="text-muted"  style="padding-right: 535px;">게시판 > 경조사게시판</span>
				</div>
			</div>
		</div>
	</section>

	<section class="content container-fluid">
		<div class="card card-navy card-outline">
			<div class="card-header">
				<h3 class="card-title" style="padding-top: 8px;">경조사게시판 등록</h3>
				<div class="col-lg-12">
					<button class="btn btn-outline-dark float-right" style="margin-left:20px;" type="button" onclick="javascript:history.back();">취소</button>
					<button class="btn btn-outline-primary float-right"  type="button" onclick="regist_go();">등록</button>
				</div>
			</div>

			<div class="card-body">
				<form enctype="multipart/form-data" role="form" action="eventRegist.do" method="post" name="registForm">
					<div class="form-group row">
						<label for="title" class="col-2">경조 구분</label>
						<select class="form-control col-3" id="eventcate" name="eventcate">
							<option value="1">결혼</option>
							<option value="2">부고</option>
						</select>
					</div>
					<div class="form-group row">
						<label for="title" class="col-2">게시글 만료일</label>
						<input type="date" id="enddate" value="" name="enddate" class="form-control form-control col-3">
					</div>
					<div class="form-group row">
						<label for="title" class="col-2">제목</label>
						<input class="form-control col-10" type="text" id="boardTitle" name="boardTitle" placeholder="제목을 작성하세요">
						<input type="hidden" name="classCode" value="A103">
					</div>
					<div class="form-group row">
						<label for="eno" class="col-2">작성자</label>
						<input class="form-control col-10" type="text" id="name" name="name" value="${loginUser.name }" readonly>
					</div>
					<div class="form-group row">
						<label for="content" class="col-2" >내용</label>
						<textarea class="form-control" name="boardContent" id="boardContent" rows="5" cols=""
							placeholder="" ></textarea>
					</div>
					<div class="card card-light card-outline">
						<div class="card-header">
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
	   summernote_go($('#boardContent'),'<%=request.getContextPath()%>');
	})
</script>
<script>
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
	if(form.boardTitle.value==""){
		Swal.fire({
		      icon: 'warning',
		      title: '제목은 필수입니다.',
		      confirmButtonColor: '#3085d6',
		    });
		return;
	}
	form.submit();
}
</script>
</body>
