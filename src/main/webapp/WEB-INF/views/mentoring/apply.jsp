<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.user-block img {
	float: left;
	height: 50px;
	width: 50px;
}

.username {
	padding-left: 20px;
	padding-top: 3px;
}

.post .user-block {
	margin-bottom: 0px;
}

.post {
	border-bottom: 0px solid #adb5bd;
}

.fa-star{
	color: #ffc107;
}
</style>
</head>

<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row">
				<div style="padding-left: 9px;">
					<h3>멘토링 신청</h3>
				</div>
			</div>
		</div>
	</section>

	<section class="content container-fluid">
		<div class="row">
			<div class="col-md-6">
				<div class="card card-navy">
					<div class="card-header">
						<h3 class="card-title">멘토 선택</h3>
					</div>


					<form class="form-horizontal">
						<div class="tab-pane fade active show" id="custom-tabs-four-home"
							role="tabpanel" aria-labelledby="custom-tabs-four-home-tab"
							style="margin: 20px">

							<span class="material-symbols-outlined">
								corporate_fare
							</span>
						  	<span >PoJo기업</span>
							<div id="organization" ></div>

						</div>
					</form>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card card-navy">
					<div class="card-header">
						<h3 class="card-title">멘토 추천</h3>
					</div>

					<form class="form-horizontal">
						<div class="card-body">
							<div class="post">
								<div class="user-block">
									<c:forEach items="${mbtiList }" var="mbtiList">
										<div style="cursor:pointer;" onclick="OpenWindow('mentoDetail.do?eno=' + ${mbtiList.eno}, '멘토링 신청', '800', '600')">
										<img class="img-circle img-bordered-sm"
											src="${mbtiList.photo }" alt="user image">
										<span class="username">${mbtiList.name } ${mbtiList.ppsName }&nbsp;&nbsp;${mbtiList.mbti }
										<c:if test="${mbtiList.score eq 5 }">
										&nbsp;&nbsp;<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
										</c:if>
										<c:if test="${mbtiList.score eq 4 }">
										&nbsp;&nbsp;<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star star"></i>
										</c:if>
										<c:if test="${mbtiList.score eq 3 }">
										&nbsp;&nbsp;<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star star"></i><i class="far fa-star star"></i>
										</c:if>
										<c:if test="${mbtiList.score eq 2 }">
										&nbsp;&nbsp;<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star star"></i><i class="far fa-star star"></i><i class="far fa-star star"></i>
										</c:if>
										<c:if test="${mbtiList.score eq 1 }">
										&nbsp;&nbsp;<i class="fas fa-star"></i><i class="far fa-star star"></i><i class="far fa-star star"></i><i class="far fa-star star"></i><i class="far fa-star star"></i>
										</c:if>
										</span>
										<span class="username">${mbtiList.dname }&nbsp;&nbsp;${mbtiList.job }</span>
										</div>
										<hr style="margin-top: 6px;margin-bottom: 6px;">
									</c:forEach>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</section>

<script>

$('#organization').jstree({
	core : {
		data :${organizationNode}
	},
	types : {
		'default' : {'icon': 'jstree-folder'}
	},
	 plugins: ['wholerow', 'types']
});

$('#organization').on("changed.jstree", function(e,data){
	if(data.node.id.length > 3){
		if(data.node.id == ${loginUser.eno}){
			alert("본인은 멘토링 신청대상이 아닙니다.");
		}else{
			$.ajax({
				url : "<%=request.getContextPath()%>/mentoring/getSubMentoring.do?eno=" + data.node.id,
				type : 'get',
				success:function(res){
					console.log(res);
					if(res > 0){
						Swal.fire({
						      icon: 'warning',
						      title: '이미 신청한 멘토입니다.',
						      confirmButtonColor: '#3085d6',
						    });
					}else{
						OpenWindow('mentoDetail.do?eno=' + data.node.id, '멘토링 신청', '800', '600')
					}
				},
				error:function(error){
					Swal.fire({
					      icon: 'error',
					      title: error,
					      confirmButtonColor: '#3085d6',
					    });
				}
			})
		}
	}
});
</script>

</body>

