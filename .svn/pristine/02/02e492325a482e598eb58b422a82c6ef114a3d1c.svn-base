<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>



	page = 1;
	favPage = 1;
	function seFirstName(){
		
	//	page = startPage
		var data = {
				'page' : page,
				'searchType' : $('.mSearch select[name="searchType"]').val(),
				'keyword' : $('.mSearch input[name="keyword"]').val(),
				'eno' : ${loginUser.eno}
		}
	
	
	$.ajax({
		url:'<%=request.getContextPath()%>/contact/getGiList',
		type:'get',
		dataType : 'json',
		success:function(response){
			console.log("response",response);
			
			if(response.myconList.length > 0){
				printWorkData(response.myconList, $('#botallTable'), $('#contactList-template'));
			}else{
				var str = `
					<tr>
						<td colspan="7" style="text-align:center">
							등록된 주소록이 없습니다.
						</td>
					</tr>
				`;

				$('#botallTable').html(str);
			}

			
		 
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


<script type="text/x-handlebars-template"  id="contactList-template">

	<table class="table table-hover text-nowrap">
				<thead>                                                   
					<tr>                                                  
						<th >                                             
							<input type="checkbox" value="" id="check1">  
							<label for="check1"></label>                  
						</th>                                             
							<th ></th>                                
							<th >이름</th>                                
							<th >직위</th>                                
							<th >휴대폰</th>                              
							<th >이메일</th>                              
							<th >부서</th>                                
							<th >내선번호</th>                            
					</tr>                                                 
				</thead>                                                  
				<tbody id="tall"> 


{{#each .}}
				<tr style="font-size: 0.85em;cursor:pointer;" onclick=OpenWindow("../mail/registForm.do","메일보내기",1000,800)>
					<td>  
						<div class="icheck-primary" style="margin-top: 10px;">  
							<input type="checkbox" class="empCheckbox" id={{eno}} name="eno" onclick="inputEmpList({{eno}})"> 
							<label for="check1"></label> 
						</div> 
					</td> 
		 	 		<td class="Photohover"><img class="table-avatar emp_profile" src={{photo}} style="border-radius: 50px;"></td>
					<td><div style="margin-top: 10px;">{{name}}

		 	 	{{#if({{condition}} == '업무중')}}
		 	 	<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1"><span class="visually-hidden"></span></span>
		 	 	 else if ({{condition}} == '업무종료'){
		 	 	<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;"><span class="visually-hidden"></span></span>
		 	 	} else
		 	 	<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;"><span class="visually-hidden"></span></span>
				
				</div></td>
					<td><div style="margin-top: 10px;">{{ppsname}}</div></td> 
					<td><div style="margin-top: 10px;">{{phone}}</div></td>
					<td  onclick=OpenWindow("../mail/send.do","메일보내기",1000,800)><div style="margin-top: 10px;"><U>'+v.email+'</U></div></td>
					<td><div style="margin-top: 10px;">{{dname}}</div></td>
					<td><div style="margin-top: 10px;">{{call}}</div></td>
				</tr>
{{/each}}
					</tbody>
						</table>
</script>
