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
    <script src="${contextPath}/res/plugIn/treeview/bootstrap-treeview.min.js"></script>
    <style type="text/css">
        ul.node-tree-all{list-style: none; margin: 0 0 15px 0; border: 1px solid #ddd;border-left:none; border-top: none; width: 30%;}
        ul.node-tree-all li{list-style: none; padding:0 0 0 10px; border: 1px solid #ddd; border-bottom: none; border-right:none; line-height:34px;}
        ul.node-tree-all .check-icon{ margin:-2px 3px 0 0;vertical-align:middle;}
        ul.node-tree-02,ul.node-tree-03,ul.node-tree-04{ display: none; list-style: none;}
        ul.node-tree-all .glyphicon{ cursor: pointer;}
        input.tree-input{ display: none;}
    </style>
</head>

<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <!-- /section:basics/sidebar -->
    <c:set var="basePath" value="${contextPath}/be/role"></c:set>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>BE系统</li>
                    <li>用户管理</li>
                    <li><a href="${basePath}/list">角色列表</a></li>
                    <li class="active">更新角色</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content" id="tabAll">
                <div class="row">
                    <h3 class="header smaller lighter blue">角色更新</h3>
                    <input type="hidden" id="updateUrl" value="${basePath}/update">
                    <input type="hidden" id="updatePermissionUrl" value="${basePath}/permission/update">
                    <!-- PAGE CONTENT BEGINS -->
                    <form class="form-horizontal" method="post" id="roleForm" role="form" action="">
                        <input type="hidden" id="id" name="id" value="${role.id}">
                        <div class="profile-user-info profile-user-info-striped">
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 角色编号<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="roleCode" readonly="readonly" placeholder="角色编号" value="${role.roleCode}" class="col-xs-3"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 角色名称<font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="roleName" name="roleName" placeholder="角色名称" value="${role.roleName}" class="col-xs-3"/></span>
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
                    <br>
                    <br>
                    <h3 class="header smaller lighter blue">权限分配</h3>

                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form class="form-horizontal" method="post" id="treeForm" role="form" action="">
                            <div id="tree" data-url="${basePath}/tree/${role.id}"></div>
                            <button class="btn btn-sm btn-reset" type="reset">重置<i class="ace-icon fa fa-undo bigger-110"></i></button>
                            <button type="button" class="btn btn-sm btn-success" id="treeButton"/>提交<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i></button>
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

    <script type="text/javascript">
        $(function(){
            var $tree = $("#tree");
            $.getJSON($tree.data("url"),function(data){
                var html='<ul class="node-tree-all">';
                if(data.length>0){
                    $.each(data,function(i,v){// 1 str
                        var icon=(v.nodes!=null && v.nodes.length>0)?'<span class="glyphicon glyphicon-plus show-chil"></span>':'<span class="glyphicon glyphicon-minus show-chil"></span>',
                            che=v.state.checked==true?'check':'unchecked',
                            sel=v.state.checked==true?'checked':'';
                        html+='<li class="node-tree-01">'+icon+'&nbsp;&nbsp;<span class="icon check-icon glyphicon glyphicon-'+che+'"><input class="tree-input" '+sel+' type="checkbox" value="'+v.id+'"></span>'+v.text;
                        if(v.nodes!=null){
                            html+='<ul class="node-tree-02">';
                            $.each(v.nodes,function(ii,vv){
                                var arrow2=(vv.nodes!=null && vv.nodes.length>0)?'<span class="glyphicon glyphicon-plus show-chil"></span>':'<span class="glyphicon glyphicon-minus show-chil"></span>',
                                    che2=vv.state.checked==true?'check':'unchecked',
                                    sel2=vv.state.checked==true?'checked':'';
                                html+='<li>'+arrow2+'&nbsp;&nbsp;<span class="icon check-icon glyphicon glyphicon-'+che2+'"><input class="tree-input" '+sel2+' type="checkbox" value="'+vv.id+'"></span>'+vv.text;
                                 if(vv.nodes!=null){
                                    html+='<ul class="node-tree-03">';
                                    $.each(vv.nodes,function(iii,vvv){
                                        var arrow3=(vvv.nodes!=null && vvv.nodes.length>0)?'<span class="glyphicon glyphicon-plus show-chil"></span>':'<span class="glyphicon glyphicon-minus show-chil"></span>',
                                            che3=vvv.state.checked==true?'check':'unchecked',
                                            sel3=vvv.state.checked==true?'checked':'';
                                        html+='<li>'+arrow3+'&nbsp;&nbsp;<span class="icon check-icon glyphicon glyphicon-'+che3+'"><input class="tree-input" '+sel3+' type="checkbox" value="'+vvv.id+'"></span>'+vvv.text;
                                         if(vvv.nodes!=null){
                                            html+='<ul class="node-tree-04">';
                                            $.each(vvv.nodes,function(iiii,vvvv){
                                                var che4=vvvv.state.checked==true?'check':'unchecked',
                                                     sel4=vvvv.state.checked==true?'checked':'';
                                                html+='<li><span class="icon check-icon glyphicon glyphicon-'+che4+'"><input class="tree-input" '+sel4+' type="checkbox" value="'+vvvv.id+'"></span>'+vvvv.text+'</li>';
                                            });
                                            html+="</ul>";
                                        }
                                        html+="</li>";
                                    });
                                    html+="</ul>";
                                }
                                html+="</li>";
                            });
                            html+="</ul>";
                        }
                        html+="</li>";
                    });// 1 end
                }
                html+="</ul>";
                $tree.html(html);
            });

            //权限设置子集展开收缩
            $tree.delegate("span.show-chil","click",function () {
                var $th=$(this);
                if($th.hasClass("glyphicon-plus")){
                    $th.removeClass("glyphicon-plus").addClass("glyphicon-minus");
                    if($th.siblings("ul").length>0){
                        $th.siblings("ul").css("display","block");
                    }
                }else{
                    $th.removeClass("glyphicon-minus").addClass("glyphicon-plus");
                    if($th.siblings("ul").length>0) {
                        $th.siblings("ul").css("display", "none");
                        $th.find("ul").css("display", "none");
                    }
                }
            });
            //权限设置子集权限
            $tree.delegate("span.check-icon","click",function () {
                var $th=$(this);
                if($th.hasClass("glyphicon-unchecked")){
                    $th.removeClass("glyphicon-unchecked").addClass("glyphicon-check");
                    $th.children("input").prop("checked",true);
                    if($th.siblings("ul").length>0){
                        var check= $th.parent().find("span.check-icon");
                        check.each(function(i,v){
                            $(v).removeClass("glyphicon-unchecked").addClass("glyphicon-check");
                            $(v).children("input").prop("checked",true);
                        });
                    }
                    if($th.parents("li").length>0){
                        var check= $th.parents("li");
                        check.each(function(i,v){
                            $(v).children("span.check-icon").removeClass("glyphicon-unchecked").addClass("glyphicon-check");
                            $(v).children("span.check-icon input").prop("checked",true);
                        });
                    }
                }else{
                    $th.removeClass("glyphicon-check").addClass("glyphicon-unchecked");
                    $th.find("input").removeAttr("checked");
                    if($th.siblings("ul").length>0){
                        var check= $th.parent().find("span.check-icon");
                        check.each(function(i,v){
                            $(v).removeClass("glyphicon-check").addClass("glyphicon-unchecked");
                            $(v).children("input").removeAttr("checked");
                        });
                    }
                    if($th.parents("li").length>0 && $th.closest("ul").find(".glyphicon-check").length == 0){
                        var check=$th.parents("li");
                        check.each(function(i,v){
                            if($(v).children(".glyphicon-check").length==1 && $(v).find("ul").find(".glyphicon-check").length == 0){
                                $(v).children("span.check-icon").removeClass("glyphicon-check").addClass("glyphicon-unchecked");
                                $(v).children("span.check-icon input").removeAttr("checked");
                            }
                        });
                    }
                }
            });

        });

        var isClick=false;
        var updateUrl = $("#updateUrl").val();
        $("#subButton").bind("click",function () {
            if(isClick){
                alert("请不要重复点击");
                return false;
            }

            var params = $("#roleForm").serialize();
            $.post(updateUrl, params,function (result) {
                if(result.status=='1'){
                    alert("更新成功");
                    window.location.href = "${basePath}/list";
                }else{
                    alert(result.summary);
                    $("#tokenName").val(result.name);
                    $("#tokenValue").val(result.value);
                    isClick=false;
                }
            },"json");
        });
        $("#treeButton").bind("click",function () {
            var arr = $('#tree').find("input:checked");
            var permissionIds=[];
            arr.each(function(i,v){
                permissionIds.push($(v).val());
            });
            var params={};
            params["permissionIds"] =permissionIds.join(",");
            params["roleId"] =${role.id};
            var updatePermissionUrl = $("#updatePermissionUrl").val();
            $.post(updatePermissionUrl, params,function (result) {
                if(result.status=='1'){
                    alert("更新权限成功");
                    window.location.href = "${basePath}/list";
                }else{
                    alert(result.summary);
                }
            },"json");
        });
    </script>
</body>
</html>
