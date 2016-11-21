<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="/WEB-INF/views/common/base.jsp" %>
    <title>民投金服管理后台</title>
    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <script src="${contextPath}/res/plugIn/summernote/0.8.2/lang/summernote-zh-CN.js"></script>
    <script src="${contextPath}/res/plugIn/ace/assets/js/jquery.jqGrid.min.js"></script>
    <script src="${contextPath}/res/plugIn/ace/assets/js/grid.locale-en.js"></script>
</head>

<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <c:set var="basePath" value="${contextPath}/be/user"></c:set>
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>BE系统</li>
                    <li>用户管理</li>
                    <li><a href="${basePath}/list">BE用户列表</a></li>
                    <li class="active">新增BE用户</li>
                </ul><!-- /.breadcrumb -->
            </div>
            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content" id="tabAll">
                <div class="row">
                    <input type="hidden" id="addUrl" value="${basePath}/add">
                    <h3 class="header smaller lighter blue">新增BE用户</h3>
                    <form class="form-horizontal" method="post" id="userForm" role="form" action="" enctype="multipart/form-data">
                        <div class="profile-user-info profile-user-info-striped">
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 用户名<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="userName" name="userName"  class="col-xs-10"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 初始密码<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="password" name="password"  class="col-xs-10"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 角色列表<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="title" name="roleCodes" class="col-xs-10"/></span>
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
                    </form>
                </div><!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

    <!-- basic scripts -->
    <script type="text/javascript">
        jQuery(function ($) {

        });

        var isClick = false;
        var addUrl = $("#addUrl").val();
        $("#subButton").bind("click",function () {
            if(isClick){
                alert("请不要重复点击");
                return false;
            }
            var password=$("#password").val();
            if(password==''){
                alert("请输入初始密码");
                isClick=false;
                return false;
            }
            var userName=$("#userName").val();
            if(userName==''){
                alert("请输入用户名");
                isClick=false;
                return false;
            }

            var params = $("#userForm").serialize();
            $.post(addUrl, params,function (result) {
                if(result.status=='1'){
                    alert("新增成功");
                    window.location.href = "${basePath}/list";
                }else{
                    alert(result.summary);
                    isClick=false;
                }
            },"json");

        });

    </script>
</body>
</html>
