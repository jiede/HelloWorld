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
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>用户管理</li>
                    <li><a href="/be/user/list">BE用户列表</a></li>
                    <li class="active">更新BE用户</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content" id="tabAll">
                <div class="row">
                    <input type="hidden" id="updatePwdUrl" value="${contextPath}/be/user/update/pwd">
                    <input type="hidden" id="updateRoleUrl" value="${contextPath}/be/user/update/role">

                    <h3 class="header smaller lighter blue">密码重置</h3>
                    <form class="form-horizontal" method="post" id="roleForm" role="form" action="">
                        <input type="hidden" id="id" name="id" value="${role.id}">
                        <div class="profile-user-info profile-user-info-striped">
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 用户名</div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text"  readonly="readonly" placeholder="用户名" value="${beUser.userName}" class="col-xs-2"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 密码<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="password" id="password" name="password" placeholder="重置密码"  class="col-xs-2"/></span>
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



                    <h3 class="header smaller lighter blue">角色分配</h3>
                    <div class="col-xs-12">
                        <form class="form-horizontal" method="post" id="userRoleForm" role="form" >
                            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>角色编号</th>
                                        <th>角色名称</th>
                                        <th class="center">是否分配</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userRoleList}" var="userRole">
                                    <tr class="">
                                        <td>${userRole.roleCode}</td>
                                        <td>${userRole.roleName}</td>
                                        <td class="center"><label class="position-relative"><input type="checkbox" class="ace" name="roleIds"  value="${userRole.roleId}" <c:if test="${userRole.isPossessed == 1}">checked</c:if> ><span class="lbl"></span> </label></td>
                                    </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="3" align="center">
                                            <input type="hidden" name="id" value="${beUser.id}">
                                            <button type="button" class="btn btn-sm btn-success" id="subRoleButton"/>
                                            提交<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <b:token/>
                        </form>
                    </div>

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

        $("#subPwdButton").bind("click",function () {
            var password = $("#password").val();
            if(password==null||password==''){
                alert("请输入密码");
                return false;
            }
            bootbox.confirm({
                message: "是否重置用户【${beUser.userName}】密码?",
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
                        var params = {};
                        params["id"] =${beUser.id};
                        if(password.length<=20){
                            password=RSAUtils.pwdEncode(password);
                        }
                        $("#password").val(password);
                        params["password"] =$("#password").val();
                        $.post(updatePwdUrl, params, function (result) {
                            if (result.status == '1') {
                                alert("重置成功");
                                window.location.href = "${contextPath}/be/user/list";
                            } else {
                                alert(result.summary);
                            }
                        }, "json");
                    }
                }
            });});

            $("#subRoleButton").bind("click",function () {
                var updateRoleUrl = $("#updateRoleUrl").val();
                var params = {};
                var strSel = '';
                var roleIds="";
                $("[name='roleIds']:checked").each(function(index, element) {
                    strSel += $(this).val() + ",";
                });
                if(strSel.length>0){
                    roleIds =strSel.substring(0, strSel.length - 1); //把最后一个逗号去掉
                }
                params["roleIds"] =roleIds;
                params["userId"] =${beUser.id};
                $.post(updateRoleUrl, params, function (result) {
                    if (result.status == '1') {
                        alert("角色分配成功");
                        window.location.href = "${contextPath}/be/user/list";
                    } else {
                        alert(result.summary);
                    }
                }, "json");
            });
    </script>
</body>
</html>
