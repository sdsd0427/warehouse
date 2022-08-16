<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="popularWorkList" value="${dataMap.popularWorkList}" />
<c:set var="name" value="${dataMap.name}" />

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
						<h3>노하우</h3>
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
							<h5 class="card-title">${name}의 노하우</h5>
							<div class="card-tools">
								<button type="button" id="listBtn" class="btn btn-secondary"
									onclick="CloseWindow();">닫기</button>
							</div>
						</div>
						<div class="card-body">
							<table class="table table-hover projects" style="table-layout: fixed;">
									<tr style="font-size: 0.95em;">
										<th style="width: 30%; text-align:center;">제목</th>
										<th style="width: 20%; text-align:center;">요청자</th>
										<th style="width: 25%; text-align:center;">담당자</th>
										<th style="width: 10%; text-align:center;">조회수</th>
										<th style="width: 15%; text-align:center;">즐겨찾기</th>
									</tr>
									<c:if test="${empty popularWorkList }" >
										<tr>
											<td colspan="5" style="text-align: center;">
												<strong >등록된 업무가 없습니다.</strong>
											</td>
										</tr>
									</c:if>	
									<c:forEach items="${popularWorkList }" var="work" varStatus="status">
										<tr style='font-size: 0.85em;'
										onclick="OpenWindow('<%=request.getContextPath()%>/work/workDetail.do','상세보기',1000,700);">
										<td>${work.wtitle}</td>
										<td>
											<div style="align-items: center; display: flex;">
												<div>
													<img class="table-avatar emp_profile"
														src="<%=request.getContextPath()%>/resources/bootstrap/dist/img/avatar.png">
												</div>
												<div>
													<p style="font-size: 16px; font-weight: bold">${work.requestBy.name}</p>
													<div style="font-size: 12px;">
														<p>${work.requestBy.ppsname }</p>
														<p>${work.requestBy.dname }</p>
													</div>
												</div>
											</div>
										</td>
										<td>
											<div style="align-items: center; display: flex;">
											<c:forEach items="${work.workManagerList }" var="workManager" varStatus="status">
												<c:if test="${workManager.wmstep eq '1'}" >
													<div>
														<img class="table-avatar emp_profile"src="<%=request.getContextPath()%>/resources/bootstrap/dist/img/avatar2.png">
														  </div>
															   <div>
																<p style="font-size: 16px; font-weight: bold">${workManager.name}</p>
																	<div style="font-size: 12px;">
																	<p>${workManager.ppsname}</p>
																	<p>${workManager.dname}</p>
																</div>
													 </div>
												</c:if>
											</c:forEach>
												
												<div style="font-size: 12px">
													<span>외 ${work.managerCnt}명</span>
												</div>
											</div>
										</td>
										<td><i class="fas fa-light fa-eye" ></i> ${work.viewCnt}</td>
										<td style="text-align:center;">
											<i class="far fa-star"style="font-size: 1.5em; color: #ffc107;"></i> 
											<!-- <i class="fas fa-solid fa-star" style="font-size: 1.5em; color: #ffc107;"></i> -->
										</td>
									</tr>
									</c:forEach>
									
								</table>
						</div>

						<div class="card-footer">
							<ul class="pagination justify-content-center m-0">
									<li class="page-item">
										<a class="page-link" href=""> <i class="fas fa-angle-double-left"></i></a>
									<li class="page-item">
										<a class="page-link" href=""> <i class="fas fa-angle-left"></i></a>
									</li>

										<li class="page-item active">
											<a class="page-link" href="">1</a>
										</li>

									<li class="page-item">
										<a class="page-link" href=""> <i class="fas fa-angle-right"></i></a>
									</li>
									<li class="page-item">
										<a class="page-link" href=""> <i class="fas fa-angle-double-right"></i></a>
									</li>
								</ul>
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









