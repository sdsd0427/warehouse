//팝업창들 뛰우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight, event) {
	console.log(event);
   winleft = (screen.width - WinWidth) / 2;
   wintop = (screen.height - WinHeight) / 2;
   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", "
                     +"height="+ WinHeight +", top="+ wintop +", left="
                     + winleft +", resizable=yes, status=yes"  );
   win.focus() ;
}

//팝업창 닫기
function CloseWindow(){

   window.opener.location.reload(true);
   window.close();
}

//summernote
var contextPath="";
function summernote_go(target,context){
	console.log("target", target);
	console.log("context", context);

	contextPath = context;

	target.summernote({
		placeholder: '여기에 내용을 적으세요.',
		lang:'ko_KR',
		height:250,
		disableResizeEditor:true,
		callbacks:{
			onImageUpload : function(files, editor, welEditable){
				for(var file of files){
					if(file.name.substring(file.name.lastIndexOf('.') + 1).toUpperCase() != "JPG"){
						alert("JPG 이미지형식만 가능합니다.");
						return;
					}

					if(file.size > 1024 * 1024 * 5){
						alert("이미지는 5MB 미만입니다.");
						return;
					}
				}

				for(var file of files){
					sendFile(file,this);
				}
			},
			onMediaDelete : function(target){
					deleteFile(target[0].src);
			}
		}
	});
}

function sendFile(file, el) {
	   var form_data = new FormData();
	   form_data.append("file", file);
	   $.ajax({
	      url: contextPath+'/uploadImg.do',
	       data: form_data,
	       type: "POST",
	       contentType: false,
	       processData: false,
	       success: function(img_url) {
	          $(el).summernote('editor.insertImage', img_url);
	       },
	       error:function(){
	          alert(file.name+" 업로드에 실패했습니다.");
	       }
	   });
	}

	function deleteFile(src) {
	   var splitSrc= src.split("=");
	   var fileName = splitSrc[splitSrc.length-1];

	   var fileData = {fileName:fileName};

	   $.ajax({
	      url:contextPath+"/deleteImg.do",
	      data : JSON.stringify(fileData),
	      type:"post",
	      contentType:"application/json",
	      success:function(res){
	         console.log(res);
	      },
	      error:function(){
	         alert("이미지 삭제가 불가합니다.");
	      }
	   });
	}


//우클릭시 사원 프로필 팝업
//$('.emp_profile').contextmenu(function(event){
//	event.preventDefault();
//	$('.name').text(event.target.getAttribute("data-name"))
//	$('.emp_card').offset({left:event.pageX, top:event.pageY});
//	$('.emp_card').show();
//});
//
//$(document).click(function(){
//	$('.emp_card').hide();
//	$('.emp_card').css({
//		"left":"0",
//		"top":"0"
//	});
//});

//새페이지로 상세보기 이동 새로고침 유지
function goIframPage(url,mCode){

	parentDoc.querySelector('iframe[name="ifr"]').setAttribute("src", url + "?mCode=" + mCode)
	//HTML5 지원브라우저에서 사용 가능
	if(typeof(history.pushState) == 'function'){
		//현재 주소 가져오기
		var renewURL = parentUrl;

		//현재 주소 중 .do 뒤 부분이 있다면 날려버린다
		renewURL = renewURL.substring(0, renewURL.indexOf('.do')  + 3);

		if(mCode != 'M000000'){
			renewURL += "?open=" + url + "?mCode=" + mCode;
		}
		//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		window.parent.history.pushState(mCode, null, renewURL);
	}else{
		location.hash = "#" + mCode;
	}
}

//새페이지로 상세보기 이동 새로고침 유지
function goDetail(url,mCode){

	parentDoc.querySelector('iframe[name="ifr"]').setAttribute("src", url + "&mCode=" + mCode)
	//HTML5 지원브라우저에서 사용 가능
	if(typeof(history.pushState) == 'function'){
		//현재 주소 가져오기
		var renewURL = parentUrl;

		//현재 주소 중 .do 뒤 부분이 있다면 날려버린다
		renewURL = renewURL.substring(0, renewURL.indexOf('.do')  + 3);

		if(mCode != 'M000000'){
			renewURL += "?open=" + url + "&mCode=" + mCode;
		}
		//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		window.parent.history.pushState(mCode, null, renewURL);
	}else{
		location.hash = "#" + mCode;
	}
}

//새페이지로 등록페이지 이동
function goRegist(url,mCode){
	parentDoc.querySelector('iframe[name="ifr"]').setAttribute("src", url + "?mCode=" + mCode)
	//HTML5 지원브라우저에서 사용 가능
	if(typeof(history.pushState) == 'function'){
		//현재 주소 가져오기
		var renewURL = parentUrl;

		//현재 주소 중 .do 뒤 부분이 있다면 날려버린다
		renewURL = renewURL.substring(0, renewURL.indexOf('.do')  + 3);

		if(mCode != 'M000000'){
			renewURL += "?open=" + url + "?mCode=" + mCode;
		}
		//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		window.parent.history.pushState(mCode, null, renewURL);
	}else{
		location.hash = "#" + mCode;
	}
}

//redirect loginForm
function AjaxErrorSecurityRedirectHandler(status) {
   if (status == "302") {
      alert("세션이 만료되었습니다.\n로그인 하세요.");
      location.reload();

   }else if(status == "403"){
      alert("권한이 유효하지 않습니다.");
      history.go(-1);
   }else if(status == "404"){
      alert("해당 페이지를 찾을수 없습니다.");
   }else {
      alert("시스템장애로 실행이 불가합니다.");
      history.go(-1);
   }

}
