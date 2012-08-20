<#-- @ftlvariable name="systemUser" type="com.brains.prj.tianjiu.order.common.SystemUser" -->
<@OrderControl path="getSystemUser" para="" />
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
</@block>
<@block name="head_css">
</@block>
<@block name="include_js">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/popwindow.js"></script>
    <script type="text/javascript" src="/js/laosong_zhCn.js"></script>
    <script type="text/javascript" src="/js/laosong.js"></script>
</@block>
</head>
<body>
<@block name="body_container">
<div id="toptip">
    <div class="toptip_wrap">
        <div class="toptip_logon left">
            <ul class="clearfix">
                <#if (systemUser.getUserId()<0)>
                    <li>您好，欢迎来到天酒商城！<a href="/home/user/login.htm">请登录</a>
                        <a href="/home/user/reg.htm">免费注册</a><span>|
                    </li>
                <#else>
                    <li>您好，<span><a href="/home/user/center.htm">${systemUser.getUserName()!("nobody")}</a></span>！
                        <a href="/home/user/logout.htm">退出</a><span>|</span>
                    </li>
                </#if>
                <li><a href="/home/user/favor.htm">我的收藏夹</a></li>
            </ul>
        </div>
        <div class="toptip_tool right">
            <ul class="clearfix">
                <li class="t_collect icon">
                    <a href="javascript:void(0);">收藏天酒商城</a><span>|</span></li>
                <li><a href="#" target="_blank">网站公告</a><span>|</span></li>
                <li><a href="#" target="_blank">关于我们</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="container">
    <@block name="body_head">
        <div id="header" class="clearfix">
            <h1 class="logo left"><a href="/"><img src="/images/logo.png" alt="天酒商城"/></a><span>天酒商城</span></h1>
            <p class="slogan commonBg">喝茅台好酒，上天酒商城！</p>
            <div class="header_tel commonBg right">全国免费客服电话：4006036519</div>
        </div>
        <div id="nav" class="pr">
            <div class="nav_brand" id="brand">
                <h2 class="btn">天酒品牌<i class="icon">&nbsp;</i></h2>
            </div>
            <div id="search" class="clearfix">
                <div class="hotwords link_white left">
                    <a href="#" target="_blank">茅台</a>
                    <a href="#" target="_blank">五粮液</a>
                    <a href="#" target="_blank">茅台</a>
                    <a href="#" target="_blank">国窖1573</a>
                    <a href="#" target="_blank">汾酒</a>
                </div>
                <div class="i_search left">
                    <form>
                        <input type="text" tabindex="1" value="搜索 茅台/劲酒" class="s_input">
                        <input type="button" tabindex="2" value="搜索" class="s_submit btn">
                    </form>
                </div>
                <div class="t_cart btn right" id="miniCartContainer">
                </div>
            </div>
        </div>
    </@block>
    <@block name="body_content">
    </@block>
    <@block name="body_footer">
        <div id="footer">
            <div class="btm_help clearfix">
                <dl>
                    <dt class="guide">购物指南</dt>
                    <dd>
                        <ul>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt class="pay">购买支付</dt>
                    <dd>
                        <ul>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt class="deliver">配送方式</dt>
                    <dd>
                        <ul>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt class="service">售后服务</dt>
                    <dd>
                        <ul>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                            <li><a href="#">天酒天酒天酒天酒</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt class="tel">订购热线</dt>
                    <dd>
                        <ul>
                            <li>400 60 36519(免长途费)</li>
                            <li><a href="#">联系我们</a></li>
                        </ul>
                    </dd>
                </dl>
            </div>
            <div class="footer_nav">
                <div class="f_link">
                    <a href="#" target="_blank">关于我们</a><i>|</i>
                    <a href="#" target="_blank">网站地图</a><i>|</i>
                    <a href="#" target="_blank">联系我们</a><i>|</i>
                    <a href="#" target="_blank">友情链接</a>
                </div>
                <p class="copyright fcor_gray">Copyright&nbsp;&copy;&nbsp;2012, All Rights Reserved
                    <a href="#" target="_blank">京ICP证000000号</a></p>
            </div>
        </div>
    </@block>
</div>
</@block>
<@block name="body_footerjs">
</@block>
<script type="text/javascript">
    $(function () {
        $.callOrderAction("POST", "/orderAction/miniCart", null,
                function (data) {
                    $("#miniCartContainer").html(data);
                }
        )
    });
</script>
</body>
</html>