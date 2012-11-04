<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城,登录" />
    <title>登录_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css"	rel="stylesheet" type="text/css"/>
    <link href="/css/register.css"	rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
<body>
<div id="header" class="logHeader clearfix">
    <div class="mainlogo left"><a href="/index.htm"><img src="/images/logo.png" alt="天酒商城" /></a></div>
    <div class="header_tool right"><a href="/index.htm">首页</a><span>|</span><a href="#">帮助中心</a></div>
</div>
<div id="login">
    <div class="log_container">
        <div class="log_con clearfix">
            <div class="ebLog left">
                <h2 class="reg_til">用户登录</h2>
                <div class="log_field ebLog_form">
                    <form:form commandName="cmd" method="post" action="/home/user/login.htm">
                        <c:if test="${empty param.toUrl}"><input  type="hidden" name="toUrl" value="${__sCtrlInfo.prevInfo.fullUri}" /></c:if>
                        <c:if test="${!empty param.toUrl}"><input  type="hidden" name="toUrl" value="${param.toUrl}" /></c:if>
                        <div align="center" style="color: red;"><form:errors path="*"/></div>
                        <div class="info_input clearfix">
                            <label for="iusername">用户名</label>
                            <input class="log_input_box" id="iusername" name="login_name" type="text" value="${cmd.login_name}" maxlength="50" tabIndex="1" />
                        </div>
                        <div class="info_input clearfix">
                            <label for="iuserpwd"><span>密</span>码</label>
                            <input class="log_input_box" id="iuserpwd" name="login_pass" type="password" value="" maxlength="50" tabIndex="2" />
                        </div>
                        <div id="checkCode" class="info_input clearfix">
                            <label for="checkcode">验证码</label>
                            <div class="easyformfield codeInput">
                                <input type="text" size="4" class="left" name="vc" id="valid_code" maxlength="4"/>
                                <img class="left" src="/verify_code.jpg" alt="验证码" id="valid_code_img" />
                                <p class="f666"></p>
                            </div>
                            <div class="A_directions clearfix" id="checkCode_check_msg"></div>
                        </div>
                        <div class="info_input log_remb clearfix">
                            <div class="log_checkbox left">
                                <input id="remember" type="checkbox" name="expDays" value="14" tabIndex="3" />
                                <label for="remember">记住登录状态</label>
                            </div>
                            <p class="left"><a href="{- $web_grade_base_url -}/user/getpwd/" target="_blank">忘记密码？</a></p>
                        </div>
                        <div class="login_submit mart20">
                            <input class="btn ebsmbbtn" type="submit" name="submit" value="登 录" onMouseOver="this.className='btn ebsmbbtn ebbtnhv'" onMouseOut="this.className='btn ebsmbbtn'" tabIndex="4" onclick="logonSubmit();" />
                        </div>
                    </form:form>
                </div>
                <div class="cooperation">
                    <!--
                    <p>使用合作网站帐户登录天酒商城：</p>
                    <div class="cooperation_item mart10"><a href="#" class="icon_cooperation icon_qq">QQ</a><span>|</span><a href="#" class="icon_cooperation icon_sina">新浪微博</a></div>
                    -->
                </div>
            </div>
            <div class="ebReg right">
                <h2 class="f14px fb">还不是天酒商城用户？</h2>
                <p class="mart10">现在免费注册成为天酒商城用户，便能立刻享受便宜又放心的购物乐趣。</p>
                <div class="payOrderBtn"><a href="/home/user/reg.htm" class="ebregbtn btn">新用户注册</a></div>
            </div>
        </div>
    </div>
</div>
<c:import url="../footer_sim.jsp" charEncoding="utf-8"/>
</body>
</html>