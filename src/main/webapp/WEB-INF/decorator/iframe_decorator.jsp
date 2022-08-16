<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="./iframe/header.jsp" %>
<c:if test="${menu.mcode ne 'M000000'}">
	<%@ include file="./main/aside.jsp" %>
</c:if>
<decorator:body/>

<%@ include file="./iframe/footer.jsp" %>

<script type="text/x-handlebars-template" id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item subMenu">
    		<a href="javascript:goPage('<%=request.getContextPath()%>{{murl }}','{{mcode }}');" class="nav-link {{isNavCheck isnav}}" style="{{mainMenuCheck mcode}}">
        		<i class="{{micon}}"></i>
          		<p>{{mname}}</p>
      		</a>
		</li>
	{{/each}}
</script>

<script>
parentDoc = window.parent.document;
parentUrl = parentDoc.location.href;

window.onload = function(){
	subMenu_go('${menu.upcode}');
	parent.countSignal();
// 	parent.calcHeight();
}

function goPage(url, mCode){
	parentDoc.querySelector('iframe[name="ifr"]').setAttribute("src", url + "?mCode=" + mCode)
	//HTML5 지원브라우저에서 사용 가능
	if(typeof(history.pushState) == 'function'){
		//현재 주소 가져오기
		var renewURL = parentUrl;

		//현재 주소 중 .do 뒤 부분이 있다면 날려버린다
		renewURL = renewURL.substring(0, renewURL.indexOf('.do')  + 3);

		if(mCode != 'M000000'){
			renewURL += "?mCode=" + mCode;
		}
		//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		window.parent.history.pushState(mCode, null, renewURL);
	}else{
		location.hash = "#" + mCode;
	}
}

	function subMenu_go(mCode){
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
		},
		"mainMenuCheck" : function(mcode){
			if(mcode == '${menu.upcode}'){
				return "display:none";
			}
		}
	});

</script>