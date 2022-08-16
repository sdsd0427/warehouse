<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


<script>
var signerMemberList = [];
var signRank =[];
var tempSave ='';

var reFMemberList=[];
var viewerMemberList=[];



for(var i = 0; i < ${mySignLineList}.length; i++){	
	signerMemberList.push(${mySignLineList}[i].eno);
}
var signDocForm = $('#signDocForm');


//결재/참조/열람 모달 확인
function clickSave(){
// 	formData.append("signerMemberList", signerMemberList);
	console.log("signerMemberList",signerMemberList); //결재사원들
	
}


function butTempSave(){
	 tempSave = document.getElementById("tempSave").value;
	 Swal.fire({
	      icon: 'success',
	      title: '저장되었습니다.',
	      confirmButtonColor: '#3085d6',
	    });
}


function cancel(){
	Swal.fire({
	      icon: 'success',
	      title: '취소되었습니다.',
	      confirmButtonColor: '#3085d6',
	    });
	location.href='main.do';
}


var loginUserdno = document.getElementById("loginUserdno").getAttribute('data-value');  //dno 가져오기
console.log('${param.sFormNo}',${param.sFormNo});

//결재요청
function SignReq(){
	signDocForm.find("[name='title']").val($('input[name="title"]').val());
	signDocForm.find("[name='eno']").val($('input[name="eno"]').val());
	signDocForm.find("[name='signContent']").val($('textarea[name="signContent"]').val());
	
	signDocForm.find("[name='signNo']").val($('#signDOCNO2').text());
	signDocForm.find("[name='dno']").val(loginUserdno);
	signDocForm.find("[name='sFormNo']").val('${param.sFormNo}');
	
	signDocForm.find("[name='sOpen']").val($('input[name="sOpen"]:checked').val());
	if(tempSave == 1){		
		signDocForm.find("[name='tempSave']").val(tempSave);
	}
	
	if($('input[name="emergency"]').is(':checked')){		
		signDocForm.find("[name='emergency']").val($('input[name="emergency"]').val());
		console.log('긴급',signDocForm.find("[name='emergency']").val());
	}
	
	
	signDocForm.find("[name='hashTag']").val($('input[name="hashTag"]').val());
	
	
	
	
	console.log(signDocForm.find("[name='title']").val());
	console.log(signDocForm.find("[name='eno']").val());
	console.log(signDocForm.find("[name='signContent']").val());
	console.log(signDocForm.find("[name='signNo']").val());
	console.log(signDocForm.find("[name='dno']").val());
	console.log(signDocForm.find("[name='sFormNo']").val());
	console.log(signDocForm.find("[name='sOpen']").val());
	console.log(signDocForm.find("[name='tempSave']").val());
	console.log(signDocForm.find("[name='emergency']").val());
	
	
	var files=$('input[name="uploadFile"]');
	for(var file of files){
		if(file.value==""){
			Swal.fire({
			      icon: 'warning',
			      title: '파일을 선택하세요.',
			      confirmButtonColor: '#3085d6',
			    });
			file.focus();
			file.click();
			return;
		}
	}

	 

	var formData = new FormData(signDocForm[0]);
	formData.append("signerMemberList", signerMemberList);
	formData.append("reFMemberList", reFMemberList);
	formData.append("viewerMemberList", viewerMemberList);
	
	
	for(var file of files){
		console.log(file.files[0])
		formData.append("uploadFile", file.files[0]);
	}
	

 	var request = new XMLHttpRequest();
 	request.onreadystatechange = function(){
		if (request.readyState === XMLHttpRequest.DONE) {
		      if (request.status == 200) {
		    	  Swal.fire({
				      icon: 'success',
				      title: '결재가 요청되었습니다.',
				      confirmButtonColor: '#3085d6',
				    }).then(function(){
				        goIframPage("<%=request.getContextPath()%>/approval/main.do", '${menu.mcode}');
				      });
		      }
	    }
	}
 
 	request.open("POST", "<%=request.getContextPath()%>/approval/registSignDoc.do"); 
 	request.send(formData); 
 	
}








