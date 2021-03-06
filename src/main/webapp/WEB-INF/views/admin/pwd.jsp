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
    <link rel="stylesheet" href="${contextPath}/res/plugIn/summernote/0.8.2/summernote.css" />
    <script src="${contextPath}/res/plugIn/summernote/0.8.2/summernote.js"></script>
    <script src="${contextPath}/res/plugIn/summernote/0.8.2/lang/summernote-zh-CN.js"></script>
    <b:rsaJs />
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
            <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>修改密码</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content" id="tabAll">
                <div class="row">
                    <h3 class="header smaller lighter blue">修改密码</h3>
                    <input type="hidden" id="updatePwdUrl" value="${contextPath}/pwd/reset">
                    <form class="form-horizontal" method="post" id="userPwdForm" role="form" action="">
                        <input type="hidden" id="id" name="id" value="${beUser.id}">
                        <div class="profile-user-info profile-user-info-striped">
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 原密码<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="password" id="password" name="password" placeholder="原密码" class="col-xs-2"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 新密码<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="password" id="newPassword" name="newPassword" placeholder="新密码" class="col-xs-2"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 确认密码<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="password" id="checkPassword" name="checkPassword" placeholder="确认密码" class="col-xs-2"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div> </div>
                                <div class="profile-info-value">
                                    <button class="btn btn-sm btn-reset" type="reset">
                                        重置<i class="ace-icon fa fa-undo bigger-110"></i>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-success" id="subPwdButton"/>
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
    </div><!-- /.main-container -->
</div>
    <!-- basic scripts -->
    <script type="text/javascript">
        jQuery(function ($) {
        });

        $("#subPwdButton").bind("click",function () {
            var password = $("#password").val();
            if(password==null||password==''){
                alert("请输入密码");
                return false;
            }
            var newPassword = $("#newPassword").val();
            if(newPassword==null||newPassword==''){
                alert("请输入新密码");
                return false;
            }
            var checkPassword = $("#checkPassword").val();
            if(checkPassword==null||checkPassword==''){
                alert("请输入确认密码");
                return false;
            }
            if(newPassword!=checkPassword){
                alert("两次密码输入不一致");
                return false;
            }
            if(password.length<=20){
                password=RSAUtils.pwdEncode(password);
            }
            if(newPassword.length<=20){
                newPassword=RSAUtils.pwdEncode(newPassword);
            }
            if(checkPassword.length<=20){
                checkPassword=RSAUtils.pwdEncode(checkPassword);
            }
            bootbox.confirm({
            message: "是否修改密码?",
            buttons: {
                confirm: {
                    label: "确认",
                    className: "btn-primary btn-sm",
                },
                cancel: {
                    label: "取消",
                    className: "btn-sm",
                }
            },
            callback: function (result) {
                if (result) {
                    var updatePwdUrl = $("#updatePwdUrl").val();
                    $("#password").val(password);
                    $("#checkPassword").val(checkPassword);
                    $("#newPassword").val(newPassword);
                    var params = $("#userPwdForm").serialize();
                    $.post(updatePwdUrl, params, function (result) {
                        if (result.status == '1') {
                            alert("重置成功，请重置登录");
                            window.parent.location.href = "/logout";
                        } else {
                            alert(result.summary);
                            $("#tokenName").val(result.tokenName);
                            $("#tokenValue").val(result.tokenValue);
                            $("#password").val("");
                            $("#newPassword").val("");
                            $("#checkPassword").val("");
                        }
                    }, "json");
                }
            }
        });});

    </script>
</body>
</html>
