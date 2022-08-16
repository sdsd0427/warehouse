<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
td:nth-child(2n+1) {
    background-color: #EEEEEE;
    vertical-align: middle !important;
}

.center{
	text-align: center;
}
img {
	height: 100%;
	width: 100%;
	object-fit: fill;
}
.cat {
	width: 300px;
}
.form-control-sm{
	font-size: .75rem;
	width: 100px;
}
/**/
</style>

</head>

<body>

<section class="content-header">
	<div class="container-fluid">
		<div class="row ">
			<div class="col-sm-4">
				<h3>인사정보 수정</h3>
			</div>
			<div class="col-sm-8">
				<button class="btn btn-outline-dark float-right" style="margin-left: 20px;" type="button" onclick="history.go(-1);">취소</button>
				<button class="btn btn-outline-primary float-right" style="margin-left: 20px;" type="button" onclick="modifyPOST_go();">수정</button>
			</div>
		</div>
	</div>
</section>

<section class="content container-fluid">
<div>

	<div>
<!-- 		<span class="col-12" style="font-size: 1.1em;">인사정보</span> -->
		<div class="row">
				<div class="col-2 cat">
					<img src="${hrDetail.photo }" style="float:left; height: 160px; margin-top: 8px;">
				</div>
			<div class="col-10" style="padding-top: 10px;">
				<span>기본정보</span>
				<table class=" table table-bordered" style="margin-top: 8px; font-size: 0.8em;">
					<tbody>
						<tr>
							<td>이름</td>
							<td class="center">${hrDetail.name}</td>
							<td>생년월일</td>
							<td class="center">${hrDetail.birth}</td>


						</tr>
						<tr>
							<td>MBTI</td>
							<td class="center">${hrDetail.mbti}</td>
							<td>휴대전화</td>
							<td class="center">${hrDetail.phone}</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td class="center">${hrDetail.email}</td>
							<td class="center">-</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-12">
			<span>인사정보</span>
			<form action="hrModify.do" method="post" role="hrModifyForm">
				<table class=" table table-bordered" style="margin-top: 8px; font-size: 0.8em;" >
					<tbody>
						<tr>
							<td>사번</td>
							<td class="center"><input type="text" id="eno" value="${hrDetail.eno}" name='eno' class="form-control form-control-sm" readonly></td>
							<td>부서</td>
							<td class="center">
								<select class="form-control form-control-sm" name="dno" id="dno">
									<option value="201" ${hrDetail.dno eq '201' ? 'selected':'' }>영업팀</option>
									<option value="202" ${hrDetail.dno eq '202' ? 'selected':'' }>마케팅팀</option>
									<option value="301" ${hrDetail.dno eq '301' ? 'selected':'' }>총무팀</option>
									<option value="310" ${hrDetail.dno eq '310' ? 'selected':'' }>인사관리팀</option>
									<option value="401" ${hrDetail.dno eq '401' ? 'selected':'' }>개발팀</option>
									<option value="402" ${hrDetail.dno eq '402' ? 'selected':'' }>디자인팀</option>
								</select>
							</td>
							<td>직위</td>
							<td class="center">
							<select class="form-control form-control-sm" name="ppscode" id="ppscode">
									<option value="PPS001" ${hrDetail.ppscode eq 'PPS001' ? 'selected':'' }>사원</option>
									<option value="PPS002" ${hrDetail.ppscode eq 'PPS002' ? 'selected':'' }>대리</option>
									<option value="PPS003" ${hrDetail.ppscode eq 'PPS003' ? 'selected':'' }>과장</option>
									<option value="PPS004" ${hrDetail.ppscode eq 'PPS004' ? 'selected':'' }>차장</option>
									<option value="PPS005" ${hrDetail.ppscode eq 'PPS005' ? 'selected':'' }>부장</option>
									<option value="PPS006" ${hrDetail.ppscode eq 'PPS006' ? 'selected':'' }>이사</option>
									<option value="PPS007" ${hrDetail.ppscode eq 'PPS007' ? 'selected':'' }>상무</option>
									<option value="PPS008" ${hrDetail.ppscode eq 'PPS008' ? 'selected':'' }>전무</option>
								</select>
							</td>
							<td>직책</td>
							<td class="center"><input type="text" id="job" value="${hrDetail.job}" name='job' class="form-control form-control-sm"></td>


						</tr>
						<tr>
							<td>내선번호</td>
							<td class="center"><input type="text" id="call" value="${hrDetail.call}" name='call' class="form-control form-control-sm"></td>
							<td>입사일</td>
							<td class="center"><input readonly type="date" name="wend" class="form-control form-control-sm" value="<fmt:formatDate value="${hrDetail.hiredate}" pattern="yyyy-MM-dd"/>"></td>
							<td>퇴사일</td>
							<td class="center"><input type="date" id="retiredate" value="" name='retiredate' class="form-control form-control-sm"></td>
							<td>상태</td>
							<td class="center">
								<select class="form-control form-control-sm" name="enabled" id="enabled">
									<option value="0" ${hrDetail.enabled eq '0' ? 'selected':'' }>퇴사</option>
									<option value="1" ${hrDetail.enabled eq '1' ? 'selected':'' }>재직</option>
									<option value="2" ${hrDetail.enabled eq '2' ? 'selected':'' }>휴직</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			</div>
		</div>
	</div>


</div>
</section>

<script>
function modifyPOST_go(){
	$("form[role='hrModifyForm']").submit();
}
</script>

</body>






