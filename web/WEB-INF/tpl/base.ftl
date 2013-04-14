<#global systemUser = __RequestContext.getSystemUser()>
<#assign product_img_root = "">
<@OrderControl path="getPageNavData" para="shortNames=b1|b2|b3"/>
<#-- @ftlvariable name="searchAds" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.AdItem>" -->
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
                        <a href="/home/user/reg.htm">免费注册</a><span>|</span>
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
                <li><a href="/home/news-list.htm" target="_blank">网站公告</a><span>|</span></li>
                <li><a href="/help/aboutus.htm" target="_blank">关于我们</a></li>
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
                    <#list searchAds as searchAd>
                        <a href="${searchAd.href}" target="_blank">${searchAd.title?html}</a>
                    </#list>
                </div>
                <div class="i_search left">
                    <form id="command" action="/home/search/list.htm" method="get">
                        <input type="text" tabindex="1" name="keyword" value="" class="s_input"/>
                        <input type="submit" tabindex="2" value="搜索" class="s_submit btn"/>
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
                            <li><a href="/help/buy.htm#1">如何购物</a></li>
                            <li><a href="/help/buy.htm#2">购物保障</a></li>
                            <li><a href="/help/buy.htm#3">发票说明</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt class="pay">购买支付</dt>
                    <dd>
                        <ul>
                            <li><a href="/help/pay.htm#1">货到付款</a></li>
                            <li><a href="/help/pay.htm#2">在线支付</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt class="deliver">配送方式</dt>
                    <dd>
                        <ul>
                            <li><a href="/help/ship.htm#1">配送时间</a></li>
                            <li><a href="/help/ship.htm#2">配送费用</a></li>
                            <li><a href="/help/ship.htm#3">配送范围</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt class="service">售后服务</dt>
                    <dd>
                        <ul>
                            <li><a href="/help/service.htm#1">退换货政策</a></li>
                            <li><a href="/help/service.htm#2">退换货流程</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt class="tel">订购热线</dt>
                    <dd>
                        <ul>
                            <li>400 60 36519(免长途费)</li>
                            <li><a href="/help/contactus.htm">联系我们</a></li>
                        </ul>
                    </dd>
                </dl>
            </div>
            <div class="footer_nav">
                <div class="f_link">
                    <a href="/help/aboutus.htm" target="_blank">关于我们</a><i>|</i>
                    <a href="/help/sitemap.htm" target="_blank">网站地图</a><i>|</i>
                    <a href="/help/contactus.htm" target="_blank">联系我们</a><i>|</i>
                    <a href="/help/flinks.htm" target="_blank">友情链接</a>
                </div>
                <p class="copyright fcor_gray">Copyright&nbsp;&copy;&nbsp;2012, All Rights Reserved
                    <a href="/html/icp.html" target="_blank">黔ICP证B2-20130004</a>黔ICP备12004944号
                </p>
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