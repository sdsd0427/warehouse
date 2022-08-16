<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataDepMap.pageMaker }" />
<c:set var="cri" value="${dataDepMap.pageMaker.cri }" />
<c:set var="myDepartmenList" value="${dataDepMap.myDepartmenList }" />

<c:set var="mygroupList" value="${groupMap.mygroupList }" />

<head>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style type="text/css">
<meta charset="UTF-8">

.Photohover img {
  transition: all 0.2s linear;
}
.Photohover:hover img {
  transform: scale(1.4);
}

.row{
	margin: 0;
}

.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

.jumbotron {
	margin-bottom: 0;
}

#content {
	margin-left: 50px;
	margin-right: 50px;
	overflow: hidden;
}

/*  */
#title {
	border-bottom: 2px solid #727377;
}

#rightMenu {
	margin-top: 10px;
}

.profileImg {
	height: 128px;
	width: 96px;
}

#officerList > thead > tr > th, #officerList > tbody > tr > td {
	text-align: center;
}



	.upWord .word{
	    list-style-type: none;
	    float: left;
	    margin: 5px;
	}

.btn_submenu {
    display: inline-block;
}

	span#RecName{
		margin-left: 120px;
	}


	pribut{
	 border:1px solid;

	}
	div#chart {
    padding-top: 10px;
}

	select#perPageNum ,select#searchType {
	list-style-type: none;
    width: 140px;
    float: left;
}

input.form-control{
list-style-type: none;
    width: 180px;
    float: left;
}

div#inName {
 	width: 290px;
 	height:40px;
    margin-left: 8px;
     margin-top: 3px;
     background-color: #ffc107;
         padding-top: 8px;
}

div#botle {
    margin-left: 500px;

}
div#b {
    border-radius: 5px;
}
.sename{
color:black;
}
div#bottom {
    margin-left: 40px;
    margin-top: -30PX;
}
ul.upWord {
    margin-left: -30px;
}
.emailcur{
cursor:pointer;
}
</style>

</head>
<body>





<div class="wrapper" style="overflow-y:hidden;  ">
	<section class="content-header">
			<div class="row md-2">
				<div class="col-sm-12">
					<h3>부서주소록</h3>
				</div>
			</div>
		</section>
	<div>
	<div style="display: flex; justify-content: space-between; padding: 20px 0 ">
<!-- 		<div id="b" class="bg-info" style="height: 40px; width:140px"><a id="pribut" style="padding-left: 10px" href="javascript:test()" ><span style="vertical-align: -7px">개인주소록 추가</span></a></div>
 -->
		<button type="button" class="btn btn-sm btn-outline-primary" data-toggle="modal" data-target="#myModalAdd" data-backdrop="false" style="font-size: 1.0em;margin-left: 5px"><strong>개인주소록 추가</strong></button>


		<div id="c">
			<ul class="upWord" name="searchFirstType" id="searchFirstType">
				<li class="word" ><a href="#" onclick="allReload()" class="sename"><strong>전체</strong></a></li>
				<li class="word" ><a href="#" class="sename" onclick="DseFirstName()"><strong>ㄱ</strong></a></li>
				<li class="word" ><a href="#" class="sename" onclick="DseNiName()"><strong>ㄴ</strong></a></li>
				<li class="word" ><a href="#" class="sename" onclick="DseDiName()"><strong>ㄷ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseRiName()"><strong>ㄹ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseMiName()"><strong>ㅁ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseBiName()"><strong>ㅂ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseXiName()"><strong>ㅅ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseOiName()"><strong>ㅇ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseJiName()"><strong>ㅈ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseCiName()"><strong>ㅊ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseCaiName()"><strong>ㅋ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseTiName()"><strong>ㅌ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DsePiName()"><strong>ㅍ</strong></a></li>
				<li class="word"><a href="#" class="sename" onclick="DseHiName()"><strong>ㅎ</strong></a></li><!-- </li> -->
			</ul>
		</div>  <!-- ㄱ,ㄴ,ㄷ -->
	</div>
