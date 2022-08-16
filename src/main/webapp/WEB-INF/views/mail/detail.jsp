<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mail.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
.fas{
	margin-right: 10px;
}

.btn_submenu{
	margin-left: 15px;
}

a:hover {
    color: #0056b3;
    text-decoration: none;
}
a{
	color: black;
}
th, td{
	text-align: left !important;
}
</style>
</head>
<body>
<div class="wrapper">

	<h3 style="padding: 15px 0.5rem;">메일</h3><br><br>
	<section class="content" style="margin-top: -50px;">
		<div class="container-fluid">
			<div class="card card-navy card-outline">
				<div class ="card-tools" style="float: left; border-bottom: 1px solid lightgray;">
					<div class="aa" style="display: flex;">
						<div class="btn_submenu">
							<button type="button" class="btn btn-sm checkbox-toggle" style="font-size: 1.0em !important;margin-top: 7px;" onclick="goDetail('<%=request.getContextPath()%>/mail/resendRegistFormGo.do?mFrom=${mail.mFrom }', '${menu.upcode }')">
								<i class="fas fa-reply">답장</i>
							</button>
						</div>
						<div class="btn_submenu" style="margin-left: 0;">
							<button type="button" class="btn btn-sm checkbox-toggle" style="font-size: 1.0em !important;margin-top: 7px;" onclick="trash('${mail.mailNo}')" id="clean" >
								<i class="fas fa-trash-alt">삭제</i>
							</button>
						</div>
						<button type="submit" class="btn btn-sm btn-outline-dark" style="margin-left: 720px; height: 38px; margin-top: 7px; width: 58px;font-size: medium;margin-bottom: 7px;" onclick="goIframPage('/warehouse/mail/${test }.do','${from }')">목록</button>
			      	</div>
				</div>

				<div class="card-body pad">
						<div class="row">
							<h5 style="font-weight: bold;padding-left: 10px;padding-right: 10px;">${mail.title }</h5>
							<fmt:formatDate value="${mail.mDate }" pattern="yyyy-MM-dd HH:mm" />
						</div>
						<div class="row" style="padding-left: 10px;">
							<strong>보낸 사람</strong>&nbsp;&nbsp;&nbsp;&nbsp;${mail.name}&nbsp;&lt;${mail.mFrom }&gt;
						</div>
						<div class="row" style="padding-left: 10px;">
							<strong>받는 사람</strong>&nbsp;&nbsp;&nbsp;
							<c:forEach items="${mail.mtoList }" var="mto" varStatus="i">
								${mto.name }&nbsp;&lt;${mto.eno }&gt;
								<c:if test="${not i.last}">,&nbsp;</c:if>
							</c:forEach>
						</div>
						<hr>
						<div class="row" style="padding-left: 10px;">${mail.content }</div>

					<div class="card card-light card-outline" style="margin-top: 100px;">
						<div class="card-header">
							<h5 class="card-title" style="font-size: medium;"><i class="fas fa-paperclip"></i>첨부파일</h5>
						</div>
						<div class="card-footer">
							<div class="row">
								<c:forEach items="${mail.attachList }" var="attach">
									<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;" onclick="location.href='getFile.do?attachNo=${attach.attachNo}';">
										<div class="info-box">
										 	<span class="info-box-icon bg-info">
												<i class="fa fa-copy"></i>
											</span>
											<div class="info-box-content">
												<span class ="info-box-text">
													<fmt:formatDate value="${attach.regDate }" pattern="yyyy-MM-dd" />
												</span>
												<span class ="info-box-number">${attach.fileName }</span>
											</div>
										</div>
									 </div>
								</c:forEach>
							</div>
						</div>
				    </div>
				</div>

			</div>
		</div>
	</section>
</div>

<script>
parent.countMail();
// window.onload=function(){
<%-- 	summernote_go($('#content'),'<%=request.getContextPath()%>');  --%>
// }

// 휴지통으로 이동
function trash(mailNo){
	Swal.fire({
	      title: '메일 삭제',
	      text: "메일을 삭제하시겠습니까?",
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
	          '휴지통으로 이동되었습니다.'
	        ).then(function(){
	        	location.href='<%=request.getContextPath()%>/mail/trashUpdate.do?mailNo='+mailNo+'&mCode='+'${menu.mcode}&move=main';
	        })
	      }
	   })
}

//팝업창 닫기
function CloseWindow(){
	window.opener.location.reload(true);
	window.close();
}

</script>


</body>
