<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community.css">


<style type="text/css">

	hr {
		margin-top: 0;
   		margin-bottom: 0;
	}
	.callout{
		margin-bottom: 0rem;
	    padding: 0.2rem;
    }
   .table td,.card-footer{
		padding: 6px 0.75rem;
	}
	.card-header, .table th{
		padding: 8px 0.75rem;
	}
	.table{
			margin: 0;
		}

	.page-link {
	    line-height: 1;
	    background-color: #fff;
	    color: #28a745;
	}
	.page-item.active .page-link {
	    z-index: 3;
	    color: #fff;
	    border-color: #1e6e0c;
	    background: #1e6e0c;
	}

 	.ctab {
     display: block;
     padding: 0.1rem 0.3rem;
 	}

 	.callout{
 		border-left:5px solid #1e6e0c;
 	}
 	
 	.card-success.card-outline{
 		border-top: 3px solid #1e6e0c;
 	}
 	
 	table tbody tr{
 		cursor: pointer;
 	}
 	
 	.card-success:not(.card-outline)>.card-header{
 		background-color: #1e6e0c;
 	}
/* 	.commuPicture{ */
/* 		width:100%; */
/* 		height:40px; */
/* 		margin:0 auto; */
/* 		background-size: contain; */
/* 		border-radius: 0; */
/* 	} */
	.btn-success{
		background-color: #1e6e0c;
	}
</style>
</head>

<title></title>

<body class="hold-transition skin-blue sidebar-collapse">
	<div class="wrapper">
		<section class="content-header" style="padding-bottom: 5px;">
			<div class="row md-2">
				<div class="col-sm-12">
					<h3>커뮤니티</h3>
				</div>
			</div>
		</section>

		<section class="content">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-sm-12" style="font-weight: bold;">
						<i class="fas fa-medal"></i>인기 커뮤니티
					</div>
				</div>

				<div class="row bestCommu">


				</div>
			</div>
		</section>

		<section class="content">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-md-6">
						<div class="card card-success">
							<div class="card-header" >
								나의 커뮤니티
							</div>
							<div class="card-body " style="overflow: auto; height: 180px;">
								<table class="table table-hover text-nowrap"
									style="text-align: center;">
									<tbody class="joinCommu">

									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card card-success card-tabs" >
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs border-bottom-0" id="custom-tabs-one-tab" role="tablist" >
								<li class="nav-item"><a class="nav-link active ctab" style="height: 33px;"
									id="custom-tabs-one-com-tab" data-toggle="pill"
									href="#custom-tabs-one-com" role="tab"
									aria-controls="custom-tabs-one-com" aria-selected="true" onclick="javascript:subCommuListGo();">가입신청
										대기</a></li>
								<li class="nav-item"><a class="nav-link ctab" style="height: 33px;"
									id="custom-tabs-one-com-tab" data-toggle="pill"
									href="#custom-tabs-one-com" role="tab"
									aria-controls="custom-tabs-one-com" aria-selected="true" onclick="javascript:myApproveCommuListGo();">커뮤니티신청 대기</a></li>
								<li class="nav-item"><a class="nav-link ctab" style="height: 33px;"
									id="custom-tabs-one-com-tab" data-toggle="pill"
									href="#custom-tabs-one-com" role="tab"
									aria-controls="custom-tabs-one-com" aria-selected="true" onclick="javascript:inviteCommuGo();">초대받은 커뮤니티</a></li>

							</ul>
						</div>
						<div class="card-body" style="overflow: auto; height: 180px;">
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade show active" id="custom-tabs-one-com"
									role="tabpanel" aria-labelledby="custom-tabs-one-com-tab" style="text-align: center;">

								</div>
							</div>
						</div>


					</div>



					</div>

				</div>
			</div>
		</section>

		<section class="content">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-md-12">

						<div class="card card-outline card-success">
							<div class="card-header with-border">
								<span style="float: left;">전체 커뮤니티</span>
								<div id="" class="card-tools" style="width: 450px;">
									<div class="input-group input-group-sm row">
										<select class="form-control col-md-3" name="searchType"
											id="searchType">
											<option value="cn">전체</option>
											<option value="c">커뮤니티</option>
											<option value="n">회장</option>
										</select> <input class="form-control " type="text" name="keyword"
											placeholder="검색어를 입력하세요" value="${param.keyword }" /> <span
											class="input-group-append">
											<button class="btn btn-success" type="button"
												onclick="communityListGo(1);" data-card-widget="search">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-hover text-nowrap" style="text-align:center;">
									<tr style="font-size: 0.95em;">
										<th style="width: 70%;">커뮤니티</th>
										<th style="width: 10%;">회장</th>
										<th style="width: 10%;">회원 수</th>
										<th style="width: 10%;">개설일</th>
									</tr>
									<tbody class="allCommu">

									</tbody>
								</table>
							</div>
							<div class="card-footer">
								<ul class="pagination justify-content-center m-0">

								</ul>
							</div>
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
	      title: '개설 신청 되었습니다.',
	      confirmButtonColor: '#3085d6',
	    });
	</script>
</c:if>
<c:if test="${from eq 'remove' }" >
	<script>
		Swal.fire({
	      icon: 'success',
	      title: '커뮤니티가 폐쇄 되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			window.close();
			window.opener.location.href="javascript:goIframPage('<%=request.getContextPath()%>/community/main.do', 'M180000')"
	    });

	</script>
</c:if>
<c:if test="${from eq 'removeJoinCommu' }" >
	<script>
		Swal.fire({
	      icon: 'success',
	      title: '탈퇴 하였습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			parent.sendSignal('${ceno}','${cname}',"D109","community/main.do","M180000");
	    });
	</script>
</c:if>


	<script>
		$(function(){
			bestCommuListGo();
			communityListGo(1);
			joinCommunListGo();
			subCommuListGo();
			$('.openDeco-sideBar').css('background','#1e6e0c');

// 			$('.subMenu').hover(function(){
// 				$(this).css("background","white");
// 			},function(){
// 				$(this).css("background","green");
// 			})
		})

		//사용자 사진 출력

	</script>


<%@ include file="./community_js.jsp" %>
</body>
