<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="/WEB-INF/views/common/base.jsp" %>
    <%@ include file="/WEB-INF/views/common/bootstrap-jqGrid.jsp" %>
    <title>民投金服管理后台</title>
    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <%@ include file="/WEB-INF/views/common/base-ace-css.jsp" %>
</head>

<body  class="no-skin" id="body">
<!-- #section:basics/navbar.layout -->
<%@ include file="./common/header.jsp" %>
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" style="height: 97%;">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>


    <!--菜单栏 start-->
    <!-- #section:basics/sidebar -->
    <div id="sidebar" class="sidebar responsive">
        <script type="text/javascript">
            try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
        </script>
        <ul id="menuUL" class="nav nav-list" data-url="${contextPath}/menu/my">

        </ul>
        <script type="text/javascript">
            try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
        </script>
        <!-- #section:basics/sidebar.layout.minimize -->
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
    </div>
    <!--菜单栏 end-->


    <div class="main-content" style="height: 100%;" id="tabAll">
        <iframe src="" name="conframe" frameborder="0" frameborder=false scrolling="auto" width="100%" height="100%" frameborder=no onload="document.all['conframe'].style.height=conframe.document.body.scrollHeight-50">
        </iframe>
    </div><!-- /.main-content -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

</body>
</html>
<script type="text/javascript">

    jQuery(function ($) {
        setTimeout(function(){
            document.getElementById('body')[0].style.height = window.innerHeight+'px';
        },20);
        var $menuUrl=$("#menuUL");
        $.getJSON($menuUrl.data("url"), function(data){
            var html='';
            $menuUrl.html("");
            $.each(data,function(i,v){
                var arrow=(v.nodes!=null && v.nodes.length>0)?'<b class="arrow"></b>':'';
                html+='<li><a href="#" class="dropdown-toggle"><i class="menu-icon fa '+v.icon+'"></i><span class="menu-text">'+v.nodeName+'</span><b class="arrow fa fa-angle-down"></b></a>'+arrow;
                if(v.nodes!=null){
                    html+='<ul class="submenu ">';
                    $.each(v.nodes,function(ii,vv){
                        var arrow2=(vv.nodes!=null && vv.nodes.length>0)?'<b class="arrow"></b>':'';
                        html+='<li class=""><a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right"></i> '+vv.nodeName+'<b class="arrow fa fa-angle-down"></b></a>'+arrow2;
                        if(vv.nodes!=null){
                            html+='<ul class="submenu">';
                            $.each(vv.nodes,function(iii,vvv){
                                html+='<li><a href="'+vvv.url+'" target="conframe" ><i class="menu-icon fa fa-caret-right"></i>'+vvv.nodeName+'</a><b class="arrow"></b></li>';
                            });
                            html+='</ul>';
                        }
                        html+='</li>';
                    });
                    html+='</ul>';
                }
                html+='</li>';
            });
            $("#menuUL").html(html);
        });
    });

</script>