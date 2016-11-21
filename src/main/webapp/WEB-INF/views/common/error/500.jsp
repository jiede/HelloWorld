<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/common/base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统提示</title>
</head>
<body>
	<p>系统出现异常, 请联系管理员。</p>
	<p />
	<%
	    Exception e = (Exception) request.getAttribute("exception");
	    if (e != null) {
	        out.print(e.getMessage());
	    }
	%>
</body>
</html>
