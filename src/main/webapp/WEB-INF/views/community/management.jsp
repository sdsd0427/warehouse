<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/community.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
img {
  transition: all 0.2s linear;
}
img:hover {
  transform: scale(1.4);
}
.table td,.card-footer{
	padding: 6px 0.75rem;
}
.card-header, .table th{
	padding: 8px 0.75rem;
}

.card-success:not(.card-outline)>.card-header{
 		background-color: #1e6e0c;
 	}
</style>
</head>

<title>커뮤니티 관리</title>

<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">


		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-sm-6">
						<h3>커뮤니티 관리</h3>
					</div>

				</div>
			</div>
		</section>


		<!-- Main content -->
		<section class="content">
			<div class=" container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card card-success card-tabs">
						<div class="card-header p-0 pt-1 ">
							<div class="row col-10">
								<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="custom-tabs-one-mana-tab" data-toggle="pill"
										href="#custom-tabs-one-mana" role="tab"
										aria-controls="custom-tabs-one-mana" aria-selected="true" onclick="communityInfo('${cmno}')">정보</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-one-mana-tab" data-toggle="pill"
										href="#custom-tabs-one-mana" role="tab"
										aria-controls="custom-tabs-one-mana" aria-selected="false" onclick="setCommuBoard('${cmno}');">게시판</a>
									</li>
									<li class="nav-item"><a class="nav-link "
										id="custom-tabs-one-mana-tab" data-toggle="pill"
										href="#custom-tabs-one-mana" role="tab"
										aria-controls="custom-tabs-one-mana" aria-selected="false" onclick="joinCommuListInfo('${cmno}')">회원</a>
									</li>
									<li class="nav-item"><a class="nav-link "
										id="custom-tabs-one-mana-tab" data-toggle="pill"
										href="#custom-tabs-one-mana" role="tab"
										aria-controls="custom-tabs-one-mana" aria-selected="false" onclick="getSubCommu('${cmno}')">가입</a>
									</li>
									<li class="nav-item"><a class="nav-link "
										id="custom-tabs-one-mana-tab" data-toggle="pill"
										href="#custom-tabs-one-mana" role="tab"
										aria-controls="custom-tabs-one-mana" aria-selected="false" onclick="closingCommu('${cmno}')">폐쇄</a>
									</li>
								</ul>
							</div>
