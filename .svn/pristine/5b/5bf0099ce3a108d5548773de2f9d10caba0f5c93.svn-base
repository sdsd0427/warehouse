<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.infoList{
	background-color: #fff;
    border-radius: 4px;
    border: 1px solid #ddd;
    font-size: 15px;
}
.infoList li:hover{
	background-color: rgba(0,0,0,.075);
}
.infoList li a{
	color: black;
}
.infoList li{
	padding: 5px;
}
.badge-signal .badge-mail{
    font-size: .6rem;
    font-weight: 300;
    padding: 2px 4px;
    position: absolute;
    right: 5px;
    top: 5px;
}

.impact{
	font-weight: bold;
}

.hoverdown ul{
	display:none;
	height:auto;
	position:absolute;
	width:200px;
	z-index:200;
}
.hoverdown:hover ul{
	display:block;
}
</style>

<nav class="main-header navbar navbar-expand-md navbar-light navbar-white" style="margin: 0; ">
   <div class="gnb">
     <a href="index.do" class="navbar-brand">
       <img src="<%=request.getContextPath() %>/resources/images/logo.png"  class="brand-image  " style="opacity: .8;width:70px;">
       <img src="<%=request.getContextPath() %>/resources/images/name.png" style="width:100px;">
<!--        <span class="brand-text font-weight-light">Ware House</span> -->
     </a>
     <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>

     <div class="collapse navbar-collapse order-3" id="navbarCollapse" style="margin-left: 30px;">
       <!-- MainMenu -->
       <ul class="navbar-nav" style="">
        	<c:forEach items="${mainMenuList }" var="menu">
        		<c:if test="${empty menu.micon}">
        			<c:if test="${menu.mcode eq 'M230000' }">
		       			<li class="nav-item hoverdown">
		       				<div class="${menu.mcode }" style="padding: 0 12px;" onclick="listToggle()">
		       					<div style="width: 40px;">
									<img alt="img" class="direct-chat-img" src="${loginUser.photo }" style="width:100%; border-radius:50%; cursor:pointer"/>
								</div>
								<ul class="infoList" style="position: absolute; padding: 10px; margin-top: 40px; display: none; width: 140px; ">
									<li><a href="javascript:goPage('<%=request.getContextPath() %>/mypage/profile.do', '${menu.upcode }')">
									<i class="fas fa-user-lock"></i>&nbsp;&nbsp;내 정보 수정</a></li>
									<li><a href="<%=request.getContextPath() %>/common/logout.do">
									<i class="fas fa-door-open"></i>&nbsp;&nbsp;로그아웃</a></li>
								</ul>
		       				</div>
		    		 	</li>
        			</c:if>
	       			<c:if test="${menu.mcode ne 'M230000' }">
		       			<li class="nav-item" onclick="listImpact(event)">
			      		<a href="javascript:<%-- subMenu_go('${menu.mcode }'); --%>goPage('<%=request.getContextPath()%>${menu.murl }','${menu.mcode }');"
			      			class="nav-link ${menu.mcode }" style="padding: 8px 12px; ">&nbsp;${menu.mname }</a>
		    		 	</li>
	       			</c:if>
        		</c:if>
        		<c:if test="${!empty menu.micon }">
        			<c:if test="${menu.mcode ne 'M220000' }">
		       			<li class="nav-item" style="${menu.mcode eq 'M210000' ? 'margin-left:80px;' : ''}">
			      			<a href="javascript:subMenu_go('${menu.mcode }');goPage('<%=request.getContextPath()%>${menu.murl }','${menu.mcode }');"
			      			class="nav-link ${menu.mcode }" style="padding: 8px 12px; ">&nbsp;<i class="${menu.micon }"></i><span class="badge badge-danger navbar-badge badge-mail" style="top: 5px;"></span></a>
		    		 	</li>
	    		 	</c:if>
	    		 	<c:if test="${menu.mcode eq 'M220000' }">
	    		 		<li class="nav-item">
			      			<a href="javascript:subMenu_go('${menu.mcode }');goPage('<%=request.getContextPath()%>${menu.murl }','${menu.mcode }');"
<%-- 			      			<a href="javascript:subMenu_go('${menu.mcode }');OpenWindow('<%=request.getContextPath()%>${menu.murl }','알림 상세',1000,900);" --%>
			      			class="nav-link ${menu.mcode }" style="padding: 8px 12px;">&nbsp;<i class="${menu.micon }"></i><span class="badge badge-danger navbar-badge badge-signal" style="top: 5px;"></span></a>
		    		 	</li>
	    		 	</c:if>
        		</c:if>

        	</c:forEach>
       </ul>
     </div>

     <!-- Right navbar links -->
   </div>
</nav>
<script>
	function listToggle(){
		$('.infoList').toggle();
	}

	function listImpact(e){
		$('#navbarCollapse ul li a').each(function(i,v){
			v.classList.remove("impact")
		});
		e.target.classList.add("impact");
	}

</script>

<script>
	function countSignal(){
		$.ajax({
			url : '<%=request.getContextPath()%>/signal/countSignal.do?eno='+${loginUser.eno},
			type : 'get',
			success: function(res){
				console.log(res);
				if(res!=0){
					$('.badge-signal').text(res);
				}else{
					$('.badge-signal').text('');
				}
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}
</script>
<script>
	function countMail(){
		$.ajax({
			url : '<%=request.getContextPath()%>/mail/countMail.do?eno='+${loginUser.eno},
			type : 'get',
			success: function(res){
				console.log("정인",res);
				if(res!=0){
					$('.badge-mail').text(res);
				}else{
					$('.badge-mail').text('');
				}
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}
</script>