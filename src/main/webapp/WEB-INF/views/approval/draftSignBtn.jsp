<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${signDoc.state eq '3'}">
	<button type="button" class="signBtn btn btn-sm btn-outline-dark" onclick="deleteSdoc();">상신취소</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark">인쇄</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark">다운로드</button>
</c:if>

<c:if test="${signDoc.state eq '4'}">
	<button type="button" class="signBtn btn btn-sm btn-outline-dark" onclick="goDetail('approval/reRegist.do?signNo=${signDoc.signNo }','${menu.mcode }')" >재기안</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark">다운로드</button>
</c:if>

<c:if test="${signDoc.state eq '5'}">
	<button type="button" class="signBtn btn btn-sm btn-outline-dark">인쇄</button>
	<button type="button" class="signBtn btn btn-sm btn-outline-dark">다운로드</button>
</c:if>
