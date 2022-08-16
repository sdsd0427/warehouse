<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community.css" type="text/css">
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

    .page-link {
	    line-height: 1;
	    background-color: #fff;
	    color: #1e6e0c;
	}
	.page-item.active .page-link {
	    z-index: 3;
	    color: #fff;
	    border-color: #1e6e0c;
	    background: #1e6e0c;
	}
	
	.card-success.card-outline{
 		border-top: 3px solid #1e6e0c;
 	}
 	
 	.card-success:not(.card-outline)>.card-header{
 		background-color: #1e6e0c;
 	}
 	.btn-success{
		background-color: #1e6e0c;
	}
 	
	</style>
</head>

<title></title>

<body class="hold-transition skin-blue sidebar-collapse">
	<div class="wrapper" style="margin-left: 190px;">
		<div class="row" style="height: 100%;">

		<%@ include file="./sideBar.jsp" %>


		<section class="content-header col-10">
				<div class="col-sm-12">
					<h3>${commuBoard.cbName}&nbsp;&nbsp;<span class="text-muted" style="font-size: medium; ">커뮤니티 > 나의 커뮤니티 </span></h3>
				</div>

			<div class="col-sm-12 mt-4">
					<div class="card card-success">
						<div class="card-header">
							<h3 class="card-title">게시판 소개</h3>
						</div>
						<div class="card-body">${commuBoard.cbIntro }</div>
					</div>
				</div>


			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-md-12">

						<div class="card card-outline card-success">
							<div class="card-header with-border">
								<c:if test="${commuBoard.writeOpen eq 0 ||  authority eq '2'}">
									<button style="float: left; " type="button" id="" class="btn btn-outline-primary" onclick="OpenWindow('boardRegistForm.do?cboardNo=${commuBoard.cboardNo}','게시글 작성',800,700);">작성</button>
								</c:if>

								<div id="" class="card-tools" style="width: 450px;">
									<div class="input-group row input-group-sm mt-1">
										<select class="form-control col-md-3" name="searchType"
											id="searchType">
											<option value="tw">전체</option>
											<option value="t">제목</option>
											<option value="w">작성자</option>
										</select> <input class="form-control" type="text" name="keyword"
											placeholder="검색어를 입력하세요" value="${param.keyword }" /> <span
											class="input-group-append">
											<button class="btn btn-success" type="button"
												onclick="commuPostListGo(1);" data-card-widget="search">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-hover text-nowrap" style="text-align:center;table-layout: fixed;">
									<tr style="font-size: 0.95em;">
										<th style="width: 55%;">제목</th>
										<th style="width: 10%;">작성자</th>
										<th style="width: 10%;">조회 수</th>
										<th style="width: 15%;">등록일</th>
									</tr>
									<tbody id="commuPost">

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
	</div>

<c:if test="${from eq 'regist' }" >
	<script>
		Swal.fire({
	      icon: 'warning',
	      title: '등록되었습니다.',
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
		commuPostListGo(1);
		MemberPictureThumbSub('<%=request.getContextPath()%>');
		$('.openDeco-sideBar').css('background','#1e6e0c');
	})
</script>


<script>

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


postPage = 1;
function commuPostListGo(startPage){
	postPage = startPage
	var data = {
			'page' : page,
			'perPageNum' : 10,
			'searchType' : $('select[name="searchType"]').val(),
			'keyword' : $('input[name="keyword"]').val(),
			'cboardNo' : '${commuBoard.cboardNo}'
	}


	$.ajax({
		url : '<%=request.getContextPath()%>/community/commuPostList.do',
		data : data,
		type : 'post',
		success: function(res){

			if(res.commuPostList.length > 0){
				printWorkData(res.commuPostList, $('#commuPost'), $('#commuPostList-template'));


			}else{
				var str = `
					<tr>
						<td colspan="4" style="text-align:center">
							등록된 게시글이 없습니다.
						</td>
					</tr>
				`;

				$('#commuPost').html(str);
			}

			lPage = postPage - 1;
			if(lPage < 1){lPage = 1;}
			rPage = postPage + 1;
			if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
			pageMakerData = {
					pageMaker : res.pageMaker,
					left : "javascript:commuPostListGo("+lPage+")",
					right : "javascript:commuPostListGo("+rPage+")",
					doubleLeft : "javascript:commuPostListGo("+1+")",
					doubleRight :"javascript:commuPostListGo("+res.pageMaker.realEndPage+")"
			}

			printPageMaker(pageMakerData ,$('.pagination'), $('#pageMaker-template'));



		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}


function printWorkData(dataList, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(dataList);
	target.html(html);
}

function printPageMaker(data, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(data);
	target.html(html);
}
</script>

<script type="text/x-handlebars-template"  id="commuPostList-template">
{{#each .}}
	<tr style='font-size: 0.85em; cursor:pointer;' onclick="OpenWindow('boardDetail.do?cpostNo={{cpostNo}}&from=list','게시글 상세',800,700);">
		<td style="text-align:left">{{title}}</td>
		<td>{{name}}</td>
		<td><i class="fas fa-light fa-eye"></i> {{viewCnt}}</td>
		<td>{{formatDate regDate}}</td>
	</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="pageMaker-template">
	<li class="page-item">
		<a class="page-link" href="{{doubleLeft}}">
			<i class="fas fa-angle-double-left"></i>
		</a>
	</li>
	<li class="page-item">
		<a class="page-link" href="{{left}}">
			<i class="fas fa-angle-left"></i>
		</a>
	</li>
		{{printPage this}}
	<li class="page-item">
		<a class="page-link" href="{{right}}">
			<i class="fas fa-angle-right"></i>
		</a>
	</li>
	<li class="page-item">
		<a class="page-link" href="{{doubleRight}}">
			<i class="fas fa-angle-double-right"></i>
		</a>
	</li>
</script>

<script>
	Handlebars.registerHelper({
		"formatDate" : function(regDate){
			var dateObj = new Date(regDate);
			var year = dateObj.getFullYear();
			var month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
			var date = ('0' + dateObj.getDate()).slice(-2);
			return year + "-" + month + "-" + date;
		},
		"printPage" : function(pageMakerData){
			var pageMaker = pageMakerData.pageMaker;


			var str = '';
			for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
				var active = i == pageMaker.cri.page ? 'active' : '';
				str += '<li class="page-item ' + active + '">';
				str += '<a class="page-link" href="javascript:commuPostListGo(' + i + ')">';
				str += i
				str += '</a>';
				str += '</li>';
			}
			return new Handlebars.SafeString(str);
		}
	});
</script>




<%@ include file="./community_js.jsp" %>
</body>
