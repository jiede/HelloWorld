<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/views/common/base.jsp" %>
    <%@ include file="/WEB-INF/views/common/bootstrap-jqGrid.jsp" %>
    <%@ include file="/WEB-INF/views/common/base-ace-css.jsp" %>
    <title>用户登录</title>

    <meta name="description" content="Admin login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <b:rsaJs />
</head>

<body class="login-layout  light-login">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <span class="red">民投金服</span>
                            <span class="grey" id="id-text2">后台管理系统</span>
                        </h1>
                    </div>

                    <div class="space-6"></div>
                    <input type="hidden" id="loginUrl" value="${contextPath}/login">
                    <form class="form-horizontal" method="post" id="loginForm" role="form" action="">
                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-coffee green"></i>
                                        请输入用户名和密码
                                    </h4>
                                    <div class="space-6"></div>
                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
                                            <span class="block input-icon input-icon-right">
                                                <input type="text" class="form-control" id="loginId" name="loginId"
                                                       placeholder="用户名"/>
                                                <i class="ace-icon fa fa-user"></i>
                                            </span>
                                            </label>

                                            <label class="block clearfix">
                                            <span class="block input-icon input-icon-right">
                                                <input type="password" id="password" name="password"
                                                       class="form-control"
                                                       placeholder="密码"/>
                                                <i class="ace-icon fa fa-lock"></i>
                                            </span>
                                            </label>

                                            <input type="text" id="captchaCode" name="captchaCode" class="col-xs-4" placeholder="验证码"/>
                                            <img src="${contextPath}/captcha.login" onclick="changeVerifyCode()"
                                                 id="yzmImg" style="cursor: pointer;">
                                            <a href="javascript:void(0)"
                                               onclick="changeVerifyCode()">看不清</a>
                                            <div class="space"></div>

                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace"/>
                                                    <span class="lbl"> 记住我</span>
                                                </label>
                                                <b:token/>
                                                <button type="button" id="subButton"
                                                        class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">登录</span>
                                                </button>
                                            </div>
                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>
                                    <div class="space-6"></div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div><!-- /.login-box -->

                    </div><!-- /.position-relative -->
                    </form>
                    <div class="navbar-fixed-top align-right">
                        <br/>
                        &nbsp;
                        <a id="btn-login-dark" href="#">黑</a>
                        &nbsp;
                        <span class="blue">/</span>
                        &nbsp;
                        <a id="btn-login-blur" href="#">蓝</a>
                        &nbsp;
                        <span class="blue">/</span>
                        &nbsp;
                        <a id="btn-login-light" href="#">白</a>
                        &nbsp; &nbsp; &nbsp;
                    </div>
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->
</body>
</html>
<script type="text/javascript">
    jQuery(function ($) {
        $(document).on('click', '.toolbar a[data-target]', function (e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });
    });
    //you don't need this, just used for changing background
    jQuery(function ($) {
        $('#btn-login-dark').on('click', function (e) {
            $('body').attr('class', 'login-layout');
            $('#id-text2').attr('class', 'white');
            $('#id-company-text').attr('class', 'blue');
            e.preventDefault();
        });
        $('#btn-login-light').on('click', function (e) {
            $('body').attr('class', 'login-layout light-login');
            $('#id-text2').attr('class', 'grey');
            $('#id-company-text').attr('class', 'blue');

            e.preventDefault();
        });
        $('#btn-login-blur').on('click', function (e) {
            $('body').attr('class', 'login-layout blur-login');
            $('#id-text2').attr('class', 'white');
            $('#id-company-text').attr('class', 'light-blue');
            e.preventDefault();
        });

        //处理键盘的回车键登录
        $(document).keydown(function(event){
            if(event.keyCode==13){
                loginSub();
            }
        });

    });
    //点击切换验证码
    function changeVerifyCode() {
        $("#yzmImg").attr("src", "${contextPath}/captcha.login?" + Math.floor(Math.random() * 100));
    }

    var isClick=false;
    $("#subButton").bind("click",loginSub);

    function loginSub() {
        if(isClick){
            alert("请不要重复点击");
            return false;
        }
        if($("#loginId").val()==''){
            alert("请输入用户名");
            return false;
        }
        var password=$("#password").val();
        if(password==''){
            alert("请输入密码");
            return false;
        }
        if($("#captchaCode").val()==''){
            alert("请输入验证码");
            return false;
        }

        if(password.length<=20){
            password=RSAUtils.pwdEncode(password);
        }
        isClick = true;
        var loginUrl = $("#loginUrl").val();
        $("#password").val(password);
        var params = $("#loginForm").serialize();
        $.post(loginUrl, params,function (result) {

            if(result.status=='1'){
                window.location.href = "/";
            }else{
                alert(result.summary);
                $("#tokenName").val(result.tokenName);
                $("#tokenValue").val(result.tokenValue);
                $("#password").val("");
                $("#captchaCode").val("");
                changeVerifyCode();
                isClick=false;
            }
        },"json");
    }
</script>
