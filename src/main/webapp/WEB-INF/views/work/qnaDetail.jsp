<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		th{
			vertical-align: middle!important;
			text-align: center;
			width: 20%;
		}
		td{
			width: 80%;
		}
		#qnaReplyContainer .card-header{
			padding: 0.5rem 1rem;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div style="display: flex; justify-content: space-between; padding: 10px 20px">
			<h3 class="title">질문 상세보기</h3>
			<c:if test="${loginUser.eno eq qna.eno}">
				<div class="row col-4">
					<div class="col-6">
						<button type="button" class="btn btn-block btn-outline-primary" onclick="location.href='qnaModifyForm.do?qnaNo=${qna.qnaNo}'">수정</button>
					</div>
					<div class="col-6">
						<button type="button" class="btn btn-block btn-outline-danger" onclick="location.href='qnaDelete.do?qnaNo=${qna.qnaNo}'">삭제</button>
					</div>
				</div>
			</c:if>
		</div>
		<div class="card card-outline card-navy" style=" margin: 0 10px;">
			<div class="card-body">
				<table class="table projects text-nowrap" style="table-layout: fixed;">
					<tr>
						<th>작성자</th>
						<td>
							<div style="align-items: center; display: flex;">
								<div>
									<img class="table-avatar emp_profile" src="${qna.writer.photo }">
								</div>
								<div>
									<span style="font-size:12px; font-weight:bold">${qna.writer.name } ${qna.writer.ppsname }</span>
									<div style="font-size:8px;">
										<p>${qna.writer.dname }</p>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							${qna.title }
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div>
								${qna.content }
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="card card-outline card-navy" style="margin:20px 10px;" id="qnaReplyContainer">
			<div class="card-header" style="font-weight: bold; display: flex; justify-content: space-between;">
				<h3 class="card-title col-10" style="display: flex; align-items: center">
					<i class="fas fa-comments"></i>&nbsp;&nbsp;답변
				</h3>
				<button class="btn btn-outline-dark col-2" data-toggle="modal" data-target="#qnaReply-modal" data-backdrop="false">답변 작성</button>
			</div>

			<div class="card-body">
				<div id="accordion">

				</div>
			</div>

			<div class="card-footer">
				<div class='text-center'>
					<ul class="pagination justify-content-center m-0" id="qnaReplyPagination"></ul>
				</div>

			</div>
		</div>
	</div>
	<div class="modal" id="qnaReply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">답변 작성</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div style="margin-top: 10px; display: flex; justify-content: flex-end; padding: 0 10px;">
						<button type="button" style="margin: 0 5px;" class="btn btn-outline-primary" onclick="qnaReplyRegist()">등록</button>
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
					</div>
					<form action="qnaReplyRegist.do" method="post" id="qnaReplyForm">
						<input type="hidden" name="eno" value="${loginUser.eno }">
						<input type="hidden" name="qnano" value="${qna.qnaNo }">
						<div class="modal-body">
							<textarea class="form-control" name="content" rows="5" cols="5"  id="qnaReplyContent"></textarea>
						</div>
					</form>
			</div>


		</div>
	</div>
<script>
window.onload = function(){
	summernote_go($('textarea[name="content"]'), '<%=request.getContextPath()%>');
}

$(function(){
	getQnaReplyList(1);
})

function qnaReplyRegist(){
	var qnaReplyForm = $('#qnaReplyForm');

	qnaReplyForm.submit();
}

var qnaReplyPage = 1;
function getQnaReplyList(page){
	qnaReplyPage = page;
	$.ajax({
		url : "<%=request.getContextPath()%>/work/getQnaReplyList.do?qnaNo=${qna.qnaNo}&page=" + page,
		type : 'get',
		success : function(res){
			printQnaReply(res.workQnaReplyList, $('#accordion'), $('#qna-template'));
			printQnaPageMaker(res.pageMaker, $('#qnaReplyPagination'), $('#qna-paination-template'));
		},
		error : function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function printQnaReply(replyList, target, templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyList);
	target.html(html);
}

function printQnaPageMaker(pageMaker, target, templateObject){
	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNumArray[i]=pageMaker.startPage+i;
	}
	pageMaker.pageNum=pageNumArray;
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;

	var template=Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html);
}

function replyShow(e){
	var content = e.target.parentNode.parentNode.parentNode.children[1];
	content.classList.toggle("show");
}

Handlebars.registerHelper({
	"signActive":function(page){
		if(page == qnaReplyPage) return 'active';
	},
	"safeString":function(content){
		return new Handlebars.SafeString(content);
	},
	"dateFormat" : function(regDate){
		var d = new Date(regDate),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('-');
	},
	"sameUserCheck":function(eno){
		if('${loginUser.eno}' == eno){
			return 'display:flex'
		}else{
			return 'display:none'
		}
	}
})
</script>

<script type="text/x-handlebars-template"  id="qna-template">
{{#each .}}
<div class="card card-outline card-success">
		<div class="card-header" style="display:flex;align-items:center; cursor:pointer">
			<div class="col-9">
				<i class="fas fa-caret-down" onclick="replyShow(event)"></i>
				<span style="font-size:12px; font-weight:bold">{{writer.name }} {{writer.ppsname }}</span>
				<span style="font-size:8px;">{{writer.dname }}</span>
				<span style="font-size:12px; margin-left:10px;">{{dateFormat regDate}}</span>
			</div>
			<div class="col-3" style="{{sameUserCheck eno}}; justify-content:flex-end">
				<button class="btn btn-outline-primary" style="font-size:12px;">수정</button>
				<button class="btn btn-outline-danger" style="font-size:12px; margin-left:5px;" onclick="location.href='removeQnaReply.do?qrno={{qrno}}'">삭제</button>
			</div>
		</div>
		<div  class="collapse show" data-parent="#accordion">
			<div class="card-body">
				{{safeString content}}
			</div>
		</div>
</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="qna-paination-template">
	<li class="page-item">
		<a class="page-link" href="javascript:getQnaReplyList(1)">
			<i class="fas fa-angle-double-left"></i>
		</a>
	</li>
	<li class="page-item">
		<a class="page-link" href="{{#if prev}} javascript:getQnaReplyList({{prevPageNum}}){{/if}}">
			<i class="fas fa-angle-left"></i>
		</a>
	</li>
	{{#each pageNum}}
		<li class="paginate_button page-item {{signActive this}}">
		<a class="page-link" href="javascript:getQnaReplyList({{this}})">
			{{this}}
		</a>
	</li>
	{{/each}}

	<li class="page-item">
		<a class="page-link" href="{{#if next}} javascript:getQnaReplyList({{nextPageNum}}){{/if}}">
			<i class="fas fa-angle-right"></i>
		</a>
	</li>
	<li class="page-item">
		<a class="page-link" href="javascript:getQnaReplyList({{realEndPage}})">
			<i class="fas fa-angle-double-right"></i>
		</a>
	</li>
</script>
<c:if test="${from eq 'replyRegist' }">
	<script>
	Swal.fire({
	      icon: 'success',
	      title: '답변이 등록되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
	    	$('#qnaReply-modal').hide();
			location.reload();
	      });
	</script>
</c:if>
<c:if test="${from eq 'replyRemove' }">
	<script>
	Swal.fire({
	      icon: 'success',
	      title: '답변이 삭제되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			location.reload();
	      });
	</script>
</c:if>
</body>
