<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<head>
	<style>
		.title{
			padding: 10px 20px;
		}
		.hide{
			display: none;
		}
	</style>
</head>
<%@ include file="./iframe/header.jsp" %>
<decorator:body/>

<%@ include file="./iframe/footer.jsp" %>
