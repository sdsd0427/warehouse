<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${from eq 'regist'}" >
	<script>
		Swal.fire({
		    icon: 'success',
		    title: '멘토링이 신청되었습니다.',
		    confirmButtonColor: '#3085d6',
		  }).then(function(){
			var target = ${signalMento};
			var ref = document.referrer;
			opener.opener.parent.sendSignal(target, "멘토링", "E101", "mentoring/main.do", 'M190000');
		
			window.close();
		  });
	</script>
</c:if>



<script>
</script>
