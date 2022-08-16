<%@ page contentType="text/html; charset=UTF-8"%>

<head>

<!-- jQuery EasyUi API -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

</head>

<div class="card">
	<!-- <div id="inName"><span id="RecName"><strong>조직도</strong></span></div> -->
	<div id="inAll" style="margin: 30px">

		<div id="wrap">
			<!-- header 시작 -->
			<!-- nav 종료 -->
			<span class="material-symbols-outlined"> corporate_fare </span> <span>PoJo기업</span>
			<div id="container">
				<ul>
					<li><span>최민규 대표이사</span></li>
					<li>영업본부
						<ul>
							<li>영업팀</li>
							<li>마케팅 팀</li>
						</ul>
					</li>
					<li>경영지원본부
						<ul>
							<li>재경팀</li>
							<li>총무 팀</li>
							<li>인사 팀</li>
						</ul>
					</li>
					<li>개발본부
						<ul>
							<li data-jstree='{ "selected" : true, "opened" : true }'>개발1팀
								<ul>
									<li class="emp">김형민</li>
									<li class="emp">장문석</li>
									<li class="emp">서난희</li>
									<li class="emp">오지현</li>
									<li class="emp">강정인</li>
									<li class="emp">이종민</li>
								</ul>
							</li>
							<li>플랫폼운영팀</li>
							<li>디자인팀</li>
						</ul>
					</li>
					<li>서비스본부
						<ul>
							<li>인터넷사업팀</li>
							<li>커머스사업팀</li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- content 종료 -->


		</div>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
		<script type="text/x-handlebars-template" id="emp-profile-template">
			<div class="emp_select_card" style="align-items: center; display: flex; justify-content: center;position:relative; padding:10px;">
				<div>
					<span class="removeBtn material-symbols-outlined" style="position:absolute; top:0; left:0; cursor:pointer;" onclick="removeManager()">
						remove
					</span>
					<img class="table-avatar emp_profile" src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/avatar2.png">
				</div>
				<div>
					<p style="font-size: 16px; font-weight: bold">김형민 </p>
					<div style="font-size: 12px;">
						<p>부장</p>
						<p>개발1팀</p>
					</div>
				</div>
			</div>
		</script>
		<script>
			  $('#container').jstree({   //문서 없는 버전
				"types" : {
				      "default" : {
				        "icon" : "glyphicon glyphicon-flash"
				      },
				      "demo" : {
				        "icon" : "fas fa-user"
				      }
				    },
				    "plugins" : [ "types" ]
			});

			 $('#container').on("changed.jstree", function (e, data) {
				    if(data.node.children.length == 0){
				    	addEmp(data.node.text, $('.manager-list'), $('#emp-profile-template'));
				    }
		 	 });

			function addEmp(data, target, templateObject){
				var template = Handlebars.compile(templateObject.html());
				var html = template(data);
				target.append(html);
			}
		</script>

	</div>
</div>