<!-- 							<div class="col-1"> -->
<!-- 								<button type="button" id="listBtn" -->
<!-- 									class="btn btn-sm btn-dark mt-1" style="float: right;" -->
<!-- 									onclick="CloseWindow();">닫기</button> -->
<!-- 							</div> -->


						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade active show" id="custom-tabs-one-mana"
									role="tabpanel" aria-labelledby="custom-tabs-one--tab">




								</div>
							</div>
						</div>

					</div>


				</div>
			</div>
			<!-- end row  -->

			<!--  modal-board -->
			<div class="modal fade" id="modal-board">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">게시판 추가</h4>
							<div>
							<button type="button" class="btn btn-outline-primary reset" data-dismiss="modal" onclick="boardRegist()">추가</button>
							<button type="button" class="btn btn-outline-dark reset" data-dismiss="modal">닫기</button>
							</div>
						</div>
						<div class="modal-body">
							<form id="registBoard">
							<div class="row ">
							<label class="col-2">게시판 명</label>
							<input class="form-control col-10" type="text" id="newCbname" name='cbName' class="form-control" placeholder="게시판 명을 쓰세요">

							<label class="col-2 mt-3">소개글</label>
							<textarea class="form-control col-10 mt-3" id="newCnIntro" name="cbIntro" rows="5" cols="" placeholder="소개글을 작성하세요"></textarea>

							<label class="col-2 mt-3">댓글 여부</label>
							<div class="form-check col-1 mt-3">
								<input class="form-check-input" type="radio" id="newYbreplyOpen" name="newReplyOpen" value="0" checked>
								<label class="form-check-label">작성</label>
							</div>
							<div class="form-check col-9 mt-3">
								<input class="form-check-input" type="radio" id="newNbreplyOpen" name="newReplyOpen" value="1">
								<label class="form-check-label">미작성</label>
							</div>

							<label class="col-2 mt-3">작성 여부</label>
							<div class="form-check col-1 mt-3">
								<input class="form-check-input" type="radio" id="newYbwriteOpen" name="newWriteOpen" value="0" checked>
								<label  class="form-check-label">작성</label>
							</div>
							<div class="form-check col-9 mt-3">
								<input class="form-check-input" type="radio" id="newNbwriteOpen" name="newWriteOpen" value="1">
								<label class="form-check-label">미작성</label>
							</div>
						</div>
						</form>
						</div>

					</div>

				</div>
			</div>
			<!--  modal-board -->

			<!--  modal-set -->
			<div class="modal fade" id="modal-set">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">게시판 설정</h4>
							<div>
							<button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="boardModify()">저장</button>
							<button type="button" class="btn btn-outline-danger" data-dismiss="modal" onclick="boardRemove()">삭제</button>
							<button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
							</div>
						</div>
						<div class="modal-body">
							<div class="row ">
							<input type="hidden" name="cboardNo" id="boardNo">
							<label class="col-2">게시판 명</label>
							<input class="form-control col-10" type="text" id="boardName" name='cbName' class="form-control" >

							<label class="col-2 mt-3">소개글</label>
							<textarea class="form-control col-10 mt-3" id="boardIntro" name="cbIntro" rows="5" cols="" ></textarea>

							<label class="col-2 mt-3">댓글 여부</label>
							<div class="form-check col-1 mt-3">
								<input class="form-check-input" type="radio" id="ybreplyOpen" name="replyOpen" value="0">
								<label  class="form-check-label">작성</label>
							</div>
							<div class="form-check col-9 mt-3">
								<input class="form-check-input" type="radio" id="nbreplyOpen" name="replyOpen" value="1">
								<label class="form-check-label">미작성</label>
							</div>

							<label class="col-2 mt-3">작성 여부</label>
							<div class="form-check col-1 mt-3">
								<input class="form-check-input" type="radio" id="ybwriteOpen" name="writeOpen" value="0">
								<label  class="form-check-label">작성</label>
							</div>
							<div class="form-check col-9 mt-3">
								<input class="form-check-input" type="radio" id="nbwriteOpen" name="writeOpen" value="1">
								<label class="form-check-label">미작성</label>
							</div>
						</div>
						</div>

					</div>

				</div>
			</div>
			<!--  modal-set -->
			</div>
		</section>
		<!-- /.content -->



	</div>
	<!-- /.content-wrapper -->





	<script>
	$(function(){
		communityInfo('${cmno}');
	})


	  $(document).on("click", ".reset",function(){
        $('#registBoard')[0].reset();
    });


	$(document).on('click', '#checkAll', function(){
		if($("#checkAll").is(":checked")) $("input[name=eno]").prop("checked", true);
		else $("input[name=eno]").prop("checked", false);
	})

	$(document).on('click', 'input[name=eno]', function(){
		var total = $("input[name=eno]").length;
		var checked = $("input[name=eno]:checked").length;

		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true);
	})


	function changePicture_go(){
 		//alert("file change");

 		var picture = $('input#inputFileName')[0];

 		var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();

 		//이미지 확장자 jpg 확인
		if(!(fileFormat=="JPG" || fileFormat=="JPEG" || fileFormat=="PNG")){
			
			Swal.fire({
			      icon: 'warning',
			      title: '이미지는 jpg,png 형식만 가능합니다.',
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}

		//이미지 파일 용량 체크
		if(picture.files[0].size>1024*1024*1){
			Swal.fire({
			      icon: 'warning',
			      title: '사진 용량은 1MB 이하만 가능합니다.',
			      confirmButtonColor: '#3085d6',
			    });
			return;
		};

		$('label[for="inputFileName"]').text(picture.files[0].name)



 	 }

	</script>
<%@ include file="./management_js.jsp" %>
</body>









