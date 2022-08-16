<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 
<script>



function relatedDoc(){
	
	$.ajax({
 		url:'<%=request.getContextPath()%>/approval/getRelatedDocList.do',
 		type:'get',
 		dataType : 'json',
 		success:function(response){
 			console.log("response관련문서",response);
	/*			
 		if(response.relatedDoc.length > 0){
			printWorkData(response.relatedDoc, $('#reldoc'), $('#relatedList-template'));
		}else{
			var str = `
				<tr>
					<td colspan="6" style="text-align:center">
						관련된 문서가 없습니다.
					</td>
				</tr>
			`;

			$('#reldoc').html(str);
		}
		*/
 		}
 	});
	
}

</script>  


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

<script type="text/x-handlebars-template"  id="relatedList-template">
{{#each .}}
	
		<div class="info-box" style="margin-left: -5px;" onclick="OpenWindow('<%=request.getContextPath() %>/kw/RelateddetailDocform.do?signNo={{signNo }}','관련문서',1000,800);">
			<div class="imgContainer">
				<li class="list-inline-item">
					<img class="table-avatar emp_profile" src="{{photo}}">
				</li>
			</div>
		<div class="info-box-content">
			<div class="infoandspan" style="display: flex";>
				<span class="info-box-text">{{title}}</span>
					<span class="material-symbols-outlined">assignment</span>
			</div>
				<span class="info-box-number">{{name}} {{ppsname}}</span>
		</div>
		</div>
		
{{/each}}
</script>	  