<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="/WEB-INF/views/common/base.jsp" %>
    <title>民投金服管理后台</title>
    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
</head>

<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <c:set var="basePath" value="${contextPath}/be/role"></c:set>
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>BE系统</li>
                    <li>用户管理</li>
                    <li><a href="${basePath}/list">角色列表</a></li>
                    <li class="active">新增角色</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content" id="tabAll">
                <div class="row">
                    <input type="hidden" id="addUrl" value="${basePath}/add">
                    <h3 class="header smaller lighter blue">新增角色</h3>
                    <form class="form-horizontal" method="post" id="roleForm" role="form" action="">
                        <div class="profile-user-info profile-user-info-striped">
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 角色编号<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="roleCode" name="roleCode" placeholder="角色编号"  class="col-xs-2"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 角色名称<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="roleName" name="roleName" placeholder="角色名称"  class="col-xs-2"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div> </div>
                                <div class="profile-info-value">
                                    <button class="btn btn-sm btn-reset" type="reset">
                                        重置<i class="ace-icon fa fa-undo bigger-110"></i>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-success" id="subButton"/>
                                    提交<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <b:token/>
                    </form>
                </div><!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

    <script type="text/javascript">
        var isClick=false;
        var addUrl = $("#addUrl").val();
        $("#subButton").bind("click",function () {
            if(isClick){
                alert("请不要重复点击");
                return false;
            }

            var params = $("#roleForm").serialize();
            $.post(addUrl, params,function (result) {
                if(result.status=='1'){
                    alert("新增成功");
                    window.location.href = "${basePath}/list";
                }else{
                    alert(result.summary);
                    $("#tokenName").val(result.name);
                    $("#tokenValue").val(result.value);
                    isClick=false;
                }
            },"json");

        });
    </script>
</body>
</html>
