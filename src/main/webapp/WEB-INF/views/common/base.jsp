<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/alpha.io/tags" prefix="b"%>

<b:website />

<%-- 常用属性变量 --%>
<%-- 
     ${website}         站点域名
     ${contextPath}     应用上下文路径
     ${staticPath}      缓存一年
     ${scriptPath}      脚本缓存一个月
     ${stylePath}       样式缓存一个月
     ${imagePath}       图片缓存一个月
     ${resourcesPath}   缓存两小时
     ${nocachePath}     不缓存
     ${staticResourceServer}  静态资源服务地址
--%>

<%
	response.addHeader("Pragma", "no-cache");
    response.addHeader("Cache-Control", "no-cache, no-store, max-age=0");
    response.addDateHeader("Expires", 1L);
%>
<%@ include file="/WEB-INF/views/common/base-ace-js.jsp" %>
<%@ include file="/WEB-INF/views/common/base-ace-css.jsp" %>