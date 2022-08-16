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
</style>

</head>

<body>

<div class="wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div>
					<h3 class="title" style="padding-left: 10px;">내 인사정보</h3>
				</div>
				<div style="display: inline; margin-left: 10px; margin-top: 10px;">
					<span  class="text-muted">근태 > 내 인사정보 </span>
				</div>
			</div>
		</div>
	</section>


	<div class="ml-4 row" style="margin-top: 10px;">
<!-- 		<span class="col-12" style="font-size: 1.1em;">인사정보</span> -->
			<img class="col-2" src="${emp.photo }" style="float:left; height: 245px; margin-top: 8px;">
			<div class="col-10">
			<span>기본정보</span>
			<table class=" table table-bordered" style="margin-top: 8px; font-size: small; " >
				<tbody>
					<tr>
						<td>이름</td>
						<td class="center">${emp.name}</td>
						<td>이메일</td>
						<td class="center">${emp.email}</td>
						<td>생년월일</td>
						<td class="center">${emp.birth}</td>
						<td>휴대전화</td>
						<td class="center">${emp.phone}</td>

					</tr>
					<tr>
						<td>MBTI</td>
						<td class="center">${emp.mbti}</td>
						<td>주소</td>
						<td class="center">${emp.address}</td>
						<td class="center">-</td>
						<td class="center">-</td>
						<td class="center">-</td>
						<td class="center">-</td>
					</tr>
				</tbody>
			</table>
			<span>인사정보</span>
			<table class=" table table-bordered" style="margin-top: 8px; font-size: small;" >
				<tbody>
					<tr>
						<td>사번</td>
						<td class="center">${emp.eno }</td>
						<td>부서</td>
						<td class="center">${emp.dname}</td>
						<td>직위</td>
						<td class="center">${emp.ppsname}</td>
						<td>직책</td>
						<td class="center">${emp.job }</td>
					</tr>
					<tr>
						<td>내선번호</td>
						<td class="center">${emp.call}</td>
						<td>상태</td>
						<td class="center">
							<c:if test="${emp.enabled eq '0'}">퇴사</c:if>
							<c:if test="${emp.enabled eq '1'}">재직</c:if>
						</td>
						<td>퇴사일</td>
						<td class="center"> <c:if test="${not empty emp.retiredate}">
								<fmt:formatDate value="${emp.retiredate }" pattern="yyyy-MM-dd"/>
							</c:if>
							<c:if test="${empty emp.retiredate}">
								-
							</c:if>
						</td>
						<td>퇴직사유</td>
						<td class="center">
							<c:if test="${not empty emp.retirereason}">
								${emp.retirereason}
							</c:if>
							<c:if test="${empty emp.retirereason}">
								-
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
	</div>

	<div class="ml-4 row" style="margin-top: 30px;">
		<span class="col-6" style="font-size: 1.1em;">예상 퇴직금 조회</span>
		<button type="button" class="btn btn-outline-dark" style="margin-left: 65px;" onclick="calPay()">계산하기</button>
		<div class="col-8">
			<table class="table table-bordered" style="margin-top: 8px;font-size: medium;">
				<tbody>
					<tr>
						<td class="col-3">입사일</td>
						<td class="col-3"><div id="hiredate" style="text-align: center;" class="pt-1"><fmt:formatDate value="${emp.hiredate }" pattern="yyyy-MM-dd"/></div></td>
						<td class="col-3">예상 퇴직일</td>
						<td class="col-3"><input type="date" id="date" style="width: 100%; height: 35px;" value="<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/>"></td>
					</tr>
					<tr>
						<td>예상 직위</td>
						<td>
							<select class="custom-select" id="postPostion" style="width: 100%; height: 35px;">
								<c:forEach items="${postPostionList }" var="postPostion">
									<option value="${postPostion.ppsPay}"  ${emp.ppsname eq postPostion.ppsName ? 'selected' : ''}>${postPostion.ppsName}</option>
								</c:forEach>
							</select>
						</td>
						<td>예상 직급</td>
						<td>
							<select class="custom-select" id="job" style="width: 100%; height: 35px;">
								<option value="0.1" >1호봉</option>
								<option value="0.2">2호봉</option>
								<option value="0.3">3호봉</option>
								<option value="0.4">4호봉</option>
								<option value="0.5">5호봉</option>
								<option value="0.6">6호봉</option>
								<option value="0.7">7호봉</option>
								<option value="0.8">8호봉</option>
								<option value="0.9">9호봉</option>
								<option value="1">10호봉</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>연간 상여금 총액</td>
						<td><input type="text" id="bonus" value="0" placeholder="원"style="text-align: right; height: 35px; border-radius: 4px; border: 1px solid #CCCCCC; width: 100%;"></td>
						<td>연차 수당</td>
						<td><input type="text" id="annual" value="0" placeholder="원" style="text-align: right; height: 35px; border-radius: 4px; border: 1px solid #CCCCCC; width: 100%;"></td>
					</tr>
					<tr>
						<td>재직일수</td>
