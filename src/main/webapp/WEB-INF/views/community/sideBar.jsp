<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<div class="col-2"
				style="border: 2px solid #1e6e0c; height: 100vh;">
				<span class="commuPictureSub mt-3" data-id="${community.cmno}" style="display:block;height:100px;margin:0 auto;"></span>
				<c:if test="${authority eq 2}">
				<button class="btn btn-block btn-outline-primary mt-4 " type="button" onclick="OpenWindow('management.do?cmno=${community.cmno}','관리',1000,600);">관리</button>
				</c:if>
				<button class="btn btn-block btn-outline-primary mt-4 " type="button" onclick="goDetail('<%=request.getContextPath()%>/community/commuSub.do?cmno=${community.cmno}', '${menu.upcode }')">커뮤니티 홈</button>

				<c:if test="${community.eno ne loginUser.eno }">
					<button class="btn btn-block btn-outline-danger mt-3 " type="button" onclick="removeJoinCommu('${community.eno}','${community.cname}');">탈퇴하기</button>
				</c:if>

				<ul class=" mt-3" style="list-style: none; padding: 0px;">
					<li>
						<p>게시판</p>
						<ul id="commuBoard" style="font-size: 0.8em;">
						</ul>
					</li>

					<li>
						<p>회원</p>
						<ul id="joinCommuEmpList" style="font-size: 0.8em; margin: 20px;">
						</ul>
					</li>
				</ul>

				<c:if test="${authority eq 2 || authority eq 1}">
				<button class="btn btn-block btn-outline-primary mt-3 " type="button" onclick="OpenWindow('commuInviteForm.do?cmno=${community.cmno}','초대하기',800,600);">초대하기</button>
				</c:if>
			</div>