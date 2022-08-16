<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import = "java.util.Calendar" %>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/workDoc.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set> 

	<a id="loginUserEno"  data-value="${loginUser.eno }" ></a>										
	<span>
		<table style="border: 0px solid rgb(0, 0, 0); border-image: none;  font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
			<!-- Header -->
			<colgroup>
				<col width="310" />
				<col width="490" />
			</colgroup>
			<tbody>
				<tr>
					<td style="background: white; padding: 0px !important; border: 0px currentColor; border-image: none; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: middle;" colspan="2" class="">
						휴 가 신 청</td>
				</tr>
				<tr>
					<td style="background: white; padding: 0px !important; border: currentColor; border-image: none; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;"><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. -->
						<table style="border: 1px solid rgb(0, 0, 0); border-image: none; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
							<!-- User -->
							<colgroup>
								<col width="90" />
								<col width="220" />
							</colgroup>
							<tbody id="tableBot">
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
										기안자
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
										<span data-select-option="true" id="loginName"></span>
										<input type="hidden" name="eno" value="">
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
										소속
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
										<span data-select-option="true" id="deptName"></span>
										<input type="hidden" name="dname" value="">
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
										기안일
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
										<span data-select-option="true">
											<c:out value="${date}" />
										</span>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
										문서번호
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
										<span data-select-option="true" id="signDOCNO"></span>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				
				
					<td style=" background: white;text-align: right; padding: 0px !important; border: currentColor; border-image: none; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
						<span class="sign_type1_inline" data-group-seq="0" data-group-name="신청" data-group-max-count="1" data-group-type="type1" data-is-reception="" >
							<span class="sign_tit_wrap">
								<span class="sign_tit"><strong>신청</strong></span>
							</span>
							<span class="sign_member_wrap" id="activity_14264">
								<span class="sign_member">
									<span class="sign_rank_wrap">
										<span id="ppsloginname"class="sign_rank">${allSign.ppsname }
											<input type="hidden" name="ppsname" value="">
										</span>
									</span>
									<span class="sign_wrap"> 
										<span class="sign_stamp">
											<img src="http://tour.daouoffice.com:80/resources/images/stamp_approved.png">
										</span>
										<span id="sign_name"><strong>${allSign.name}</strong></span>
									</span>
									<span class="sign_date_wrap">
										<span class="sign_date " id="date_14264"><fmt:formatDate value="${allSign.ddate }" pattern="yyyy-MM-dd" /></span>
									</span>
								</span>
							</span>
						</span> <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. -->
						<!--  	<div id ="signStamp">	-->
						<c:forEach items="${allSign.signerList }" var="signer"> 	
							<span class="sign_type1_inline dStamp" data-signer="${signer.eno}" data-group-seq="1" data-group-name="승인" data-group-max-count="7" data-group-type="type1" data-is-reception="">
								<span class="sign_tit_wrap">
									<span class="sign_tit"><strong>승인</strong></span>
								</span>
								 <span class="sign_member_wrap" id="activity_14265">
								 	<span class="sign_member">
								 		<span class="sign_rank_wrap">
								 			<span class="sign_rank">${signer.ppsName}</span>
								 		</span>
								 		<span class="sign_wrap">
											<span class="sign_name"><strong>${signer.name}</strong></span>
										</span>
										<span class="sign_date_wrap">
											<span class="sign_date " id="date_14265">
											</span>
										</span>
									</span>
								</span>
							</span> 
						</c:forEach>
						<span id ="signStamp"></span>
						<!-- 결재선 추가 넣을 곳 -->
					</td>
				</tr>
			</tbody>
		</table>
		












