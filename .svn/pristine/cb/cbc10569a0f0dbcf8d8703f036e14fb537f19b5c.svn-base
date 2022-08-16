<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	page = 1;
	function communityListGo(startPage){
		page = startPage
		var data = {
				'page' : page,
				'perPageNum' : 5,
				'searchType' : $('select[name="searchType"]').val(),
				'keyword' : $('input[name="keyword"]').val()
		}


		$.ajax({
			url : '<%=request.getContextPath()%>/community/communityList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.communityList.length > 0){
					printWorkData(res.communityList, $('.allCommu'), $('#communityList-template'));


				}else{
					var str = `
						<tr>
							<td colspan="4" style="text-align:center">
								등록된 커뮤니티가 없습니다.
							</td>
						</tr>
					`;

					$('.allCommu').html(str);
				}

				lPage = page - 1;
				if(lPage < 1){lPage = 1;}
				rPage = page + 1;
				if(rPage > res.pageMaker.realEndPage){rPage = res.pageMaker.realEndPage;}
				pageMakerData = {
						pageMaker : res.pageMaker,
						left : "javascript:communityListGo("+lPage+")",
						right : "javascript:communityListGo("+rPage+")",
						doubleLeft : "javascript:communityListGo("+1+")",
						doubleRight :"javascript:communityListGo("+res.pageMaker.realEndPage+")"
				}

				printPageMaker(pageMakerData ,$('.pagination'), $('#pageMaker-template'));



			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function joinCommunListGo(){
		var data = {
				'eno' : ${loginUser.eno}

		}

		$.ajax({
			url : '<%=request.getContextPath()%>/community/joinCommuList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.length > 0){
					printWorkData(res, $('.joinCommu'), $('#joinCommuList-template'));


				}else{
					var str = `
						<tr>
							<td colspan="4" style="text-align:center">
								가입한 커뮤니티가 없습니다.
							</td>
						</tr>
					`;

					$('.joinCommu').html(str);
				}


			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function subCommuListGo(){
		var data = {
				'eno' : ${loginUser.eno}

		}

		$.ajax({
			url : '<%=request.getContextPath()%>/community/subCommuList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.length > 0){
					printWorkData(res, $('#custom-tabs-one-com'), $('#subCommuList-template'));


				}else{
					var str = `가입신청한 커뮤니티가 없습니다.`;

					$('#custom-tabs-one-com').html(str);
				}


			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function inviteCommuGo(){
		var data = {
				'eno' : ${loginUser.eno}
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/community/inviteCommu.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.length > 0){
					printWorkData(res, $('#custom-tabs-one-com'), $('#inviteCommu-template'));


				}else{
					var str = `초대된 커뮤니티가 없습니다.`;

					$('#custom-tabs-one-com').html(str);
				}


			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function myApproveCommuListGo(){
		var data = {
				'eno' : ${loginUser.eno}

		}

		$.ajax({
			url : '<%=request.getContextPath()%>/community/approveCommuList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.length > 0){
					printWorkData(res, $('#custom-tabs-one-com'), $('#approveCommuList-template'));


				}else{
					var str = `가입신청한 커뮤니티가 없습니다.`;

					$('#custom-tabs-one-com').html(str);
				}


			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}



	function bestCommuListGo(){
		var data = {
				'eno' : ${loginUser.eno}
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/community/bestCommuList.do',
			data : data,
			type : 'post',
			success: function(res){
				if(res.length > 0){
					printWorkData(res, $('.bestCommu'), $('#bestCommuList-template'));
					MemberPictureThumb('<%=request.getContextPath()%>');

				}else{
					var str = `
						<div class="col-12" style="text-align:center;">
							<h3>등록된 커뮤니티가 없습니다.</h3>
						</div>
					`;

					$('.bestCommu').html(str);
				}


			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function removeSubCommu(cmno){
		
		Swal.fire({
		    title: '취소',
		    text: "정말 취소하시겠습니까?",
		    icon: 'question',
		    showCancelButton: true,
		    confirmButtonColor: '#3085d6',
		    cancelButtonColor: '#d33',
		    confirmButtonText: '확인',
		    cancelButtonText: '취소',
		    reverseButtons: true, // 버튼 순서 거꾸로
		  }).then((result) => {
		    if (result.isConfirmed) {
		    	var data = {
						'cmno' : cmno,
						'eno' : ${loginUser.eno}
				}

				$.ajax({
					url : '<%=request.getContextPath()%>/community/removeSubCommu.do',
					data : data,
					type : 'post',
					success: function(res){
						Swal.fire({
						      icon: 'success',
						      title: res,
						      confirmButtonColor: '#3085d6',
						    }).then(function(){
								subCommuListGo();
								bestCommuListGo();   
						     });
					},
					error:function(error){
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});
		    }
		 })
		

	}

	function removeApproveCommu(cmno){
		
		Swal.fire({
		    title: '취소',
		    text: "정말 취소하시겠습니까?",
		    icon: 'question',
		    showCancelButton: true,
		    confirmButtonColor: '#3085d6',
		    cancelButtonColor: '#d33',
		    confirmButtonText: '확인',
		    cancelButtonText: '취소',
		    reverseButtons: true, // 버튼 순서 거꾸로
		  }).then((result) => {
		    if (result.isConfirmed) {
		    	var data = {
						'cmno' : cmno,
				}

				$.ajax({
					url : '<%=request.getContextPath()%>/community/removeApproveCommu.do',
					data : data,
					type : 'post',
					success: function(res){
						Swal.fire({
						      icon: 'success',
						      title: res,
						      confirmButtonColor: '#3085d6',
						    }).then(function(){
						    	myApproveCommuListGo();   
						     });
					},
					error:function(error){
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});
		    }
		 })
		
		
	}

	function insertSubCommu(cmno,eno,cname,check){

		   //확인
			var data = {
					'cmno' : cmno,
					'eno' : ${loginUser.eno}
			}

			$.ajax({
				url : '<%=request.getContextPath()%>/community/insertSubCommu.do',
				data : data,
				type : 'post',
				success: function(res){
					Swal.fire({
					      icon: 'success',
					      title: res,
					      confirmButtonColor: '#3085d6',
					    }).then(function(){
					    	bestCommuListGo();
							subCommuListGo(); 
					     });
					if(res == "가입신청 되었습니다."){
						if(check == 1){
							opener.parent.sendSignal(eno,cname,"D101","community/main.do","M180000");
						} else if (check == 0){
							parent.sendSignal(eno,cname,"D101","community/main.do","M180000");
						}

					}

				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});


	}


	function empOpenCommuList(eno,name){

		   //확인
			var data = {
					'eno' : eno
			}

			$.ajax({
				url : '<%=request.getContextPath()%>/community/empOpenCommuList.do',
				data : data,
				type : 'post',
				success: function(res){
					if(res.length > 0){
						printWorkData(res, $('#empOpenCommuList'), $('#empOpenCommuList-template'));
						$('#empName').text(res[0].name + "의 개설 커뮤니티");

					}else{
						var str = `
						<tr>
							<td colspan="4">개설한 커뮤니티가 없습니다.</td>
						</tr>`;

						$('#empOpenCommuList').html(str);
					}
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});


	}

	function commuBoardList(cmno){

		   //확인
			var data = {
					'cmno' : cmno
			}

			$.ajax({
				url : '<%=request.getContextPath()%>/community/commuBoardList.do',
				data : data,
				type : 'post',
				success: function(res){
					if(res.length > 0){
						printWorkData(res, $('#commuBoard'), $('#commuBoardList-template'));
					}else{
						var str = `
						<li class="side"><a href="#">
							<p>등록된 게시판이 없습니다.</p>
						</a></li>`;

						$('#commuBoard').html(str);

					}
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});


	}

	function joinCommuEmpList(cmno){

		   //확인
			var data = {
					'cmno' : cmno
			}

			$.ajax({
				url : '<%=request.getContextPath()%>/community/joinCommuEmpList.do',
				data : data,
				type : 'post',
				success: function(res){
					if(res.length > 0){
						printWorkData(res, $('#joinCommuEmpList'), $('#joinCommuEmpList-template'));
					}

				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});


	}

	function RecentCommuPostList(cmno){

		   //확인
			var data = {
					'cmno' : cmno
			}

			$.ajax({
				url : '<%=request.getContextPath()%>/community/RecentCommuPostList.do',
				data : data,
				type : 'post',
				success: function(res){
					if(res.length > 0){
						printWorkData(res, $('#recentCommuPost'), $('#RecentCommuPostList-template'));
					}

				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});


	}


	function acceptCommu(cmno,eno , cname){

		   //확인
			var data = {
					'cmno' : cmno,
					'eno' : ${loginUser.eno}
			}

			$.ajax({
				url : '<%=request.getContextPath()%>/community/acceptCommu.do',
				data : data,
				type : 'post',
				success: function(res){
					Swal.fire({
					      icon: 'success',
					      title: res,
					      confirmButtonColor: '#3085d6',
					    }).then(function(){
					    	inviteCommuGo();
							joinCommunListGo();
							bestCommuListGo();
					     });
					
					if(res == "커뮤니티의 가입 되셨습니다."){
						parent.sendSignal(eno,cname,"D107","community/main.do","M180000");
					}
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});


	}

	function removeInviteCommu(cmno,eno,cname){

		   //확인
			var data = {
					'cmno' : cmno,
					'eno' : ${loginUser.eno}
			}

			$.ajax({
				url : '<%=request.getContextPath()%>/community/removeInviteCommu.do',
				data : data,
				type : 'post',
				success: function(res){
					Swal.fire({
					      icon: 'success',
					      title: res,
					      confirmButtonColor: '#3085d6',
					    }).then(function(){
					    	inviteCommuGo();
					     });

					if(res == "커뮤니티의 초대 거절하셨습니다."){
						parent.sendSignal(eno,cname,"D108","community/main.do","M180000");
					}
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});


	}




	function printWorkData(dataList, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(dataList);
		target.html(html);
	}

	function printPageMaker(data, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(data);
		target.html(html);
	}


</script>

<script type="text/x-handlebars-template"  id="communityList-template">
{{#each .}}
	<tr style='font-size: 0.85em;'>
		<td onclick="OpenWindow('detail.do?cmno={{cmno}}&eno=${loginUser.eno}','상세보기',800,600);" style="text-align:left;">{{change cname}}</td>
		<td>{{name}}</td>
		<td><i class="fas fa-users"></i> {{joinCnt}}</td>
		<td>{{formatDate regDate}}</td>
	</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="joinCommuList-template">
{{#each .}}
	<tr onclick="goDetail('<%=request.getContextPath()%>/community/commuSub.do?cmno={{cmno}}', '${menu.upcode }')">
		<td style="text-align:left;">{{change cname}}</td>
		<td>{{name}}</td>
		<td><i class="fas fa-users"></i> {{joinCnt}}</td>
		<td>{{formatDate regDate}}</td>
	</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="subCommuList-template">
	<table class="table table-hover text-nowrap"
		style="text-align: center;">
		<tbody>
{{#each .}}
			<tr>
				<td style="text-align:left;">{{change cname}}</td>
				<td>{{name}}</td>
				<td><i class="fas fa-users"></i> {{joinCnt}}</td>
				<td>
					<button class="btn btn-xs btn-outline-dark  " type="button" onclick="javascript:removeSubCommu('{{cmno}}')">가입 취소</button>
				</td>
			</tr>
{{/each}}
		</tbody>
	</table>
</script>

<script type="text/x-handlebars-template"  id="inviteCommu-template">
	<table class="table table-hover text-nowrap"
		style="text-align: center;">
		<tbody>
{{#each .}}
			<tr>
				<td style="text-align:left;">{{change cname}}</td>
				<td>{{name}}</td>
				<td><i class="fas fa-users"></i> {{joinCnt}}</td>
				<td>
					<button class="btn btn-xs btn-outline-primary  " type="button" onclick="javascript:acceptCommu('{{cmno}}','{{eno}}','{{cname}}')">수락</button>
				</td>
				<td>
					<button class="btn btn-xs btn-outline-danger  " type="button" onclick="javascript:removeInviteCommu('{{cmno}}','{{eno}}','{{cname}}')">거절</button>
				</td>
			</tr>
{{/each}}
		</tbody>
	</table>
</script>

<script type="text/x-handlebars-template"  id="approveCommuList-template">

	<table class="table table-hover text-nowrap"
		style="text-align: center;">
		<tbody>
{{#each .}}
			<tr>
				<td style="text-align:left;">{{change cname}}</td>
				<td>{{formatDate regDate}}</td>
				<td>
					<button class="btn btn-xs btn-outline-dark  " type="button" onclick="javascript:removeApproveCommu('{{cmno}}')">개설 취소</button>
				</td>
			</tr>
{{/each}}
		</tbody>
	</table>
</script>

<script type="text/x-handlebars-template"  id="bestCommuList-template">

{{#each .}}
	<div class="col-lg-4 col-6">
		<div class="card card-outline card-success mt-2" style="padding: 10px 10px;">
			<strong style="font-size: 1.2em"> {{change cname}}
				{{checkJoin checkJoin cmno eno cname}}
			</strong>
			<hr>

			<span class="commuPicture mt-1" data-id="{{cmno}}" style="display:block;width:100%;height:40px;margin:0 auto;background-size: contain;border-radius: 0;"></span>

			<div class="callout" style="height: 25px;%;font-size: 0.8em;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
				<span style="word-break: break-all;">{{change intro}}</span>

			</div>
			<span>회장 : {{name}} <i class="fas fa-crown"></i> / 회원 수 : {{joinCnt}}명</span>
			<span>개설일 : {{formatDate regDate}}</span>
		</div>
	</div>
{{/each}}

</script>

<script type="text/x-handlebars-template"  id="empOpenCommuList-template">

{{#each .}}
	<tr style='font-size: 0.85em;'>
		<td>{{change cname}}</td>
		<td>{{name}}</td>
		<td><i class="fas fa-users"></i> {{joinCnt}}</td>
		<td>{{formatDate regDate}}</td>
	</tr>

{{/each}}

</script>

<script type="text/x-handlebars-template"  id="commuBoardList-template">

{{#each .}}
	<li class="side"><a href="javascript:goDetail('<%=request.getContextPath()%>/community/boardGo.do?cmno={{cmno}}And{{cboardNo}}','${menu.upcode}')">
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{cbName}}</p>
	</a></li>
{{/each}}

</script>

<script type="text/x-handlebars-template"  id="joinCommuEmpList-template">

{{#each .}}
	<li style="height: 50px;"><img class="direct-chat-img "
		src="{{photo}}"
		alt="noimg"> &nbsp;&nbsp;<span style="line-height: 40px;">{{name}}&nbsp;&nbsp;{{authorityCheck authority}}</span>
	</li>
{{/each}}

</script>

<script type="text/x-handlebars-template"  id="RecentCommuPostList-template">

{{#each .}}
	<tr style='font-size: 0.85em; cursor:pointer;' onclick="OpenWindow('boardDetail.do?cpostNo={{cpostNo}}&from=list','게시글 상세',800,700);">
		<td >{{cbName}}</td>
		<td style="text-align:left">{{change title}}</td>
		<td>{{name}}</td>
		<td><i class="fas fa-light fa-eye"></i> {{viewCnt}}</td>
		<td>{{formatDate regDate}}</td>
	</tr>
{{/each}}

</script>

<script type="text/x-handlebars-template"  id="commuPostList-template">
{{#each .}}
	<tr style='font-size: 0.85em; ' onclick="OpenWindow('boardDetail.do','게시글 작성',800,700);">
		<td style="text-align:left">{{change title}}</td>
		<td>{{name}}</td>
		<td><i class="fas fa-light fa-eye"></i> {{viewCnt}}</td>
		<td>{{formatDate regDate}}</td>
	</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="pageMaker-template">
	<li class="page-item">
		<a class="page-link" href="{{doubleLeft}}">
			<i class="fas fa-angle-double-left"></i>
		</a>
	</li>
	<li class="page-item">
		<a class="page-link" href="{{left}}">
			<i class="fas fa-angle-left"></i>
		</a>
	</li>
		{{printPage this}}
	<li class="page-item">
		<a class="page-link" href="{{right}}">
			<i class="fas fa-angle-right"></i>
		</a>
	</li>
	<li class="page-item">
		<a class="page-link" href="{{doubleRight}}">
			<i class="fas fa-angle-double-right"></i>
		</a>
	</li>
</script>
<script>
	Handlebars.registerHelper({
		"formatDate" : function(regDate){
			var dateObj = new Date(regDate);
			var year = dateObj.getFullYear();
			var month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
			var date = ('0' + dateObj.getDate()).slice(-2);
			return year + "-" + month + "-" + date;
		},
		"printPage" : function(pageMakerData){
			var pageMaker = pageMakerData.pageMaker;


			var str = '';
			for(i = pageMaker.startPage; i <= pageMaker.endPage; i++){
				var active = i == pageMaker.cri.page ? 'active' : '';
				str += '<li class="page-item ' + active + '">';
				str += '<a class="page-link" href="javascript:communityListGo(' + i + ')">';
				str += i
				str += '</a>';
				str += '</li>';
			}
			return new Handlebars.SafeString(str);
		},
		"checkJoin" : function(checkJoin, cmno,eno ,cname){
			var a = 123421;
			var str= "";
			if(checkJoin == 0){
				str = '<button class="btn btn-outline-primary " type="button" onclick="insertSubCommu(\''+cmno+'\',\''+eno+'\',\''+cname+'\',0)"  id="${cmno}" style="float: right; padding: 0.1rem 0.5rem;">가입</button>';
			}

			return new Handlebars.SafeString(str);
		},
		"authorityCheck" : function(authority){
			var str = ""

			if(authority == 2){
				str = "<i class='fas fa-crown'></i>";
			}

			return new Handlebars.SafeString(str);
		},
		"change" : function(title) {
			return new Handlebars.SafeString(title);
		}
// 		,
// 		"MemberPictureThumb" : MemberPictureThumb(){
<%-- 			 var contextPath = <%=request.getContextPath()%> --%>
// 			  for(var target of document.querySelectorAll('.commuPicture')){
// 			       var cmno = target.getAttribute('data-id');
// 			       console.log("cmno",cmno);
// 			       target.style.backgroundImage="url('"+contextPath+"/community/getPicture.do?cmno="+cmno+"')";
// 			       target.style.backgroundPosition="center";
// 			       target.style.backgroundRepeat="no-repeat";
// 			       target.style.backgroundSize="cover";
// 			   }
// 		}


	});


	function MemberPictureThumb(contextPath){
	    for(var target of document.querySelectorAll('.commuPicture')){
	       var cmno = target.getAttribute('data-id');
	       console.log("cmno",cmno);
	       target.style.backgroundImage="url('"+contextPath+"/community/getPicture.do?cmno="+cmno+"')";
// 	       target.style.backgroundRepeat="no-repeat";
	       target.style.height= '150px';
	       target.style.width= '100%';
	       target.style.backgroundSize="cover";
// 	       target.style.borderRadius = '1em';
	   }
	}
</script>






















