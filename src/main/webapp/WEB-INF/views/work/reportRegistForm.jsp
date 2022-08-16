<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		th{
			vertical-align: middle!important;
			text-align: center;
		}

		.reportBtn button{
			width: 80px;
			height: 40px;
			margin: 5px;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div style="display: flex; justify-content: space-between; padding: 10px 20px">
			<h3 class="title">보고서 작성</h3>
			<div class="col-2 reportBtn" style="display: flex; justify-content: flex-end;">

				<button type="button" class="btn btn-block btn-outline-primary" onclick="registGo()">등록</button>
			</div>
		</div>
		<div class="card" style="padding: 20px 40px 20px 20px;">
			<form id="registForm" method="post" action="reportRegist.do" enctype="multipart/form-data">
				<input type="hidden" name="eno" value="${loginUser.eno }">
				<input type="hidden" name="wcode" value="${wcode }">
				<table class="table">
					<tr>
						<th>보고자</th>
						<td>
							<input type="text" class="form-control" value="${loginUser.name } ${loginUser.ppsname}" disabled="disabled">
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" class="form-control" placeholder="보고서 제목을 입력해주세요." name="title">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="card card-light card-outline">
								<div class="card-header">
								<h5 class="card-title"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;첨부파일</h5>
								&nbsp;&nbsp;&nbsp;<button class="btn btn-xs btn-info"
												onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
								</div>
								<div class="card-footer fileInput"></div>
							</div>
						</td>
					</tr>
				</table>
				<div>
					<textarea class="textarea" name="content" id="content" rows="20"
									cols="90" placeholder="1000자 내외로 작성하세요." ></textarea>
				</div>
			</form>
		</div>
	</div>
	<script>
	window.onload = function(){
		summernote_go($('textarea[name="content"]'), '<%=request.getContextPath()%>');
	}
	function registGo(){
		var reportForm = $('#registForm')

		var file=$('input[name="uploadFile"]');
		if(file.val()==""){
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

		if($('input[name="title"]').val() == ""){
			Swal.fire({
			      icon: 'warning',
			      title: '제목은 필수입력입니다.',
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}


		reportForm.submit();
	}

	var dataNum=0;
	function addFile_go(){
		if($('input[name="uploadFile"]').length>=1){
			Swal.fire({
			      icon: 'warning',
			      title: '파일첨부는 1개만 가능합니다.',
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
	</script>
	<c:if test="${from eq 'reportRegist' }">
		<script>
		Swal.fire({
		      icon: 'success',
		      title: '보고서가 등록되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				window.close();
				window.opener.location.reload();
		      });
		</script>
	</c:if>
</body>