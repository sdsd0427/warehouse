<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<c_rt:set var="open" value='<%= request.getParameter("open") %>'/>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

	<title><decorator:title default="Ware House"/></title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <decorator:head/>

  <style>

   	.gnb{
  		display: flex;
  		width: 100%;
  	}
  	.brand-image{
  		width: 70px;
  		height: 50px;
  	}

  	.item-container{
  		padding-top: 20px;
  		display: flex; justify-content: center;
  	}

	.container::-webkit-scrollbar {
    	display: none; /* Chrome, Safari, Opera*/
	}
	#msgStack{
	width: 300px;
/* 	position: fixed; */
	position: absolute;
	right: 5%;
    top: 60px;
	z-index: 9999;
	}
/* 	.error { */
/* 	    width: 250px; */
/* 	    height: 20px; */
/* 	    height:auto; */
/* 	    position: fixed; */
/* 	    left: 90%; */
/* 	    margin-left:-125px; */
/* 	    top: 60px; */
/* 	    z-index: 9999; */
/* 	    background-color: #383838; */
/* 	    color: #F0F0F0; */
/* 	    font-family: Calibri; */
/* 	    font-size: 15px; */
/* 	    padding: 10px; */
/* 	    text-align:center; */
/* 	    border-radius: 2px; */
/* 	    -webkit-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); */
/* 	    -moz-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); */
/* 	    box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); */
/* 	} */
  </style>



</head>
<body>

<div class="wrapper">
<div id="msgStack"></div>
<div class='error' style='display:none'>메시지 띄운다</div>
	<%@ include file="./main/header.jsp" %>
	<decorator:body/>
</div>


<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>


<!-- 소켓 -->
<%@ include file="./socket/socket.jsp" %>

<script>
function endDateMentoringGo(){
	//alert("alert");
	$.ajax({
		url : '<%=request.getContextPath()%>/mentoring/deleteEndDateMentoring.do',
		type : 'POST',
		success : function(res){
			//console.log("delete", res);
			if(res=="OK"){
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
endDateMentoringGo();
</script>

<script>
	$('div.wrapper').css({
		"max-width":"1280px",
		"margin":"0 auto"
	});
</script>

<script type="text/x-handlebars-template" id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item subMenu" >
    		<a href="javascript:goPage('<%=request.getContextPath()%>{{murl }}','{{mcode }}');" class="nav-link">
        		<i class="{{micon}}"></i>
          		 <p>{{mname}}</p>
      		</a>
		</li>
	{{/each}}
</script>

<c:if test="${empty open }">
	<script>
	window.onload = function(){
		goPage('<%= request.getContextPath()%>${menu.murl}' , '${menu.mcode}');
	}
	</script>
</c:if>
<c:if test="${!empty open }">
	<script>
		window.onload = function(){
			console.log('${open}');
			if('${open}'.includes('mCode')){
				mainTainPage('${open}')
			}else{
				mainTainPage('${open}', '${menu.mcode}');
			}
			countSignal();
			countMail();
		}
	</script>
</c:if>

<script>
function goPage(url, mCode){

	$('iframe[name="ifr"]').attr("src",url + "?mCode=" + mCode);
	//HTML5 지원브라우저에서 사용 가능
	if(typeof(history.pushState) == 'function'){
		//현재 주소 가져오기
		var renewURL = location.href;

		//현재 주소 중 .do 뒤 부분이 있다면 날려버린다
		renewURL = renewURL.substring(0, renewURL.indexOf('.do')  + 3);

		if(mCode != 'M000000'){
			renewURL += "?mCode=" + mCode;
		}

		//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		history.pushState(mCode, null, renewURL);
	}else{
		location.hash = "#" + mCode;
	}
}

function mainTainPage(open, mCode){
	if(mCode){
		$('iframe[name="ifr"]').attr("src",open + "&mCode=" + mCode);
	}else{
		$('iframe[name="ifr"]').attr("src",open);
	}
	//HTML5 지원브라우저에서 사용 가능
	if(typeof(history.pushState) == 'function'){
		//현재 주소 가져오기
		var renewURL = location.href;

		//현재 주소 중 .do 뒤 부분이 있다면 날려버린다
		renewURL = renewURL.substring(0, renewURL.indexOf('.do')  + 3);

		if(mCode){
			if(mCode != 'M000000'){
				renewURL += "?open=" + open + "&mCode=" + mCode;
			}
		}else{
			renewURL += "?open=" + open
		}

		//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		history.pushState(mCode, null, renewURL);
	}else{
		location.hash = "#" + mCode;
	}
}

function subMenu_go(mCode){
	console.log(mCode);
	if(mCode != "M000000"){
		$.ajax({
			url:"<%= request.getContextPath()%>/subMenu.do?mCode=" + mCode,
			type:'get',
			success:function(data){
				printData(data, $('.subMenuList'), $('#subMenu-list-template'), $('.subMenu'));
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}else{
		$('.subMenuList').html("");
	}
}


function printData(dataArr, target, templateObject, removeClass){
	var template = Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	removeClass.remove();
	target.append(html);
}

Handlebars.registerHelper({
	"isNavCheck" : function(isnav){
		if(isnav == 0) return "nav-link-btn";
		return "";
	}
});

window.addEventListener('message', event => {
	  history.pushState(null, null, event.data);
});

// function setMyPage(){
// 	var str = `
// 		<div style="width: 40px;">
<%-- 			<img src="<%=request.getContextPath() %>/resources/images/indexPage/chopa.jpg" style="width:100%; border-radius:50%;"/> --%>
// 		</div>
// 	`;
// 	myPageMenu = $('.M230000');
// 	myPageMenu.html(str);
// 	myPageMenu.css({
// 		"display" : "flex",
// 		"align-items" : "center"
// 	});

// }

</script>
</body>
</html>