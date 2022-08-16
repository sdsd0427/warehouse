<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	function myWorkListGo(){
		$('.card-outline').removeAttr('style');
		$('#title').text("");
		$('#custom-tabs-one-kw').html("");
		var data = {
				'eno' : ${loginUser.eno}
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/kw/knowhow/myWorkList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.length> 0){
						printWorkData(res, $('.selector'), $('#myWorkList-template'));
						recommendWorklListGo(1,res[0].wcode,res[0].wtitle);

				}else{
					var str = `
						진행중인 업무가 없습니다.
					`
						$('.selector').html(str);
						$('#custom-tabs-one-kw').html("");
				}
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});

	}

	function myReturnSignDocListGo(){
		$('.card-outline').removeAttr('style');
		$('#title').text("");
		$('#custom-tabs-one-kw').html("");

		var data = {
				'eno' : ${loginUser.eno}
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/kw/approval/myReturnSignDocList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.length> 0){
					printWorkData(res, $('.selector'), $('#myReturnSignDocList-template'));
					requiredDocumentListGo(1,res[0].signNo,res[0].title)
				}else{
					var str = `
						<span>반려 문서가 없습니다.</span>
					`
					$('.selector').html(str);

				}
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});

	}




	mPage = 1;
	wPage = 1;
	aPage = 1;
	function viewManualListGo(startPage){
		$('#title').text("");
		$('.card-outline').attr('style','display:none;');
		$('#custom-tabs-one-kw').html("");
		mPage = startPage
		var data = {
				'page' : mPage,
				'eno' : ${loginUser.eno}
		}


		$.ajax({
			url : '<%=request.getContextPath()%>/kw/manual/viewManualList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.viewManualList.length > 0){
					printWorkData(res.viewManualList, $('#custom-tabs-one-kw'), $('#viewManualList-template'));


				}else{
					var str = `
						<table class="table table-hover text-nowrap"
						style="text-align: center; table-layout: fixed;">
						<tr>
							<td colspan="6" style="text-align:center">
								등록된 메뉴얼이 없습니다.
							</td>
						</tr>
						</table>
					`;

					$('#custom-tabs-one-kw').html(str);
				}

				lPage = mPage - 1;
				if(lPage < 1){lPage = 1;}
				rPage = mPage + 1;
				if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}

				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'viewManualListGo',
						left : "javascript:viewManualListGo("+lPage+")",
						right : "javascript:viewManualListGo("+rPage+")",
						doubleLeft : "javascript:viewManualListGo("+1+")",
						doubleRight :"javascript:viewManualListGo("+res.pageMaker.realEndPage+")"
				}

				printPageMaker(pageMakerData ,$('.kwPage'), $('#pageMaker-template'));



			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function recommendWorklListGo(startPage,wcode, wtitle){
		wPage = startPage
		$('#title').text("'"+ wtitle + "'의 추천 업무");

		var data = {
				'page' : wPage,
				'wcode' : wcode
		}


		$.ajax({
			url : '<%=request.getContextPath()%>/kw/knowhow/recommendWorkList.do',
			data : data,
			type : 'post',
			success: function(res){

				if(res.knowhowList.length > 0){
					printWorkData(res.knowhowList, $('#custom-tabs-one-kw'), $('#recommendWorkList-template'));


				}else{
					var str = `
						<table class="table table-hover text-nowrap"
						style="text-align: center; table-layout: fixed;">
						<tr>
							<td colspan="5" style="text-align:center">
								관련된 노하우가 없습니다.
							</td>
						</tr>
						</table>
					`;

					$('#custom-tabs-one-kw').html(str);
				}

				lPage = wPage - 1;
				if(lPage < 1){lPage = 1;}
				rPage = wPage + 1;
				if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
				res.pageMaker.wcode = wcode;
				res.pageMaker.wtitle = wtitle;
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'recommendWorklListGo',
						left : "javascript:recommendWorklListGo("+lPage+",'"+ wcode +"','"+ wtitle +"')",
						right : "javascript:recommendWorklListGo("+rPage+",'"+ wcode +"','"+ wtitle +"')",
						doubleLeft : "javascript:recommendWorklListGo("+1+",'"+ wcode +"','"+ wtitle +"')",
						doubleRight :"javascript:recommendWorklListGo("+res.pageMaker.realEndPage+",'"+ wcode +"','"+ wtitle +"')"
				}

				printPageMaker(pageMakerData ,$('.kwPage'), $('#pageMaker-template'));



			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function requiredDocumentListGo(startPage,signNo, title){
		aPage = startPage
		$('#title').text("'" + title + "'의 추천 업무");

		var data = {
				'page' : aPage,
				'signNo' : signNo
		}


		$.ajax({
			url : '<%=request.getContextPath()%>/kw/approval/requiredDocumentList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.requiredDocumentList.length > 0){
					printWorkData(res.requiredDocumentList, $('#custom-tabs-one-kw'), $('#requiredDocumentList-template'));


				}else{
					var str = `
						<table class="table table-hover text-nowrap"
							style="text-align: center; table-layout: fixed;">
						<tr>
							<td colspan="6" style="text-align:center">
								관련된 문서가 없습니다.
							</td>
						</tr>
						</table>
					`;

					$('#custom-tabs-one-kw').html(str);
				}

				lPage = aPage - 1;
				if(lPage < 1){lPage = 1;}
				rPage = aPage + 1;
				if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
				res.pageMaker.signNo = signNo;
				res.pageMaker.title = title;
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'requiredDocumentListGo',
						left : "javascript:requiredDocumentListGo("+lPage+",'"+ signNo +"','"+ title +"')",
						right : "javascript:requiredDocumentListGo("+rPage+",'"+ signNo +"','"+ title +"')",
						doubleLeft : "javascript:requiredDocumentListGo("+1+",'"+ signNo +"','"+ title +"')",
						doubleRight :"javascript:requiredDocumentListGo("+res.pageMaker.realEndPage+",'"+ signNo +"','"+ title +"')"
				}

				printPageMaker(pageMakerData ,$('.kwPage'), $('#pageMaker-template'));



			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getAllKnowhowList(page, type, content){
		var allKnowHowPage = page;
		var searchType = $('select[name="searchType"]').val();
		var keyword = $('input[name="keyword"]').val();
		if(type){
			searchType = type,
			keyword = content
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/kw/knowhow/getAllKnowHowList.do",
			type : 'get',
			data : {
				page : page,
				searchType : searchType,
				keyword: keyword
			},
			success:function(res){
				if(res.knowhowList.length == 0){
					var str = `
						<table class="table table-hover text-nowrap"
						style="text-align: center; table-layout: fixed;">
						<tr style="font-size: 0.95em;">
							<th style="width: 30%; text-align:center;">제목</th>
							<th style="width: 20%; text-align:center;">요청자</th>
							<th style="width: 30%; text-align:center;">담당자</th>
							<th style="width: 10%; text-align:center;">조회수</th>
							<th style="width: 10%; text-align:center;">즐겨찾기</th>
						</tr>
						<tr>
							<td colspan="5" style="text-align:center">
								노하우가 존재하지 않습니다.
							</td>
						</tr>
						</table>
					`
					$('.knowhowList').html(str);
				}else{
					printWorkData(res.knowhowList, $('.knowhowList'), $('#recommendWorkList-template'));
				}
				lPage = page - 1;
				if(lPage < 1){lPage = 1;}
				rPage = page + 1;
				if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'getAllKnowhowList',
						left : "javascript:getAllKnowhowList("+lPage+")",
						right : "javascript:getAllKnowhowList("+rPage+")",
						doubleLeft : "javascript:getAllKnowhowList("+(1)+")",
						doubleRight :"javascript:getAllKnowhowList("+(res.pageMaker.endPage)+")"
				}
				$('input[name="searchType"]').val(res.pageMaker.cri.searchType);
				$('input[name="keyword"]').val(res.pageMaker.cri.keyword);

				printPageMaker(pageMakerData ,$('#knowhowlistPage'), $('#pageMaker-template'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getFavKnowhowList(page){
		var favKnowhowPage = page;

		$.ajax({
			url : "<%=request.getContextPath()%>/kw/knowhow/getFavKnowhowList.do?page=" + page,
			type:'get',
			success : function(res){
				if(res.favKnowhowList.length == 0){
					var str = `
						<table class="table table-hover text-nowrap"
						style="text-align: center; table-layout: fixed;">
						<tr style="font-size: 0.95em;">
							<th style="width: 30%; text-align:center;">제목</th>
							<th style="width: 20%; text-align:center;">요청자</th>
							<th style="width: 30%; text-align:center;">담당자</th>
							<th style="width: 10%; text-align:center;">조회수</th>
							<th style="width: 10%; text-align:center;">즐겨찾기</th>
						</tr>
						<tr>
							<td colspan="5" style="text-align:center">
								관심 노하우가 존재하지 않습니다.
							</td>
						</tr>
						</table>
					`;

					$('.favKnowhowList').html(str);
				}else{
					printWorkData(res.favKnowhowList, $('.favKnowhowList'), $('#recommendWorkList-template'))
				}
				lPage = page - 1;
				if(lPage < 1){lPage = 1;}
				rPage = page + 1;
				if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'getFavKnowhowList',
						left : "javascript:getFavKnowhowList("+lPage+")",
						right : "javascript:getFavKnowhowList("+rPage+")",
						doubleLeft : "javascript:getFavKnowhowList("+(1)+")",
						doubleRight :"javascript:getFavKnowhowList("+(res.pageMaker.endPage)+")"
				}

				printPageMaker(pageMakerData ,$('#favKnowhowPage'), $('#pageMaker-template'));
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

	function addFavKnowhow(event){
		event.stopPropagation();
		var wcode = event.target.id;
		$.ajax({
			url : "<%=request.getContextPath()%>/kw/knowhow/addFavKnowhow.do?wcode=" + wcode,
			type : "get",
			success : function(res){
				Swal.fire({
					      icon: 'success',
					      title: '관심노하우에 추가되었습니다.',
					      confirmButtonColor: '#3085d6',
					    }).then(function(){
									location.reload();
			 			});
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function removeFavKnowhow(event){
		event.stopPropagation();
		var wcode = event.target.id;
		$.ajax({
			url : "<%=request.getContextPath()%>/kw/knowhow/removeFavKnowhow.do?wcode=" + wcode,
			type : "get",
			success : function(res){
				Swal.fire({
				      icon: 'success',
				      title: '관심노하우가 삭제되었습니다.',
				      confirmButtonColor: '#3085d6',
				    }).then(function(){
								location.reload();
		 			});
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function getKnowhowDetail(wcode){
		console.log(wcode);
		OpenWindow('<%=request.getContextPath()%>/work/knowhowDetail.do?wcode=' + wcode,'상세보기',800,600);
		location.reload();
	}

	
	
	function addDocFavDoc(event){
		event.stopPropagation();
		var signNo = event.target.id;
		$.ajax({
			url : "<%=request.getContextPath()%>/kw/approvalDocBox/addDocFavDoc.do?signNo=" + signNo,
			type : "get",
			success : function(res){
				Swal.fire({
				      icon: 'success',
				      title: '관심문서에 추가되었습니다.',
				      confirmButtonColor: '#3085d6',
				    }).then(function(){
								location.reload();
		 			});
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}
	
	
	function favRemove(event){
		event.stopPropagation();
		var signNo = event.target.id;
		var id = event.target;

		$.ajax({
			url : "<%=request.getContextPath()%>/kw/approvalDocBox/favRemove.do?signNo=" + signNo,
			type : "get",
			success : function(res){
				Swal.fire({
				      icon: 'success',
				      title: '관심문서가 삭제되었습니다.',
				      confirmButtonColor: '#3085d6',
				    }).then(function(){
								location.reload();
		 			});
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}
</script>

<script type="text/x-handlebars-template" id="myWorkList-template">
<div class="col-12"><h4>내 업무</h4></div>
{{#each .}}
		<span class="callout col-3 mt-1 row"style="font-size:0.8em; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" >
		<div class="col-9" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
			{{wtitle}}
		</div>
		<div class="col-3">
		<button class="btn btn-xs btn-outline-primary " type="button" onclick="recommendWorklListGo(1,'{{wcode}}','{{wtitle}}')"style="float:left;">확인</button>
		</div>
		</span>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="myReturnSignDocList-template">
<div class="col-12"><h4>반려 문서</h4></div>
{{#each .}}
		<span class="callout col-3 mt-1 row" style="font-size:0.8em; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
		<div class="col-9" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
			{{title title}}
		</div>
		<div class="col-3">
		<button class="btn btn-xs btn-outline-primary " type="button" onclick="requiredDocumentListGo(1,'{{signNo}}','{{title title}}')"style="float: left;">확인</button>
		</div>
		</span>
{{/each}}

</script>

<script type="text/x-handlebars-template" id="viewManualList-template">
	<div class="row">
		<div class="col-12 mt-3">
			<table class="table table-hover text-nowrap"
				style="text-align: center; table-layout: fixed;">
				<tr style="font-size: 0.95em;">
					<th style="width: 40%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 15%;">카테고리</th>
					<th style="width: 15%;">등록일</th>
					<th style="width: 10%;">조회수</th>
					<th style="width: 10%;">즐겨찾기</th>
				</tr>
				<tbody>
{{#each .}}
				<tr style='font-size: 0.85em;'>
					<td id="manualTitle"
						style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; text-align: left;"
						onclick="javascript:OpenWindow('manual/manualDetail.do?from=list&manualNo={{manualNo}}','상세보기',800,700);">
							<span class="col-sm-12 ">{{title manualTitle}}</span>
					</td>
					<td class="as">{{name}}</td>
					<td >{{checkCate cateNo}}</td>
					<td>{{formatDate regDate}}</td>
					<td><i class="fas fa-light fa-eye"></i> {{viewCnt }}</td>
					<td class="favManual">
					<input type="hidden" id="manualNo" name="manualNo" value="{{manualNo}}">
					<input type="hidden" id="eNo" name="eNo" value="${loginUser.eno}">
					{{mcheckFav favCount}}
					</td>
				</tr>
{{/each}}
				</tbody>
			</table>

		</div>
	</div>
</script>

<script type="text/x-handlebars-template"  id="recommendWorkList-template">
<div class="row">
	<div class="col-12 mt-3">
		<table class="table table-hover projects" style="table-layout: fixed;">
			<tr style="font-size: 0.95em;">
				<th style="width: 25%; text-align:center;">제목</th>
				<th style="width: 25%; text-align:center;">요청자</th>
				<th style="width: 30%; text-align:center;">담당자</th>
				<th style="width: 10%; text-align:center;">조회수</th>
				<th style="width: 10%; text-align:center;">즐겨찾기</th>
			</tr>
{{#each .}}
			<tr style='font-size: 0.85em;'
				onclick="getKnowhowDetail('{{wcode}}')">
				<td style="text-align:left;">{{wtitle}}</td>
				<td>
					<div style="align-items: center; display: flex;">
						<div>
							<img class="table-avatar emp_profile" src="{{requestBy.photo}}">
						</div>
						<div>
							<span style="font-size: 12px; font-weight: bold">{{requestBy.name}}({{requestBy.dname }}){{requestBy.ppsname }}</span>
						</div>
					</div>
				</td>
				<td>
					<div style="align-items: center; display: flex;">
					{{checkManager workManagerList}}

							<span style="font-size: 12px; font-weight: bold">외 {{managerCnt}}명</span>
					</div>
				</td>
				<td><i class="fas fa-light fa-eye" ></i> {{viewCnt}}</td>
				<td style="text-align:center;">
					{{checkFav favCheck wcode}}
				</td>
			</tr>
{{/each}}
		</table>
	</div>
</div>
</script>

<script type="text/x-handlebars-template"  id="requiredDocumentList-template">
<div class="row">
	<div class="col-12 mt-3">
		<table class="table table-hover text-nowrap"
			style="text-align: center; table-layout: fixed;">
			<tr >
				<th style="width: 35%;">제목</th>
				<th style="width: 10%;">기안자</th>
				<th style="width: 15%;">카테고리</th>
				<th style="width: 15%;">등록일</th>
				<th style="width: 10%;">조회수</th>
				<th style="width: 10%;">즐겨찾기</th>
			</tr>
{{#each .}}
			<tr onclick="goDetail('kw/detailGo.do?signNo={{signNo}}','${menu.mcode }')">
				<td text-align:left;>{{title title}}</td>
				<td>{{name}}</td>
				<td>{{signForm.formClass}}</td>
				<td>{{formatDate eDate}}</td>
				<td><i class="fas fa-light fa-eye" style="margin-right: 5px"></i>{{viewCnt}}</td>
				<td>
					{{aCheckFav favCheck signNo}}
				</td>
			</tr>
{{/each}}
			</table>
	</div>
</div>

</script>


<script type="text/x-handlebars-template" id="pageMaker-template">
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
			var target;
			var str = '';
			if(pageMakerData.target == "viewManualListGo"){
				target = "viewManualListGo";

				for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
					var active = i == pageMaker.cri.page ? 'active' : '';
					str += '<li class="page-item ' + active + '">';
					str += '<a class="page-link" href="javascript:'+target+'(' + i + ')">';
					str += i
					str += '</a>';
					str += '</li>';
				}
			}

			if(pageMakerData.target == "recommendWorklListGo"){
				target = "recommendWorklListGo";

				for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
					var active = i == pageMaker.cri.page ? 'active' : '';
					str += '<li class="page-item ' + active + '">';
					str += '<a class="page-link" href="javascript:'+target+'(' + i + ',\'' + pageMaker.wcode + '\',\'' + pageMaker.wtitle + '\')">';
					str += i
					str += '</a>';
					str += '</li>';
				}

			}

			if(pageMakerData.target == "requiredDocumentListGo"){
				target = "requiredDocumentListGo";

				for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
					var active = i == pageMaker.cri.page ? 'active' : '';
					str += '<li class="page-item ' + active + '">';
					str += '<a class="page-link" href="javascript:'+target+'(' + i + ',\'' + pageMaker.signNo + '\',\'' + pageMaker.title + '\')">';
					str += i
					str += '</a>';
					str += '</li>';
				}

			}

			if(pageMakerData.target == "getAllKnowhowList"){
				target = "getAllKnowhowList";

				for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
					var active = i == pageMaker.cri.page ? 'active' : '';
					str += '<li class="page-item ' + active + '">';
					str += '<a class="page-link" href="javascript:'+target+'(' + i + ')">';
					str += i
					str += '</a>';
					str += '</li>';
				}
			}

			if(pageMakerData.target == "getFavKnowhowList"){
				target = "getFavKnowhowList";

				for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
					var active = i == pageMaker.cri.page ? 'active' : '';
					str += '<li class="page-item ' + active + '">';
					str += '<a class="page-link" href="javascript:'+target+'(' + i + ')">';
					str += i
					str += '</a>';
					str += '</li>';
				}
			}



			return new Handlebars.SafeString(str);

		},
		"checkFav" : function(favCount, wcode){
			str = "";
			if(favCount > 0){
				str += '<i id="' + wcode + '"class="fas fa-solid fa-star star"style="font-size: 1.5em; color: #ffc107; cursor:pointer;"  onclick="removeFavKnowhow(event)"></i>';
			}else {
				str += '<i id="' + wcode + '" class="far fa-star star"style="font-size: 1.5em; color: #ffc107; cursor:pointer;" " onclick="addFavKnowhow(event)"></i>';
			}

			return new Handlebars.SafeString(str);
		},
		"mcheckFav" : function(favCount){
			str = "";
			if(favCount > 0){
				str += '<i id="fav"class="fas fa-solid fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick=""></i>';
			}else {
				str += '<i id="nFav" class="far fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick=""></i>';
			}

			return new Handlebars.SafeString(str);
		},
		"aCheckFav" : function(favCheck, signNo){
			str = "";
			if(favCheck > 0){
				str += '<i id="' + signNo + '"class="fas fa-solid fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick="favRemove(event)"></i>';
			}else {
				str += '<i id="' + signNo + '" class="far fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick="addDocFavDoc(event)"></i>';
			}

			return new Handlebars.SafeString(str);
		},
		"checkManager" : function(workManagerList){

			var str = "";
			for(var workManager of workManagerList){
				var name = workManager.name;
				var ppsname = workManager.ppsname;
				var dname = workManager.dname;
				if(workManager.wmstep == 1){
				str ='<div>';
				str +='		<img class="table-avatar emp_profile"src="'+workManager.photo+'">';
				str +='	  </div>';
				str +='	   <div>';
				str +='		<span style="font-size: 12px; font-weight: bold">'+name+'('+dname + ')' + ppsname + '</span>';
				str +='	 </div>';
				}
			}


			return new Handlebars.SafeString(str);

		},
		"title" : function(title){
			return new Handlebars.SafeString(title);
		},
		"checkCate" : function(cateNo){
			str = "";

			if(cateNo == 1){
				str = "그룹웨어";
			}else if(cateNo == 2){
				str = "회사내규";
			}else if(cateNo == 3){
				str = "참고자료";
			}
			return str;
		}


	});
</script>






















