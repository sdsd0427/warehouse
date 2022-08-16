<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<title>게시글 상세</title>

<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">


		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-sm-6">
						<h3>인기 해시태그</h3>
					</div>

				</div>
			</div>
		</section>


		<!-- Main content -->
		<section class="content container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-outline card-info">
						<div class="card-header">
							<h5 class="card-title">인기 해시태그</h5>
							<div class="card-tools">
								<button type="button" id="listBtn" class="btn btn-secondary"
									onclick="CloseWindow();">닫기</button>
							</div>
						</div>
						<div class="card-body">
							<table class="table table-hover text-nowrap"
									style="text-align: center;">
									<thead>
										<tr>
											<td>NO.</td>
											<td>해시태그</td>
											<td>갯수</td>
											<td>노하우</td>
											<td>문서</td>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${popularHashtagList }" var="ph" varStatus="status">
										<tr>
											<td>${status.index + 1}</td>
											<td >${ph.hashtag}</td>
											<td >${ph.cnt}</td>
											<td ><a href="#">${ph.knowHowCnt}</a></td>
											<td ><a href="#">${ph.approvalCnt}</a></td>
										</tr>
									</c:forEach>
									
									</tbody>
								</table>
						</div>

						<div class="card-footer">
							
						</div>

					</div>
					<!-- end card -->
				</div>
				<!-- end col-md-12 -->
			</div>
			<!-- end row  -->
		</section>
		<!-- /.content -->



	</div>
	<!-- /.content-wrapper -->





	<script>
		
	</script>

</body>









