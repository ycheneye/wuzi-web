<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	int port = request.getServerPort();
	String basePath  = null;
	if(port==80){
		basePath = request.getScheme()+"://"+request.getServerName()+path;
	}else{
		basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	}
	request.setAttribute("basePath", basePath);
%>  


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/all.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/validate.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/very-easyui.js"></script>

	
</head>

<body>
<div class='overlay'>
	<img alt="" src="${pageContext.request.contextPath}/resource/loading.gif" />
</div>
<script>

	setTimeout(function(){
		
		$(".overlay").hide();
		
	},1000);

</script>


