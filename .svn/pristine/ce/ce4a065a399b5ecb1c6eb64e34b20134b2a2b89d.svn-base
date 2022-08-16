<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>

<h5>그룹 이름</h5>
<input id="groupname" name="groupname" type="text" placeholder="예) 커뮤니티그룹">
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <!--    <button id="groupsave"type="button" class="btn btn-info" data-dismiss="modal" onclick="location.href='personalList.do'" >저장</button>-->
          <button id="groupsave"type="button" class="btn btn-info" data-dismiss="modal" onclick='clickEvent()'>저장</button>


<script>
function clickEvent(){
	var form = document.registForm;
	console.log(form);
	console.log($("form[role='form']"));
	if($("input[name='groupname']").val()==""){
		Swal.fire({
		      icon: 'warning',
		      title: '그룹은 필수입니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
		    	$("input[name='groupname']").focus();
		    });
		return;
	}

	var checked = $('input[type="checkbox"]:checked');
	console.log(checked);
	Swal.fire({
	      icon: 'success',
	      title: '개인주소록으로 저장되었습니다.',
	      confirmButtonColor: '#3085d6',
	    })
	    .then(function(){
			form.submit();
			window.close();
			window.opener.location.reload();
			location.href='personalList.do';
	    });

}
</script>

</body>
</html>