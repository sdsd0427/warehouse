<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/community.css"
	type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style type="text/css">
	.table{
			margin: 0;
		}
	.table td,.card-footer{
		padding: 6px 0.75rem;
	}
	.card-header, .table th{
		padding: 8px 0.75rem;
	}
	
	.card-success.card-outline{
 		border-top: 3px solid #1e6e0c;
 	}
 	
 	.card-success:not(.card-outline)>.card-header{
 		background-color: #1e6e0c;
 	}
</style>
</head>

<title></title>

<body class="hold-transition skin-blue sidebar-collapse">
	<div class="wrapper" style="margin-left: 190px;">
		<div class="row">
			<%@ include file="./sideBar.jsp" %>


			<section class="content-header col-10 ">
				<div class="col-sm-12">
					<h3>${community.cname }&nbsp;&nbsp;<span class="text-muted" style="font-size: medium; ">커뮤니티 > 나의 커뮤니티</span></h3>
				</div>

				<div class="col-sm-12 mt-4">
					<div class="card card-outline card-success">
						<div class="card-header">
							<h3 class="card-title"><i class="fas fa-quote-left" style="font-size: small;"></i> 소개글 <i class="fas fa-quote-right" style="font-size: small;"></i></h3>
						</div>
						<div class="card-body">${community.intro}</div>
					</div>
				</div>

				<div class="col-sm-12 mt-4">
					<div class="col-md-12">

						<div class="card card-success">
							<div class="card-header with-border">
								<span style="float: left;">커뮤니티 소식</span>
							</div>
							<div class="card-body">
								<table class="table table-hover text-nowrap" style="text-align:center;">
									<tr style="font-size: 0.95em;">
										<th style="width: 15%;">게시판</th>
										<th style="width: 45%;">게시글</th>
										<th style="width: 15%;">작성자</th>
										<th style="width: 10%;">조회수</th>
										<th style="width: 15%;">등록일</th>
									</tr>
									<tbody id="recentCommuPost">

									</tbody>

								</table>
							</div>
						</div>



					</div>

				</div>


			</section>



		</div>
	</div>
<form role="form">
	<input type="hidden" name="cmno" value="${community.cmno}" />
	<input type="hidden" name="eno" value="${loginUser.eno}" />
	<input type="hidden" name="ceno" value="${community.eno}" />
	<input type="hidden" name="cname" value="${community.cname}" />
</form>



	<c:forEach  items="${enoList}" var="eno">
		<script type="text/javascript">
			opener.parent.sendSignal(${eno},'${community.cname}',"D102","community/main.do","M180000");
		</script>
	</c:forEach>

<c:if test="${from eq 'invite' }" >
	<script>
		Swal.fire({
	      icon: 'success',
	      title: '초대하였습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			window.close();
			window.opener.location.reload();
		});
	</script>
</c:if>


<script type="text/javascript">
	$(function(){
		commuBoardList('${community.cmno}');
		joinCommuEmpList('${community.cmno}');
		RecentCommuPostList('${community.cmno}');
		MemberPictureThumbSub('<%=request.getContextPath()%>');
		$('.openDeco-sideBar').css('background','#1e6e0c');

	})

</script>

<script type="text/javascript">
		function removeJoinCommu(){
			var formObj = $("form[role='form']");
			
			Swal.fire({
			    title: '파일 삭제',
			    text: "정말 탈퇴하시겠습니까?",
			    icon: 'question',
			    showCancelButton: true,
			    confirmButtonColor: '#3085d6',
			    cancelButtonColor: '#d33',
			    confirmButtonText: '확인',
			    cancelButtonText: '취소',
			    reverseButtons: true, // 버튼 순서 거꾸로
			  }).then((result) => {
			    if (result.isConfirmed) {
			    	formObj.attr("action", "removeJoinCommu.do");
					formObj.attr("method", "post");
					formObj.submit();
			    }
			 })
		}


		function MemberPictureThumbSub(contextPath){
		  		var target = document.querySelector('.commuPictureSub')
		       var cmno = target.getAttribute('data-id');
		       console.log("cmno",cmno);
		       target.style.backgroundImage="url('"+contextPath+"/community/getPicture.do?cmno="+cmno+"')";
		       target.style.backgroundRepeat="no-repeat";
		       target.style.backgroundSize="cover";
		       target.style.height= '100px';
		       target.style.borderRadius = '1em';

		}
	</script>


<%@ include file="./community_js.jsp" %>
</body>

































