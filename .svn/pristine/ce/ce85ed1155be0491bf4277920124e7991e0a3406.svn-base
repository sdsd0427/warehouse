<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
		.table td,.card-footer{
			padding: 6px 0.75rem;
		}
		.table th{
			padding: 8px 0.75rem;
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
		    color: #001f3f;
		    background-color: #fff;
		}
		.page-item.active .page-link {
		    z-index: 3;
		    color: #fff;
		    background-color: #001f3f;
		    border-color: #001f3f;
		}
		.table th, .table td{
			text-align: center;
		}
		table tr{
			cursor: pointer;
		}
	</style>
</head>

<title></title>

<body class="hold-transition skin-blue sidebar-collapse">
	<div class="wrapper">
		<section class="content-header" style="padding-left: 10px;">
			<div class="row md-2">
				<div>
					<h3>노하우 게시판</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted"  style="padding-right: 535px;">지식창고 > 노하우 게시판</span>
				</div>
			</div>
		</section>

			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-md-12">
						<div class="card card-navy card-outline">
							<div class="card-header bg-light" style="font-weight: bold;">
								노하우 목록
							</div>
							<div class="card-body">
									<div style="display: flex; justify-content: space-between;">
										<div class="col-8">
											<div  id="hashTag">
												<c:forEach items="${workHashTagList }" var="hashtag">
													<button class="btn btn-outline-dark" style="font-size: 12px; margin: 2px 0;" onclick="getAllKnowhowList(1,'h','${hashtag}')">${hashtag }</button>
												</c:forEach>
											</div>
										</div>
										<div class="card-tools col-4">
											<div class="input-group input-group-sm row" style="padding-bottom: 10px;">
												<select class="form-control col-md-3" name="searchType"
													id="searchType">
													<option value="tmrh" ${param.searchType eq 'tmrh' ? 'selected' : '' }>전체</option>
													<option value="t" ${param.searchType eq 't' ? 'selected' : '' }>제목</option>
													<option value="m" ${param.searchType eq 'm' ? 'selected' : '' }>담당자</option>
													<option value="r" ${param.searchType eq 'r' ? 'selected' : '' }>요청자</option>
													<option value="h" ${param.searchType eq 'h' ? 'selected' : '' }>해시태그</option>
												</select>
												 <input class="form-control" type="text" name="keyword"
													placeholder="검색어를 입력하세요" value="${param.keyword }" /> <span
													class="input-group-append">
													<button class="btn btn-dark" type="button"
														onclick="getAllKnowhowList(1);" data-card-widget="search">
														<i class="fa fa-fw fa-search"></i>
													</button>
												</span>
											</div>
										</div>
									</div>
									<div class="knowhowList">

									</div>
							</div>
							<div class="card-footer">
								<ul class="pagination justify-content-center m-0" id="knowhowlistPage">

								</ul>
							</div>
						</div>

					</div>
					<div class="col-md-12">
						<div class="card card-navy card-outline">
								<div class="card-header bg-light" style="font-weight: bold">
									<b>관심 노하우</b>

								</div>
								<div class="card-body">
									<div class="favKnowhowList">
									</div>
								</div>
								<div class="card-footer">
									<ul class="pagination justify-content-center m-0" id="favKnowhowPage">

									</ul>
								</div>
							</div>
					</div>

					</div>
				</div>
			</div>
<script>
	$(function(){
		getAllKnowhowList(1);
		getFavKnowhowList(1);
	})
	console.log($('select[name="searchType"]').val());
</script>


<%@ include file="./kw_js.jsp" %>
</body>
