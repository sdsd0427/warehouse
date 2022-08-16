<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="popularHashtagList" value="${popularHashtagList}" />
<c:set var="populareEmpList" value="${populareEmpList}" />

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
	.table{
			margin: 0;
		}
	.table td, .table th {
    	padding: 0.3rem;
    }
    .table td,.card-footer{
		padding: 6px 0.75rem;
	}
	.card-header, .table th{
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

	.callout{
		margin-bottom: 0rem;
	    padding: 0.2rem;
	    border-left:5px solid #001f3f;
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
		<section class="content-header">
			<div class="row md-2">
				<div class="col-sm-12">
					<h3>지식창고</h3>

				</div>
			</div>
		</section>

		<!-- first section -->
		<section class="content" >
			<div class="row ml-2">


				<div class="col-12" style="padding-left: 0">
					<div class="card card-navy card-tabs">
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-kw-tab" data-toggle="pill"
									href="#custom-tabs-one-kw" role="tab"
									aria-controls="custom-tabs-one-kw" aria-selected="true" onclick="javascript:myWorkListGo();">추천
										노하우</a></li>
								<li class="nav-item"><a class="nav-link"
									id="custom-tabs-one-kw-tab" data-toggle="pill"
									href="#custom-tabs-one-kw" role="tab"
									aria-controls="custom-tabs-one-kw" aria-selected="true" onclick="javascript:myReturnSignDocListGo();">내게
										필요한 문서</a></li>
								<li class="nav-item"><a class="nav-link"
									id="custom-tabs-one-kw-tab" data-toggle="pill"
									href="#custom-tabs-one-kw" role="tab"
									aria-controls="custom-tabs-one-kw" aria-selected="true" onclick="javascript:viewManualListGo(1);">자주찾는
										메뉴얼</a></li>

							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-one-tabContent">
							<div class="card card-outline card-navy">
								<div class="card-header row selector" style="text-align:center;">
								</div>

							</div>
								<div id="title" style="font-weight: bold;"></div>
								<div class="tab-pane fade show active" id="custom-tabs-one-kw"
									role="tabpanel" aria-labelledby="custom-tabs-one-kw-tab" style="text-align: center;">

								</div>
							</div>
						</div>
						<div class="card-footer">
								<ul class="kwPage pagination justify-content-center m-0">

								</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- first section -->

		<!-- second section -->
<!-- 		<section class="content"> -->
<!-- 			<div class="row ml-2"> -->
<!-- 				<div class="col-12 row"> -->
<!-- 					<div class="col-6 elevation-1" -->
<!-- 						style="border: 1px solid #17a2b8; border-radius: 5px;"> -->
<!-- 						<a -->
<!-- 							href="javascript:OpenWindow('hashTagListForm.do','인기 해시태그',800,700);" -->
<!-- 							style="float: right; color: black;" class="mb-3">더보기 <i -->
<!-- 							class="fas fa-light fa-arrow-right"></i></a> -->
<%-- 						<canvas id="myChart" width="385" height="300" --%>
<%-- 							style="display: block; box-sizing: border-box; height: 192px; width: 385px;"></canvas> --%>
<!-- 					</div> -->

<!-- 					<div class="col-6"> -->
<!-- 						<div class="card card-info"> -->
<!-- 							<div class="card-header"> -->
<!-- 								<h3 class="card-title">인기 사원</h3> -->
<!-- 							</div> -->
<!-- 							<div class="card-body " style="overflow: auto;"> -->
<!-- 								<table class="table table-hover text-nowrap" -->
<!-- 									style="text-align: center;"> -->
<!-- 									<tbody> -->
<%-- 									<c:forEach items="${populareEmpList }" var="pe" varStatus="status"> --%>
<!-- 										<tr> -->
<%-- 											<td>${status.index + 1}</td> --%>
<%-- 											<td>${pe.dName}</td> --%>
<!-- 											<td class="popEmp_profile"> -->
<%-- 												<input type="hidden" name="eno" value="${pe.eno}"> --%>
<%-- 												<input type="hidden" name="appCnt" value="${pe.appCnt}"> --%>
<%-- 												<input type="hidden" name="knowCnt" value="${pe.knowCnt}"> --%>
<%-- 												<input type="hidden" name="ppsName" value="${pe.ppsName}"> --%>
<%-- 												<input type="hidden" name="name" value="${pe.name}"> --%>
<%-- 												<img class="direct-chat-img" src="<%=request.getContextPath()%>/resources/images/noimg.jpg" alt="noimg"> --%>
<!-- 											</td> -->
<%-- 											<td>${pe.name} ${pe.ppsName}</td> --%>
<!-- 										</tr> -->
<%-- 									</c:forEach> --%>
<!-- 									</tbody> -->
<!-- 								</table> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->
		<!-- second section -->
<!-- 		<div class="emp_card" style="height: 100px;"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-4 row" -->
<!-- 					style="border-right: 1px solid lightgray; text-align: center; margin: auto;"> -->
<!-- 					<img class="direct-chat-img col-12 ml-1" -->
<%-- 						src="<%=request.getContextPath()%>/resources/images/noimg.jpg" --%>
<!-- 						alt="noimg"> <span class="ml-1 empName"></span> -->
<!-- 				</div> -->
<!-- 				<div class="col-8"> -->
<!-- 					<table class="table table-hover text-nowrap" -->
<!-- 						style="text-align: center;"> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<!-- 								<td > -->
<!-- 									<a href="" class="knowhow"></a> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td > -->
<!-- 									<a href=""  class="approval"></a> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->


	</div>

	<script type="text/javascript">
	$(function(){
// 		recommendWorklListGo(1);
		myWorkListGo();
	})

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
				'manualNo' : manualNo,
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
						viewManualListGo($('li.page-item.active>a').text());
				      });
			},
			error:function(error){
				Swal.fire({
				      icon: 'error',
				      title: "error : " + error.status,
				      confirmButtonColor: '#3085d6',
				    });
			}
		});
	}



	$('.popEmp_profile').contextmenu(function(event){

		event.preventDefault();
		$('.empName').text($(this).find($('input[name=name]')).val() + " " + $(this).find($('input[name=ppsName]')).val());

		$('.knowhow').attr('href','javascript:OpenWindow("empWorkListForm.do?eno='+$(this).find($('input[name=eno]')).val()+'&name='+$(this).find($('input[name=name]')).val()+'","노하우 목록",800,700);');
		$('.knowhow').html("노하우 " + $(this).find($('input[name=knowCnt]')).val() + "명<i class='fas fa-light fa-arrow-right' style='float: right;'></i>");

		$('.approval').attr('href','javascript:OpenWindow("empDocumentListForm.do?eno='+$(this).find($('input[name=eno]')).val()+'&name='+$(this).find($('input[name=name]')).val()+'","노하우 목록",800,700);');
		$('.approval').html('전사문서 ' + $(this).find($('input[name=appCnt]')).val() + '명<i class="fas fa-light fa-arrow-right" style="float: right;"></i>');


		$('.emp_card').offset({left:event.pageX, top:event.pageY});
		$('.emp_card').show();
	});
	</script>
	<script>
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ '${popularHashtagList[0].hashtag}' , '${popularHashtagList[1].hashtag}', '${popularHashtagList[2].hashtag}', '${popularHashtagList[3].hashtag}', '${popularHashtagList[4].hashtag}' ],
						datasets : [ {
							label : '인기 Hashtag',
							data : [ ${popularHashtagList[0].cnt}, ${popularHashtagList[1].cnt}, ${popularHashtagList[2].cnt}, ${popularHashtagList[3].cnt}, ${popularHashtagList[4].cnt} ],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 206, 86, 0.2)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 206, 86, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});
	</script>
	<script type="text/javascript">
// 		$('ul').Treeview(options)
	</script>

	<%@ include file="./kw_js.jsp" %>
</body>
