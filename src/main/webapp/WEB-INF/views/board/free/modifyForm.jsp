<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<h3>자유게시판</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;"> 	
					<span  class="text-muted"  style="padding-right: 580px;">게시판 > 자유게시판</span>
				</div>
			</div>
		</div>
	</section>

	<section class="content container-fluid">
		<div class="card card-navy card-outline">
			<div class="card-header">
				<h3 class="card-title" style="padding-top: 8px;">자유게시판 수정</h3>
				<div class="col-lg-12">
					<button class="btn btn-outline-dark float-right" style="margin-left:20px;" type="button" onclick="javascript:history.back();">취소</button>
					<button class="btn btn-outline-primary float-right" type="button" onclick="modify_go()">수정</button>
				</div>
			</div>

			<div class="card-body">
				<form enctype="multipart/form-data" role="form" method="post" action="freeModify.do" name="modifyForm">
				<input type="hidden" name="boardNo" value="${board.boardNo }" />

					<div class="form-group row">
					<label class="col-2 mt-3">작성자 표시</label>
						<div class="row">
							<div class="custom-control col-12 mt-3" style="padding-left:30px;">
								<div class="custom-checkbox">
									<input class="form-check-input" type="checkbox" id=anonym name="anonym" value="" ${board.anonym eq 1? 'checked':'' }>
									<label>익명 사용</label>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-2">제목</label>
						<input class="form-control col-10" type="text" class="form-control" id="boardTitle" name="boardTitle" value="${board.boardTitle }">
					</div>
					<div class="form-group row">
						<label class="col-2">작성자</label>
						<input class="form-control col-10" type="text" class="form-control" id="name" name="name" value="${board.name }" readonly>
					</div>
					<div class="form-group row">
						<label class="col-2" for="content">내용</label>
						<textarea class="form-control" name="boardContent" id="boardContent" rows="5" cols=""
							placeholder="" >${board.boardContent }</textarea>
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

								<c:forEach items="${board.attachList }" var="attach" >
									<li class="attach-item thumb${attach.attachNo }" file-name="${attach.fileName }" target-ano="${attach.attachNo }">
										<div class="mailbox-attachment-info ">
											<a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${attach.fileName }" attach-no="${attach.attachNo }" href="<%=request.getContextPath()%>/free/getFile.do?attachNo=${attach.attachNo }"  >
												<i class="fas fa-paperclip"></i>
												${attach.fileName }&nbsp;&nbsp;
												<button type="button" onclick="removeFile_go('thumb${attach.attachNo}');return false;" style="border:0;outline:0;"
														class="badge bg-red">X</button>
											</a>
										</div>
									</li>
								</c:forEach>
							</ul>
							<br/>
						</div>
					</div>
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

function removeFile_go(className){
	var li = $('li.'+className);
	
	Swal.fire({
	    title: '파일 삭제',
	    text: li.attr("file-name")+"을 정말 삭제하시겠습니까?",
	    icon: 'question',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: '확인',
	    cancelButtonText: '취소',
	    reverseButtons: true, // 버튼 순서 거꾸로
	  }).then((result) => {
	    if (result.isConfirmed) {
	      Swal.fire(
	        '파일을 삭제하였습니다.'
	      ).then(function(){
	    	  li.remove();

	    		var input=$('<input>').attr({"type":"hidden",
	    			"name":"deleteFile",
	    			"value":li.attr("target-ano")
	    			})
	    		$('form[role="form"]').prepend(input);
	      })
	    }
	 })
	
}

var dataNum=0;
function addFile_go(){
	var attachedFile=$('a[name="attachedFile"]').length;
	var inputFile=$('input[name="uploadFile"]').length;
	var attachCount=attachedFile+inputFile;

	if(attachCount>=5){
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

function modify_go(){
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name+" : "+file.value);
		if(file.value==""){
			Swal.fire({
			      icon: 'warning',
			      title: '파일을 선택하세요.',
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
						file.focus();
			      });
			return false;
		}
	}

	var form = $('form[name="modifyForm"]');

	if($("#anonym").is(":checked")){
		$("#anonym").attr("value",1);
	}

	if($("input[name='boardTitle']").val()==""){
		Swal.fire({
		      icon: 'warning',
		      title: '제목은 필수입니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
		    	$("input[name='boardTitle']").focus();
		      });
		return;
	}
	$("form[role='form']").submit()
}
</script>

</body>