$(function(){
	$.ajax({
		url:'<%=request.getContextPath()%>/approval/getSignDocNo',
		type:'get',
		dataType : 'json',
		success:function(response){
			//console.log("ㄴㄹㅇㄴㄴㄹㅇ",response.DocNo);
			res=''+response.DocNo+'';
			$('#signDOCNO2').text(res);
		}
	});
})



//문서번호, 모달 안 기안자 이름,부서명,결재상태
var loginUserEno = document.getElementById("loginUserEno").getAttribute('data-value');
//console.log("loginUserEno!!!",loginUserEno)



$(function(){
	$.ajax({
		url:'<%=request.getContextPath()%>/approval/getDrafterInfo?eno='+loginUserEno,
		type:'get',
		dataType : 'json',
		success:function(response){
			//console.log("response",response);
			
			$.each(response.myconList, function(i, v){
				//console.log(v.dname)
	res=''+v.signNo+'';
	str=''+v.dname+'';
	stq=''+v.name+'';
	stw=''+v.dname+'';
			$('#DocNo').text(res);
			$('#departName').text(str);
			$('.SignName').text(stq);
			$('.DepName').text(stw);
	
			
			
			
			//해시태그
			//$('#hashTag').text(stw);
			
			$('input[name=hashTag]').attr('value',"#"+stw);
			
			var hashTag = $('input[name=hashTag]').val();
		   
			console.log("hashTag!!",hashTag);
			
			var tagList = hashTag.split(" ");
			console.log(tagList);
			
			var hashCodeSet = new Set(tagList);
			hashCodeSet.add("#" + v.year + "년차");
			console.log(hashCodeSet);
			
			var result = "";
			for(var code of hashCodeSet){
				result += code+" ";
			}
			
			$('input[name=hashTag]').val(result.trim());
			
			
			
			
			}) 
		}
		
	});
	
})

//문서정보
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


	
var loginUser = ${loginUser.eno };	
	

$(function(){
   summernote_go($('textarea[name="boardContent"]'),'<%=request.getContextPath()%>');
});
var dataNum=0;
function addFile_go(){
	if($('input[name="uploadFile"]').length>=5){
		Swal.fire({
		      icon: 'warning',
		      title: '파일첨부는 5개까지만 가능합니다.',
		      confirmButtonColor: '#3085d6',
		    });
		return;
	}

	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");

	$('.fileInput').append(div);
	dataNum++;
}
function remove_go(dataNum){
	$('div[data-no="'+dataNum+'"]').remove();
}



var removeSigner =  function(eno){
	console.log("signer",$('tr[data-signer=' + eno + ']'));   //쓰레기통 모형 삭제
	$('tr[data-signer=' + eno + ']').remove();
	$('tr[data-ref=' + eno + ']').remove();
	$('tr[data-viewer=' + eno + ']').remove();
	
	 //const div = document.getElementById('AddEmp');  // 쓰레기통 모형 클릭 시 밖의 div 삭제
	// const div2 = document.getElementById('delStamp');  // 승인란 삭제
	 
	 $('div[data-signer=' + eno + ']').remove();
	 $('div[data-ref=' + eno + ']').remove();
	 //$('span[data-signer=' + eno + ']').remove();
	
	
	  
}


//그룹삭제
function removeGrName(signGroupNo){

	 var formData = new FormData();

	 formData.append("signGroupNo",signGroupNo);

	 var request = new XMLHttpRequest();
		request.open("POST", "<%=request.getContextPath()%>/approval/removeSignGr.do");
		request.send(formData);

		Swal.fire({
		      icon: 'success',
		      title: '그룹이 삭제되었습니다.',
		      confirmButtonColor: '#3085d6',
		    }).then(function(){
				window.location.reload();
		      });
	}

//첨부파일 추가
function addFile_go(){
	if($('input[name="uploadFile"]').length>=5){
		Swal.fire({
		      icon: 'warning',
		      title: '파일첨부는 5개까지만 가능합니다.',
		      confirmButtonColor: '#3085d6',
		    });
		return;
	}

	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");

	$('.fileInput').append(div);
	dataNum++;
}

//첨부파일 삭제
function remove_go(dataNum){
	$('div[data-no="'+dataNum+'"]').remove();
}

</script>



