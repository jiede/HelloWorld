<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--菜单栏 start-->
<!-- #section:basics/sidebar -->
<div id="sidebar" class="sidebar responsive">
    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
    </script>

    <ul class="nav nav-list">
        <li class="active">
            <input type="hidden" id="menuUrl" value="${contextPath}/menu/my" />
            <a href="${contextPath}/assetProduct/list" class="dropdown-toggle">
                <i class="menu-icon fa fa-desktop"></i>
				<span class="menu-text">资产管理</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>

            <ul class="submenu">
                <li class="active">
                    <a href="${contextPath}/assetProduct/list">
                        <i class="menu-icon fa fa-caret-right"></i>
                        资产列表
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul><!-- /.nav-list -->
        </li>
    </ul>

    <!-- #section:basics/sidebar.layout.minimize -->
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <!-- /section:basics/sidebar.layout.minimize -->
    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    </script>
</div>
<!--菜单栏 end-->


<script type="text/javascript">
    $(function(){
        var menuUrl = $("#menuUrl").val();
        $.getJSON(menuUrl, function(data){
            alert(data);
            if(data!=null){

            }
        });
    });
</script>
