<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/community.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style type="text/css">
		.card-success.card-outline{
 		border-top: 3px solid #1e6e0c;
 	}
	</style>
</head>

<title>커뮤니티 상세</title>

<body>

  <!-- Content Wrapper. Contains page content -->
  <div class="wrapper">


	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h3>커뮤니티</h3>
	  			</div>

	  		</div>
	  	</div>
	</section>


      <!-- Main content -->
    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-success">
					<div class="card-header">
						<h5 class="card-title">상세보기</h5>
						<div class="card-tools">
						<c:if test="${community.checkJoin eq '0'}">
							<button type="button" id="modifyBtn" class="btn btn-outline-primary" onclick="insertSubCommu('${community.cmno}','${community.eno}','${community.cname}',1);">가입</button>
						</c:if>
						    <button type="button" id="listBtn" class="btn btn-outline-dark" onclick="CloseWindow();">닫기</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
							<label for="title">커뮤니티</label>
							<input type="text" class="form-control" id="" readonly disabled value="${community.cname }" />
						</div>
						<div class="row">
							<div class="form-group col-sm-4" >
								<label for="writer">회장</label>
								<input type="text" class="form-control" id="" readonly value="${community.name }"/>
							</div>

							<div class="form-group col-sm-4" >
								<label for="regDate">회원 수</label>
								<input type="text" class="form-control" id="regDate" readonly value="${community.joinCnt}" />
							</div>
							<div class="form-group col-sm-4" >
								<label for="regDate">개설일</label>
								<input type="text" class="form-control" id="regDate" readonly value="<fmt:formatDate value="${community.regDate }" pattern="yyyy-MM-dd"/>" />
							</div>

						</div>
						<div class="form-group col-sm-12">
							<label for="content">소개글</label>
							<div id="content">${community.intro}</div>
						</div>
					</div>
				</div><!-- end card -->
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    </section>
    <!-- /.content -->



  </div>
  <!-- /.content-wrapper -->





<script>



</script>
<%@ include file="./community_js.jsp" %>
</body>