<!-- 						<td><input type="text" value="" placeholder="일" id="day" readonly style="text-align: right; background-color: #e9ecef; height: 35px; border-radius: 4px; border: 1px solid #CCCCCC; width: 100%;"></td> -->
						<td><div id="day" style="float: right;"></div></td>
						<td>1일 평균임금</td>
<!-- 						<td><input type="text" value="" placeholder="원" id="oneDayPay" readonly style="text-align: right; background-color: #e9ecef; height: 35px; border-radius: 4px; border: 1px solid #CCCCCC; width: 100%;"></td> -->
						<td><div id="oneDayPay" style="float: right;"></div></td>
					</tr>
					<tr>
						<td>예상퇴직금</td>
<!-- 						<td colspan="3"><input type="text" id="severancePay" value="원 " readonly style="text-align: right; background-color: #e9ecef; height: 35px; border-radius: 4px; border: 1px solid #CCCCCC; width: 100%;"></td> -->
						<td colspan="3"><div id="severancePay" style="float: right;"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-4" style="border: 1px solid #DEE2E6; height: 280px; margin-top: 8px;">
			<ul class="list-unstyled" style="font-size: 0.9em;">
				<li style="font-size: 1.1em !important; font-weight: bold !important;">[퇴직금 선정 기준]</li><br>
				<li>a. 퇴직일 기준 최종 3개월간의 임금</li>
				<li>b. 퇴직일 기준 1년간 받은 상여금 * 3 / 12</li>
				<li>c. 퇴직일 기준 1년간 받은 미사용 연차수당 * 3 / 12</li><br>
				<li>1일 평균 임금</li>
				<li>&nbsp;&nbsp;= a + b + c / 퇴직전 3개월간의 일수</li>
				<li>퇴직금</li>
				<li>&nbsp;&nbsp;= 1일 평균임금 * 30일 * (재직일수 / 365)</li>
			</ul>
		</div>
	</div>

</div>


<script type="text/javascript">
//

	function calPay(){

		if($('input[id="date"]').val() == ""){
			Swal.fire({
		      icon: 'warning',
		      title: "퇴직일을 설정해주세요",
		      confirmButtonColor: '#3085d6',
		    });
			return;
		}
		if($('input[id="bonus"]').val() == ""){
			Swal.fire({
			      icon: 'warning',
			      title: "연간 상여금 총액을 입력해주세요",
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}
		if($('input[id="annual"]').val() == ""){
			Swal.fire({
			      icon: 'warning',
			      title: "연차 수당을 입력해주세요",
			      confirmButtonColor: '#3085d6',
			    });
			return;
		}



		var sal = parseInt($('select[id="postPostion"]').val());
		var alpha = parseFloat($('select[id="job"]').val());
		var a = (sal + (sal * alpha)) * 3;

		var bonus = parseInt($('input[id="bonus"]').val());
		var b = (bonus * 3) / 12;

		var annual = parseInt($('input[id="annual"]').val());
		var c = (annual * 3) /12;

		var retireDay =$('input[id="date"]').val();
		var retire = new Date(retireDay);
		var tempRetire = new Date(retireDay);
		var retire3 = new Date(tempRetire.setMonth(tempRetire.getMonth() - 3));

		const diffdays = retire.getTime() - retire3.getTime();
		days = Math.abs(diffdays / (1000 * 60 * 60 * 24));
		var oneDayPay = Math.floor((a + b + c) / days);


		d1 = $('input[id="date"]').val();
		d2 = $('div[id="hiredate"]').text();
		 const date1 = new Date(d1);
		 const date2 = new Date(d2);
		 if(date1.getTime() < date2.getTime()){
			 Swal.fire({
			      icon: 'warning',
			      title: "다시선택해주세요",
			      confirmButtonColor: '#3085d6',
			    });
			 reutrn;
		 }
		 const diffDate = date1.getTime() - date2.getTime();

		day = Math.floor(diffDate / (1000 * 60 * 60 * 24));
		year = Math.floor(diffDate / (1000 * 60 * 60 * 24 * 365));

		var severancePay = Math.floor(oneDayPay * 30 * (day / 365));
		oneDayPay = oneDayPay.toLocaleString('ko-KR');
		severancePay = severancePay.toLocaleString('ko-KR');
		$('#oneDayPay').text(oneDayPay + "원");
		$('#day').text(day + "일");
		$('#severancePay').text(severancePay + "원");
	}


</script>
</body>