<br>

			<table class="__se_tbl" style="background: white; border: 1px solid black; border-image: none;  color: black; font-family: malgun gothic, dotum, arial, tahoma; font-size: 12px; margin-top: 0px; border-collapse: collapse !important;">
				<tbody>
					<tr>
						<td style="background: rgb(221, 221, 221);width: 130px; padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							제목						
						</td>
						<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
							<input type="text" style="width: 100%; height: 100%;border: 0;" name="title" value="${allSign.title}">
						</td>
					</tr>
					<tr>
						<td
							style="background: rgb(221, 221, 221);width: 130px; padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

							기간&nbsp;및&nbsp;일시</td>
						<td
							style="background: rgb(255, 255, 255); width: 130px;padding: 3px; border: 1px solid black; border-image: none; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle;">
							<input
							type="date" 
							class="ipt_editor ipt_editor_date hasDatepicker"
							data-dsl="{{calendar:vacStart}}" id="vacStart"
							data-id="vacStart" data-name="vacStart" data-require="false"
							data-maxlength="" data-width="" data-defaultstr=""
							data-editable="false" name="vacStart" data-value="" value="<fmt:formatDate value="${allSign.vacStart }" pattern="yyyy-MM-dd" />" onclick="DateStart()">&nbsp;~&nbsp;
							
							<input type="date" 
							class="ipt_editor ipt_editor_date hasDatepicker"
							data-dsl="{{calendar:vacEnd}}" id="vacEnd" data-id="vacEnd"
							data-name="vacEnd" data-require="false" data-maxlength=""
							data-width="" data-defaultstr="" data-editable="false"
							name="vacEnd" data-value="" value="<fmt:formatDate value="${allSign.vacEnd }" pattern="yyyy-MM-dd" />" onclick="DateEnd()"></td>
					</tr>
					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

							연차&nbsp;일수</td>
						<td
							style="background: rgb(255, 255, 255); padding: 3px; border: 1px solid black; border-image: none; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle;"><span
							id="restPointArea"
							style="line-height: normal; font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; margin-top: 0px; margin-bottom: 0px;"><b>잔여연차
									: </b> <span  class="ipt_editor ipt_editor_num"
								data-dsl="{{number:restPoint}}" name="restPoint" id="restPoint"
								data-require="false" data-editable="true" value="0"
								readonly="readonly"> <b id="restPoint_Comment"
								style="font-weight: bold; color: red"></b> </span></span><span
							id="applyPointArea"
							style="line-height: normal; font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; margin-top: 0px; margin-bottom: 0px;"><b>신청연차
									: </b> <span  class="ipt_editor ipt_editor_num"
								data-dsl="{{number:applyPoint}}" name="GapDate"
								id="GapDate" data-require="false" data-editable="true"
								value="1" readonly="readonly" ></p></span> <b
								id="applyPoint_Comment" style="font-weight: bold; color: red"></b>
						</span></td>
					</tr>
					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 80px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"><b
							style="color: rgb(255, 0, 0);">*</b>&nbsp;휴가&nbsp;사유</td>
						<td
							style="background: rgb(255, 255, 255); padding: 3px; border: 1px solid black; border-image: none;  text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: top;">
							<textarea style=" resize: none;height: 150px;width: 100%;border: none"
								class="txta_editor" data-dsl="{{textarea:description}}"
								name="signContent" id="description" value=""
								data-id="description" data-name="description"
								data-require="false" data-maxlength="" data-width=""
								data-defaultstr="" data-editable="false" data-value=""
								placeholder="">${allSign.signContent }</textarea></td>
					</tr>
					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 20px !important; border: 1px solid black; border-image: none; width: 800px; height: 22px; text-align: left; vertical-align: middle;"
							colspan="2">1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여
							사용함을 원칙으로 한다. 
							단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수
							있다.<br> 2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>
							3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
						</td>
					</tr>
				</tbody>
			</table>

	</span>
	
<script>

function DateEnd(){
	
	var toDate = new Date($("#vacStart").val());
	var fromDate = new Date($("#vacEnd").val());
	var dateGap = Math.ceil(
	      (fromDate.getTime() - toDate.getTime()) / (1000 * 3600 * 24)
	    );
	
	var GapDate = document.getElementById('#GapDate');
	
	document.getElementById("GapDate").innerHTML=dateGap;
	
	console.log("toDate",toDate)
	console.log("fromDate",fromDate)
	console.log("dateGap",dateGap)
	
	
}
	
	



var loginUserEno = document.getElementById("loginUserEno").getAttribute('data-value');
//console.log("loginUserEno!!!",loginUserEno)

$(function(){
	$.ajax({
		url:'<%=request.getContextPath()%>/approval/getDrafterInfo?eno='+loginUserEno,
		type:'get',
		dataType : 'json',
		success:function(response){
			console.log("responseDOc",response);
			
			$.each(response.myconList, function(i, v){
				//console.log(v.dname)
			res=''+v.name+'';
			rer=''+v.dname+'';
			str=''+v.ppsname+'';
			stq=''+v.name+'';
			$('#loginName').text(res);
			$('#deptName').text(rer);
			$('#ppsloginname').text(str);
			$('#sign_name').text(stq);
			$('input[name="eno"]').val(v.eno);
			$('input[name="dname"]').val(v.dname);
// 			$('input[name="dDate"]').val(v.dDate);
 			$('input[name="signNo"]').val(v.signNo);
			$('input[name="ppsname"]').val(v.ppsname);
			
			})
		}
	});
})

$(function(){
	$.ajax({
		url:'<%=request.getContextPath()%>/approval/getSignDocNo',
		type:'get',
		dataType : 'json',
		success:function(response){
			//console.log("responseDoc1111",response.DocNo);
			res=''+response.DocNo+'';
			$('#signDOCNO').text(res);
		}
	});
})

</script>