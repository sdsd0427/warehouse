<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<script>
swal({
    title : "날짜 설정실패",
    text : "종료일은 시작일 이후여야합니다.",
    type : "warning"
 });
</script>

<script>
//알림 클릭 시 script를 사용해야 하는 경우(alert 또는 모달)
var ref = document.referrer; //유입된 페이지의 url 값
function testConfirm(){
	
	Swal.fire({
	    title: '승인',
	    text: "커뮤니티 가입을 승인하시겠습니까?",
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
	        '가입을 승인했습니다.'
	      ).then(function(){
	    	  parent.location.href = ref;//유입된 페이지로 다시 이동
	      })
	    }
	 })
}
</script>

<script>
testConfirm();
</script>