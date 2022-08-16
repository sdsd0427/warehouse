<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >

{{#each .}}
<div class="replyLi" >
	<div class="user-block">
		<img src="{{anonymPhoto anonym photo}}" class="img-circle img-bordered-sm"/>
    </div>
	<div class="timeline-item" >
  		<span class="time">
    		<i class="fa fa-clock"></i>{{prettifyDate regDate}}
	 		<a class="btn btn-outline-primary btn-xs {{rno}}-a" id="modifyReplyBtn" data-rno={{rno}}
				onclick="replyModifyModal_go('{{rno}}','{{anonym}}');"
				style="display:{{VisibleByLoginCheck name}};"
				style="display:visible;"
	    		data-replyer={{name}} data-toggle="modal" data-target="#modal-reply">수정</a>
			<a class="btn btn-outline-danger btn-xs {{rno}}-a" id="modifyReplyBtn" data-rno={{rno}}
				onclick="replyRemove_go('{{rno}}');"
				style="display:{{VisibleByLoginCheck name}};"
				style="display:visible;"
	    		data-replyer={{name}}>삭제</a>
  		</span>

  		<h3 class="timeline-header"><strong style="display:none;">{{rno}}</strong>{{anonymName anonym name}}</h3>
  		<div class="timeline-body" id="{{rno}}-replytext">{{replyText}} </div>
	</div>
</div>

{{/each}}
</script>

<script type="text/x-handlebars-template"  id="reply-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
	<a href="javascript:getPage('<%=request.getContextPath()%>/replies/${board.boardNo}/{{this}}',{{this}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>
</script>


<script>
var replyPage=1;

$(function(){

	getPage("<%=request.getContextPath()%>/replies/${board.boardNo}/"+replyPage);
})
function getPage(pageInfo,page){
	if(page) replyPage = page;
	$.getJSON(pageInfo,function(data){
		console.log(data.replyList);
		printReplyList(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}

function printReplyList(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$('.replyLi').remove();
	target.after(html);
}

Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"-"+month+"-"+date;
	},
	"VisibleByLoginCheck":function(replyer){
		var result="none";
		if(replyer == "${loginUser.name}") result="visible";
		return result;
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	},
	"anonymName":function(anonym, name){
		str = '';
		if(anonym == 1) {
			str= '익명';
			return str;
		}else{
			str= name;
			return str;
		}
	},
	"anonymPhoto":function(anonym, photo){
		str = '';
		if(anonym == 1) {
			str= '<%=request.getContextPath() %>/resources/images/익명2.png';
			return str;
		}else{
			str= photo;
			return str;
		}
	}
});


/* pagination */
function printPagination(pageMaker,target,templateObject){
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

function replyRegist_go(){
	var replytext=$('#newReplyText').val();

	if($("#anonym").is(":checked")){
		$("#anonym").attr("value",1);
		var anonym=$('#anonym').val();
		//alert(anonym);
	}

	var data={
			"refNo":"${board.boardNo}",
			"name":"${loginUser.name}",
			"replyText":replytext,
			"anonym":anonym,
			"eno":"${loginUser.eno}",
			"perPageNum" : 5
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/replies",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			console.log("realEndPage : ",data);
			Swal.fire({
			      icon: 'success',
			      title: '댓글이 등록되었습니다.\n마지막페이지로 이동합니다.',
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
			    	replyPage=data; //페이지이동
					getPage("<%=request.getContextPath()%>/replies/${board.boardNo}/"+data); //리스트 출력
					$('#newReplyText').val("");

					$("input[type='checkbox']").prop("checked", false).attr("checked", false).removeAttr("checked");	
			      });
			
			


		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}

//댓글 수정 modal
function replyModifyModal_go(rno,anonym){
	//alert(anonym);
	//alert($('div#'+rno+'-replytext').text());
	$('div#modal-reply div.modal-body div.row #replyText').val($('div#'+rno+'-replytext').text());
	$('div#modal-reply div.modal-header h4.modal-title').text(rno);
	$('div#modal-reply div.modal-header h4.modal-anonym').text(anonym);
}

//댓글 수정.
function replyModify_go(){
	//alert("modify btn");
	var rno=$('div#modal-reply h4.modal-title').text();
	var replytext=$('input[name="replyText"]').val();
	var anonym=$('div#modal-reply h4.modal-anonym').text();


	var sendData={
			"rno":rno,
			"replyText":replytext,
			"anonym":anonym
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/replies/"+rno,
		type:"PUT",
		data:JSON.stringify(sendData),
		contentType:"application/json",
		headers:{
			"X-HTTP-Method-Override":"PUT"
		},
		success:function(result){
			Swal.fire({
			      icon: 'warning',
			      title: '댓글이 수정되었습니다.',
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
					getPage("<%=request.getContextPath()%>/replies/${board.boardNo}/"+replyPage);
			      });
		},
		error:function(error){
			//alert('수정 실패했습니다.');
			AjaxErrorSecurityRedirectHandler(error.status);
		}
// 		complete:function(){
// 			$('#modifyModal').modal('hide');
// 		}
	});
}

function replyRemove_go(rno){
	//alert("delete btn");

	//var rno=$('.modal-title').text();

	$.ajax({
		url:"<%=request.getContextPath()%>/replies/${board.boardNo}/"+rno+"/"+replyPage,
		type:"DELETE",
		headers:{
			"X-HTTP-Method-Override":"DELETE"
		},
		success:function(page){
			Swal.fire({
			      icon: 'warning',
			      title: '댓글이 삭제되었습니다.',
			      confirmButtonColor: '#3085d6',
			    }).then(function(){
						getPage("<%=request.getContextPath()%>/replies/${board.boardNo}/"+page);
						replyPage=page;
			      });
		},
		error:function(error){
			//alert('삭제 실패했습니다.');
			AjaxErrorSecurityRedirectHandler(error.status);
		}
// 		complete:function(){
// 			$('#modifyModal').modal('hide');
// 		}
	});
}
</script>


