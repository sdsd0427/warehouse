<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<input type="hidden" name="draftDoc" value="SF000001">
<input type="hidden" name="CooperationDoc" value="SF000002">
<input type="hidden" name="businessTripDoc" value="SF000003">
<input type="hidden" name="reportDoc" value="SF000004">
<input type="hidden" name="vacationDoc" value="SF000005">


<script>
var draftDoc=$("input[name=draftDoc]").val();
var CooperationDoc=$("input[name=CooperationDoc]").val();
var businessTripDoc=$("input[name=businessTripDoc]").val();
var reportDoc=$("input[name=reportDoc]").val();
var vacationDoc=$("input[name=vacationDoc]").val();


	function DocListGo(page, type, content){
		console.log("업무기안")
		var page = page;
		var searchType = $('select[name="searchType"]').val();
		var keyword = $('input[name="keyword"]').val();
		var eno = ${loginUser.eno};
		if(type){
			searchType = type,
			keyword = content
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/kw/getApprovalList?sFormNo='+draftDoc,
			data : {
				page : page,
				searchType : searchType,
				keyword: keyword,
				eno : eno
			},
			type : 'post',
			success: function(res){
				console.log("res:",res.myApprovalList)
				if(res.myApprovalList.length > 0){
					printWorkData(res.myApprovalList, $('#draftDoc'), $('#DocList-template'));
				}else{
					var str = `<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<tr style="font-size: 0.95em;">
						<th style="width: 40%;text-align:center;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 15%;">카테고리</th>
						<th style="width: 15%;">등록일</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 10%;">즐겨찾기</th>
						</tr>
					<tbody>
						<tr>
							<td colspan="6" style="text-align:center">
								등록된 문서가 없습니다.
							</td>
						</tr></tbody></table>
					`;

					$('#draftDoc').html(str);
				}
				console.log('startpage : ' + res.pageMaker.startPage);
				console.log('endpage : ' + res.pageMaker.endPage);
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'DocListGo',
						left : "javascript:DocListGo("+(page -1)+")",
						right : "javascript:DocListGo("+(page+1)+")",
						doubleLeft : "javascript:DocListGo("+(1)+")",
						doubleRight :"javascript:DocListGo("+(res.pageMaker.endPage)+")"
				}

				$('input[name="searchType"]').val(res.pageMaker.cri.searchType);
				$('input[name="keyword"]').val(res.pageMaker.cri.keyword);

				printPageMaker(pageMakerData ,$('#draftDocPage'), $('#pageMaker-template'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}


	function Cooperation(page, type, content){
		console.log("업무협조!")
		var page = page;
		var searchType = $('select[name="searchType"]').val();
		var keyword = $('input[name="keyword"]').val();
		var eno = ${loginUser.eno};
		if(type){
			searchType = type,
			keyword = content
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/kw/getApprovalList?sFormNo='+CooperationDoc,
			data : {
				page : page,
				searchType : searchType,
				keyword: keyword,
				eno : eno
			},
			type : 'post',
			success: function(res){
				console.log("업무협조")
				console.log("res업무협조:",res.myApprovalList)
				if(res.myApprovalList.length > 0){
					printWorkData(res.myApprovalList, $('#CooperationDoc'), $('#DocList-template'));
				}else{
					var str = `<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<tr style="font-size: 0.95em;">
						<th style="width: 40%;text-align:center;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 15%;">카테고리</th>
						<th style="width: 15%;">등록일</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 10%;">즐겨찾기</th>
						</tr>
					<tbody>
						<tr>
							<td colspan="6" style="text-align:center">
								등록된 문서가 없습니다.
							</td>
						</tr></tbody></table>
					`;

					$('#CooperationDoc').html(str);
				}
				console.log('startpage : ' + res.pageMaker.startPage);
				console.log('endpage : ' + res.pageMaker.endPage);
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'Cooperation',
						left : "javascript:Cooperation("+(page -1)+")",
						right : "javascript:Cooperation("+(page+1)+")",
						doubleLeft : "javascript:Cooperation("+(1)+")",
						doubleRight :"javascript:Cooperation("+(res.pageMaker.endPage)+")"
				}

				$('input[name="searchType"]').val(res.pageMaker.cri.searchType);
				$('input[name="keyword"]').val(res.pageMaker.cri.keyword);

				printPageMaker(pageMakerData ,$('#CooperationDocPage'), $('#pageMaker-template'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}


	function businessTrip(page, type, content){
		console.log("일반품의서!");
		var page = page;
		var searchType = $('select[name="searchType"]').val();
		var keyword = $('input[name="keyword"]').val();
		var eno = ${loginUser.eno};
		if(type){
			searchType = type,
			keyword = content
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/kw/getApprovalList?sFormNo='+businessTripDoc,
			data : {
				page : page,
				searchType : searchType,
				keyword: keyword,
				eno : eno
			},
			type : 'post',
			success: function(res){
				console.log("일반품의서")
				console.log("res출장:",res.myApprovalList)
				if(res.myApprovalList.length > 0){
					printWorkData(res.myApprovalList, $('#businessTripDoc'), $('#DocList-template'));
				}else{
					var str = `<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<tr style="font-size: 0.95em;">
						<th style="width: 40%;text-align:center;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 15%;">카테고리</th>
						<th style="width: 15%;">등록일</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 10%;">즐겨찾기</th>
						</tr>
					<tbody>
						<tr>
							<td colspan="6" style="text-align:center">
								등록된 문서가 없습니다.
							</td>
						</tr></tbody></table>
					`;

					$('#businessTripDoc').html(str);
				}
				console.log('startpage : ' + res.pageMaker.startPage);
				console.log('endpage : ' + res.pageMaker.endPage);
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'businessTrip',
						left : "javascript:businessTrip("+(page -1)+")",
						right : "javascript:businessTrip("+(page+1)+")",
						doubleLeft : "javascript:businessTrip("+(1)+")",
						doubleRight :"javascript:reportTrip("+(res.pageMaker.endPage)+")"
				}

				$('input[name="searchType"]').val(res.pageMaker.cri.searchType);
				$('input[name="keyword"]').val(res.pageMaker.cri.keyword);

				printPageMaker(pageMakerData ,$('#businessTripDocPage'), $('#pageMaker-template'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}


	function report(page, type, content){
		console.log("보고서!");
		var page = page;
		var searchType = $('select[name="searchType"]').val();
		var keyword = $('input[name="keyword"]').val();
		var eno = ${loginUser.eno};
		if(type){
			searchType = type,
			keyword = content
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/kw/getApprovalList?sFormNo='+reportDoc,
			data : {
				page : page,
				searchType : searchType,
				keyword: keyword,
				eno : eno
			},
			type : 'post',
			success: function(res){
				console.log("보고서")
				console.log("res보고서:",res.myApprovalList)
				if(res.myApprovalList.length > 0){
					printWorkData(res.myApprovalList, $('#reportDoc'), $('#DocList-template'));
				}else{
					var str = `<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<tr style="font-size: 0.95em;">
						<th style="width: 40%;text-align:center;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 15%;">카테고리</th>
						<th style="width: 15%;">등록일</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 10%;">즐겨찾기</th>
						</tr>
					<tbody>
						<tr>
							<td colspan="6" style="text-align:center">
								등록된 문서가 없습니다.
							</td>
						</tr></table></tbody>
					`;

					$('#reportDoc').html(str);
				}
				console.log('startpage : ' + res.pageMaker.startPage);
				console.log('endpage : ' + res.pageMaker.endPage);
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'report',
						left : "javascript:report("+(page -1)+")",
						right : "javascript:report("+(page+1)+")",
						doubleLeft : "javascript:report("+(1)+")",
						doubleRight :"javascript:report("+(res.pageMaker.endPage)+")"
				}

				$('input[name="searchType"]').val(res.pageMaker.cri.searchType);
				$('input[name="keyword"]').val(res.pageMaker.cri.keyword);

				printPageMaker(pageMakerData ,$('#reportDocPage'), $('#pageMaker-template'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}


	function vacation(page, type, content){
		console.log("휴가!");
		var page = page;
		var searchType = $('select[name="searchType"]').val();
		var keyword = $('input[name="keyword"]').val();
		var eno = ${loginUser.eno};
		if(type){
			searchType = type,
			keyword = content
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/kw/getApprovalList?sFormNo='+vacationDoc,
			data : {
				page : page,
				searchType : searchType,
				keyword: keyword,
				eno : eno
			},
			type : 'post',
			success: function(res){
				console.log("휴가신청")
				console.log("res휴가:",res.myApprovalList)
				if(res.myApprovalList.length > 0){
					printWorkData(res.myApprovalList, $('#vacationDoc'), $('#DocList-template'));
				}else{
					var str = `<table class="table table-hover text-nowrap" style="table-layout: fixed;">
						<tr style="font-size: 0.95em;">
						<th style="width: 40%;text-align:center;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 15%;">카테고리</th>
						<th style="width: 15%;">등록일</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 10%;">즐겨찾기</th>
						</tr>
					<tbody>
						<tr>
							<td colspan="6" style="text-align:center">
								등록된 문서가 없습니다.
							</td>
						</tr></table></tbody>
					`;

					$('#vacationDoc').html(str);
				}
				console.log('startpage : ' + res.pageMaker.startPage);
				console.log('endpage : ' + res.pageMaker.endPage);
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'vacation',
						left : "javascript:vacation("+(page -1)+")",
						right : "javascript:vacation("+(page+1)+")",
						doubleLeft : "javascript:vacation("+(1)+")",
						doubleRight :"javascript:vacation("+(res.pageMaker.endPage)+")"
				}

				$('input[name="searchType"]').val(res.pageMaker.cri.searchType);
				$('input[name="keyword"]').val(res.pageMaker.cri.keyword);

				printPageMaker(pageMakerData ,$('#vacationDocPage'), $('#pageMaker-template'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function addDocFavDoc(event){
		console.log("123")
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



	function getfavDocList(page, type, content){
		console.log("관심문서")
		var favDocPage = page;
		var eno = ${loginUser.eno};

		$.ajax({
			url : "<%=request.getContextPath()%>/kw/approvalDocBox/getfavDocList.do?eno=" + eno,
			
			data : {
				page : page,
				eno : eno
			},
			
			
			type:'get',
			success : function(res){
				console.log("resFav:",res)

				if(res.favDocList.length == 0){
					var str = `
						<table class="table table-hover text-nowrap"
						style="text-align: center; table-layout: fixed;">
						<tr style="font-size: 0.95em;">
							<th style="width: 30%; text-align:center;">제목</th>
							<th style="width: 20%; text-align:center;">기안자</th>
							<th style="width: 15%; text-align:center;">카테고리</th>
							<th style="width: 15%; text-align:center;">등록일</th>
							<th style="width: 10%; text-align:center;">조회수</th>
							<th style="width: 10%; text-align:center;">즐겨찾기</th>
						</tr>
						<tr>
							<td colspan="6" style="text-align:center">
								관심 문서가 존재하지 않습니다.
							</td>
						</tr>
						</table>
					`;

					$('.favDocList').html(str);
				}else{
					printWorkData(res.favDocList, $('.favDocList'), $('#favDocList-template'))
				}

				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'getfavDocList',
						left : "javascript:getfavDocList("+(favDocPage -1)+")",
						right : "javascript:getfavDocList("+(favDocPage+1)+")",
						doubleLeft : "javascript:getfavDocList("+(1)+")",
						doubleRight :"javascript:getfavDocList("+(res.pageMaker.endPage)+")"
				}

				printPageMaker(pageMakerData ,$('#favDocPage'), $('#pageMaker-template'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});

	}



	function favRemove(event){
		console.log("삭제")
		event.stopPropagation();
		var signNo = event.target.id;
		var id = event.target;
		console.log("signNo",signNo);
		console.log("id",id);

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

<script>
function goDetail(){
	//var sFormNo = $('input[name="sFormNo"]:checked').val();
	goDetail('<%=request.getContextPath()%>/approval/detailGo.do?signNo= {{signNo}});

}
</script>


<script type="text/x-handlebars-template"  id="favDocList-template">
<div class="row">
	<div class="col-12 mt-3">
		<table class="table table-hover text-nowrap" style="table-layout: fixed;">
			<tr style="font-size: 0.95em;">
				<th style="width: 40%;text-align:center;">제목</th>
				<th style="width: 10%;">작성자</th>
				<th style="width: 15%;">카테고리</th>
				<th style="width: 15%;">등록일</th>
				<th style="width: 10%;">조회수</th>
				<th style="width: 10%;">즐겨찾기</th>
				</tr>
				<tbody class="favManualList">
		{{#each .}}
				<tr style="font-size: 0.85em;" onclick="goDetail('kw/detailGo.do?signNo={{signNo}}','${menu.mcode }')">
					<td style="text-align:left;">{{title}}</td>
					<td>{{name}}</td>
					<td>{{formText}}</td>
					<td>{{formatDate eDate}}</td>
					<td><i class="fas fa-light fa-eye" style="margin-right: 5px"></i>{{viewCnt}}</td>
					<td>
						{{checkFav favCheck signNo}}
					</td>
				</tr>
	{{/each}}
				</tbody>
		</table>
	</div>
</div>
</script>

<%-- onclick="OpenWindow('<%=request.getContextPath()%>/approval/detailGo.do?signNo={{signNo}}','상세보기',1000,700);" --%>
<script type="text/x-handlebars-template"  id="DocList-template">

		<table class="table table-hover text-nowrap" style="table-layout: fixed; "  >
					<tbody>
					<tr >
						<th style="width: 35%;" text-align:center;>제목</th>
						<th style="width: 10%;">기안자</th>
						<th style="width: 15%;">카테고리</th>
						<th style="width: 15%;">등록일</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 10%;">즐겨찾기</th>
					</tr>
{{#each .}}
				<tr style="font-size: 0.85em;"onclick="goDetail('kw/detailGo.do?signNo={{signNo}}','${menu.mcode }')">
					<td style="text-align:left;">{{title}}</td>
					<td>{{name}}</td>
					<td>{{formText}}</td>
					<td>{{formatDate eDate}}</td>
					<td><i class="fas fa-light fa-eye" style="margin-right: 5px"></i>{{viewCnt}}</td>
					<td>
						{{checkFav favCheck signNo}}
					</td>
				</tr>
{{/each}}
		</tbody></table>
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
			var target;

			if(pageMakerData.target == "DocListGo"){
				target = "DocListGo";
			}
			if(pageMakerData.target == "getfavDocList"){
				target = "getfavDocList";
			}
			if(pageMakerData.target == "Cooperation"){
				target = "Cooperation";
			}
			if(pageMakerData.target == "businessTrip"){
				target = "businessTrip";
			}
			if(pageMakerData.target == "report"){
				target = "report";
			}
			if(pageMakerData.target == "vacation"){
				target = "vacation";
			}

			var str = '';
			for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
				var active = i == pageMaker.cri.page ? 'active' : '';
				str += '<li class="page-item ' + active + '">';
				str += '<a class="page-link" href="javascript:'+target+'(' + i + ')">';
				str += i
				str += '</a>';
				str += '</li>';
			}
			return new Handlebars.SafeString(str);
		},
		"checkFav" : function(favCheck, signNo){
			str = "";
			if(favCheck > 0){
				str += '<i id="' + signNo + '"class="fas fa-solid fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick="favRemove(event)"></i>';
			}else {
				str += '<i id="' + signNo + '" class="far fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick="addDocFavDoc(event)"></i>';
			}

			return new Handlebars.SafeString(str);
		},
		"mcheckFav" : function(favCheck){
			str = "";
			if(favCheck > 0){
				str += '<i id="fav"class="fas fa-solid fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick=""></i>';
			}else {
				str += '<i id="nFav" class="far fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick=""></i>';
			}

			return new Handlebars.SafeString(str);
		}

	});
</script>






















