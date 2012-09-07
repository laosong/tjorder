<#global systemUser = __RequestContext.getSystemUser()>
<#assign product_img_root = "">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><@block name="title">天酒商城</@block></title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
<@block name="include_css">
    <link rel="stylesheet" type="text/css" href="/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/register.css"/>
    <link rel="stylesheet" type="text/css" href="/css/laosong.css"/>
    <link rel="stylesheet" type="text/css" href="/css/buy.css"/>
</@block>
<@block name="head_css">
</@block>
<@block name="include_js">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/laosong_zhCn.js"></script>
    <script type="text/javascript" src="/js/laosong.js"></script>
</@block>
</head>
<body>
<@block name="body_container">
<div id="container">
    <@block name="body_head">
        <div id="header" class="ebHeader clearfix">
            <div class="mainlogo left">
                <a href="/"><img src="/images/logo.png" alt="天酒商城"/></a>
            </div>
            <div class="header_tool right">
                <div class="header_help right"><a href="#" target="_blank">帮助中心</a></div>
                <div class="header_login right">
                    <#if (systemUser.getUserId()<0)>
                        <a href="/home/user/login.htm">登录</a><span>|</span><a href="/home/user/reg.htm">注册</a>
                    <#else>
                        <a href="/orderAction/showCart">${systemUser.getUserName()!("nobody")}</a><span>|</span>
                        <a href="/orderAction/myOrders">我的订单</a><span>|</span>
                        <a href="/home/user/logout.htm">[退出]</a>
                    </#if>
                </div>
            </div>
        </div>
    </@block>
    <@block name="body_content">
    </@block>
    <@block name="body_footer">
        <div id="footer_sim">
            <div class="f_link">
                <a href="#" target="_blank">关于我们</a><i>|</i>
                <a href="#" target="_blank">网站地图</a><i>|</i>
                <a href="#" target="_blank">联系我们</a><i>|</i>
                <a href="#" target="_blank">友情链接</a>
            </div>
            <p class="copyright fcor_gray">Copyright&nbsp;&copy;&nbsp;2012, All Rights Reserved
                <a href="#" target="_blank">京ICP证000000号</a>
            </p>
        </div>
    </@block>
</div>
</@block>
<@block name="body_footerjs">
</@block>
</body>
</html>