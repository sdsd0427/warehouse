<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${signDoc.signerList }" var="signer">
	<c:if test="${signer.eno eq loginUser.eno}">
		<c:set var="mySigner" value="${signer}" />
	</c:if>
</c:forEach>



<c:if test="${mySigner.signState eq '1'}">
	<button type="button" class="signBtn btn btn-sm btn-outline-dark " data-toggle="modal" data-target="#commentModal" data-backdrop="false">결재</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark " data-toggle="modal" data-target="#waitCommentModal" data-backdrop="false">보류</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark " data-toggle="modal" data-target="#rejectCommentModal" data-backdrop="false">반려</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark">인쇄</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark" >다운로드</button>
</c:if>

<c:if test="${mySigner.signState eq '2'}">
	<button type="button" class="signBtn btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#commentModal" data-backdrop="false">결재</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#rejectCommentModal" data-backdrop="false">반려</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark">인쇄</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark" >다운로드</button>
</c:if>
<c:if test="${mySigner.signState eq '3' or mySigner.signState eq '4' or mySigner.signState eq '5'}">
	<button type="button" class="signBtn btn btn-sm btn-outline-dark">인쇄</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark" >다운로드</button>
</c:if>