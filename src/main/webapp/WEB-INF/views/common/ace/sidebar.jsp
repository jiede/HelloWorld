<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="sidebar" class="sidebar  responsive   ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <!--
        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
            <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                <button class="btn btn-success">
                    <i class="ace-icon fa fa-signal"></i>
                </button>

                <button class="btn btn-info">
                    <i class="ace-icon fa fa-pencil"></i>
                </button>

                <button class="btn btn-warning">
                    <i class="ace-icon fa fa-users"></i>
                </button>

                <button class="btn btn-danger">
                    <i class="ace-icon fa fa-cogs"></i>
                </button>
            </div>

            <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                <span class="btn btn-success"></span>

                <span class="btn btn-info"></span>

                <span class="btn btn-warning"></span>

                <span class="btn btn-danger"></span>
            </div>
        </div>/.sidebar-shortcuts -->

    <ul class="nav nav-list">
        <li class="active open">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-university"></i>
                <span class="menu-text">
                    支付系统
                    </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="/payment/bank/card">
                        <i class="menu-icon fa fa-caret-right"></i>
                        <span class="fa fa-credit-card"/>
                        银行卡
                    </a>
                    <b class="arrow"></b>
                </li>
                <li class="">
                    <a href="/payment/quick/treaty">
                        <i class="menu-icon fa fa-caret-right"></i>
                        <span class="fa fa-pencil-square-o"/>
                        快捷协议
                    </a>
                    <b class="arrow"></b>
                </li>
                <li class="">
                    <a href="/payment/recharge">
                        <i class="menu-icon fa fa-caret-right"></i>
                        <span class="fa fa fa-money"/>
                        充值
                    </a>
                    <b class="arrow"></b>
                </li>
                <li class="">
                    <a href="/payment/withdraw">
                        <i class="menu-icon fa fa-caret-right"></i>
                        <span class="fa fa fa-jpy"/>
                        提现
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul><!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>