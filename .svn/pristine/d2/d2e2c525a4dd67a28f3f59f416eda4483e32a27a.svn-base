<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<title></title>

<body>
	<div class="wrapper">
		<section class="content-header ">
			<div class="row md-2">
				<div class="col-sm-12">
					<h2>메뉴얼 수정</h2>
				</div>
			</div>
		</section>

		<section class="content card card-outline card-navy">
			<div class="container-fluid">
				<div class="card-header">
							<h5 class="card-title">메뉴얼 수정</h5>
							<div class="card-tools">
								<button type="button" id="modifyBtn" class="btn btn-outline-primary"
									onclick="modify_go()">수정</button>
								<button type="button" id="listBtn" class="btn btn-outline-dark"
									onclick="history.go(-1);">최소</button>
							</div>
						</div>
						<div class="card-body">
						<form enctype="multipart/form-data" role="form" method="post" action="manualModify.do" name="modifyForm">
							<input type="hidden" name="manualNo" value="${manual.manualNo}" />
							<input type="hidden" name="eNo" value="${manual.eNo}" />
							<div class="form-group col-sm-12">
								<label for="manualTitle">제목</label> <input type="text"
									class="form-control" id="manualTitle" name="manualTitle" value="${manual.manualTitle}"/>
							</div>
							<div class="row">
								<div class="form-group col-sm-6">
									<label for="name">작성자</label> <input type="text"
										class="form-control" id="name" name="name" readonly value="${manual.name }"/>
								</div>

								<div class="form-group col-sm-6">
									<label >카테고리</label>
									<div class="card-tool" style="width: 67rem;">
										<select class="form-control col-md-4" name="cateNo"
												id="cateNo">
												<option value="1" ${manual.cateNo eq '1' ? 'selected':'' }>그룹웨어</option>
												<option value="2" ${manual.cateNo eq '2' ? 'selected':'' }>회사내규</option>
												<option value="3" ${manual.cateNo eq '3' ? 'selected':'' }>참고자료</option>
											</select>
									</div>
								</div>

							</div>
							<div class="form-group col-sm-12">
								<label class="col-2 mt-1">내용</label>
							<textarea class="form-control col-12 mt-1" id="manualContent" name="manualContent" rows="5" cols="" placeholder="소개글을 작성하세요">${manual.manualContent}</textarea>
							</div>

							<div class="form-group">
									<div class="card card-outline card-light">
									<div class="card-header">
										<h5 class="card-title"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
									&nbsp;&nbsp;&nbsp;<button class="btn btn-xs bg-navy"
													onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
									</div>
									<div class="card-footer fileInput">
										<ul class="mailbox-attachments d-flex align-items-stretch clearfix">

											<c:forEach items="${manual.attachList }" var="attach" >
											<li class="attach-item thumb${attach.attachNo }" file-name="${attach.fileName }" target-ano="${attach.attachNo }">
												<div class="mailbox-attachment-info ">
													<a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${attach.fileName }" attach-no="${attach.attachNo }" href="<%=request.getContextPath()%>/manual/getFile.do?ano=${attach.attachNo }"  >
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

window.onload=function(){
	summernote_go($("#manualContent"),'<%=request.getContextPath()%>');
}
</script>

<script>
function removeFile_go(className){
	var li = $('li.'+className);

	if(!confirm(li.attr("file-name")+"을 정말 삭제하시겠습니까?")){
		return;
	}

	li.remove();

	var input=$('<input>').attr({"type":"hidden",
		 "name":"deleteFile",
		 "value":li.attr("target-ano")
		});
	$('form[role="form"]').prepend(input);

}

	var dataNum=0;

	function addFile_go(){

		var attachedFile=$('a[name="attachedFile"]').length; //기존파일
		var inputFile=$('input[name="uploadFile"]').length;	 //추가된 파일
		var attachCount=attachedFile+inputFile; //기존파일 + 추가된파일 개수

		if(attachCount >=5){
			Swal.fire({
			      icon: 'warning',
			      title: '파일추가는 5개까지만 가능합니다.',
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}

		var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
		div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='btn btn-xs btn-danger' type='button'>X</button>");

		$('.fileInput').append(div);

		dataNum++;

	}

	function remove_go(dataNum){
		$('div[data-no="'+dataNum+'"]').remove();
	}


// 	submit---------------------------------------------
	function modify_go(){
		var form = $('form[name="modifyForm"]');

		//유효성 체크
		if($("input[name='manualTitle']").val()==""){
			Swal.fire({
			      icon: 'warning',
			      title: '제목은 필수입니다.',
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
					$("input[name='manualTitle']").focus();
			      });
			return;
		}

		//파일 첨부확인
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


		form.submit();
	}

</script>

</body>


