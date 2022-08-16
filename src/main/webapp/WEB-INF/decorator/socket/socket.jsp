<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">
//전역변수 설정
var socket  = null;

//onready 한 다음 웹소켓 연결
$('#navbarCollapse > ul > li:nth-child(13) > a').ready(function(){
    // 웹소켓 연결
    sock = new SockJS("<c:url value="/echo-ws"/>");
    socket = sock;
	console.log("socket",socket);
    // 데이터를 전달 받았을때 toast 생성
    sock.onmessage = onMessage;
});
</script>

<script>
// toast생성 및 추가
function onMessage(evt){
// 	$('.error').fadeIn(400).delay(3000).fadeOut(400); //fade out after 3 seconds
	console.log("evt",evt);

	var data = evt.data;

	countSignal();
	printToast(evt, $("#msgStack"), $('#toast-template'));

    $(".toast").toast({"animation": true, "autohide": false});
    $('.toast').toast('show');
    setTimeout(function(){
		$('.toast').toast('hide');
		$('.toast').remove();
	}, 8000);
};
</script>

<script>
//DB에 알림을 보내는 함수
//signalTarget : 알림 대상(eno), 복수면 반복문?
//signalContent : 알림 내용, 제목
//classCode : classCode
//moveUrl : 이동할 페이지 url
//sigMcode : 이동할 페이지 mCode
//새창으로 이동은 문제가 있다...
function sendSignal(signalTarget, signalContent, classCode, moveUrl, sigMcode){
	var data ={
			"signalTarget" : signalTarget,
			"signalFrom" : ${loginUser.eno},
//	 		"signalDate" : "2022-07-23 17:10:00",
//	 		"signalTime" : "2022-07-23 17:10:00",
			"signalContent" : signalContent,
			"moveUrl" : moveUrl,
			"classCode" : classCode,
			"sigMcode" : sigMcode
		}

	$.ajax({
		url : '<%=request.getContextPath()%>/signal/sendSignal.do',
		data : data,
		type : 'post',
		success: function(res){
			console.log(res);

			//실시간 알림 작동(대상자가 로그인한 상태면 실시간 알림)
			sendSocketMsg(res);
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}
</script>

<script>
//메시지 보내기
function sendSocketMsg(res){
// 	console.log("dd",res);
	socket.send(res.name+","+ res.ppsName +","+res.signalTarget+","+res.signalContent+","+res.moveUrl+","+res.sigMcode+","+res.className+","+res.explanation);
}
</script>

<script>
//toast에서 페이지 이동
function goPageFromSignal(res){
	url = $(res).attr('data-url');
	mCode = $(res).attr('data-mCode');
	console.log(url, mCode);

	goPage(url, mCode);
}
</script>

<script>
countSignal();
countMail();
</script>

<script type="text/x-handlebars-template" id="toast-template">
<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>
	<div class='toast-header'>
		<i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>
		<small class='text-muted'>just now</small>
		<button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>
			<span aria-hidden='true'>&times;</span>
		</button>
	</div>
	<div class='toast-body'>{{toast data}}</div>
</div>
</script>
<script type="text/x-handlebars-template" id="toast-template2">
<div id="toastsContainerTopRight" class="toasts-top-right fixed">
	<div class="toast fade show" role="alert" aria-live="assertive"
		aria-atomic="true">
		<div class="toast-header">
			<img class="rounded mr-2" src="../../dist/img/user3-128x128.jpg"
				alt="User Picture" style="height: 25px; width: auto;"><strong
				class="mr-auto">Toast Title</strong><small>Subtitle</small>
			<button data-dismiss="toast" type="button" class="ml-2 mb-1 close"
				aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
		</div>
		<div class="toast-body">Lorem ipsum dolor sit amet, consetetur
			sadipscing elitr.</div>
	</div>
</div>
</script>

<script>
function printToast(dataArr, target, templateObject){
	var template = Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	target.append(html);
}

Handlebars.registerHelper({
	"toast" : function(strCode){
		return new Handlebars.SafeString(strCode);
	}
});
</script>