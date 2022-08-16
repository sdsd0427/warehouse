<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<h2>메뉴얼 작성</h2>
				</div>
			</div>
		</section>

		<section class="content card card-outline card-navy">
			<div class="container-fluid">
				<div class="card-header">
							<h5 class="card-title">메뉴얼 작성</h5>
							<div class="card-tools">
								<button type="button" id="modifyBtn" class="btn btn-outline-primary"
									onclick="regist_go()">작성</button>
								<button type="button" id="listBtn" class="btn btn-outline-dark"
									onclick="CloseWindow();">닫기</button>
							</div>
						</div>
						<div class="card-body">
						<form enctype="multipart/form-data" role="form" method="post" action="manualRegist.do" name="registForm">
							<input type="hidden" name="eNo" id="eNo" value="${loginUser.eno}">
							<div class="form-group col-sm-12">
								<label for="manualTitle">제목</label> <input type="text"
									class="form-control" id="manualTitle" name="manualTitle" value=""/>
							</div>
							<div class="row">
								<div class="form-group col-sm-6">
									<label for="name">작성자</label> <input type="text"
										class="form-control" id="name" name="name" readonly value="${loginUser.name}"/>
								</div>

								<div class="form-group col-sm-6">
									<label >카테고리</label>
									<div class="card-tool" style="width: 67rem;">
										<select class="form-control col-md-4" name="cateNo"
												id="cateNo">
												<option value="1">그룹웨어</option>
												<option value="2">회사내규</option>
												<option value="3">참고자료</option>
											</select>
									</div>
								</div>

							</div>
							<div class="form-group col-sm-12">
								<label class=" mt-1" for="manualContent">내용</label>
							<textarea class="form-control col-12 mt-1" name="manualContent" id="manualContent" rows="5" cols="" placeholder="소개글을 작성하세요"></textarea>
							</div>

							<div class="form-group">
								<div class="card card-light card-outline">
									<div class="card-header">
									<h5 class="card-title"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
									&nbsp;&nbsp;&nbsp;<button class="btn btn-xs bg-navy"
													onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
									</div>
									<div class="card-footer fileInput"></div>
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
function regist_go(){

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
					file.click();
			      });
			return
		}
	}

	if($("input[name='manualTitle']").val()==""){ // form.title.value
		Swal.fire({
		      icon: 'warning',
		      title: '제목은 필수입니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				$("input[name='manualTitle']").focus();
		      });
		return;
	}

	$("form[role='form']").submit()
}

var dataNum=0;

function addFile_go(){

	if($('input[name="uploadFile"]').length >= 5){
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
// 	alert(dataNum);
	$('div[data-no="'+dataNum+'"]').remove();
}
</script>


</body>


