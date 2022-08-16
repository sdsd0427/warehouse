<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
	.table{
			margin: 0;
		}
	.table td,.card-footer{
		padding: 6px 0.75rem;
	}
	.table th{
		padding: 8px 0.75rem;
	}
	.page-link {
	    line-height: 1;
	    background-color: #fff;
	}
	.page-item.active .page-link {
	    z-index: 3;
	    color: #fff;
	    border-color:;
	}
</style>
</head>


<body class="hold-transition skin-blue sidebar-collapse">
	<div class="wrapper">
<!-- 	<div class="preloader flex-column justify-content-center align-items-center" style="max-width:1130px; height: 100vh; margin-left:220px;"> -->
<%-- 			<img class="animation__shake" src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/AdminLTELogo.png" width="60" height="60"> --%>
<!-- 		</div> -->
		<section class="content-header ">
			<div class="row md-2">
				<div>
					<h3>사내 메뉴얼</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted"  style="padding-right: 535px;">지식창고 > 사내 메뉴얼</span>
				</div>
			</div>
		</section>

		<section class="content">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-md-12">

						<div class="card card-navy card-outline">
							<div class="card-header with-border">
								<button class="btn btn-outline-primary" type="button" id="registBtn"
									onclick="OpenWindow('manualRegistForm.do','메뉴얼 작성',800,600);">작성</button>
								<div id="" class="card-tools" style="width: 450px;">
									<div class="input-group row mSearch input-group-sm mt-1">
										<select class="form-control col-md-3" name="category" onchange="manualListGo(1);"
											id="category">
											<option value="0">전체</option>
											<option value="1">그룹웨어</option>
											<option value="2">회사내규</option>
											<option value="3">참고자료</option>
										</select> <select class="form-control col-md-3" name="searchType"
											id="searchType">
											<option value="tw">전체</option>
											<option value="t">제목</option>
											<option value="w">작성자</option>
										</select> <input class="form-control" type="text" name="keyword"
											placeholder="검색어를 입력하세요" value="${param.keyword }" /> <span
											class="input-group-append ">
											<button class="btn bg-navy" type="button"
												onclick="manualListGo(1);" data-card-widget="search">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-hover text-nowrap"
									style="text-align: center; table-layout: fixed;">
									<tr style="font-size: 0.95em;">
										<th style="width: 40%;">제목</th>
										<th style="width: 10%;">작성자</th>
										<th style="width: 15%;">카테고리</th>
										<th style="width: 15%;">등록일</th>
										<th style="width: 10%;">조회수</th>
										<th style="width: 10%;">즐겨찾기</th>
									</tr>
									<tbody class="manualList">
									</tbody>
								</table>
							</div>
							<div class="card-footer">
									<ul class="manualPage pagination justify-content-center m-0">

									</ul>
							</div>
						</div>

					</div>

					<div class="card card-navy card-outline">
						<div class="card-header with-border">
							<span>관심 메뉴얼</span>
							<div id="" class="card-tools" style="width: 450px;">
								<div class="input-group row favMSearch input-group-sm">
									<select class="form-control col-md-3" name="category" id="category" onchange="favManualListGo(1);">
										<option value="0">전체</option>
										<option value="1">그룹웨어</option>
										<option value="2">회사내규</option>
										<option value="3">참고자료</option>
									</select> <select class="form-control col-md-3" name="searchType"
										id="searchType">
										<option value="tfavW">전체</option>
										<option value="t">제목</option>
										<option value="favW">작성자</option>
									</select> <input class="form-control" type="text" name="keyword"
										placeholder="검색어를 입력하세요" value="${param.keyword }" /> <span
										class="input-group-append">
										<button class="btn bg-navy" type="button"
											onclick="favManualListGo(1);" data-card-widget="search">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
						<div class="card-body">
							<table class="table table-hover text-nowrap"
								style="text-align:center; table-layout: fixed;">
								<tr style="font-size: 0.95em;">
									<th style="width: 40%;">제목</th>
									<th style="width: 10%;">작성자</th>
									<th style="width: 15%;">카테고리</th>
									<th style="width: 15%;">등록일</th>
									<th style="width: 10%;">조회수</th>
									<th style="width: 10%;">즐겨찾기</th>
								</tr>
								<tbody class="favManualList">
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<ul class="favManualPage pagination justify-content-center m-0">

							</ul>
						</div>
					</div>

				</div>
			</div>
		</section>
	</div>

<c:if test="${from eq 'regist' }" >
	<script>
		Swal.fire({
		      icon: 'success',
		      title: '등록되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				window.close();
				window.opener.location.reload();
		     });
	</script>
</c:if>

<script>

$(function(){
	manualListGo(1);
	favManualListGo(1);
})

// $(function(){
// 		setTimeout(() => {
// 			closeLoading();
// 		}, 500);
// 	});

// function closeLoading(){
// 	$('.preloader').css({
// 		"display" : "none"
// 	});

// 	$('.animation__shake').css({
// 		"display" : "none"
// 	})
// }

$(document).on('click', '.star', function(){
	var favManual = $(this).closest('.favManual');
	var manualNo = favManual.find('input[name="manualNo"]').val();
	var eNo = favManual.find('input[name="eNo"]').val();
	if($(this).attr('id') == 'nFav'){
		favCheck('registFav.do', eNo, manualNo);
	}
	else if($(this).attr('id') == 'fav'){
		favCheck('removeFav.do', eNo, manualNo);
	}
})

function favCheck(url,eNo,manualNo){
	var data = {
			'eNo' : eNo,
			'manualNo' : manualNo
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/kw/manual/'+url,
		data : data,
		type : 'post',
		success: function(res){
			Swal.fire({
			      icon: 'success',
			      title: res,
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
					window.location.reload();
			    });
		},
		error:function(error){
			alert("error : " + error.status)
		}
	});
}

</script>
<%@ include file="./manual_js.jsp" %>
</body>
