<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	page = 1;
	favPage = 1;
	function manualListGo(startPage){
		page = startPage
		var data = {
				'page' : page,
				'searchType' : $('.mSearch select[name="searchType"]').val(),
				'keyword' : $('.mSearch input[name="keyword"]').val(),
				'category' : $('.mSearch select[name="category"]').val(),
				'eno' : ${loginUser.eno}
		}


		$.ajax({
			url : '<%=request.getContextPath()%>/kw/manual/manualList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.manualList.length > 0){
					printWorkData(res.manualList, $('.manualList'), $('#manualList-template'));


				}else{
					var str = `
						<tr>
							<td colspan="6" style="text-align:center">
								등록된 메뉴얼이 없습니다.
							</td>
						</tr>
					`;

					$('.manualList').html(str);
				}

				lPage = page - 1;
				if(lPage < 1){lPage = 1;}
				rPage = page + 1;
				if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'manualListGo',
						left : "javascript:manualListGo("+ lPage +")",
						right : "javascript:manualListGo("+ rPage +")",
						doubleLeft : "javascript:manualListGo("+1+")",
						doubleRight :"javascript:manualListGo("+res.pageMaker.realEndPage+")"
				}

				printPageMaker(pageMakerData ,$('.manualPage'), $('#pageMaker-template'));



			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}


	function favManualListGo(startPage){
		favPage = startPage
		var data = {
				'page' : favPage,
				'perPageNum' : 5,
				'searchType' : $('.favMSearch select[name="searchType"]').val(),
				'keyword' : $('.favMSearch input[name="keyword"]').val(),
				'category' : $('.favMSearch select[name="category"]').val(),
				'eno' : ${loginUser.eno}
		}


		$.ajax({
			url : '<%=request.getContextPath()%>/kw/manual/favManualList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.favManualList.length > 0){
					printWorkData(res.favManualList, $('.favManualList'), $('#favManualList-template'));


				}else{
					var str = `
						<tr>
							<td colspan="6" style="text-align:center">
								등록된 메뉴얼이 없습니다.
							</td>
						</tr>
					`;

					$('.favManualList').html(str);
				}

				lPage = favPage - 1;
				if(lPage < 1){lPage = 1;}
				rPage = favPage + 1;
				if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
				
				pageMakerData = {
						pageMaker : res.pageMaker,
						target : 'favManualListGo',
						left : "javascript:favManualListGo("+lPage+")",
						right : "javascript:favManualListGo("+rPage+")",
						doubleLeft : "javascript:favManualListGo("+(1)+")",
						doubleRight :"javascript:favManualListGo("+(res.pageMaker.realEndPage)+")"
				}

				printPageMaker(pageMakerData ,$('.favManualPage'), $('#pageMaker-template'));


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

<script type="text/x-handlebars-template"  id="manualList-template">
{{#each .}}
	<tr style='font-size: 0.85em;'>
		<td id="manualTitle"
			style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; text-align:left;"
			onclick="javascript:OpenWindow('manualDetail.do?from=list&manualNo={{manualNo}}','상세보기',800,700);">
				<span class="col-sm-12 ">{{title manualTitle}}</span>
		</td>
		<td class="as">{{name}}</td>
		<td >{{checkCate cateNo}}</td>
		<td>{{formatDate regDate}}</td>
		<td><i class="fas fa-light fa-eye"></i> {{viewCnt }}</td>
		<td class="favManual">
		<input type="hidden" id="manualNo" name="manualNo" value="{{manualNo}}">
		<input type="hidden" id="eNo" name="eNo" value="${loginUser.eno}">
		{{checkFav favCount}}
		</td>
	</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="favManualList-template">
{{#each .}}
		<tr style='font-size: 0.85em;'>
			<td id="manualTitle"
					style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; text-align:left;"
				onclick="javascript:OpenWindow('manualDetail.do?from=list&manualNo={{manualNo}}','상세보기',800,700);">
					<span class="col-sm-12 ">{{title manualTitle}}</span>
			</td>
			<td>{{name}}</td>
			<td>{{checkCate cateNo}}</td>
			<td>{{formatDate regDate}}</td>
			<td><i class="fas fa-light fa-eye"></i> {{viewCnt}}</td>
		<td class="favManual">
			<input type="hidden" id="manualNo" name="manualNo" value="{{manualNo}}">
			<input type="hidden" id="eNo" name="eNo" value="${loginUser.eno}">
			<i id="fav" class="fas fa-solid fa-star star"
				style="font-size: 1.5em; color: #ffc107;"></i></td>
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
			var target;

			if(pageMakerData.target == "manualListGo"){
				target = "manualListGo";
			}
			if(pageMakerData.target == "favManualListGo"){
				target = "favManualListGo";
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
		"checkFav" : function(favCount){
			str = "";
			if(favCount > 0){
				str += '<i id="fav"class="fas fa-solid fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick=""></i>';
			}else {
				str += '<i id="nFav" class="far fa-star star"style="font-size: 1.5em; color: #ffc107;" onclick=""></i>';
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






















