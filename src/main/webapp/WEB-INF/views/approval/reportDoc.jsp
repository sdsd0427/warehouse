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
						보 고 서</td>
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
										<span id="ppsloginname"class="sign_rank">
											<input type="hidden" name="ppsname" value="">
										</span>
									</span>
									<span class="sign_wrap"> 
										<span class="sign_stamp">
											<img src="http://tour.daouoffice.com:80/resources/images/stamp_approved.png">
										</span>
										<span id="sign_name"><strong></strong></span>
									</span>
									<span class="sign_date_wrap">
										<span class="sign_date " id="date_14264"></span>
									</span>
								</span>
							</span>
						</span> <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. -->
						<!--  	<div id ="signStamp">	-->
						<c:forEach items="${mySignLineList }" var="SignLineList"> 	
							<span class="sign_type1_inline" data-signer="${SignLineList.eno}" data-group-seq="1" data-group-name="승인" data-group-max-count="7" data-group-type="type1" data-is-reception="">
								<span class="sign_tit_wrap">
									<span class="sign_tit"><strong>승인</strong></span>
								</span>
								 <span class="sign_member_wrap" id="activity_14265">
								 	<span class="sign_member">
								 		<span class="sign_rank_wrap">
								 			<span class="sign_rank">${SignLineList.ppsname}</span>
								 		</span>
								 		<span class="sign_wrap">
											<span class="sign_name"><strong>${SignLineList.name}</strong></span>
										</span>
										<span class="sign_date_wrap">
											<span class="sign_date " id="date_14265"></span>
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
		<table style="border: 0px solid rgb(0, 0, 0); border-image: none;  font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
			<!-- Draft -->
			<colgroup>
				<col width="120" />
				<col width="230" />
				<col width="120" />
				<col width="330" />
			</colgroup>
			<tbody>
				<tr>
					<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle; ">
						제목
					</td>
					<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
						<input type="text" style="width: 100%; height: 100%;border: 0;" name="title"  placeholder="제목을 작성하세요">
					</td>
				</tr>
				<tr>
					<td colspan='5'>
						<textarea class="form-control" name="signContent" id="signContent" rows="10" cols="10" style="height:400px;" placeholder="" ></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</span>
	
<script>
$(function(){
   summernote_go($('textarea[name="signContent"]'),'<%=request.getContextPath()%>');
});









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