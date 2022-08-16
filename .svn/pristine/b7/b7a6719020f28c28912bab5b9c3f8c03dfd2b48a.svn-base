<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css" integrity="sha512-0/rEDduZGrqo4riUlwqyuHDQzp2D1ZCgH/gFIfjMIL5az8so6ZiXyhf1Rg8i6xsjv+z/Ubc4tt1thLigEcu6Ug==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/pds.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style>
		.table th,.table td{
			padding: 4px 0.75rem;
		}

		.card-header{
			padding: 4px 1.25rem;
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
	</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
</head>
<body>
<div class="wrapper pl-3">
	<section class="content-header p-0">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3 class="title" style="padding-left: 0px;">휴지통</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 25px;">
					<span class="text-muted"  style="">자료실 > 휴지통</span>
				</div>
			</div>
		</div>
	</section>

	<div class="row">

	<div class="card card-navy card-outline pl-1 pt-2 pr-1 mr-1" style="width: 210px;">
		<i class="fas fa-inbox m-2" style="cursor: pointer;" onclick="goInOut('#')">&nbsp;휴지통</i>
		<div id="pdsExplorer" style="font-size: 0.80em;">
		</div>
	</div>

	<div class="card card-navy card-outline col-9" style="min-height: 550px;">
		<div class="card-header header-padding">
			<button type="button" class="btn btn-sm allDelBtn" style="display: inline-block;" onclick="removeAllFile()">
				<i class="fas fa-trash-alt">&nbsp;휴지통 비우기</i>
			</button>
			<button type="button" class="btn btn-sm selectDelBtn" style="display: inline-block;" onclick="removeChekedFile()">
				<i class="fas fa-trash-alt">&nbsp;선택 삭제</i>
			</button>
			<button type="button" class="btn btn-sm selectBackBtn" style="display: inline-block;" onclick="recycleChekedFile()">
				<i class="fas fa-recycle">&nbsp;선택 복원</i>
			</button>
<!-- 			<button type="button" class="btn btn-sm"> -->
<!-- 				<i class="fas fa-copy">&nbsp;복사</i> -->
<!-- 			</button> -->
<!-- 			<button type="button" class="btn btn-sm"> -->
<!-- 				<i class="fas fa-envelope">&nbsp;메일</i> -->
<!-- 			</button> -->

<!-- 			<div class="card-tools"> -->
<!-- 				<div class="input-group input-group-sm"> -->
<!-- 					<input type="text" class="form-control" placeholder="검색어를 입력하세요"> -->
<!-- 					<div class="input-group-append"> -->
<!-- 						<div class="btn btn-info"> -->
<!-- 							<i class="fas fa-search"></i> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<!-- card-header  -->

		<div class="card-body">
			<div class="row">
				<div class="col-8">
					<div class="file-manager-container file-manager-col-view">
				        <div class="file-manager-row-header">
				            <div class="file-item-name pb-2">Filename</div>
				            <div class="file-item-changed pb-2">Changed</div>
				        </div>

				        <div class="file-item backBtn" style="display: none; visibility: visible;" onclick="backBtn()">
						    <div class="file-item-icon file-item-level-up fas fa-level-up-alt text-secondary"></div>
						    <input type="hidden" class="BackUpPno" value="">
						    <input type="hidden" class="lastDist" value="">
						    <a href="javascript:void(0)" class="file-item-name">
						        ..
						    </a>
						</div>

					</div>
			        <div class="mt-3 alertMsg" style="display: none; text-align: right; height: 300px;">
				        <div class="row" style="height: 100px;"></div>
				        <div class="row">
				        	<div class="col-11">
					        	<span class="text-center">휴지통이 비어있습니다</span>
				        	</div>
				        </div>
		            </div>
					<!-- file -->

				</div>

				<div class="col-4 detail-target">

				</div>
			</div>
		</div>
		<!-- card-body  -->
	</div>
	<!-- card  -->
	</div>
<form role="fileForm" action="regist.do" method="post" enctype="multipart/form-data">
	<input id="uploadFile" name="uploadFile" type="file" class="form-control"
		style="display:none;" onchange="regist()">
	<input type="hidden" name="eno" value="${loginUser.eno }" />
	<input type="hidden" id="fileName" name="fileName" value="" />
	<input type="hidden" id="upPno" name="upPno" value="#" />
	<input type="hidden" id="dist" name="dist" value="휴지통" onchange="distChange(this)">
</form>
</div>
<!-- div-wrapper -->
<input type="hidden" id="dist" name="dist" value="휴지통/개인자료실" onchange="distChange(this)">
<div id="testDiv" style="visibility: hidden;">
	<div class="length-target" style="background: none; border: none!important;">
		<div class="card-body pt-1 text-white length-remove">
			<h6 class="mb-2">휴지통 용량</h6>
			<div class="progress" style="height: 10px;">
				<div class="progress-bar bg-info" role="progressbar"
					style="width: 0%;" aria-valuenow="0" aria-valuemin="0"
					aria-valuemax="100"></div>
			</div>
			<p class="">
				<span>0.0MB</span> <span class="float-end"> / 100MB</span>
			</p>
			<div>
				<button type="button" class="btn btn-sm mt-1 pl-0 text-white">
					<i class="far fa-trash-alt mr-2"></i>휴지통 비우기
				</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function testRemoveBtn() {
	$('.nav-link-btn').css('display','none');
}
</script>

<script type="text/javascript">

function countCheck(){
// 	var cnt = 0;
// 	cnt = $('input[type="checkbox"]:checked').length;
// 	if(cnt > 0){
// 		$('.allDelBtn').css('display','none');
// 		$('.selectDelBtn').css('display','inline');
// 		$('.selectBackBtn').css('display','inline');
// 	}else{
// 		$('.allDelBtn').css('display','inline');
// 		$('.selectDelBtn').css('display','none');
// 		$('.selectBackBtn').css('display','none');
// 	}
}
</script>

<script type="text/javascript">
$(document).on('click', 'body > aside > div > ul > li:nth-child(2) > a', function(){
	$(this).attr("href", "#");
	$(this).css('display','none');
})

$('body > aside > div > ul > li:nth-child(2) > a').ready(function(){
	var testDiv = $('#testDiv');
	$('body > aside > div > ul').after(testDiv);
	testDiv.css('visibility','visible');
	$('body > aside > div > ul').click();
})
</script>

<script>
$('#pdsExplorer').jstree({
	core : {
		data :${pdsExplorer}
	},
	types : {
		'default' : {'icon': 'jstree-folder'}
	},
	 plugins: ['wholerow', 'types']
})

</script>

<script>
//탐색창에서 클릭 이벤트
$('#pdsExplorer').on("changed.jstree", function (e, data) {
	console.log("data",data);
    if(data.node.icon == "far fa-folder"){
		var upPno = data.node.id;
// 		var dist = data.node.text;

		goInOut(upPno);


		var data={
				'pno' : upPno
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/pds/detail.do',
			data : data,
			type : 'post',
			success: function(res){
//	 			console.log("de",res);
				$('.BackUpPno').val(res.upPno);
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});


    }
});


//화면 재구성
function goInOut(upPno){
	if(upPno==null) var upPno="#";
	var dist = "휴지통";
	var data ={
			'eno' : ${loginUser.eno },
			'dist' : dist,
			'upPno' : upPno
		}

	$.ajax({
  		url : '<%=request.getContextPath()%>/pds/getTrash.do',
   		data : data,
   		type : 'post',
   		success: function(res){
   			console.log("dd",res);
   			if(upPno=="#" && res.length == 0){
				$('.alertMsg').css('display','block');
				$('.removeFileItem').remove();
				$('.removeDetail').remove();
				return;
			}
			$('.alertMsg').css('display','none');

   			printPds(res, $('.file-manager-container'), $('#pds-template'), $('.removeFileItem'));
   			pdsLength();


   			$('#upPno').val(upPno);
   			backBtnChange();
   			detail(res[0].pno);


   		},
   		error:function(error){
   			AjaxErrorSecurityRedirectHandler(error.status);
   		}
   	});
}
goInOut();
</script>

<script type="text/javascript">
function getPds(dist){
	if(dist==null) dist="휴지통/개인자료실";
	$('.title').text(dist.replace("/개인자료실",""));
	var data ={
			'eno' : ${loginUser.eno },
			'dist' : dist
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/pds/getTrash.do',
		data : data,
		type : 'post',
		success: function(res){
			console.log(res);
			if(dist=="휴지통/개인자료실" && res.length == 0){
				$('.alertMsg').css('display','block');
				$('.removeFileItem').remove();
				$('.removeDetail').remove();
				return;
			}
			$('.alertMsg').css('display','none');
			printPds(res, $('.file-manager-container'), $('#pds-template'), $('.removeFileItem'));
			pdsLength();
			detail(res[0].pno);
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
// getPds();
</script>

<script type="text/javascript">
function recycleChekedFile(){
	var chekedFile = [];

	$('input[type="checkbox"]:checked').each(function (index) {
		chekedFile.push($(this).next().val());
	});
	if(chekedFile.length==0) return;

	Swal.fire({
	    title: '파일 복원',
	    text: "선택한 파일을 복원하시겠습니까?",
	    icon: 'question',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: '확인',
	    cancelButtonText: '취소',
	    reverseButtons: true, // 버튼 순서 거꾸로
	  }).then((result) => {
	    if (result.isConfirmed) {
	      Swal.fire(
	        '파일을 복원하였습니다.'
	      ).then(function(){
	    	  for(var pno of chekedFile ){
	    	         console.log(pno);
	    	         var data={
	    	               'pno' : pno
	    	         }
	    	         $.ajax({
	    	            url : '<%=request.getContextPath()%>/pds/recycleFile.do',
	    	            data : data,
	    	            type : 'post',
	    	            success: function(res){
//	    	                console.log(res);
	    	               var dist = $('#dist').val();
	    	               var upPno = $('#upPno').val();
	    	               goInOut(upPno);
	    	               backBtnChange();

	    	            },
	    	            error:function(error){
	    	               alert("error : " + error.status);
	    	               return false;
	    	            }
	    	         });

	    	      }
		      })
		    }
		 })


}

function removeChekedFile(){
	var chekedFile = [];

	$('input[type="checkbox"]:checked').each(function (index) {
		chekedFile.push($(this).next().val());
	});
// 	console.log(chekedFile);

	if(chekedFile.length==0) return;

	Swal.fire({
	    title: '파일 삭제',
	    text: "선택한 파일을 삭제하시겠습니까?",
	    icon: 'question',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: '확인',
	    cancelButtonText: '취소',
	    reverseButtons: true, // 버튼 순서 거꾸로
	  }).then((result) => {
	    if (result.isConfirmed) {
	      Swal.fire(
	        '파일을 삭제하였습니다.'
	      ).then(function(){
	    	  for(var pno of chekedFile ){
	  			console.log(pno);
	  			var data={
	  					'pno' : pno
	  			}
	  			$.ajax({
	  				url : '<%=request.getContextPath()%>/pds/removeFile.do',
	  				data : data,
	  				type : 'post',
	  				success: function(res){
//	   					console.log(res);
	  					var dist = $('#dist').val();
	  					var upPno = $('#upPno').val();
	  					goInOut(upPno);
	  					backBtnChange();
	  				},
	  				error:function(error){
	  					AjaxErrorSecurityRedirectHandler(error.status);
	  				}
	  			});

	  		}
	      })
	    }
	 })

}
</script>

<script type="text/javascript">
function removeAllFile(){
	var removeFile = [];

	$('input[type="checkbox"]').each(function (index) {
		removeFile.push($(this).next().val());
	});
	if(removeFile.length==0) return;

	Swal.fire({
	    title: '파일 삭제',
	    text: "휴지통의 모든 파일을 삭제하시겠습니까?",
	    icon: 'question',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: '확인',
	    cancelButtonText: '취소',
	    reverseButtons: true, // 버튼 순서 거꾸로
	  }).then((result) => {
	    if (result.isConfirmed) {
	      Swal.fire(
	        '파일을 삭제하였습니다.'
	      ).then(function(){
	    	  var data={
	  				'eno' : ${loginUser.eno }
	  		}
	  		$.ajax({
	  			url : '<%=request.getContextPath()%>/pds/removeAllFile.do',
	  			data : data,
	  			type : 'post',
	  			success: function(res){

	  				Swal.fire({
					      icon: 'success',
					      title: '모든 파일이 삭제되었습니다.',
					      confirmButtonColor: '#3085d6',
					    })
					    .then(function(){
			  				var dist = $('#dist').val();
			  				var upPno = $('#upPno').val();
			  				goInOut(upPno);
			  				backBtnChange();
			  				$('.removeFileItem').remove();
			  				$('.removeDetail').remove();
					    });

	  			},
	  			error:function(error){
	  				AjaxErrorSecurityRedirectHandler(error.status);
	  			}
	  		});
	      })
	    }
	 })

}
</script>

<script type="text/javascript">
function pdsLength() {
	var data ={
		'eno' : ${loginUser.eno }
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/pds/pdsLength.do',
		data : data,
		type : 'post',
		success: function(res){
			console.log(res);
			var length = 0;
			var bar = 0;
			bar = Math.round((res / (1024*1024) / 10 * 100) *100) /100;
			if(res >= (1024*1024)){
				length = res / (1024*1024);
				length = Math.round(length * 100) / 100
				length = length.toLocaleString()+"MB";
			} else {
				length = res / 1024;
				length = Math.round(length * 100) / 100
				length = length.toLocaleString()+"KB";
			}
			console.log(length);
			var data ={
					'length' : length,
					'bar' : bar
			}
			printDetail(data, $('.length-target'), $('#length-template'), $('.length-remove'));

		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}
pdsLength();
</script>

<script type="text/javascript">
function detail(pno){
	var data={
			'pno' : pno
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/pds/detail.do',
		data : data,
		type : 'post',
		success: function(res){
// 			console.log(res);
			printDetail(res, $('.detail-target'), $('#detail-template'), $('.removeDetail'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}
</script>

<script type="text/javascript">
function dbClick(div){
	console.log($(div).find('.fileType').val());
	if($(div).find('.fileType').val() != "folder"){
		//다운로드?
		var pno = $(div).find('.pno').val();
		downloadByPno(pno);

		//뷰어?

		return;
	}
	//수정 후
	var upPno = $(div).find('.pno').val();
	var backUpPno = $(div).find('.upPno').val();
	$('.BackUpPno').val(backUpPno);
	goInOut(upPno);
	backBtnChange();


}
</script>

<script type="text/javascript">
//싱글클릭 or 더블클릭
var DELAY = 200, clicks = 0, timer = null;
function clickOrDbClick(div){
	clicks++;  //count clicks

    if(clicks == 1) {

        timer = setTimeout(function() {
        	detail($(div).find('.pno').val());

        	$('.file-item').removeClass("card");
        	$(div).addClass("card");
//             alert("Single Click");  //perform single-click action
            clicks = 0;             //after action performed, reset counter

        }, DELAY);

    } else {

        clearTimeout(timer);    //prevent single-click action
        dbClick(div);
//         alert("Double Click");  //perform double-click action
        clicks = 0;             //after action performed, reset counter
    }
}
</script>

<script type="text/javascript">
//뒤로가기
function backBtn(btn){
	clicks++;  //count clicks

    if(clicks == 1) {
        timer = setTimeout(function() {
            clicks = 0;
        }, DELAY);

    } else {
        clearTimeout(timer);
        //수정
        //upPno를 구해서
        console.log("dd",$(btn).find('.BackUpPno').val());
        var pno = $(btn).find('.BackUpPno').val();

        var data={
    			'pno' : pno
    	}

        $.ajax({
    		url : '<%=request.getContextPath()%>/pds/detail.do',
    		data : data,
    		type : 'post',
    		success: function(res){
    			console.log("de",res);
		        goInOut(pno);
		        $('.BackUpPno').val(res.upPno);
		        backBtnChange();

    		},
    		error:function(error){
    			AjaxErrorSecurityRedirectHandler(error.status);
    		}
    	});

        clicks = 0;

    }
}

//수정 후 뒤로가기 버튼
function backBtnChange(){
	console.log($('#upPno').val());
	if($('#upPno').val()!="#"){
		var backBtn = $('.backBtn');
		backBtn.css('display','block');
	} else {
		var backBtn = $('.backBtn');
		backBtn.css('display','none');
	}
}
</script>

<script type="text/x-handlebars-template"  id="detail-template" >
<div class="card card-widget removeDetail">
	<div class="card-header">
		<span>{{fileName}}</span>
		<div class="card-tools">
			<button type="button" class="btn btn-tool pt-0"
				data-card-widget="remove">
				<i class="fas fa-times"></i>
			</button>
		</div>
	</div>

	<div class="card-body">
		<p class="text-muted mb-2">상세정보</p>
		<div class="attachment-block clearfix p-4">
			<div class="file-img-box file-item-icon" style="text-align: center;">
				<img width="80px" src="<%=request.getContextPath()%>/resources/images/fileicon/{{fileType}}.svg"
					onerror="this.src='<%=request.getContextPath()%>/resources/images/fileicon/file.svg'" alt="icon">
			</div>
		</div>
		<table style="font-size: 0.80em;" class="table table-hover">
			<tbody>
				<tr>
					<td style="width: 45%;">종류</td>
					<td>{{kind fileType}}</td>
				</tr>
				<tr>
					<td>원래위치</td>
					<td>{{dist}}</td>
				</tr>
				<tr>
					<td>크기</td>
					<td>{{fileSizeToKB fileSize}}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>{{content}}</td>
				</tr>
				<tr>
					<td>등록일자</td>
					<td>{{formatDate regDate}}</td>
				</tr>
				<tr>
					<td>삭제일자</td>
					<td>{{formatDate delDate}}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</script>

<script type="text/x-handlebars-template"  id="length-template">
<div class="card-body pt-1 text-white length-remove">
	<h6 class="mb-2">개인자료실 용량</h6>
	<div class="progress" style="height: 10px;">
		<div class="progress-bar" role="progressbar"
			style="width: {{bar}}%; background-color:{{barColor bar}};" aria-valuenow="{{bar}}" aria-valuemin="0"
			aria-valuemax="100"></div>
	</div>
	<p class="">
		<span>{{length}}</span> <span class="float-end"> / 10MB</span>
	</p>
	<div>
		<button type="button" class="btn btn-sm mt-1 pl-0 text-white">
			<i class="far fa-trash-alt mr-2"></i>휴지통 비우기
		</button>
	</div>
</div>
</script>

<script type="text/x-handlebars-template"  id="pds-template">
{{#each .}}
	<div class="file-item removeFileItem" onclick="clickOrDbClick(this)">
	    <div class="file-item-select-bg bg-primary"></div>
	    <label class="file-item-checkbox custom-control custom-checkbox">
	        <input type="checkbox" onchange="countCheck()" class="custom-control-input" name="fileChek" onclick="event.cancelBubble=true" />
			<input type="hidden" class="pno" name="pno" value="{{pno}}">
	        <span class="custom-control-label"></span>
	    </label>
	    <div class="file-img-box file-item-icon">
	    	<img src="<%=request.getContextPath()%>/resources/images/fileicon/{{fileType}}.svg"
				onerror="this.src='<%=request.getContextPath()%>/resources/images/fileicon/file.svg'" alt="icon">
	    </div>
	    <a href="javascript:void(0)" class="file-item-name">
	        {{fileName}}
	    </a>
	    <div class="file-item-changed"></div>
		<input type="hidden" class="pno" name="pno" value="{{pno}}">
		<input type="hidden" id="uploadPath" value="{{uploadPath}}">
		<input type="hidden" class="fileType" value="{{fileType}}">
		<input type="hidden" class="fileSize" value="{{fileSize}}">
		<input type="hidden" class="regDate" value="{{formatDate regDate}}">
		<input type="hidden" class="dist" value="{{dist}}">
		<input type="hidden" class="upPno" value="{{upPno}}">
		<input type="hidden" class="delYn" value="{{delYn}}">
		<input type="hidden" class="delDate" value="{{formatDate delDate}}">
	    <div class="file-item-actions btn-group">
	    </div>
	</div>
{{/each}}
</script>

<script>
//handelbars printElement (args : data Array, appent target, handlebar template, remove class)
function printPds(dataArr,target,templateObject, removeClass){
	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	removeClass.remove();

	target.append(html);
}
function printDetail(dataArr,target,templateObject, removeClass){
	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	removeClass.remove();

	target.append(html);
}
</script>
<script type="text/javascript">
Handlebars.registerHelper({
	"formatDate" : function(strDate){
		var dateObj = new Date(strDate);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		if(month < 10) month = '0'+month;
		var date = dateObj.getDate();
		if(date < 10) date = '0'+date;
		return year+"-"+month+"-"+date;
	},
	"fileSizeToKB" : function(fileSize){
		var kb = 0;
		if(fileSize > 1024) {
			kb = fileSize / 1024;
			kb = Math.round(kb * 100) / 100
			return kb.toLocaleString()+"KB";
		} else{
			return fileSize.toLocaleString()+"Byte";
		}
	},
	"kind" : function(fileType){
		var str = "";
		if(fileType == "folder"){
			str = "폴더"
			return str;
		} else {
			str = fileType +" 파일";
		}
		return str;
	},
	"originalDist" : function(dist){
		var str = "";
		str = dist.replace("휴지통/", "");
		return str;
	},
	"barColor" : function(size){
		var str = "#17a2b8";
		if(size >= 80){
			str = "#dc3545"
			return str;
		}
		return str;
	}
})
</script>
</body>