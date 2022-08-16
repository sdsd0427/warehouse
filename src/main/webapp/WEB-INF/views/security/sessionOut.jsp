<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	response.setStatus(302); %>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<script>
// Swal.fire({
//     icon: 'warning',
//     title: '${message}',
//     confirmButtonColor: '#3085d6',
//   }).then(function(){
// 	  if(window.opener) {
// 			window.opener.parent.location.reload();
// 		}else{
<%-- 			window.parent.location.href="<%=request.getContextPath()%>"; --%>
// 		}
// 		window.close();
// 	});
	
	alert('${message}');
	 if(window.opener) {
			window.opener.parent.location.reload();
		}else{
			window.parent.location.href="<%=request.getContextPath()%>";
		}
		window.close();
</script>