<div class="row" style="justify-content: space-between;">

	<div id="bot" class="col-lg-12" >
				<div class="card card-navy card-outline">
					<div class="card-header with-border">
						<div id="" class="card-tools" >
							<div class="input-group row">
								 <select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);">
									<option value="10">정렬</option>
									<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20</option>
									<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50</option>
									<option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100</option>
								</select>
									<select class="form-control col-md-3" name="searchType" id="searchType">
										<option value="pn"
											${cri.searchType eq 'pn' ? 'selected':'' }>전체</option>
										<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>이름</option>
										<option value="p" ${cri.searchType eq 'p' ? 'selected':'' }>직위</option>
									</select> <input class="form-control" type="text"name="keyword" placeholder="검색어를 입력하세요" value="${param.keyword }"> <span class="input-group-append">
										<button class="btn bg-navy" type="button" onclick="list_go(1);" data-card-widget="search">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
							</div>
						</div>
					</div>
					<div class="card-body table-responsive p-0">
					<div id="botallTable">
						 <table class="table table-hover text-nowrap" >
							<thead>
								<tr >
									<th >
										<input type="checkbox" value="" id="check1">
										<label for="check1"></label>
									</th>
										<th style="width: 10%;">사진</th>
										<th style="width: 10%;">이름</th>
										<th style="width: 10%;">직위</th>
										<th style="width: 15%;">휴대폰</th>
										<th style="width: 20%;">이메일</th>
										<th style="width: 10%;">부서</th>
										<th style="width: 10%;">내선번호</th>
										<th style="width: 10%;">메일</th>
								</tr>
							</thead>
							<tbody id="tall">

							<c:if test="${empty myDepartmenList }">
								<tr>
									<td colspan="6" ><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${myDepartmenList }" var="contact" >
								<tr style='font-size: 0.85em;cursor:pointer;' >
									<td style="margin-top: 10px;">
										<div class="icheck-primary" style="margin-top: 10px;">
											<input type="checkbox" class="empCheckbox" id="${contact.eno }" name="eno" onclick="inputEmpList(${contact.eno})">
											<label for="${contact.name }"></label>
										</div>
									</td>
									<td class="Photohover" style="padding: 0.3rem;"  onclick="OpenWindow('../contact/ContactHrDetail.do?eno=${contact.eno }','인사정보',800,500);">
										<div >
											<img class="table-avatar emp_profile" src="${contact.photo}" style="border-radius: 50px; transition: all 0.2s linear;">
										
										</div>
									</td>
									<td style="padding: 0.3rem;"  onclick="OpenWindow('../contact/ContactHrDetail.do?eno=${contact.eno }','인사정보',800,500);">
										<div style="margin-top: 10px;margin-left: 8px">
											${contact.name}
											
											<c:if test="${contact.condition eq '업무중'}">
												<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style=""><span class="visually-hidden"></span></span>
											</c:if>
											<c:if test="${contact.condition eq '업무종료'}">
												<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;"><span class="visually-hidden"></span></span>
											</c:if>
											<c:if test="${contact.condition eq '휴직'}">
												<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #e10a14!important;"><span class="visually-hidden"></span></span>
											</c:if>
											<c:if test="${contact.condition eq '외근 후 퇴근'}">
												<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;"><span class="visually-hidden"></span></span>
											</c:if>
											<c:if test="${contact.condition eq '외근'}">
												<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;"><span class="visually-hidden"></span></span>
											</c:if>
											<c:if test="${contact.condition eq '출장'}">
												<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;"><span class="visually-hidden"></span></span>
											</c:if>
											<c:if test="${contact.condition eq '회의중'}">
												<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;"><span class="visually-hidden"></span></span>
											</c:if>
											<c:if test="${contact.condition eq '자리비움'}">
												<span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1" style="background-color: #ffc107!important;"><span class="visually-hidden"></span></span>
											</c:if>
										</div>
									</td>
									<td style="padding: 0.3rem;"  onclick="OpenWindow('../contact/ContactHrDetail.do?eno=${contact.eno }','인사정보',800,500);"><div style="margin-top: 10px;margin-left: 10px">${contact.ppsname }</div></td>
									<td style="padding: 0.3rem;"  onclick="OpenWindow('../contact/ContactHrDetail.do?eno=${contact.eno }','인사정보',800,500);"><div style="margin-top: 10px;margin-left: 10px">${contact.phone }</div></td>
									<td style="padding: 0.3rem;"  onclick="OpenWindow('../contact/ContactHrDetail.do?eno=${contact.eno }','인사정보',800,500);"><div style="margin-top: 10px;margin-left: 10px">${contact.email }</div></td>
									<td style="padding: 0.3rem;"  onclick="OpenWindow('../contact/ContactHrDetail.do?eno=${contact.eno }','인사정보',800,500);"><div style="margin-top: 10px;margin-left: 10px">${contact.dname }</div></td>
									<td style="padding: 0.3rem;"  onclick="OpenWindow('../contact/ContactHrDetail.do?eno=${contact.eno }','인사정보',800,500);"><div style="margin-top: 10px;margin-left: 10px">${contact.call }</div></td>
									<td style="padding: 0.3rem;" onclick="OpenWindow('../mail/registForm.do?mFrom=${contact.eno}','메일보내기',1000,800);"><div style="margin-top: 13px;margin-left: 10px">
									<i class="fas fa-envelope"></i></div>
								</tr>
							</c:forEach>
							</tbody>
						</table>
<!-- 						<div class="card-footer"> -->
<%-- 							<%@ include file="/WEB-INF/views/common/pagination.jsp" %> --%>
<!-- 						</div> -->
					
						<div class="card-footer">
							<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
						</div>
					</div> <!--<div id="botallTable">  -->

					</div><!-- card-body table-responsive p-0 -->
					
				
				</div>
			</div><!-- bot -->
		</div><!-- row -->
	</div> <!-- <div id="bottom"> -->
