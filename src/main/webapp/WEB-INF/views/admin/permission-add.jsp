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
    <style type="text/css">
        #tree{ height: 320px; overflow-y: scroll;}
        ul.node-tree-all{list-style: none; margin: 0 0 15px 0; border: 1px solid #ddd;border-left:none; border-top: none; width: 100%;}
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
    <div class="main-content">
        <div class="main-content-inner">
            <c:set var="basePath" value="${contextPath}/be/permission"></c:set>
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>BE系统</li>
                    <li>用户管理</li>
                    <li><a href="${basePath}/list">权限列表</a></li>
                    <li class="active">新增权限</li>
                </ul><!-- /.breadcrumb -->
            </div>
            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content" id="tabAll">
                <div class="row">
                    <input type="hidden" id="addUrl" value="${basePath}/add">
                    <h3 class="header smaller lighter blue">新增权限</h3>
                    <form class="form-horizontal" method="post" id="addForm" role="form" action="">
                        <div class="profile-user-info profile-user-info-striped">
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 权限编号 <font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <input type="text" id="permissionCode" name="permissionCode"  class="col-xs-2"/></span>
                                    （权限唯一标识）
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 权限类型 <font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                       <select style="width:200px;" class="chosen-select form-control" name="permissionType" id="permissionType">
                                        <option value="1">菜单</option>
                                        <option value="2">链接</option>
                                    </select></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 权限名称 <font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <input type="text" id="permissionName" name="permissionName"  class="col-xs-2"/></span>
                                    （目录树节点名称）
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 权限 </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <input type="text" id="permissionValue" name="permissionValue"  class="col-xs-2"/></span>
                                    （请求URL，第三级菜单及链接需填）
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 菜单级别 <font color="red">*</font> </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <input type="text" id="permissionLevel" name="permissionLevel"  class="col-xs-2"/></span>
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 上级编号 </div>
                                <div class="profile-info-value">&nbsp;
                                    <a href="#modal-form" role="button" class="blue" data-toggle="modal">选择上级编号</a>
                                    <div id="modal-form" class="modal" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                                    <h4 class="blue bigger">选择上级编号</h4>
                                                </div>
                                                <div class="modal-body" id="tree" data-url="${basePath}/tree.json">

                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i>取消</button>
                                                    <button class="btn btn-sm btn-primary" data-dismiss="modal" id="primary-ok"><i class="ace-icon fa fa-check"></i>确认</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <span class="editable editable-click">
                                        <input type="hidden" name="parentId" id="parentId" />
                                        <input type="text" id="parentCode" readonly class="col-xs-2"/></span>
                                    （一级菜单可不填）
                                </div>
                            </div>
                            <div class="profile-info-row">
                                <div class="profile-info-name"> icon图标 </div>
                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <input type="text" id="icon" name="icon"  class="col-xs-2"/></span>
                                    （仅供一级菜单显示使用）
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
    </div>
</div>
</body>

<script type="text/javascript">
    $(function(){
        var $tree = $("#tree");
        $.get($tree.data("url"),function(data){
            var parentId=$("#parentId").val();
            var html='<ul class="node-tree-all">';
            if(data.length>0){
                $.each(data,function(i,v){// 1 str
                    var icon=(v.nodes!=null && v.nodes.length>0)?'<span class="glyphicon glyphicon-plus show-chil"></span>':'<span class="glyphicon glyphicon-minus show-chil"></span>',
                            che=v.id==parentId?'check':'unchecked',
                            sel=v.id==parentId?'checked':'';
                    html+='<li class="node-tree-01">'+icon+'&nbsp;&nbsp;<span class="icon check-icon glyphicon glyphicon-'+che+'"><input class="tree-input" '+sel+' type="checkbox" value="'+v.id+'" data-name="'+v.nodeName+'"></span>'+v.text;
                    if(v.nodes!=null){
                        html+='<ul class="node-tree-02">';
                        $.each(v.nodes,function(ii,vv){
                            var arrow2=(vv.nodes!=null && vv.nodes.length>0)?'<span class="glyphicon glyphicon-plus show-chil"></span>':'<span class="glyphicon glyphicon-minus show-chil"></span>',
                                    che2=vv.id==parentId?'check':'unchecked',
                                    sel2=vv.id==parentId?'checked':'';
                            html+='<li>'+arrow2+'&nbsp;&nbsp;<span class="icon check-icon glyphicon glyphicon-'+che2+'"><input class="tree-input" '+sel2+' type="checkbox" value="'+vv.id+'"  data-name="'+vv.nodeName+'"></span>'+vv.text;
                            if(vv.nodes!=null){
                                html+='<ul class="node-tree-03">';
                                $.each(vv.nodes,function(iii,vvv){
                                    var arrow3=(vvv.nodes!=null && vvv.nodes.length>0)?'<span class="glyphicon glyphicon-plus show-chil"></span>':'<span class="glyphicon glyphicon-minus show-chil"></span>',
                                            che3=vvv.id==parentId?'check':'unchecked',
                                            sel3=vvv.id==parentId?'checked':'';
                                    html+='<li>'+arrow3+'&nbsp;&nbsp;<span class="icon check-icon glyphicon glyphicon-'+che3+'"><input class="tree-input" '+sel3+' type="checkbox" value="'+vvv.id+'"  data-name="'+vvv.nodeName+'"></span>'+vvv.text;
                                    if(vvv.nodes!=null){
                                        html+='<ul class="node-tree-04">';
                                        $.each(vvv.nodes,function(iiii,vvvv){
                                            var che4=vvvv.id==parentId?'check':'unchecked',
                                            sel4=vvvv.id==parentId?'checked':'';
                                            html+='<li><span class="icon check-icon glyphicon glyphicon-'+che4+'"><input class="tree-input" '+sel4+' type="checkbox" value="'+vvvv.id+'"  data-name="'+vvvv.nodeName+'"></span>'+vvvv.text+'</li>';
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
        },"json");

        //弹出选择上级编号
        $('#modal-form').on('shown.bs.modal', function () {
            if(!ace.vars['touch']) {
                $(this).find('.chosen-container').each(function(){
                    $(this).find('a:first-child').css('width' , '210px');
                    $(this).find('.chosen-drop').css('width' , '210px');
                    $(this).find('.chosen-search input').css('width' , '200px');
                });
            }
        });

        $('#primary-ok').click(function () {
            $("input[name='parentId']").val($tree.find("input:checked").val());
            $("#parentCode").val($tree.find("input:checked").data("name"));
        });

        //选择上级编号展开收缩
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

        //选择上级编号
        $tree.delegate("span.check-icon","click",function () {
            var $th=$(this);
            $tree.find("span.check-icon").removeClass("glyphicon-check").addClass("glyphicon-unchecked");
            $tree.find("span.check-icon").find("input").removeAttr("checked");
            $th.removeClass("glyphicon-unchecked").addClass("glyphicon-check");
            $th.children("input").prop("checked",true);
        });
    });

    var isClick=false;
    var addUrl = $("#addUrl").val();
    $("#subButton").bind("click",function () {
        if(isClick){
            alert("请不要重复点击");
            return false;
        }
        var permissionCode=$("#permissionCode").val();
        if(permissionCode==''){
            alert("请输入权限编号");
            isClick=false;
            return false;
        }
        var permissionLevel=$("#permissionLevel").val();
        if(permissionLevel==''){
            alert("请输入菜单级别");
            isClick=false;
            return false;
        }
        var permissionName=$("#permissionName").val();
        if(permissionName==''){
            alert("请输入权限名称");
            isClick=false;
            return false;
        }
        var params = $("#addForm").serialize();
        $.post(addUrl, params,function (result) {
            if(result.status=='1'){
                alert("新增成功");
                window.location.href = "${contextPath}/be/permission/list";
            }else{
                alert(result.summary);
                isClick=false;
            }
        },"json");

    });

</script>
</html>
