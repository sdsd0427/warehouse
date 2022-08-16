<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<script>
	Swal.fire({
	    icon: 'warning',
	    title: '권한이 없습니다.',
	    confirmButtonColor: '#3085d6',
	  }).then(function(){
		if (window.opener) {
			window.close();
		} else {
			history.go(-1);
		}
    });
</script>