</div><!-- wrapper  -->
<!-- /* 개인주소록 추가 모달 */ -->
  <!-- Modal -->
  <div class="modal fade" id="myModalAdd" role="dialog" style="display:none">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="width: 330px">
        <div class="modal-header">
          <h5 class="modal-title">개인주소록 추가</h5>
           <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="height: 350px;width: 400px" >
           <!--  <span>그룹 </span>&nbsp; -->
           <div style="display: inline;width: 400px">
            <input id="groupname" name=cogroupname type="text" placeholder="예) 개발팀 그룹" style="height: 35px">
              <button id="groupsave"type="button" class="btn btn-sm btn-outline-primary" data-dismiss="modal" onclick='clickEvent()' style="margin-left: 10px;margin-top: -2px;width: 100px;height: 35px">그룹 추가</button>
           </div> 
            
            <div class="allgroup card" style="width: 300px;margin-top: 10px" >
					<div class="card-header">
						<h3 class="card-title"><strong>기존 그룹</strong></h3>
					</div>

					<div class="card-body p-0" style="overflow: scroll;overflow-x: hidden; height: 200px">
						<table class="table table-sm">
							<tbody>
							<c:forEach items="${mygroupList }" var="groupList">
								<tr>
									<td >
										<input type="radio" id="radioName" name="radioName" value="${groupList.cogroupcode }" style="margin-right: 10px;" onclick="inputValue('${groupList.cogroupcode }','${groupList.cogroupname }')">${groupList.cogroupname }<br>
									</td >
									<td style="width: 30%">${groupList.groupCount} 명</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						
					</div>
						 <button id="groupsave"type="button" class="btn btn-block btn-outline-primary" data-dismiss="modal" onclick='clickSave()'>기존그룹에 저장</button>
				</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-block btn-outline-secondary" data-dismiss="modal" style="width: 100px">취소</button>
        </div>
      </div>
    </div>
  </div>
	<!-- Modal 끝-->

<form role="form" action="#">

</form>


<form id="oa">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
	<input type="hidden" name="mCode" value="${menu.mcode }"/>
</form>



<script>

var appendGroup;
//그룹지정
function clickSave(){
	
	if($("input:radio[name='radioName']").is(':checked')==false ){
		Swal.fire({
	      icon: 'warning',
	      title: '그룹선택은 필수입니다.',
	      confirmButtonColor: '#3085d6',
	    });
		return;
	}
	
	console.log(appendGroup);
	console.log(appendGroup.cogroupcode);
	console.log(appendGroup.cogroupname);

	var formData = new FormData();

	formData.append("cogroupcode", appendGroup.cogroupcode);
	formData.append("empList", empList);
	console.log('empList',empList)
	console.log('formData',formData)
	var request = new XMLHttpRequest();
	request.open("POST", "<%=request.getContextPath()%>/contact/registGroupAssign.do");
	request.send(formData);

	Swal.fire({
	      icon: 'warning',
	      title: '그룹에 지정되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
			location.href='personalList.do';
	    });

}


//pagination
function list_go(page,url){
	//alert(page);
	if(!url) url="deptList.do";

	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();


}
</script>

<script>






//전체 클릭
function allReload(){
window.location.reload();
}





</script>

<script>
var empList = [];
function clickEvent(){

	 console.log($("form[role='form']"));
	if($("input[name='cogroupname']").val()==""){
		Swal.fire({
		      icon: 'warning',
		      title: '그룹은 필수입니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				$("input[name='cogroupname']").focus();
		    });
		return;
	}

	var formData = new FormData();

	formData.append("cogroupname", $('input[name="cogroupname"]').val());
	formData.append("empList", empList);
	console.log('empList',empList)
	console.log('formData',formData)
	var request = new XMLHttpRequest();
	request.open("POST", "<%=request.getContextPath()%>/contact/groupRegist.do");
	request.send(formData);


	//formData 정보
	for (var pair of formData.entries()) {
	    console.log(pair[0]+ ', ' + pair[1]);
	}

	Swal.fire({
	      icon: 'success',
	      title: '개인주소록에 추가되었습니다.',
	      confirmButtonColor: '#3085d6',
	    }).then(function(){
	    	location.href='personalList.do';
	    });

}



	/*$('.empCheckbox').on("click", function(){
		console.log("this.eno",this.id)
		console.log("v.eno",this.id)
		empList.push(this.id);
		console.log('type : ',typeof this.id)

	})*/

	function inputEmpList(id){
		console.log("v.eno",id)
		empList.push(id);
		console.log('type : ',typeof this.id)
	}
</script>
<%@ include file="./contact_js.jsp" %>
</body>
