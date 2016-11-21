<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>民投金服后台管理系统</title>
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/ui.jqgrid.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/fonts.googleapis.com.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/ace-rtl.min.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${contextPath}/res/plugIn/ace/assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="${contextPath}/res/plugIn/ace/assets/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${contextPath}/res/plugIn/ace/assets/js/html5shiv.min.js"></script>
    <script src="${contextPath}/res/plugIn/ace/assets/js/respond.min.js"></script>
    <![endif]-->

    <!--[if !IE]> -->
    <script src="${contextPath}/res/plugIn/ace/assets/js/jquery-2.1.4.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script src="${contextPath}/res/plugIn/ace/assets/js/jquery-1.11.3.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        if('ontouchstart' in document.documentElement) document.write("<script src='${contextPath}/res/plugIn/ace/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="${contextPath}/res/plugIn/ace/assets/js/bootstrap.min.js"></script>

    <!-- page specific plugin scripts -->
    <script src="${contextPath}/res/plugIn/ace/assets/js/bootstrap-datepicker.min.js"></script>
    <script src="${contextPath}/res/plugIn/ace/assets/js/jquery.jqGrid.min.js"></script>
    <script src="${contextPath}/res/plugIn/ace/assets/js/grid.locale-en.js"></script>

    <!-- ace scripts -->
    <script src="${contextPath}/res/plugIn/ace/assets/js/ace-elements.min.js"></script>
    <script src="${contextPath}/res/plugIn/ace/assets/js/ace.min.js"></script>

    <%@ include file="/WEB-INF/views/common/ace/bootstrap-ace-bootbox.jsp" %>
</head>

<body class="no-skin">
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <div class="main-content">
        <div class="main-content-inner">
            <c:set var="basePath" value="${contextPath}/be/role"></c:set>
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>BE系统</li>
                    <li>用户管理</li>
                    <li class="active">角色列表</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-2" >
                            <input id="roleCode" type="text"  placeholder="角色编号" class="col-xs-3 col-sm-12" />
                        </div>
                        <div class="col-sm-2" >
                            <input id="roleName" type="text"  placeholder="角色名称" class="col-xs-3 col-sm-12" />
                        </div>
                        <div class="col-sm-1" >
                            <button id="searchBtn" type="button" class="btn btn-info btn-sm">
                                <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                搜索
                            </button>
                        </div>
                        <div class="col-sm-1" >
                            <button id="addBtn" type="button" class="btn btn-info btn-sm">
                                <span class="ace-icon fa fa-plus-circle icon-on-right bigger-110"></span>
                                新增
                            </button>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="delUrl" value="${basePath}/delete">
                <form id="uploadForm" action="${basePath}/upload" method="post" enctype="multipart/form-data">
                <div class="page-header">
                    <div class="row">
                        <div class="col-xs-6" >
                            <input id="uploadFile" name="uploadFile" type="file"/>
                        </div>
                        <div class="col-sm-1" >
                            <button id="uploadBtn" type="submit" class="btn btn-info btn-sm">
                                <span class="ace-icon fa fa-check icon-on-right bigger-110"></span>
                                上传
                            </button>
                        </div>
                    </div>
                </div>
                </form>
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <table id="grid-table"></table>
                        <div id="grid-pager"></div>
                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<!-- inline scripts related to this page -->
<script type="text/javascript">
    $(function(){
        $("#grid-table").jqGrid({
            url:"${contextPath}/be/role/list.json",
            datatype:"local", //local默认不加载数据,json或xml默认加载数据
            mtype:"GET",//提交方式
            height:"auto",//高度，表格高度。可为数值、百分比或'auto'
            //width:1000,//这个宽度不能为百分比
            autowidth:true,//自动宽
            colNames:['id','角色编号', '角色名称','操作'],
            colModel:[
                {name:'id',index:'id',sortable:false,hidden:true,width:7},
                {name:'roleCode',index:'roleCode',sortable:false,width:10},
                {name:'roleName',index:'roleName',sortable:false,width:10},
                {name:'status',index:'status',sortable:false,width:15,formatter:function(cellvalue, options, rowObject){
                    var html = '<div class="hidden-sm hidden-xs btn-group">';

                    html = html + '<button class="btn btn-xs btn-danger" data-id ="' + rowObject.id + '" data-name ="' + rowObject.roleName + '">';
                    html = html + '<i class="ace-icon fa fa-trash-o fa-lg bigger-120" aria-hidden="true"> 删除 </i>';
                    html = html + '</button>';

                    html = html + '<button class="btn btn-xs btn-info" data-id ="' + rowObject.id + '">';
                    html = html + '<i class="ace-icon fa fa-info-circle bigger-120"> 详情 </i>';
                    html = html + '</button>';
                    html = html + '</div>';
                    return html;
                }}
            ],
            rownumbers:true,//添加左侧行号
            altRows:true,//设置为交替行表格,默认为false
            viewrecords: true,//是否在浏览导航栏显示记录总数
            rowNum:10,//每页显示记录数
            rowList:[10,20,30],//用于改变显示行数的下拉列表框的元素数组。
            pager:$('#grid-pager'),
            caption: "角色列表",//表格名称
            emptyrecords:"无数据",
            loadComplete : function() {
                var table = this;
                //setTimeout(function(){
                updatePagerIcons(table);
                //}, 0);
                $("#grid-table").undelegate(".btn","click");
                $("#grid-table").delegate(".btn","click",function(event) {
                    var id = $(this).data('id');
                    var name = $(this).data('name');
                    if($(this).hasClass("btn-danger")){
                        del(id,name);
                    }else if($(this).hasClass("btn-info")){
                        detail(id);
                    }
                });
            }
        });

        $('#uploadFile').ace_file_input({
            no_file:'角色信息Excel导入',
            btn_choose:'请选择上传文件',
            btn_change:'变更上传文件',
            droppable:false,
            onchange:null,
            thumbnail:false, //| true | large
            whitelist:'xls|xlsx'
            //blacklist:'exe|php'
            //onchange:''
            //
        });

        //replace icons with FontAwesome icons like above
        function updatePagerIcons(table) {
            var replacement =
            {
                'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
                'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
                'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
                'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
            };
            $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
                var icon = $(this);
                var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
                if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
            })
        }
    });

    // 搜索
    $('#searchBtn').on('click', function() {
        loadGrid();
    });

    $('#addBtn').on('click', function() {
        window.location.href = "${basePath}/add";
    });

    function del(id,name){
        bootbox.confirm({
            message: "是否确认删除["+name+"]?",
            buttons: {
                confirm: {
                    label: "确认删除",
                    className: "btn-primary btn-sm",
                },
                cancel: {
                    label: "取消删除",
                    className: "btn-sm",
                }
            },
            callback: function (result) {
                if (result) {
                    var delUrl = $("#delUrl").val();
                    var params = {};
                    params["id"] =id;
                    $.post(delUrl, params, function (result) {
                        if (result.status == '1') {
                            alert("删除成功");
                            loadGrid();
                        } else {
                            alert(result.summary);
                        }
                    }, "json");
                }
            }
        });
    }

    function detail(id){
        window.location.href = "${basePath}/detail/"+id;
    }

    // 加载Grid
    function loadGrid() {
        var roleCode = $('#roleCode').val();
        var roleName = $('#roleName').val();
        $("#grid-table").jqGrid('setGridParam',{datatype:'json',postData: {
            'roleCode': roleCode, 'roleName': roleName
        }}).trigger('reloadGrid');
    }
</script>
</body>
</html>
